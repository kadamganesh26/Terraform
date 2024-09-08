
#Resource Group Values
dev_rg = {
  rg_list = {
    name     = "ganesh"
    location = "west us"
  }
}

#Virtual Network Valuses 
dev_vnet = {
  vnet1 = {
    name                = "frontendvnet"
    location            = "west us"
    resource_group_name = "ganesh"
    address_space       = ["10.0.0.0/23"]
  }
}

#Subent
dev_subnet = {
  frontsubsubnet = {
    name                 = "frontendsub"
    resource_group_name  = "ganesh"
    address_prefixes     = ["10.0.0.0/25"]
    virtual_network_name = "frontendvnet"
  }
  frontbastionsubnet = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "ganesh"
    address_prefixes     = ["10.0.1.0/26"]
    virtual_network_name = "frontendvnet"
  }
}
dev_nic = {
  nic1 = {
    name                 = "vm1nic"
    location             = "west us"
    resource_group_name  = "ganesh"
    subid                = "frontendsub"
    virtual_network_name = "frontendvnet"


    ip_configuration = {
      name                          = "vm1_internal"
      private_ip_address_allocation = "Dynamic"
      subnet_id                     = "frontendsub"
    }
  }
  nic2 = {
    name                 = "vm2nic"
    location             = "west us"
    resource_group_name  = "ganesh"
    subid                = "frontendsub"
    virtual_network_name = "frontendvnet"

    ip_configuration = {
      name                          = "vm1_internal"
      private_ip_address_allocation = "Dynamic"
      subnet_id                     = "frontendsub"
    }
  }
}

#DevPublic IP
public_ip = {
  pip1 = {
    name                = "bastionpip"
    location            = "west us"
    resource_group_name = "ganesh"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "lbpip"
    location            = "west us"
    resource_group_name = "ganesh"
    allocation_method   = "Static"
  }
}

#DevBastion
dev_bastion = {
  frontdend1 = {
    name                = "frontendvnetbastion"
    resource_group_name = "ganesh"
    location            = "west us"
    #PIP_Data_Block
    pip                  = "bastionpip"
    subname              = "AzureBastionSubnet"
    virtual_network_name = "frontendvnet"

    ip_configuration = {
      name = "bastionip"
    }
  }
}
#Virtual Machine
dev_vms = {
  vm1 = {
    name                            = "frontendvm1"
    resource_group_name             = "ganesh"
    location                        = "west us"
    size                            = "Standard_F2"
    network_interface_ids           = "vm1nic"
    admin_username                  = "username"
    admin_password                  = "credential"
    disable_password_authentication = false
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
  vm2 = {
    name                            = "frontendvm2"
    resource_group_name             = "ganesh"
    location                        = "west us"
    size                            = "Standard_F2"
    network_interface_ids           = "vm2nic"
    admin_username                  = "username"
    admin_password                  = "credential"
    disable_password_authentication = false
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}

#Network Security Groups
nsg = {
  nsg1 = {
    name                = "for_http_allowed"
    location            = "west us"
    resource_group_name = "ganesh"
    #Network Security Groups Assiciations
    subid                = "frontendsub"
    virtual_network_name = "frontendvnet"

  }
}
devassonsg = {
  nsgasso = {
    virtual_network_name      = "frontendvnet"
    resource_group_name       = "ganesh"
    subid                     = "frontendsub"
    network_security_group_id = "for_http_allowed"
  }
}
#Backend for tfstate file.
# backend = {
#   stg1 = {
#     name                     = "frontstorg"
#     resource_group_name      = "ganesh"
#     location                 = "west us"
#     account_tier             = "Standard"
#     account_replication_type = "LRS"
#   }
# }

#LB values
# Loadbalabcer = {
#   lb1 = {
#     name_lb             = "frontlb"
#     resource_group_name = "ganesh"
#     location            = "west us"
#     name_pool           = "backendpool"
#     name_probe          = "H1"
#     name_rule           = "LBRule1"
#     name_address_pool   = "frontendpool"
#     name_data_pip       = "lbpip"
#     name_vnet           = "frontendvnet"
   



#   }
#   frontend_ip_configuration = {
#     name = "fontendpubip"

#   }


