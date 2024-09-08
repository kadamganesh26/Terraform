variable "nsg_allocation" {}
resource "azurerm_subnet_network_security_group_association" "nsg_allocation_blk" {
  for_each = var.nsg_allocation
  subnet_id                 = data.azurerm_subnet.subnet-datablk[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg-data[each.key].id
}

data "azurerm_network_security_group" "nsg-data" {
  for_each            = var.nsg_allocation
  name                = each.value.nsgname
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "subnet-datablk" {
  for_each             = var.nsg_allocation
  resource_group_name  = each.value.resource_group_name
  name                 = each.value.subname
  virtual_network_name = each.value.vnet

}




