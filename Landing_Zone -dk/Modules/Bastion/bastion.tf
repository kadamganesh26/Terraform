
variable "bastion_sub" {}




resource "azurerm_bastion_host" "mybastion_blk" {
  name                = "mybastion"
  location            = "west europe"
  resource_group_name = "ganesh"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnet_data_blk[each.key].id
    public_ip_address_id = data.azurerm_network_interface.nic-pip.id
  }
}


data "azurerm_subnet" "subnet_data_blk" {
  for_each = var.bastion_sub
  name =each.value.sdname
  virtual_network_name = each.value.vnetname 
  resource_group_name = each.value.resource_group_name
}
