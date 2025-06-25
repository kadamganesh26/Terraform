# resource "azurerm_mssql_server" "example" {
#   name                         = var.sql-server-name
#   resource_group_name          = var.resource_group_name
#   location                     = var.location
#   version                      = "12.0"
#   administrator_login          = var.administrator_login
#   administrator_login_password = var.administrator_login_password
#   minimum_tls_version          = var.minimum_tls_version

#   identity {type = "SystemAssigned"}
# }



resource "azurerm_mssql_server" "mssql-server-blk" {
  name                         = var.sql-server-name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}



