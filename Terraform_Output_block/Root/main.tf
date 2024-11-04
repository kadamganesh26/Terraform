module "rg_mod" {
  source = "../Child/1. Azurerm_resource_group"
  child-rg=var.dev_rg
  
}