parant_rg = {
  rg1 = {
    name     = "todoapp-rg"
    location = "west us"
  }
  rg2 = {
    name     = "sap-rg"
    location = "central india"
  }
}
parant_vnet = {
  vnet1 = {
    name                = "todoapp-vnet"
    location            = "west us"
    resource_group_name = "todoapp-rg"
    address_space       = ["10.0.0.0/22"]
  }
  vnet2 = {
    name                = "sap-vnet"
    location            = "central india"
    resource_group_name = "sap-rg"
    address_space       = ["10.0.4.0/23"]
  }
}

paranat_subnet = {
  sub1 = {
    name                 = "todoapp-subnet"
    resource_group_name  = "todoapp-rg"
    address_prefixes     = ["10.0.0.0/23"]
    virtual_network_name = "todoapp-vnet"
  }

  sub2 = {
    name                 = "sap-subnet"
    resource_group_name  = "sap-rg"
    address_prefixes     = ["10.0.4.0/24"]
    virtual_network_name = "sap-vnet"
  }

  sub3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "todoapp-rg"
    address_prefixes     = ["10.0.2.0/26"]
    virtual_network_name = "todoapp-vnet"
  }
}

paranat_nic = {
  nic1 = {
    name                = "todoapp-nic"
    location            = "west us"
    resource_group_name = "todoapp-rg"
    ip_configuration = {
      ipname                        = "todoapp-nicip"
      private_ip_address_allocation = "Dynamic"
      #datablock
      name                 = "todoapp-subnet"
      stname               = "sub1"
      virtual_network_name = "todoapp-vnet"
    }
  }
    nic2 = {
      name                = "sap-nic"
      location            = "central india"
      resource_group_name = "sap-rg"
      ip_configuration = {
        ipname                        = "sap-nicip"
        private_ip_address_allocation = "Dynamic"
        #datablock
        name                 = "sap-subnet"
        stname               = "sub2" #Subnet referanmce from the sub2 values 
        virtual_network_name = "sap-vnet"
      }
    }
  }

paranat_pip = {
  pip1 = {
    name                = "todoapp_pip"
    location            = "west us"
    resource_group_name = "todoapp-rg"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "sap_pip"
    location            = "central india"
    resource_group_name = "sap-rg"
    allocation_method   = "Static"
  }
}

paranat_vm = {
  vm1 = {
    name                = "todoappvm"
    location            = "west us"
    resource_group_name = "todoapp-rg"
    size                = "Standard_F2"
    #data-block
    #name   = "todoapp-nic"
    nic_id = "nic1" #Value is from the nic1 values
    disable_password_authentication = false
    os_disk = {
      storage_account_type = "Standard_LRS"
      caching              = "ReadWrite"
    }
  }
  
  vm2 = {
    name                = "sap-vm"
    location            = "central india"
    resource_group_name = "sap-rg"
    size                = "Standard_F2"
    #data-block
    #name   = "todoapp-nic"
    nic_id = "nic2" #Value is from the nic2 blok
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
    resource_group_name         = "todoapp-rg"
    enabled_for_disk_encryption = true
    sku_name = "standard"
  }
}

paranat_bastion = {
  bastion = {
    name                 = "AzureBastion"
    location             = "west us"
    resource_group_name  = "todoapp-rg"
    virtual_network_name = "todoapp-vnet"
    pip_name                  = "todoapp_pip"
    ip_configuration = {
      name = "configuration"
    }
  }
}
