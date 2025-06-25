


#bAckend Virtual Machine Nic
resource "azurerm_network_interface" "Backend_network_interface_blk" {
  name                = var.name-backend
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.backend-sub-data.id
    private_ip_address_allocation = "Dynamic"
  }
}





