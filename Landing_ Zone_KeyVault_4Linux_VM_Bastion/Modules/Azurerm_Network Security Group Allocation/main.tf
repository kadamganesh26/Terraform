
resource "azurerm_subnet_network_security_group_association" "nsg_allocation_blk" {
  for_each = var.nsg_allocation
  subnet_id                 = data.azurerm_subnet.subnet-datablk[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg-data[each.key].id
}
