resource "azurerm_lb_outbound_rule" "lboutbount-blk" {
  for_each                = var.lboutbount_rule
  name                    = "OutboundRule"
  loadbalancer_id         = data.azurerm_lb.lb-id[each.key].id
  protocol                = "Tcp"
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.lboutbount-data[each.key].id

  frontend_ip_configuration {
    name = "frontendIP"
  }
}

# Get existing Load Balancer
data "azurerm_lb" "lb-id" {
  for_each            = var.lboutbount_rule
  name                = each.value.lb-id
  resource_group_name = each.value.resource_group_name
}

# Get backend pool from that LB
data "azurerm_lb_backend_address_pool" "lboutbount-data" {
  for_each        = var.lboutbount_rule
  name            = each.value.backend_address_pool_id
  loadbalancer_id = data.azurerm_lb.lb-id[each.key].id 
}
