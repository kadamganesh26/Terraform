terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.44.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "8be7a0f4-188c-49e3-82b6-c75d12632382"
}


resource "azurerm_resource_group" "rg-blk" {
  name = "demo-rg1"
  location = "central india"
}


resource "azurerm_resource_group" "rg-blk1" {
  name = "demo-rg2"
  location = "central india"
}
