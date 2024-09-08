

resource "azurerm_bastion_host" "bastion_blk" {
    for_each = var.map_bastion
  name                = "frontendbastion"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "bastion"
    subnet_id            = data.azurerm_subnet.subnetdata[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pipdata[each.key].id
  }
}

data "azurerm_subnet" "subnetdata" {
    for_each = var.map_bastion
    name = each.value. subnet_id 
    virtual_network_name =each.value.virtual_network_name
    resource_group_name = each.value.resource_group_name
}

data "azurerm_public_ip" "pipdata" {
    for_each = var.map_bastion
    name =each.value.public_ip_address_id
    resource_group_name = each.value.resource_group_name
  
}
