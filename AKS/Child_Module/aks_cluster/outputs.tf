
output "aks_cluster-blk" {
  description = "Display the information bout AKS Cluster"
  value = {
    for aks in azurerm_kubernetes_cluster.aks_cluster-blk : 
    aks.name => aks.id
  }
  
}