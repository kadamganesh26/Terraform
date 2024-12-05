output "rg-blk" {
  description = "In this RG all AKS componant will be created"
  value={
    for rg in azurerm_resource_group.rg-blk : 
    rg.name=> rg.id
  }
}