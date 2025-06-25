# Variables for the Azure Public IP module
variable "elern_pip_name" {
  description = "value for the public ip name"
  type        = string
  default     = "elern-pip"
}

variable "location" {
  description = "value for the location"
  type        = string
  default     = "CentralIndia"
}

variable "resource_group_name" {
  description = "value for the resource group name"
  type        = string
  default     = "elern-rg"
}

variable "allocation_method" {
  description = "value for the allocation method"
  type        = string
  default     = "Static"
}
