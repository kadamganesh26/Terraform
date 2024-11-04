data "azurerm_subnet" "sub-data" {
    for_each = var.child_bastion
  name                 = each.value.name_subnet_id
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "pip-data" {
for_each = var.child_bastion
  name                = each.value.pip_name
  resource_group_name =each.value.resource_group_name
}
