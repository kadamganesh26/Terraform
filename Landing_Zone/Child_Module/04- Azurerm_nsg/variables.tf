variable "nsg_name" {
  description = "The name of the Network Security Group"
  type        = string
  default     = "elern-nsg"
  
}
variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
  default     = "CentralIndia"
  
}

variable "resource_group_name" {
  description = "The name of the resource group where the NSG will be created"
  type        = string
  default     = "elern-rg"
  
}