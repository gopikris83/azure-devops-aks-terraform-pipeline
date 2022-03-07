data "azurerm_kubernetes_service_versions" {
  location        = azurerm_resource_group.aks_rg.location
  include_preview = false
}