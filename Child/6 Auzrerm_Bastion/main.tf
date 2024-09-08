variable "child_bastion" {}
resource "azurerm_bastion_host" "name" {
    for_each = var.child_bastion
  name = each.value.name
  resource_group_name =each.value.resource_group_name
  location = each.value.location
ip_configuration {
  name =each.value.ip_configuration.name
  public_ip_address_id =data.azurerm_public_ip.data-pip[each.key].id 
  subnet_id =data.azurerm_subnet.data-sub[each.key].id
}
}

data "azurerm_public_ip" "data-pip" {
  for_each = var.child_bastion
  name =each.value.pip
  resource_group_name =each.value.resource_group_name
}

data "azurerm_subnet" "data-sub" {
  for_each = var.child_bastion
  name =each.value.subname
  virtual_network_name =each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}
