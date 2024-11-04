terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.5.0"
    }
  }
}
provider "azurerm" {
  features {
  }
  subscription_id = "78a6d8eb-ee26-4eb1-97fd-d6288e2ab02e"
}