output "location" {
  value = azurerem_resource_group.aks_rg.location
}

output "varsions" {
    value = data.azurerm_kubernetes_service_versions.current.version
}

output "latest_version" {
    value = data.azurerm_kubernetes_service_versions.current.latest_version
}

output "azure_ad_group_id" {
    value = azuread_group.aks_admins.id
}

output "azure_ad_group_objectid" {
    value = azuread_group.aks_admins.object_id
}