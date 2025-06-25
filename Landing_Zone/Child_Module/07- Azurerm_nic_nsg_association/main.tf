resource "azurerm_subnet_network_security_group_association" "nsg-asso-blk" {
  subnet_id                 = data.azurerm_subnet.sub-data-blk.id
  network_security_group_id = data.azurerm_network_security_group.nsg-data-blk.id
}