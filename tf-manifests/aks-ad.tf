##########################################################
# AKS Cluster resources
##########################################################
resource "azuread_group" "aks_admins" {
  #name             = "${azurerm_resource_group.aks_rg.name}-${var.environment}-admins"
  display_name     = "${azurerm_resource_group.aks_rg.name}-${var.environment}-administrators"
  description      = "Azure AKS Administrators for ${azurerm_resource_group.aks_rg.name}-${var.environment} cluster"
  security_enabled = true
}
