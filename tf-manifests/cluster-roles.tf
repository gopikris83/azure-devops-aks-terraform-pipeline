data "azurerm_subscription" "primary" {
}

data "azurerm_client_config" "client_config" {
}

# Custom Role defintions for the AKS Cluster
resource "azurerm_role_definition" "aks_cluster_create_role" {
  name        = "aks-cluster-create-role"
  scope       = data.azurerm_subscription.primary.id
  description = "Grants actions required to create and manage aks compute"
  permissions {
    actions = [
      "Microsoft.Resources/subscriptions/resourcegroups/read",
      "Microsoft.ContainerService/managedClusters/write",
      "Microsoft.ContainerService/managedClusters/read",
      "Microsoft.ContainerService/managedClusters/agentPools/write",
      "Microsoft.ContainerService/managedClusters/agentPools/read"
    ]
    not_actions = []
  }
  assignable_scopes = [
    "/subscriptions/05668dbd-b4a9-47bf-9be0-f93a45c7ca62"
  ]
}

resource "azurerm_role_assignment" "aks_cluster_create_role_assignment" {
  #name               = "create-role-assignment"
  scope              = data.azurerm_subscription.primary.id
  role_definition_id = azurerm_role_definition.aks_cluster_create_role.role_definition_resource_id
  principal_id       = data.azurerm_client_config.client_config.object_id
}

resource "azurerm_role_definition" "aks-cluster-delete-role" {
  name        = "aks-cluster-delete-role"
  scope       = data.azurerm_subscription.primary.id
  description = "Grants actions required to delete an aks cluster"
  permissions {
    actions = [
      "Microsoft.ContainerService/managedClusters/delete"
    ]
    not_actions = []
  }
  assignable_scopes = [
    "/subscriptions/05668dbd-b4a9-47bf-9be0-f93a45c7ca62"
  ]
}

resource "azurerm_role_assignment" "aks-cluster-delete-role-assignment" {
  #name               = "delete-role-assignment"
  scope              = data.azurerm_subscription.primary.id
  role_definition_id = azurerm_role_definition.aks-cluster-delete-role.role_definition_resource_id
  principal_id       = data.azurerm_client_config.client_config.object_id
}

resource "azurerm_role_definition" "aks-cluster-network-role" {
  name        = "aks-cluster-network-role"
  scope       = data.azurerm_subscription.primary.id
  description = "Can Join and AKS Cluster to a given vnet/subnet"
  permissions {
    actions = [
      "Microsoft.Resources/subscriptions/resourcegroups/read",
      "Microsoft.Network/virtualNetworks/subnets/join/action"
    ]
    not_actions = []
  }
  assignable_scopes = [
    "/subscriptions/05668dbd-b4a9-47bf-9be0-f93a45c7ca62"
  ]
}

resource "azurerm_role_assignment" "aks-cluster-network-role-assignment" {
 # name               = "network-role-assignment"
  scope              = data.azurerm_subscription.primary.id
  role_definition_id = azurerm_role_definition.aks-cluster-network-role.role_definition_resource_id
  principal_id       = data.azurerm_client_config.client_config.object_id
}

resource "azurerm_role_definition" "aks-cluster-rgdeployment-role" {
  name        = "aks-cluster-rgdeployment-role"
  scope       = data.azurerm_subscription.primary.id
  description = "Can join an AKS cluster to a log analytics workspace"
  permissions {
    actions = [
      "Microsoft.Resources/deployments/write"
    ]
    not_actions = []
  }
  assignable_scopes = [
    "/subscriptions/05668dbd-b4a9-47bf-9be0-f93a45c7ca62"
  ]
}

resource "azurerm_role_assignment" "aks-cluster-rgdeployment-role-assignment" {
 # name               = "rgdeployment-assignment"
  scope              = data.azurerm_subscription.primary.id
  role_definition_id = azurerm_role_definition.aks-cluster-rgdeployment-role.role_definition_resource_id
  principal_id       = data.azurerm_client_config.client_config.object_id
}

resource "azurerm_role_definition" "aks-cluster-loganalytics-role" {
  name        = "aks-cluster-loganalytics-role"
  scope       = data.azurerm_subscription.primary.id
  description = "Can join an AKS cluster to a log analytics workspace"
  permissions {
    actions = [
      "Microsoft.OperationalInsights/workspaces/sharedkeys/read",
      "Microsoft.OperationsManagement/solutions/write"
    ]
    not_actions = []
  }
  assignable_scopes = [
    "/subscriptions/05668dbd-b4a9-47bf-9be0-f93a45c7ca62"
  ]
}

resource "azurerm_role_assignment" "aks-cluster-loganalytics-role-assignment" {
  #name               = "loganalytics-assignment"
  scope              = data.azurerm_subscription.primary.id
  role_definition_id = azurerm_role_definition.aks-cluster-loganalytics-role.role_definition_resource_id
  principal_id       = data.azurerm_client_config.client_config.object_id
}