variable "child_rg" {}

resource "azurerm_resource_group" "rg_blk" {
  for_each = var.child_rg
  name     = each.value.name
  location = each.value.location
}
