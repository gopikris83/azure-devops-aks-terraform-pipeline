##########################################################
# AKS Cluster resources
##########################################################

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  dns_prefix          = azurerm_resource_group.aks_rg.name
  name                = "${var.resource_group_name}-aks-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${azurerm_resource_group.aks_rg.name}-nrg"

  default_node_pool {
    name                 = "aksnodepool"
    vm_size              = "Standard_D2_v2"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    availability_zones   = [1, 2, 3]
    enable_auto_scaling  = true
    max_count            = 3
    min_count            = 1
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"
    node_labels = {
      "nodepool-type" = "system"
      "environment"   = var.environment
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
    }
    tags = {
      "nodepool-type" = "system"
      "environment"   = var.environment
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
    }
  }

  # Identity either SystemAssigned or UserAssigned
  identity { type = "SystemAssigned" }

  addon_profile {
    azure_policy { enabled = true }
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.logs_insights.id
    }
  }

  role_based_access_control { enabled = true }

  windows_profile {
    admin_username = var.win_admin_username
    admin_password = var.win_admin_password
  }

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_pub_key)
    }
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "azure"
    network_policy    = "calico"
  }

  service_principal {
    client_id     = var.client_app_id
    client_secret = var.client_app_secret
  }


  tags = {
    Environment = var.environment
  }
}

# Role Assignment for the Container registry for AKS to pull images
resource "azurerm_role_assignment" "acrpull-role" {
  principal_id                     = data.azurerm_client_config.example.object_id
  scope                            = azurerm_container_registry.aks-acr.id
  role_definition_name             = "AcrPull"
  skip_service_principal_aad_check = false
}

data "azurerm_client_config" "example" {
}