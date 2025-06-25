# Subnet data source for NSG association
variable "sub_data_name" {
  description = "The name of the subnet to associate with the NSG"
  type        = string
  default     = "elern-subnet"
}

variable "virtual_network_name" {
  description = "The name of the virtual network where the subnet is located"
  type        = string
  default     = "Elern-Vnet"
}

variable "resource_group_name" {
  description = "The name of the resource group where the subnet is located"
  type        = string
  default     = "elern-rg"
}

# Network Security group data source for Nic NSG association
variable "nsg_name" {
  description = "The name of the Network Security Group to associate with the subnet"
  type        = string
  default     = "elern-nsg"
}
variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
  default     = "CentralIndia"
}

