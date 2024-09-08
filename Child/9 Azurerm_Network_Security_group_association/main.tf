variable "childasso" {
  
}

resource "azurerm_subnet_network_security_group_association" "nsg-asso" {
  for_each                  = var.childasso
  subnet_id                 = data.azurerm_subnet.subnet-data[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg-data[each.key].id
}

data "azurerm_subnet" "subnet-data" {
  for_each             = var.childasso
  name                 = each.value.subid
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_network_security_group" "nsg-data" {
  for_each            = var.childasso
  name                = each.value.network_security_group_id
  resource_group_name = each.value.resource_group_name
}