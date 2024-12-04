resource "azurerm_kubernetes_cluster" "aks_cluster-blk" {
    for_each = var.child-aks-cluster
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = "akscluster"

  network_profile {
    
    network_plugin    = "azure"
    network_policy    = "calico"       # Enabling Calico network policy
    # pod_cidr          = each.value.network_profile.pod_cidr
    service_cidr      = each.value.network_profile.service_cidr
    dns_service_ip    = each.value.network_profile.dns_service_ip
  }
  default_node_pool {
    name            = "default"
    node_count      = each.value.default_node_pool.node_count
    vm_size         = each.value.default_node_pool.vm_size
    vnet_subnet_id  = data.azurerm_subnet.sub-data[each.key].id
  }

  identity {
    type = "SystemAssigned"
  }

}

data "azurerm_subnet" "sub-data" {
    for_each = var.child-aks-cluster
  name                 = each.value.subnet_id
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
