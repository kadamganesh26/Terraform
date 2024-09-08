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
  depends_on = [module.rgmdl, module.submdl]
  source     = "../Modules/Azurerm_Network_Interface"
  nic        = var.dev_nic
}
module "vmmol" {
  depends_on = [module.nicmdl, module.rgmdl, module.bastionmol]
  source     = "../Modules/Azurerm_Virtual_Machine"
  vms        = var.dev_vms
}


module "bastionmol" {
  depends_on = [module.submdl]
  source     = "../Modules/Azurerm_Public_IP"
  pip        = var.dev_pip
}

