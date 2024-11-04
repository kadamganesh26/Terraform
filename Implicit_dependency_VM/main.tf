variable "name" {default = "raghav"}
variable "enable_public_ip" {type = bool}

#Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.name}"
  location = "West Europe"
}
#Create a Virtual Network 
resource "azurerm_virtual_network" "vnet" {
  name                = "rg-${var.name}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
#Created Subent
resource "azurerm_subnet" "subnet" {
  name                 = "rg-${var.name}-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
#Create a public ip address
resource "azurerm_public_ip" "pip" {
    count = var.enable_public_ip ? 1 : 0
  name = "rg-${var.name}-pip"
  resource_group_name  = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  
}
#Create a Network Security Netork Interface card and assined public ip address
resource "azurerm_network_interface" "nic" {
  name                = "rg-${var.name}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.enable_public_ip ? azurerm_public_ip.pip[0].id : null
   }
}

#Create a Network Security Group (NSG) with an SSH rule (port 22)
resource "azurerm_network_security_group" "nsg" {
  name                = "rg-${var.name}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate the NSG with the NIC
resource "azurerm_network_interface_security_group_association" "nsg_association" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

#Create a Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "rg-${var.name}-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_F2"
  admin_username      = "pcpl"
  network_interface_ids = [azurerm_network_interface.nic.id]
  disable_password_authentication = false
  admin_password = "hin12#$%^&*()"
  

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
