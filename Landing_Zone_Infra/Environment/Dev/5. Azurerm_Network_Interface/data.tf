data "azurerm_subnet" "subnet-data" {
  for_each             = var.child_nic
  name                 = each.value.name_subnet_id
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
