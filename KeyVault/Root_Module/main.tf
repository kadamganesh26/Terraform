module "rg-module" {
  source = "../Child_Module/Azurerm_Resource_Group"
  rg     = var.dev_rg
}

module "key_vault" {
  depends_on = [module.rg-module]
  source     = "../Child_Module/Azurerm_KeyVault"
  key_vault  = var.dev-key_vault
}