resource "azurerm_resource_group" "rg-blk" {
  name     = "dev-acr-we"
  location = "West Europe"
}

resource "azurerm_container_registry" "acr" {
  name                = "containerRegistry4dec2024"
  resource_group_name = "dev-acr-we"
  location            = "West Europe"
  sku                 = "Standard"
  admin_enabled       = false
#   georeplications {
#     location                = "East US"
#     zone_redundancy_enabled = true
#     tags                    = {}
#   }
}

