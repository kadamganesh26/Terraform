output "pip-blk" {
  description = "This public ip we will use for bastion"
  value = {
    for pip in azurerm_public_ip.pip-blk :
    pip.name => pip.id
  }
}