resource "azurerm_subnet" "frontend-subnet-blk" {
    name = var.frontend-subnet_name
    resource_group_name = var.resource_group_name
    virtual_network_name = var.virtual_network_name
    address_prefixes = var.frondtend-address_prefixes
}

resource "azurerm_subnet" "backend-subnet-blk" {
    name = var.backend-subnet_name
    resource_group_name = var.resource_group_name
    virtual_network_name = var.virtual_network_name
    address_prefixes = var.backend-address_prefixes
}