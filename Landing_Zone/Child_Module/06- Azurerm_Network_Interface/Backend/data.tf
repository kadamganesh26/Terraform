
data "azurerm_subnet" "backend-sub-data" {
  name                 = var.sub-data-backend
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}