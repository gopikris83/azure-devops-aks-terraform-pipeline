data "azurerm_kubernetes_service_versions" "current" {
  location        = data.azurerm_resource_group.aks_rg.location
  include_preview = false
}