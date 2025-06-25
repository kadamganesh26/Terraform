

data "azurerm_network_interface" "backend-nic-data" {
  name                = var.backend-nic-data
  resource_group_name = var.resource_group_name
}