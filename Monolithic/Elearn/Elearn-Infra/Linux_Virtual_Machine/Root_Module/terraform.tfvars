parant_rg = {
  rg1 = {
    name     = "frontend-rg"
    location = "west us"
  }
  rg2 = {
    name     = "backend-rg"
    location = "central india"
  }
}
parant_vnet = {
  vnet1 = {
    name                = "frontend-vnet"
    location            = "west us"
    resource_group_name = "frontend-rg"
    address_space       = ["10.0.0.0/22"]
  }
  vnet2 = {
    name                = "backend-vnet"
    location            = "central india"
    resource_group_name = "backend-rg"
    address_space       = ["10.0.4.0/23"]
  }
}

paranat_subnet = {
  sub1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "frontend-rg"
    address_prefixes     = ["10.0.0.0/23"]
    virtual_network_name = "frontend-vnet"
  }

  sub2 = {
    name                 = "backend-subnet"
    resource_group_name  = "backend-rg"
    address_prefixes     = ["10.0.4.0/24"]
    virtual_network_name = "backend-vnet"
  }

  sub3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "frontend-rg"
    address_prefixes     = ["10.0.2.0/26"]
    virtual_network_name = "frontend-vnet"
  }
}

paranat_nic = {
  nic1 = {
    name                = "frontend-nic"
    location            = "west us"
    resource_group_name = "frontend-rg"
    ip_configuration = {
      ipname                        = "frontend-nicip"
      private_ip_address_allocation = "Dynamic"
      #datablock
      name                 = "frontend-subnet"
      stname               = "sub1"
      virtual_network_name = "frontend-vnet"
    }
  }
  nic2 = {
    name                = "backend-nic"
    location            = "central india"
    resource_group_name = "backend-rg"
    ip_configuration = {
      ipname                        = "backend-nicip"
      private_ip_address_allocation = "Dynamic"
      #datablock
      name                 = "backend-subnet"
      stname               = "sub2" #Subnet referanmce from the sub2 values 
      virtual_network_name = "backend-vnet"
    }
  }
}

paranat_pip = {
  pip1 = {
    name                = "frontend_pip"
    location            = "west us"
    resource_group_name = "frontend-rg"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "backend_pip"
    location            = "central india"
    resource_group_name = "backend-rg"
    allocation_method   = "Static"
  }
}

paranat_vm = {
  vm1 = {
    name                = "frontendvm"
    location            = "west us"
    resource_group_name = "frontend-rg"
    size                = "Standard_F2"
    #data-block
    #name   = "frontend-nic"
    nic_id                          = "nic1" #Value is from the nic1 values
    disable_password_authentication = false
    os_disk = {
      storage_account_type = "Standard_LRS"
      caching              = "ReadWrite"
    }
  }

  vm2 = {
    name                = "backend-vm"
    location            = "central india"
    resource_group_name = "backend-rg"
    size                = "Standard_F2"
    #data-block
    #name   = "frontend-nic"
    nic_id                          = "nic2" #Value is from the nic2 blok
    disable_password_authentication = false
    os_disk = {
      storage_account_type = "Standard_LRS"
      caching              = "ReadWrite"
    }
  }
}



paranat_vault = {
  keyvault = {
    name                        = "mohit1"
    location                    = "west us"
    resource_group_name         = "frontend-rg"
    enabled_for_disk_encryption = true
    sku_name                    = "standard"
  }
}

# paranat_bastion = {
#   bastion = {
#     name                 = "AzureBastion"
#     location             = "west us"
#     resource_group_name  = "frontend-rg"
#     virtual_network_name = "frontend-vnet"
#     pip_name             = "frontend_pip"
#     ip_configuration = {
#       name = "configuration"
#     }
#   }
# }
