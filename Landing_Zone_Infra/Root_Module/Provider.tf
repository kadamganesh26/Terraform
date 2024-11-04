terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.5.0"
    }

  }
  # backend "azurerm" {
  #   resource_group_name  = "rg1"                    # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
  #   storage_account_name = "rksotre"                # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
  #   container_name       = "vhds"                   # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
  #   key                  = "prod.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  # }
}
provider "azurerm" {
  features {
  }
  subscription_id = "78a6d8eb-ee26-4eb1-97fd-d6288e2ab02e"
}
#Raghavkadam@hotmail.com
