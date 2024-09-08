variable "nics" {}
resource "azurerm_network_interface" "nics_blk" {
  for_each            = var.nics
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    # public_ip_address_id          = data.azurerm_public_ip.pip-data[each.key].id
    subnet_id                     = data.azurerm_subnet.sub-data[each.key].id
  }
}

#SubnetData Source
data "azurerm_subnet" "sub-data" {
  for_each             = var.nics
  name                 = each.value.sbid
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet
}

# data "azurerm_public_ip" "pip-data" {
#   for_each            = var.nics
#   name                = each.value.pipname
#   resource_group_name = each.value.resource_group_name
# }
