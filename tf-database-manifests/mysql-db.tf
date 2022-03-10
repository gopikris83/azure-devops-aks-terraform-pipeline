##########################################################
# Azure MySQL resource config
##########################################################
resource "azurerm_mysql_server" "db_server" {
  name                = "${var.resource_group_name}-${var.environment}-mysqlserver"
  location            = azurerm_resource_group.db_rg.location
  resource_group_name = azurerm_resource_group.db_rg.name

  sku_name   = var.sku_name
  storage_mb = var.storage_size
  version    = var.mysql_version

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_mysql_database" "db_mysql" {
  name                = "${var.resource_group_name}-${var.environment}-mysqldb"
  resource_group_name = azurerm_resource_group.db_rg.name
  server_name         = azurerm_mysql_server.db_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}