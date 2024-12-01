resource "azurerm_network_interface" "nic_blk" {
  for_each = var.child_nic
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  
  ip_configuration {
   name = each.value.ip_configuration.ipname
   subnet_id = data.azurerm_subnet.sub-data[each.value.ip_configuration.stname].id
   private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
   
  }
}

data "azurerm_subnet" "sub-data" {
    for_each = var.child_subnet
    name = each.value.name
    resource_group_name =each.value.resource_group_name
    virtual_network_name = each.value.virtual_network_name
}

