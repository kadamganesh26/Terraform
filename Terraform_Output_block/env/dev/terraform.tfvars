dev_rg = {
  rg1 = {
    name     = "ganesh-rg"
    location = "west india"
  }
  rg2 = {
    name     = "mohit-rg"
    location = "central india"
  }
}

dev_vnet = {
  vnet1 = {
    name                = "ganesh_vnet"
    location            = "west india"
    address_space       = ["10.0.0.0/22"]
    resource_group_name = "ganesh-rg"
  }
  vnet2 = {
    name                = "mohit1_vnet"
    location            = "central india"
    address_space       = ["10.0.0.0/21"]
    resource_group_name = "mohit-rg"
  }
}

dev_sub = {
  sub1 = {
    name                 = "ganesh-sub"
    resource_group_name  = "ganesh-rg"
    address_prefixes     = ["10.0.1.0/28"]
    virtual_network_name = "ganesh_vnet"
  }
  sub2 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "ganesh-rg"
    address_prefixes     = ["10.0.2.0/26"]
    virtual_network_name = "ganesh_vnet"
  }
  sub3 = {
    name                 = "mohit-sub"
    resource_group_name  = "mohit-rg"
    address_prefixes     = ["10.0.1.0/24"]
    virtual_network_name = "mohit1_vnet"
  }
}

dev_netwrok_interface = {
  nic1 = {
    name                = "ganesh-nic"
    location            = "west india"
    resource_group_name = "ganesh-rg"
    virtual_network_name= "ganesh_vnet"
    subnet_id = "ganesh-sub"
    ip_configuration = {
      name      = "internal-nic-ganesh"
    }
  }
  nic2 = {
    name                = "mohit-nic"
    location            = "central india"
    resource_group_name = "mohit-rg"
    virtual_network_name= "mohit1_vnet"
    subnet_id = "mohit-sub"
    ip_configuration = {
      name      = "internal-mohit-nic"
    }
  }
}
dev_pip = {
  pip1={
  name = "ganesh-pip"
  location = "west india"
  allocation_method = "Static"
  resource_group_name= "ganesh-rg"
  }
}
