resource "azurerm_resource_group" "k8-rg" {
  name     = "k8-resources"
  location = "Japan East"
}

resource "azurerm_kubernetes_cluster" "k8_blk" {
  name                = "srijan-aks1"
  location            = azurerm_resource_group.k8-rg.location
  resource_group_name = azurerm_resource_group.k8-rg.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.k8_blk.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.k8_blk.kube_config_raw

  sensitive = true
}