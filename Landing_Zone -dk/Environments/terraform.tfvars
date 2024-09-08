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

dev_vnet = {
  vnet1 = {
    name                = "fvnet"
    resource_group_name = "ganesh"
    location            = "west europe"
    address_space       = ["10.0.0.0/23"]
  }
  vnet2 = {
    name                = "bvnet"
    resource_group_name = "dinesh"
    location            = "west us"
    address_space       = ["10.0.0.0/16"]
  }
}
dev_subnet = {
  sub1 = {
    name                 = "fsub"
    resource_group_name  = "ganesh"
    address_prefixes     = ["10.0.0.0/24"]
    virtual_network_name = "fvnet"
  }

  sub3 = {
    name                 = "bsub"
    resource_group_name  = "dinesh"
    address_prefixes     = ["10.0.1.0/29"]
    virtual_network_name = "bvnet"
  }
}
Bastsub = {
  bationsub = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "ganesh"
    address_prefixes     = ["10.0.1.0/25"]
    virtual_network_name = "fvnet"
  }
}

dev_nic = {
  nic1 = {
    name                = "fnic"
    location            = "west europe"
    resource_group_name = "ganesh"
    sdname              = "fsub"
    vnetname            = "fvnet"


    ip_configuration = {
      name                          = "internal"
      private_ip_address_allocation = "Dynamic"
    }
  }
  nic2 = {
    name                = "bnic"
    location            = "west us"
    resource_group_name = "dinesh"
    sdname              = "bsub"
    vnetname            = "bvnet"
    ip_configuration = {
      name                          = "internal"
      private_ip_address_allocation = "Dynamic"

    }
  }
}

dev_vms = {
  vm1 = {
    name                = "frontendvm"
    resource_group_name = "ganesh"
    location            = "west europe"
    size                = "Standard_F2"
    admin_username      = "itsupport"
    admin_password      = "Pcpl@123"
    nicname             = "fnic"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2016-Datacenter"
      version   = "latest"
    }
  }
  vm2 = {
    name                = "backendvm"
    resource_group_name = "dinesh"
    location            = "west us"
    size                = "Standard_F2"
    admin_username      = "itsupport"
    admin_password      = "Pcpl@123"
    nicname             = "bnic"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2016-Datacenter"
      version   = "latest"
    }
  }
}

#Public IP
dev_pip = {
  pip1 = {
    name                = "fpip"
    resource_group_name = "ganesh"
    location            = "west europe"
    # allocation_method   = "Static"
    # sku                 = "Standard"
  }
  pip2 = {
    name                = "bpip"
    resource_group_name = "dinesh"
    location            = "west us"
    # allocation_method   = "Static"
    # sku                 = "Standard"
  }
}





