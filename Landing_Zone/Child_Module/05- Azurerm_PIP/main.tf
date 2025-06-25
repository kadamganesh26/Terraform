resource "azurerm_public_ip" "pip-blk" {
  name = var.elern_pip_name
  location = var.location  
    resource_group_name = var.resource_group_name
    allocation_method = "Static"
  
}