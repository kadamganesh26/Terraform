resource "azurerm_resource_group" "rg_blk" {
  for_each = var.child-rg
  name= each.value.name
  location = each.value.location
}
output "resource_group_ids" {
  value = { for rg in azurerm_resource_group.rg_blk : rg.name => rg.id }
}