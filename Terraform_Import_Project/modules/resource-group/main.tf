resource "azurerm_resource_group" "rg-blk" {
    for_each = var.resource_groups
  name     = each.value.name
  location = each.value.location
}
