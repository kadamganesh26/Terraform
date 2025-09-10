resource "azurerm_lb_backend_address_pool" "bap-blk" {
  for_each        = var.lbaop
  name            = each.value.name
  loadbalancer_id = data.azurerm_lb.lb-id[each.key].id
}



data "azurerm_lb" "lb-id" {
  for_each            = var.lbaop
  name                = each.value.lb-id
  resource_group_name = each.value.resource_group_name
}


