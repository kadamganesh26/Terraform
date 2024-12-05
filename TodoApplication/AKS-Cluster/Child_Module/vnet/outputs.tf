output "vnet-blk" {
  description = "This vnet is for the AKS"
  value={
    for vnet in azurerm_virtual_network.vnet-blk :
    vnet.name => vnet.id
  }
}