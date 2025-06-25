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



# Data source variable for subnet of the Frontend Virtual Machine Network Interface
variable "sub-data-backend" {
  description = "The name of the subnet to be used in the network interface."
  type        = string
  default     = "backend-subnet"
}

variable"virtual_network_name" {
  description = "The name of the virtual network where the subnet is located."  
    type        = string
    default     = "elern-gk-vnet"
}



# Backend Network Interface Variables Nic
variable "name-backend" {
  description = "The name of the backend network interface."
  type        = string
  default     = "backend-nic"
}

