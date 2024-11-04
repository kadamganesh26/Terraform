#Resource Group Variables
variable "dev_rg" {
  type = map(any)
}
#Virtual Network
variable "dev_vnet" {
  type = map(any)
}

#Subent
variable "subnets" {
  type = map(any)
}
#Public IP 
variable "dev_pip" {
  type = map(any)
}

#Network Interface
variable "dev_nic" {
  type = map(any)
}
#Bastion Variables
variable "dev_bastion" {
  type = map(any)
}

#Storage account variables
variable "dev_store" {
  type = map(any)
}
#KeyVaults
variable "dev_vaults" {
  type = map(any)
}