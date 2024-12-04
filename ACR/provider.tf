terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.11.0"
    }
  }
}
provider "azurerm" {
  features {
  }
  subscription_id = "a5e98f2b-9cc8-4a90-a15e-46f5d601ae33"
  #This subscription is Bhaubli account
}