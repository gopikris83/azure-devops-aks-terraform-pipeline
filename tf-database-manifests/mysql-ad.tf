##########################################################
# Azure Active Directory
##########################################################
resource "azuread_group" "ad_admins" {
  display_name     = "${azurerm_resource_group.db_rg.name}-${var.environment}-administrators"
  description      = "Azure AD for ${azurerm_resource_group.db_rg.name}-${var.environment} MySQL"
  security_enabled = true
}