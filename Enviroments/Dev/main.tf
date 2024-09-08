module "dev_rgs" {
  source   = "../../Child/1 Azurerm_Resource_Group"
  child_rg = var.dev_rg
}

module "dev_vnet" {
  depends_on = [module.dev_rgs]
  source     = "../../Child/2 Azurerm_Virtual_Network"
  child_vnet = var.dev_vnet
}

module "dev_sub" {
  depends_on = [module.dev_vnet]
  source     = "../../Child/3 Azurerm_Subnet"
  child_sub  = var.dev_subnet
}
module "dev_nic" {
  depends_on = [module.dev_sub, module.dev_vnet]
  source     = "../../Child/4 Azurerm_Network_Interface"
  child_nic  = var.dev_nic
}

module "public_ip" {
  depends_on = [var.dev_nic, module.dev_rgs]
  source     = "../../Child/5 Azurerm_Public IP"
  child_pip  = var.public_ip
}
module "bastion" {
  depends_on    = [module.dev_nic, module.public_ip, module.dev_sub, module.dev_rgs]
  source        = "../../Child/6 Auzrerm_Bastion"
  child_bastion = var.dev_bastion
}

module "linux_vm" {
  depends_on = [module.dev_nic, module.bastion, module.dev_vnet]
  source     = "../../Child/7 Azurerm_Virtual_machine"
  child_vms  = var.dev_vms
}
module "nsg" {
  depends_on = [module.dev_rgs, module.dev_nic, module.dev_vnet]
  source     = "../../Child/8 Azurerm_Network_Security Group"
  child_nsg  = var.nsg
}
module "nsgass" {
  depends_on = [module.dev_vnet, module.dev_rgs, module.dev_vnet, module.dev_sub, module.nsg]
  source     = "../../Child/9 Azurerm_Network_Security_group_association"
  childasso  = var.devassonsg
}
module "lb" {
  depends_on  = [module.dev_nic, module.linux_vm, module.dev_rgs, module.dev_vnet]
  source      = "../../Child/11 Azurerm_Lead_Balancer"
  child_lb    = var.lb_details
  child_lbnic = var.lbnic_details

}

