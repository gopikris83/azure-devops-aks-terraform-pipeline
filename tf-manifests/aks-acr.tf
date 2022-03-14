##########################################################
# AKS Azure Container Registry
##########################################################
resource "azurerm_container_registry" "aks-acr" {
  name                = "terraformaksacr"
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  sku                 = "Standard"
  admin_enabled       = false

  tags = {
    Name        = var.resource_group_name
    Environment = var.environment
  }
}

resource "azurerm_container_registry_scope_map" "example" {
  name                    = "aks-scope-map"
  container_registry_name = azurerm_container_registry.aks-acr.name
  resource_group_name     = azurerm_resource_group.aks_rg.name
  actions = [
    "repositories/repo1/content/read",
    "repositories/repo1/content/write"
  ]
}