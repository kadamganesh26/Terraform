#Resource Group Variables 
dev_rg = {
  rg1 = {
    name     = "raghav"
    location = "Japan East"
  }
}
#Virtual Network Variables
dev_vnet = {
  vnet = {
    name                = "vnet1"
    location            = "Japan East"
    resource_group_name = "raghav"
    address_space       = ["10.0.0.0/23"]
  }
}
#Subent Variables 
dev_subnet = {
  subnetA = {
    name                 = "subnet1"
    resource_group_name  = "raghav"
    address_prefixes     = ["10.0.1.0/24"]
    virtual_network_name = "vnet1"
  }
  subnetB = {
    name                 = "subnet2"
    resource_group_name  = "raghav"
    address_prefixes     = ["10.0.0.128/25"]
    virtual_network_name = "vnet1"
  }

  subnetC = {
    name                 = "subnet3"
    resource_group_name  = "raghav"
    address_prefixes     = ["10.0.0.64/26"]
    virtual_network_name = "vnet1"
  }
  subnetD = {
    name                 = "subnet4"
    resource_group_name  = "raghav"
    address_prefixes     = ["10.0.0.32/27"]
    virtual_network_name = "vnet1"
  }
}

#Network Interface Variables
dev_nic = {
  nicA = {
    name                = "nic1"
    location            = "Japan East"
    resource_group_name = "raghav"
    #Subnet data block Variables
    subnet_id            = "subnet1"
    virtual_network_name = "vnet1"
    ip_configuration = {
      name                          = "internal1"
      private_ip_address_allocation = "Dynamic"
    }
  }
  nicB = {
    name                = "nic2"
    location            = "Japan East"
    resource_group_name = "raghav"
    #Subnet data block Variables
    subnet_id            = "subnet1"
    virtual_network_name = "vnet1"
    ip_configuration = {
      name                          = "internal1"
      private_ip_address_allocation = "Dynamic"
    }
  }
}
# Storage Account Variables
dev_storeage = {
  store1 = {
    name                     = "abcdefgstore"
    resource_group_name      = "raghav"
    location                 = "Japan East"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
#Conatiner Variables
dev_cont={
  cont1={
     name                  = "vhds"
  storage_account_name  = "abcdefgstore"
  container_access_type = "private"
  }
}

#dev_Public Ip Address Variables.
dev_pip = {
  pipA = {
    name                = "pip1"
    resource_group_name = "raghav"
    location            = "Japan East"
    allocation_method   = "Static"
  }
  pipB = {
    name                = "pip2"
    resource_group_name = "raghav"
    location            = "Japan East"
    allocation_method   = "Static"
  }
}

#dev_Public Ip Address Variables.
dev_linux_VM = {
  linuxvm1 = {
    name                = "devlinuxvm"
    resource_group_name = "raghav"
    location            = "Japan East"
    size                = "Standard_F2"
    admin_username      = "pcpl"
    admin_password      = "Hin12#$%^&*()"
    #Network Interface data
    nic_name = "nic1"
    #OS Disk Details
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
  }
}
