
data "azurerm_mssql_server" "mssql-server-data" {
  name= var.sql_server_name 
  resource_group_name = var.resource_group_name
}

resource "azurerm_mssql_database" "mssql-database" {
  name         = var.sql_database_name 
  server_id    = data.azurerm_mssql_server.mssql-server-data.id
  collation    = var.collation
  license_type = var.license_type
  max_size_gb  = var.max_size_gb 
  sku_name     = var.sku_name
  enclave_type = var.enclave_type

}

