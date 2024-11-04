resource "azurerm_subnet" "sub_blk" {
  for_each = var.child_sub
  name =each.value.name
  resource_group_name =each.value.resource_group_name
  address_prefixes =each.value.address_prefixes
  virtual_network_name = each.value.virtual_network_name
}