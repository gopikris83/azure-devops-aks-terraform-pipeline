#####################################
# Azure Database for MySQL - Output #
#####################################

output "mysql_server" {
  value     = azurerm_mysql_server.db_server
  sensitive = true
}