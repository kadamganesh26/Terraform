   variable "frontend-subnet_name" {
     description = "value for the subnet name"
      type        = string
      default = "frontend-subnet"
   }

    variable "resource_group_name" {
      description = "this is the name of the resource group"
      type        = string
      default     = "Elern-rg"
    }

    variable "virtual_network_name" {
      description = "this is the name of the virtual network"
      type        = string
      default     = "Elern-Vnet" 
    }

    variable "frondtend-address_prefixes" {
      description = "this is the address prefix for the subnet"
      type        = list(string)
      default     = ["10.0.1.0/24"]
      
    }

# Backend Subnet Variables 
variable "backend-subnet_name" {
      description = "value for the backend subnet name"
      type        = string
      default     = "backend-subnet"
  
}
   

 variable "backend-address_prefixes" {
      description = "this is the address prefix for the subnet"
      type        = list(string)
      default     = ["10.0.2.0/24"] 
    }
   