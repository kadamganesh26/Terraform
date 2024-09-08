data "azurerm_subnet" "sub-data" {
  for_each             = var.nic
  name                 = each.value.sdname
  resource_group_name  = each.value.rgname
  virtual_network_name = each.value.vnetname
}
