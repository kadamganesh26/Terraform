variable "map_nsg" {}

resource "azurerm_network_security_group" "nsg_blk" {
  for_each            = var.map_nsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

security_rule {
  name                        = each.value.security_rule.nsgrule_name
  priority                    = each.value.security_rule.priority
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value.security_rule.destination_port_range
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
 
}
}
