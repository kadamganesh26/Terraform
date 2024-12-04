output "sub-blk" {
  description = "This is subnet id details"
  value = { 
   for subnet in resource.azurerm_subnet.sub-blk : 
    subnet.name => subnet.id
  }
}