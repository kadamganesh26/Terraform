variable "child_vnet" {}
resource "azurerm_virtual_network" "vnet_blk" {
  for_each            = var.child_vnet
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}
