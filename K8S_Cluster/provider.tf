terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.5.0"
    }
  }
}

provider "azurerm" {
  features {}
  
  subscription_id = "8496cc30-1450-4b93-875d-8103766a4736"
}
