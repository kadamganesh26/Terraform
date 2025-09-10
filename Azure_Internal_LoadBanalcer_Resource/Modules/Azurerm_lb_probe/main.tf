resource "azurerm_lb_probe" "lbprob-blk" {
  for_each        = var.lb-proble
  loadbalancer_id = data.azurerm_lb.lb-id[each.key].id
  name            = each.value.name
  port            = each.value.port
}



data "azurerm_lb" "lb-id" {
  for_each            = var.lb-proble
  name                = each.value.lb-id
  resource_group_name = each.value.resource_group_name
}
