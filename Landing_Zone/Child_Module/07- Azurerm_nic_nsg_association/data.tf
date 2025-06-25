data "azurerm_subnet" "sub-data-blk" {
  name                 = var.sub_data_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name

}

data "azurerm_network_security_group" "nsg-data-blk" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
}
