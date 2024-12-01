resource "azurerm_public_ip" "pip-blk" {
  for_each = var.child_pip
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method = each.value.allocation_method
}