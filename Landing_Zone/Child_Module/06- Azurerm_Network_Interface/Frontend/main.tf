#Frontend Virtual Machine Nic
resource "azurerm_network_interface" "Frontend_network_interface_blk" {
  name                = var.name-frondtend
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.frontend-sub-data.id
    private_ip_address_allocation = "Dynamic"
  }
}


data "azurerm_subnet" "frontend-sub-data" {
  name                 = var.sub-data-frontend
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

variable "name-frondtend" {
  description = "The name of the network interface."
  type        = string
  default     = "frontend-nic"
  
}
# Data source variable for subnet of the Frontend Virtual Machine Network Interface
variable "sub-data-frontend" {
  description = "The name of the subnet to be used in the network interface."
  type        = string
  default     = "frontend-subnet"
}

# Frontend Network Interface Variables Nic
variable "location" {
  description = "The Azure region where the network interface will be created."
  type        = string
  default     = "CentralIndia"
}

variable "resource_group_name" {
  description = "The name of the resource group where the network interface will be created."
  type        = string
  default     = "elern-rg"   
}

variable"virtual_network_name" {
  description = "The name of the virtual network where the subnet is located."  
    type        = string
    default     = "elern-gk-vnet"
}
