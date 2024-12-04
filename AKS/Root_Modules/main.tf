module "rg-module" {
  source   = "../Child_Module/resource_group"
  child_rg = var.dev-aks-rg
}
module "vnet-module" {
  depends_on = [ module.rg-module ]
  source         = "../Child_Module/vnet"
  child-aks-vnet = var.dev-aks-vnet
}

module "subnet-module" {
  depends_on   = [module.vnet-module]
  source       = "../Child_Module/subnet"
  child_subent = var.dev-aks-sub
}

module "aks-cluster-module" {
  depends_on        = [module.rg-module, module.subnet-module]
  source            = "../Child_Module/aks_cluster"
  child-aks-cluster = var.dev-aks-cluster

}