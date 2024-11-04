
resource "azurerm_bastion_host" "example" {
    for_each = var.child_bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.ip_configuration.name
    subnet_id            = data.azurerm_subnet.sub-data[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip-data[each.key].id
  }
}