variable "map-rgs" {}
resource "azurerm_resource_group" "rg_blk" {
  for_each = var.map-rgs
  name=each.value.name
  location=each.value.location
}
