output "subnet-blk" {
  description = "This subnet we will use for AKS"
  value = {
    for subnet in azurerm_subnet.subnet-blk : 
    subnet.name=> subnet.id
  }
}