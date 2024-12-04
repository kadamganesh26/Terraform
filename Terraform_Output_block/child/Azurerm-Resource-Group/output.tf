output "rg-blk" {
 description = "This is the resource group"
  value = { 
    for rg in azurerm_resource_group.rg-blk : 
    rg.name => rg.id 
  }
}