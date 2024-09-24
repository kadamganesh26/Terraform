variable "child_pip" {}

resource "azurerm_public_ip" "pip_blk" {
for_each = var.child_pip
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
}