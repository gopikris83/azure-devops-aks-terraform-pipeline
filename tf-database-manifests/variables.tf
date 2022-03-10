##########################################################
# Inputs for Azure resources
##########################################################
variable "resource_group_name" {
  type        = string
  description = "Azure Resource group name"
  default     = "tfdbmysql"
}

variable "environment" {
  type        = string
  description = "MySql hosted environment"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Region of Azure resources provisioned"
  default     = "Sweden Central"
}

variable "administrator_login" {
  type        = string
  description = "Login to authenticate to MySQL Server"
}

variable "administrator_login_password" {
  type        = string
  description = "Password to authenticate to MySQL Server"
  sensitive   = true
}

variable "storage_size" {
  type        = string
  description = "MySQL Storage in MB"
  default     = "5120"
}

variable "sku_name" {
  type        = string
  description = "MySQL SKU Name"
  default     = "B_Gen5_2"
}

variable "mysql_version" {
  type        = string
  description = "MySQL Server version to deploy"
  default     = "5.7"
}