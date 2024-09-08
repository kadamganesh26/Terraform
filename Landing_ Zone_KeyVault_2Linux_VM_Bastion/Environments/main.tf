
module "rgmdl" {
  source = "../Modules/Azurerm_Resource_Group"
  rgmap  = var.dev_rg
}

module "vnetmdl" {
  depends_on = [module.rgmdl]
  source     = "../Modules/Azurerm_Virtual_Network"
  vnetmap    = var.dev_vnet

}
module "submdl" {
  depends_on = [module.vnetmdl]
  source     = "../Modules/Azurerm_subnet"
  sub        = var.dev_subnet
}
module "nicmdl" {
  depends_on = [module.vnetmdl,module.submdl,module.rgmdl ]
  source     = "../Modules/Azurerm_Network_Interface"
  nic        = var.dev_nic
}
module "vmmol" {
  depends_on = [module.nicmdl, module.rgmdl]
  source     = "../Modules/Azurerm_Virtual_Machine"
  vms        = var.dev_vms
}

module "pipmol" {
  depends_on = [module.rgmdl]
  source     = "../Modules/Azurerm_Public_IP"
  map_pip= var.dev_pip
}
module "nsgmodl" {
  depends_on = [ module.rgmdl,module.nicmdl]
  source = "../Modules/Azurerm_Network Security Group"
  map_nsg=var.dev_nsg
}

#Network Securotu Group Allocation
module "nsg_allocation" {
  depends_on = [ module.submdl, module.vnetmdl ,module.nsgmodl,module.rgmdl]
  source = "../Modules/Azurerm_Network Security Group Allocation"
  nsg_allocation=var.dev_nsg_allocation
}

#Bastion 
module "bastionmodule" {
  depends_on = [ module.nicmdl,module.vnetmdl,module.vmmol, module.pipmol ]
  source = "../Modules/Bastion"
  map_bastion=var.dev_bastion
}



