
resource "azurerm_resource_group" "rg_blk" {
    for_each = var.rgmap
  name=each.value.name
  location = each.value.location
}
