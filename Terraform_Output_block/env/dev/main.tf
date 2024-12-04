module "rg-module" {
  source   = "../../child/Azurerm-Resource-Group"
  child_rg = var.dev_rg
}

module "vnet-module" {
  depends_on = [ module.rg-module]
  source = "../../child/Azurerm-Virtual Network"
  child_vnet = var.dev_vnet
}

module "subnet-module" {
  depends_on = [ module.vnet-module ]
  source = "../../child/Azurerm-Subnet"
  child_sub = var.dev_sub
}
module "nic-module" {
  depends_on = [ module.subnet-module, module.vnet-module ]
  source = "../../child/Azurerm-Network-Interface"
  child_nic = var.dev_netwrok_interface
}
module "pip-module" {
  depends_on = [ module.rg-module ]
  source = "../../child/Azurerm-Public-IP Address"
  child_pip = var.dev_pip
}