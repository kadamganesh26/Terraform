data "azurerm_network_interface" "frontend-nic-data" {
  name                = var.frontend-nic-data
  resource_group_name = var.resource_group_name
}