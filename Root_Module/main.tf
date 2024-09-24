##Resource Group Module
module "rg_module" {
  source   = "../Child_Module/1.Resource_Group"
  child_rg = var.dev_rg
}
#Virtual Network Module
module "vnet_module" {
  depends_on = [module.rg_module]
  source     = "../Child_Module/2.Virtual_Network"
  child_vnet = var.dev_vnet
}
#Subent Module
module "subnet_module" {
  depends_on   = [module.vnet_module]
  source       = "../Child_Module/3.Subnet"
  child_subent = var.dev_subnet
}
#Network Interface Module
module "nic_module" {
  depends_on = [module.rg_module, module.subnet_module, module.vnet_module]
  source     = "../Child_Module/4.Network_Interface"
  child_nic  = var.dev_nic
}
#Dev_Storeage Accounts Module
module "storeage_account_module" {
    depends_on = [ module.rg_module ]
    source = "../Child_Module/5.Storage_Account"
    child_store=var.dev_storeage
}
#dev_container Module
module "cont_module" {
  depends_on = [ module.storeage_account_module ]
  source = "../Child_Module/8.Container"
  child_cont=var.dev_cont
}
#Dev Public IP Address module
module "dev_pip" {
  depends_on = [module.rg_module]
  source     = "../Child_Module/6.Public IP Address"
  child_pip  = var.dev_pip
}
#dev_linux_virtual machine module
module "dev_vm_linux" {
  depends_on = [ module.nic_module, module.vnet_module,module.subnet_module, module.rg_module ]
  source = "../Child_Module/7.Linux_Virtaul_Machine"
  child_linux_VM=var.dev_linux_VM
}

