variable "map-vnet" {}
resource "azurerm_virtual_network" "vnetblk" {
  for_each = var.map-vnet
  name =each.value.name
  resource_group_name =each.value.resource_group_name
  location = each.value.location
  address_space =each.value.address_space

}