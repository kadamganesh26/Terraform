resource "azurerm_resource_group" "rg_blk" {
  name     = var.child_resource_group_name
  location = var.child_location
}
