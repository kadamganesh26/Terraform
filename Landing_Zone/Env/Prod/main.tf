# This must be declared at the top
data "azurerm_client_config" "current" {}

module "module_resource_group" {
  source                    = "../../Child_Module/01- Azurerm_Resource_Group"
  child_location            = "CentralIndia"
  child_resource_group_name = "elern-rg"
}

module "module_virtual_network" {
  depends_on           = [module.module_resource_group]
  source               = "../../Child_Module/02- Azurerm_Virtual_Network"
  location             = "CentralIndia"
  resource_group_name  = "elern-rg"
  virtual_network_name = "Elern-Vnet"
  address_space        = ["10.0.0.0/16"]
}

#Subnet module is used to create multiple subnets in the same virtual network.
module "module_subnet_frontend" {
  depends_on                 = [module.module_virtual_network, module.module_resource_group]
  source                     = "../../Child_Module/03- Azurerm_Subnet"
  frontend-subnet_name       = "frontend-subnet"
  resource_group_name        = "elern-rg"
  virtual_network_name       = "Elern-Vnet"
  frondtend-address_prefixes = ["10.0.1.0/24"]
}

module "module_subnet_backend" {
  depends_on               = [module.module_virtual_network, module.module_resource_group]
  source                   = "../../Child_Module/03- Azurerm_Subnet"
  backend-subnet_name      = "backend-subnet"
  resource_group_name      = "elern-rg"
  virtual_network_name     = "Elern-Vnet"
  backend-address_prefixes = ["10.0.2.0/24"]
}

#Network Interface module is used to create multiple network interfaces in the same subnet.
# This module can be used to create network interfaces for virtual machines or other resources.

module "named_network_interface_frontend" {
  depends_on           = [module.module_subnet_frontend]
  source               = "../../Child_Module/06- Azurerm_Network_Interface/frontend"
  name-frondtend       = "frontend-nic"
  location             = "CentralIndia"
  resource_group_name  = "elern-rg"
  sub-data-frontend    = "frontend-subnet"
  virtual_network_name = "Elern-Vnet"
}

module "named_network_interface_backend" {
  depends_on           = [module.module_subnet_backend]
  source               = "../../Child_Module/06- Azurerm_Network_Interface/backend"
  name-backend         = "backend-nic"
  location             = "CentralIndia"
  resource_group_name  = "elern-rg"
  sub-data-backend     = "backend-subnet"
  virtual_network_name = "Elern-Vnet"

}



module "public" {
  depends_on          = [module.module_resource_group]
  source              = "../../Child_Module/05- Azurerm_PIP"
  elern_pip_name      = "elern-pip"
  location            = "CentralIndia"
  resource_group_name = "elern-rg"
  allocation_method   = "Static"
}

#Frontend Network Security Group module is used to create a network security group for the frontend subnet.
module "network_security_group_frontend" {
  depends_on          = [module.module_resource_group, module.module_virtual_network, module.module_subnet_frontend, module.named_network_interface_frontend]
  source              = "../../Child_Module/04- Azurerm_nsg"
  nsg_name            = "frontend-nsg"
  location            = "CentralIndia"
  resource_group_name = "elern-rg"
}

module "azurerm_subnet_network_security_group_association_frontend" {
  depends_on           = [module.module_subnet_frontend, module.network_security_group_frontend, module.module_resource_group, ]
  source               = "../../Child_Module/07- Azurerm_nic_nsg_association"
  sub_data_name        = "frontend-subnet"
  virtual_network_name = "Elern-Vnet"
  resource_group_name  = "elern-rg"
  nsg_name             = "frontend-nsg"

}

#backend Network Security Group module is used to create a network security group for the backend subnet.
module "network_security_group_backend" {
  depends_on          = [module.module_resource_group, module.module_virtual_network, module.module_subnet_backend, module.named_network_interface_backend]
  source              = "../../Child_Module/04- Azurerm_nsg"
  nsg_name            = "backend-nsg"
  location            = "CentralIndia"
  resource_group_name = "elern-rg"
}

module "azurerm_subnet_network_security_group_association-backend" {
  depends_on           = [module.module_subnet_backend, module.network_security_group_backend, module.module_resource_group, ]
  source               = "../../Child_Module/07- Azurerm_nic_nsg_association"
  sub_data_name        = "backend-subnet"
  virtual_network_name = "Elern-Vnet"
  resource_group_name  = "elern-rg"
  nsg_name             = "backend-nsg"
}

module "virtual_machine_frontend" {
  depends_on          = [module.named_network_interface_frontend, module.azurerm_subnet_network_security_group_association_frontend]
  source              = "../../Child_Module/08- Azurerm_Virtual_Machine/frontend-vm"
  name-frontend-vm    = "frontend-vm"
  resource_group_name = "elern-rg"
  location            = "CentralIndia"
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  admin_password      = "P@ssw0rd1234!"

}

module "virtual_machine_backend" {
  depends_on          = [module.named_network_interface_backend, module.azurerm_subnet_network_security_group_association_frontend]
  source              = "../../Child_Module/08- Azurerm_Virtual_Machine/backend-vm"
  name-backend-vm     = "backend-vm"
  resource_group_name = "elern-rg"
  location            = "CentralIndia"
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  admin_password      = "P@ssw0rd1234!"
  # backend-nic-data    = "backend-nic"
}

module "sql_server" {
  depends_on                   = [module.module_resource_group]
  source                       = "../../Child_Module/09- Azurerm_mssql_Server"
  sql-server-name              = "elern-sql-server"
  resource_group_name          = "elern-rg"
  location                     = "central india"
  sql_version                  = 12.0
  administrator_login          = "missadministrator"
  administrator_login_password = "thisIsKat11"
  minimum_tls_version          = 1.2
}

module "mssql-database" {
  depends_on        = [module.sql_server, module.module_resource_group]
  source            = "../../Child_Module/10- Azurerm_mssql_database"
  sql_database_name = "Elearn-db"
  sql_server_name   = "elern-sql-server"
  collation         = "SQL_Latin1_General_CP1_CI_AS"
  license_type      = "LicenseIncluded"
  max_size_gb       = 2
  sku_name          = "S0"
  enclave_type      = "VBS"
}

module "KeyVault" {
  source                      = "../../Child_Module/11- Azurerm_Key_vault"
  depends_on                  = [module.module_resource_group]
  key_vault_name              = "elaren-vault"
  location                    = "central india"
  resource_group_name         = "elern-rg"
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"

}
