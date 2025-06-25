variable "sql_database_name" {
  description =" this is name of SQL database"
  type = string 
  default = "Elearn-db"
}

variable "resource_group_name" {
  default = "elern-rg"
  type = string
  description = "this is name of RG where our database is placed"
}

variable "collation" {
    default = "SQL_Latin1_General_CP1_CI_AS"
    type = string
    description = "This is a databaces collection"
}

variable "license_type" {
    default = "LicenseIncluded"
    type = string
    description = "this is linces type of database"
}
variable "max_size_gb" {
    default = 2
    type = number
    description = "this is max size of databse"
}

variable "sku_name" {
    default = "S0"
    type = string
    description = "this is SKU name"
}

variable "enclave_type" {
    default = "VBS"
    type = string
    description = "this is enclave type of database"
}


variable "sql_server_name" {
    type = string
    default = "elern-sql-server"
    description = "this is server name"
  
}