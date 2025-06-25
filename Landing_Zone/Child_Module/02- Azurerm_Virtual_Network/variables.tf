variable "name" {
  description = "The name of the virtual network module."
  type        = string
  default     = "Elern-Vnet"  
}

variable "resource_group_name" {
  description = "The name of the resource group where the virtual network will be created."
    type        = string
    default     = "elern-rg"
}

variable "location" {
  description = "The Azure region where the virtual network will be created."
  type        = string
  default     = "central india"
  
}

variable "address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
  default     = ["10.0.0/16"]
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "Elern-Vnet"
  
}

