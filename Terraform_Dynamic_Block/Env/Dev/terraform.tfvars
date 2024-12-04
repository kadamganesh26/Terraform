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
    name                = "ganesh-vnet"
    location            = "west india"
    resource_group_name = "ganesh-rg"
    address_space       = ["10.0.0.0/22"]
     subnets = {
      sub1 = {
        name             = "ganesh1-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
        sub2 = {
        name             = "ganesh2-subnet"
        address_prefixes = ["10.0.5.0/25"]
      }
    }
  }
  vnet2 = {
    name                = "mohit-vnet"
    location            = "central india"
    resource_group_name = "mohit-rg"
    address_space       = ["10.0.0.0/21"]
     subnets = {
      sub1 = {
        name             = "mohit1-subnet"
        address_prefixes = ["10.0.0.0/23"]
      }
        sub2 = {
        name             = "mohit2-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}
