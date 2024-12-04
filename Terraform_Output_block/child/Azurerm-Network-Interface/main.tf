resource "azurerm_network_interface" "nic-blk" {
  for_each = var.child_nic
  name = each.value.name
  location =each.value.location
  resource_group_name =each.value.resource_group_name
  ip_configuration {
    name =each.value.ip_configuration.name
    subnet_id = data.azurerm_subnet.sub-data[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

data "azurerm_subnet" "sub-data" {
  for_each = var.child_nic
  name = each.value.subnet_id
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name

}
output "nic-blk" {
  description = "This is network interface card"
  value = {
    for nic in azurerm_network_interface.nic-blk : 
    nic.name => nic.id
  }
}