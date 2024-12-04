resource "azurerm_resource_group" "rg-blk" {
  for_each = var.child-rg
  name = each.value.name
  location = each.value.location
}



