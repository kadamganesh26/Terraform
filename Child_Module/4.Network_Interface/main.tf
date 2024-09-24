variable "child_nic" {}
data "azurerm_subnet" "subnet_data" {
  for_each             = var.child_nic
  name                 = each.value.subnet_id
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
resource "azurerm_network_interface" "nic_blk" {
  for_each            = var.child_nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = data.azurerm_subnet.subnet_data[each.key].id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
  }
}
