terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.11.0"
    }
  }
  # backend "azurerm" {
  #   container_name = ""
  #   storage_account_name = ""
  #   resource_group_name = ""
  #   key = ""
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "240b317b-8c24-46e2-a127-7e15699f5131"
}