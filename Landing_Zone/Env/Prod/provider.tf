provider "azurerm" {
  features {}
  subscription_id = "8be7a0f4-188c-49e3-82b6-c75d12632382"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.34.0"
    }
  }
}
# This file is used to configure the AzureRM provider for Terraform.
# It specifies the provider version and the Azure subscription ID.