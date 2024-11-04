#Modules For RG
module "rg_module" {
  source   = "../Environment/Dev/1. Azurerm_ResourceGroup"
  child_rg = var.dev_rg
}
#Module for Virtual Network
module "vnet_module" {
  depends_on = [module.rg_module]
  source     = "../Environment/Dev/2. Azurerm_Virtual_Network"
  child_vnet = var.dev_vnet
}
#Modules for Subent
module "subnet_module" {
  depends_on = [module.vnet_module]
  source     = "../Environment/Dev/3. Azurerm_Subnet"
  child_sub  = var.subnets
}
#Modules for Public IP
module "pip_module" {
  depends_on = [module.rg_module]
  source     = "../Environment/Dev/4. Azurerm_Public_IP"
  child_pip  = var.dev_pip
}

#Modules for Network Interface
module "nic_module" {
  depends_on = [module.rg_module, module.vnet_module, module.subnet_module]
  source     = "../Environment/Dev/5. Azurerm_Network_Interface"
  child_nic  = var.dev_nic
}
#Modules for Bastion
module "bastion_module" {
  depends_on    = [module.subnet_module, module.vnet_module]
  source        = "../Environment/Dev/6. Azurerm_Bastion"
  child_bastion = var.dev_bastion
}
#Module for Storage account
module "storage_Account" {
  depends_on  = [module.rg_module]
  source      = "../Environment/Dev/7. Storage_Account"
  child_store = var.dev_store
}

#Modules for Keyvaults
module "KeyVaults" {
  depends_on      = [module.rg_module]
  source          = "../Environment/Dev/8. Key_Vault"
  child_keyvalult = var.dev_vaults
}
