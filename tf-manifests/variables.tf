##########################################################
# Input variables
##########################################################
variable "resource_group_name" {
  type        = string
  description = "Azure Resource group name"
  default     = "terraform-aks"
}

variable "environment" {
  type        = string
  description = "AKS hosted environment"
  default     = "test"
}

variable "location" {
  type        = string
  description = "Region of Azure resources provisioned"
  default     = "Sweden Central"
}

variable "ssh_pub_key" {
  default     = "~/.ssh/aks-terraform-sshkeys/akspubkey.pub"
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"
}

variable "win_admin_username" {
  type    = string
  default = "azureuser"
}

variable "win_admin_password" {
  type    = string
  default = "P@ssw0rd19800402"
}

variable "client_app_id" {
  description = "The Client app ID of the AKS client application"
  default     = "d91d802e-d2d5-4967-b025-caaf0fad32f0"
}

variable "client_app_secret" {
  description = "The secret created for AKS server application"
  default     = "P-O7Q~ESXl~x8NdmR9tjaQONy1i5d3KCuMfFO"
}
