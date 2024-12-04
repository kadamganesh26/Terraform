output "vnet-blk" {
  description = "This is vnet of mohit-rg"
  value ={ 
  for vnet in azurerm_virtual_network.vnet-blk :
  vnet.name => vnet.id 
  }
}
