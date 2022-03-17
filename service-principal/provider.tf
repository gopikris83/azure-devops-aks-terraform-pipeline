terraform {
  required_version = ">= 0.13"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
    }
  }
  backend "azurerm" {
    # resource_group_name  = "azactivedirectory-rg"
    # storage_account_name = "azadmysql2022"
    # container_name       = "tfstate"
    # key                  = "dev.terraform.state"
  }
}

provider "azurerm" {
  features {}
}