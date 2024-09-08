variable "vnetmap" {}
resource "azurerm_virtual_network" "vnet_blk" {
  for_each = var.vnetmap
  name=each.value.name
  resource_group_name = each.value.resource_group_name
  location=each.value.location
  address_space = each.value.address_space
}

