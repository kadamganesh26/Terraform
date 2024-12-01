resource "azurerm_bastion_host" "example" {
    for_each = var.child_bastion
  name                = "examplebastion"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_bastion_host.sub-data[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip-data[each.key].id
  }
}

data "azurerm_bastion_host" "sub-data" {
    for_each = var.child_bastion
    name = "AzureBastionSubnet"
    resource_group_name =each.value.resource_group_name
    # virtual_network_name = each.value.virtual_network_name
}

data "azurerm_public_ip" "pip-data" {
  for_each = var.child_pip
  name ="todoapp_pip"
  resource_group_name = each.value.resource_group_name
}
