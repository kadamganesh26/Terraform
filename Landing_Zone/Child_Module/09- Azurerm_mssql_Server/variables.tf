
variable "sql-server-name" {
    description = "The name of SQL Server"
    type = string
    default = "elern-sql-server"
}

variable "resource_group_name" {
    description = "name of resouce group where we can add the SQL server"
    type = string   
    default = "elern-rg"
}

variable "location" {
  description = "Name of the location where this server will create"
  default = "central india"
  type = string
}

variable "administrator_login" {
    description = "User Name of SQL Server"
    default = "missadministrator"
    type = string
}

variable "administrator_login_password" {
  description = "Password of SQL Server"
  default = "thisIsKat11"
  type = string
}

variable "minimum_tls_version" {
    description = "lts version of SQL server"
    default = 1.2
    type = number
}

variable "sql_version" {
    description = "version of SQL Server"
    default = 12.0
    type = number
  
}