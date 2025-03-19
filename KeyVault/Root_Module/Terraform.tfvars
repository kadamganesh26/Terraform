dev_rg = {
  rg1 = {
    name     = "st-rg"
    location = "australiacentral"
  }
}

dev-key_vault = {
  key_vault = {
    name                = "deevkey"
    location            = "australiacentral"
    resource_group_name = "st-rg"
    sku_name            = "standard"
    tenant_id           = "93ebf4a5-840e-41fe-ae7e-b31e10c6f812"
  }
}
