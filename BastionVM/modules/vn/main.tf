resource "azurerm_virtual_network" "vnet" {
   for_each = var.vms
  name                = each.value.vnet_name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}
