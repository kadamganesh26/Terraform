# Resource Group Module
module "rg_mod" {
  source  = "../Parent_Modules/Azurerm_Resource_Group"
  map-rgs = var.dev_map
}
# Vitural Network Module
module "vnet_mod" {
  depends_on = [module.rg_mod]
  source     = "../Parent_Modules/Azurerm_Virtual_Network"
  map-vnet   = var.dev_vnet
}
#Subnet_Module
module "sub_mod" {
  depends_on = [module.vnet_mod]
  source     = "../Parent_Modules/Azurerm_subnet"
  map_sub    = var.dev_sub
}
# Network Interface_Module
module "nic_mod" {
  depends_on = [module.vnet_mod, module.sub_mod, module.rg_mod, ]
  source     = "../Parent_Modules/Azurerm_Network_Interface"
  nics       = var.dev_nics
}
# Public IP Module
# module "pip_modl" {
#   depends_on = [module.rg_mod]
#   source     = "../Parent_Modules/Azurerm_Public_IP"
#   map_pip    = var.dev_pip
# }
# Linux Virtual Machine Module
module "vms_modl" {
  depends_on = [module.nic_mod, module.rg_mod]
  source     = "../Parent_Modules/VM_Linux"
 linux_vms =        var.dev_linuxvms
}

#Windows Virtaul Machine Module
module "win_vms_modl" {
  depends_on = [module.nic_mod,module.rg_mod ]
  source = "../Parent_Modules/VM_Windows"
  windows_vm = var.dev_winvm
}

#Netowrk_Security_Group
module "nsg_modl" {
  depends_on = [ module.rg_mod ]
  source = "../Parent_Modules/Azurerm_Network_Security_Group"
  nsg=var.dev_nsg
}

#Network Securotu Group Allocation
module "nsg_allocation" {
  depends_on = [ module.sub_mod,module.vnet_mod ,module.nsg_modl,module.rg_mod]
  source = "../Parent_Modules/Azurerm_Security_Group_Allocation"
  nsg_allocation=var.dev_nsg_allocation
}