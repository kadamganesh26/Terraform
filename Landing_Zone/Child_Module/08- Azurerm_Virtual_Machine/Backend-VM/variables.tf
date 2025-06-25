

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual machine"
  type        = string
  default     = "elern-rg"
}

variable "location" {
  description = "The Azure region where the virtual machine will be created"
  type        = string
  default     =  "CentralIndia"
}

variable "size" {
  description = "value of the size of the virtual machine"
    type        = string
    default     = "Standard_B1ls"
}

variable "admin_username" {
  description = "The administrator username for the virtual machine"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "The administrator password for the virtual machine"
  type        = string
  default     = "P@ssw0rd1234!"
  sensitive   = true
}




#Backend Virtual Machine Variables
variable "name-backend-vm" {
  description = "The name of the backend virtual machine"
  type        = string
  default = "backend-vm"
}



#Data source variable for network interface of the backend Virtual machine Network Interface
variable "backend-nic-data" {
    description = "The name of the backend virtual machine network interface"
    type        = string
    default     = "backend-nic"
}


