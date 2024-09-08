variable "child_nic" {}
resource "azurerm_network_interface" "nic_blk" {
  for_each            = var.child_nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                          = each.value.ip_configuration.name
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    subnet_id                     = data.azurerm_subnet.sbu-data[each.key].id
  }
}

data "azurerm_subnet" "sbu-data" {
  for_each             = var.child_nic
  name                 = each.value.subid
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
