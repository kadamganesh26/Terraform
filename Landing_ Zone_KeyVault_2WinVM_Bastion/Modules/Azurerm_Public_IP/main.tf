variable "map_pip" {}

resource "azurerm_public_ip" "pip_blk" {
    for_each = var.map_pip
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}


