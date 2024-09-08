variable "nic" {}

resource "azurerm_network_interface" "nic" {
  for_each            = var.nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rgname

  ip_configuration {

    name                          = each.value.ip_configuration.name
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    subnet_id                     = data.azurerm_subnet.sub-data[each.key].id
  }
}

data "azurerm_subnet" "sub-data" {
  for_each             = var.nic
  name                 = each.value.sdname
  resource_group_name  = each.value.rgname
  virtual_network_name = each.value.vnetname
}
