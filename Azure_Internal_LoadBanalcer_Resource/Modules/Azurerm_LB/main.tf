resource "azurerm_lb" "example" {
  for_each            = var.lb
  name                = "Internal-lb"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name


  frontend_ip_configuration {
    name                 = each.value.frontend_ip_configuration-name
    public_ip_address_id = data.azurerm_public_ip.pip-data[each.key].id
  }
}




data "azurerm_public_ip" "pip-data" {
  for_each            = var.lb
  name                = each.value.public_ip_address_id
  resource_group_name = each.value.resource_group_name
}

