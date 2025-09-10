module "rg_module" {
  source = "../Modules/Azurerm_resource_group"
  rg     = var.frontend-rg
}
module "vnet_module" {
  depends_on = [module.rg_module]
  source     = "../Modules/Azurerm_virtual_network"
  vnet       = var.frontend-vnet
}
module "subnet_module" {
  depends_on = [module.vnet_module]
  source     = "../Modules/Azurerm_subent"
  subnet     = var.frontend-subnet
}

module "nic_module" {
  source     = "../Modules/Azurerm_NetworkInterface"
  depends_on = [module.subnet_module, module.vnet_module]
  nic        = var.frontend-nic
}

module "vm-module1" {
  depends_on = [module.rg_module, module.nic_module, ]
  source     = "../Modules/Azurerm_Virtual_Machine_vm1"
  vm         = var.frontend-vm1
}

module "vm-module2" {
  depends_on = [module.rg_module, module.nic_module, ]
  source     = "../Modules/Azurerm_Virtual_Machine_vm2"
  vm         = var.frontend-vm2
}

module "nsg-module1" {
  depends_on = [module.rg_module]
  source     = "../Modules/Azurerm_network_security_group"
  nsg-vm1    = var.frontend-nsg1-vm1
}

module "nsg-asso" {
  depends_on   = [module.subnet_module, module.rg_module]
  source       = "../Modules/Azurerm_subnet_network_security_group_association"
  nsg-asso-vm1 = var.frontend-nsg-asso-vm1
}

module "pip" {
  depends_on = [module.rg_module]
  source     = "../Modules/Azurerm_Public_IP_Address"
  pip        = var.frontend-pip
}

module "lb" {
  depends_on = [module.pip, module.rg_module]
  source     = "../Modules/Azurerm_LB"
  lb         = var.lb
}

module "lb-rule" {
  depends_on = [module.lb]
  source     = "../Modules/Azurerm_lb_rule"
  lb-rule    = var.lb-rule
}

module "backend_address_pool_lb" {
  depends_on = [module.lb]
  source     = "../Modules/Azurerm_lb_backend_address_pool"
  lbaop      = var.backend_address_pool_lb
}

module "lboutdbount_rule" {
  depends_on      = [module.lb]
  source          = "../Modules/Azurerm_lb_outbound_rule"
  lboutbount_rule = var.lbout_bound_rule
}

module "lb-probe" {
    depends_on = [ module.lb]
    source = "../Modules/Azurerm_lb_probe"
    lb-proble =var.lb-probe

}
  