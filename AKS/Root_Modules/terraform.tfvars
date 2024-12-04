dev-aks-rg = {
  rg1 = {
    name     = "aks-rg-ac"
    location = "australiacentral"
  }
}

dev-aks-vnet = {
  vnet1 = {
    name                = "aks-vnet-wi"
    location            = "australiacentral"
    resource_group_name = "aks-rg-ac"
    address_space       = ["10.0.0.0/8"]
  }
}

dev-aks-sub = {
  sub1 = {
    name                 = "aks-subnet-wi"
    resource_group_name  = "aks-rg-ac"
    virtual_network_name = "aks-vnet-wi"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

dev-aks-cluster = {
  cluster = {
    name                = "aks-cluster-1"
    location            = "australiacentral"
    resource_group_name = "aks-rg-ac"
    virtual_network_name = "aks-vnet-wi"
    subnet_id = "aks-subnet-wi"
    network_profile = {
    # pod_cidr       = "10.244.0.0/16"
      service_cidr   = "10.0.0.0/26"
      dns_service_ip = "10.0.0.10"
    }
    default_node_pool = {
      node_count = 1
      vm_size    = "Standard_DS2_v2"
    }
  }
}