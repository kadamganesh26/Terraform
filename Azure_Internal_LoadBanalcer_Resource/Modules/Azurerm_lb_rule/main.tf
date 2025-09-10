resource "azurerm_lb_rule" "bl-rule" {
    for_each = var.lb-rule
  loadbalancer_id                = data.azurerm_lb.lb-id[each.key].id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = each.value.frontend_ip_configuration-name
}



data "azurerm_lb" "lb-id" {
    for_each = var.lb-rule
  name                = each.value.lb-id
  resource_group_name = each.value.resource_group_name
}
