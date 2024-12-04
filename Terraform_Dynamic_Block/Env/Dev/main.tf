module "rg-module" {
  source   = "../../Modules/Azurerm-Resource-Group"
  child-rg = var.dev_rg
}

module "vnet-module" {
  depends_on = [module.rg-module]
  source     = "../../Modules/Azurerm-Virtual-Network"
  child-vnet = var.dev_vnet

}