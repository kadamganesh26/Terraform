 variable "pip" {}
resource "azurerm_public_ip" "pip_blk" {
    for_each = var.pip
  name                ="bastionpip"
  location            = "west europe"
  resource_group_name = "ganesh"
  allocation_method   = "Static"
  sku                 = "Standard"
}

