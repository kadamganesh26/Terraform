frontend-rg = {
  rg1 = {
    name     = "frontend-rg"
    location = " Central India"
  }
}

frontend-vnet = {
  frontend-vent = {
    name                = "frontend-vnet"
    location            = " Central India"
    resource_group_name = "frontend-rg"
    address_space       = ["10.0.0.0/16"]
  }
}

frontend-subnet = {
  subnet1 = {
    name                 = "frontend-subnet1"
    virtual_network_name = "frontend-vnet"
    resource_group_name  = "frontend-rg"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "frontend-subnet2"
    virtual_network_name = "frontend-vnet"
    resource_group_name  = "frontend-rg"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

frontend-nic = {
  nic1 = {
    name                = "frontend_nic1"
    location            = " Central India"
    resource_group_name = "frontend-rg"
    #data block
    subnet               = "frontend-subnet1"
    virtual_network_name = "frontend-vnet"
  }

  nic2 = {
    name                = "frontend_nic2"
    location            = " Central India"
    resource_group_name = "frontend-rg"
    #data block
    subnet               = "frontend-subnet1"
    virtual_network_name = "frontend-vnet"
  }
}

frontend-vm1 = {
  frontend-vm1 = {
    name                  = "frontend-vm1"
    location              = " Central India"
    resource_group_name   = "frontend-rg"
    size                  = "Standard_F2"
    admin_username        = "admin"
    admin_password        = "@dmin@1234"
    publisher             = "Canonical"
    offer                 = "0001-com-ubuntu-server-jammy"
    sku                   = "22_04-lts"
    version               = "latest"
    network_interface_ids = "frontend_nic1"
  }
}
frontend-vm2 = {
  frontend-vm2 = {
    name                = "frontend-vm2"
    location            = " Central India"
    resource_group_name = "frontend-rg"
    size                = "Standard_F2"
    admin_username      = "admin"
    admin_password      = "@dmin@1234"
    publisher           = "Canonical"
    offer               = "0001-com-ubuntu-server-jammy"
    sku                 = "22_04-lts"
    version             = "latest"
    #data 
    network_interface_ids = "frontend_nic2"
  }
}

frontend-nsg1-vm1 = {
  nsg1 = {
    name                = "acceptanceEightySecurityGroup1"
    location            = " Central India"
    resource_group_name = "frontend-rg"
  }
}
frontend-nsg-asso-vm1 = {
  nag-asso1 = {
    subnet_id                 = "frontend-subnet1"
    network_security_group_id = "acceptanceEightySecurityGroup1"
    #data
    name                 = "frontend-subnet1"
    virtual_network_name = "frontend-vnet"
    resource_group_name  = "frontend-rg"
  }
}

frontend-pip = {
  pip1 = {
    name                = "acceptanceTestPublicIp1"
    location            = " Central India"
    resource_group_name = "frontend-rg"
    allocation_method   = "Static"
  }
}

lb = {
  lb1 = {
    name                           = "Internal-lb"
    location                       = " Central India"
    resource_group_name            = "frontend-rg"
    public_ip_address_id           = "acceptanceTestPublicIp1"
    frontend_ip_configuration-name = "frontendIP"
  }
}

lb-rule = {
  rule1 = {
    name                           = "LBRule"
    protocol                       = "Tcp"
    frontend_port                  = 80
    backend_port                   = 80
    frontend_ip_configuration-name = "frontendIP"
    lb-id                          = "Internal-lb"
    resource_group_name            = "frontend-rg"
  }
}

backend_address_pool_lb = {
  bap1 = {
    name                = "backend_address_pool"
    lb-id               = "Internal-lb"
    resource_group_name = "frontend-rg"
  }
}

lbout_bound_rule = {
  rule1 = {
    name                    = "OutboundRule"
    protocol                = "Tcp"
    backend_address_pool_id = "backend_address_pool"
    # Data
    lb-id               = "Internal-lb"
    resource_group_name = "frontend-rg"
  }
}

lb-probe = {
  lbprob1 = {
    name                = "ssh-running-probe"
    port                = 80
    loadbalancer_id     = "Internal-lb"
    resource_group_name = "frontend-rg"
    lb-id               = "Internal-lb"
  }
}
