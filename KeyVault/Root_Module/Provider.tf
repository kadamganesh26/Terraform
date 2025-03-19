terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.23.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = "11f72bf6-7739-44f9-aade-3489f9f62f7d"
}