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
  default     = "Test"
}

variable "location" {
  type        = string
  description = "Region of Azure resources provisioned"
  default     = "Sweden Central"
}

variable "ssh_pub_key" {
  default = "~/.ssh/aks-terraform-sshkeys/akspubkey.pub"
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes" 
}

variable "win_admin_username" {
    type = string
  default = "azureuser"
}

variable "win_admin_password" {
    type = string
    default = "P@ssw0rd1234"
}