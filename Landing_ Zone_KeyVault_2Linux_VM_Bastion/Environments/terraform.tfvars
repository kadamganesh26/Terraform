#Resource Group Valuse
dev_rg = {
  rg1 = {
    name     = "ganesh"
    location = "west europe"
  }
  rg2 = {
    name     = "dinesh"
    location = "west us"
  }
}
#Virtual Network Value
dev_vnet = {
  vnet1 = {
    name                = "fvnet"
    resource_group_name = "ganesh"
    location            = "west europe"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "bvnet"
    resource_group_name = "dinesh"
    location            = "west us"
    address_space       = ["10.0.0.0/23"]
  }
}
#Subnet Value
dev_subnet = {
  sub1 = {
    name                 = "fsub"
    resource_group_name  = "ganesh"
    address_prefixes     = ["10.0.0.0/29"]
    virtual_network_name = "fvnet"
  }
  sub2 = {
    name                 = "bsub"
    resource_group_name  = "dinesh"
    address_prefixes     = ["10.0.0.0/25"]
    virtual_network_name = "bvnet"
  }
  sub3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "dinesh"
    address_prefixes     = ["10.0.1.0/26"]
    virtual_network_name = "bvnet"
  }
}

dev_nic = {
  nic1 = {
    name     = "fnic"
    location = "west europe"
    rgname   = "ganesh"
    sdname   = "fsub"
    vnetname = "fvnet"

    ip_configuration = {
      name                          = "internal"
      private_ip_address_allocation = "Dynamic"
    }
  }
  nic2 = {
    name     = "bnic"
    location = "west us"
    rgname   = "dinesh"
    sdname   = "bsub"
    vnetname = "bvnet"

    ip_configuration = {
      name                          = "internal"
      private_ip_address_allocation = "Dynamic"

    }
  }
  nic3 = {
    name     = "bnic1"
    location = "west us"
    rgname   = "dinesh"
    sdname   = "bsub"
    vnetname = "bvnet"

    ip_configuration = {
      name                          = "internal"
      private_ip_address_allocation = "Dynamic"
    }
  }
}


dev_vms = {
  #Virtual Machine 1 
  vm1 = {
    name                = "frontendvm"
    resource_group_name = "ganesh"
    location            = "west europe"
    size                = "Standard_F2"
    nicname = "fnic"
    size    = "Standard_F2"

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
  #Virtual Machine 2 
  vm2 = {
    name                = "backendvm"
    resource_group_name = "dinesh"
    location            = "west us"
    size                = "Standard_F2"
    nicname = "bnic"
    size    = "Standard_F2"

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
    #Virtual Machine 3
     vm3 = {
    name                = "backendvm1"
    resource_group_name = "dinesh"
    location            = "west us"
    size                = "Standard_F2"
    nicname = "bnic1"
    size    = "Standard_F2"

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


# Public IP
dev_pip = {
  # pip1 = {
  #   name                = "fpip"
  #   resource_group_name = "ganesh"
  #   location            = "west europe"
  #   allocation_method   = "Static"
  #   sku                 = "Standard"
  # }
  pip2 = {
    name                = "bpip"
    resource_group_name = "dinesh"
    location            = "west us"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

dev_nsg = {
  nsg1 = {
    name                   = "frontendvm_nsg"
    resource_group_name    = "ganesh"
    location               = "west europe"
    destination_port_range = "22-80"

    security_rule = {
      nsgrule_name           = "rulehttp_ssh__allowed"
      priority               = 100
      destination_port_range = "*"
    }
  }

  nsg2 = {
    name                = "backendvm_nsg"
    resource_group_name = "dinesh"
    location            = "west us"

    security_rule = {
      nsgrule_name           = "rule_ssh_http_allowed"
      priority               = 120
      destination_port_range = "*"

    }
  }
}
dev_nsg_allocation = {
  dev_nsg1_allow = {
    #Subnet ID block value for nsg
    subname             = "fsub"
    vnet                = "fvnet"
    nsgname             = "frontendvm_nsg"
    name                = "frontendvm"
    resource_group_name = "ganesh"
  }
  dev_nsg2_allow = {
    #Subnet ID block value for nsg
    subname             = "bsub"
    vnet                = "bvnet"
    nsgname             = "backendvm_nsg"
    name                = "backendvm"
    resource_group_name = "dinesh"
  }
}

dev_bastion = {

  bastion1 = {
    location            = "west us"
    resource_group_name = "dinesh"
    #Data_Source
    subnet_id            = "AzureBastionSubnet"
    public_ip_address_id = "bpip"
    virtual_network_name = "bvnet"

  }
}


