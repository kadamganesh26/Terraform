module "paranat-rg" {
  source   = "../Child_Module/1.Azurerm_Resource_Group"
  child_rg = var.parant_rg
}
module "parant_vnet" {
  depends_on = [module.paranat-rg]
  source     = "../Child_Module/2.Azurerm_Virtual_Netowork"
  child_vnet = var.parant_vnet

}
module "paranat_subnet" {
  depends_on   = [module.parant_vnet]
  source       = "../Child_Module/3.Azurerm_Subent"
  child_subnet = var.paranat_subnet
}

module "paranat_nic" {
  depends_on   = [module.paranat_subnet]
  source       = "../Child_Module/4.Auzrerm_Network_Interface"
  child_nic    = var.paranat_nic
  child_subnet = var.paranat_subnet
}

module "paranat_pip" {
  depends_on = [module.paranat-rg]
  source     = "../Child_Module/5.Azurerm_Public_IP"
  child_pip  = var.paranat_pip
}
module "parant_vm" {
  depends_on  = [module.paranat_subnet, module.parant_vnet, module.paranat_nic, module.paranat-rg, module.paranat_vault  ]
  source      = "../Child_Module/6.Azurerm_Virtual_Machine"
  child-vm    = var.paranat_vm
  child_nic   = var.paranat_nic
  child-vault = var.paranat_vault
}
module "paranat_vault" {
  depends_on  = [module.paranat-rg]
  source      = "../Child_Module/7.Azurerm_Key_Vault"
  child-vault = var.paranat_vault
}
# module "paranat_bastion" {
#   depends_on    = [module.paranat_pip, module.paranat_subnet]
#   source        = "../Child_Module/8.Azurerm_Bastion"
#   child_bastion = var.paranat_bastion



# }