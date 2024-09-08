#  Network Interface ids data block 
data "azurerm_network_interface" "nic_data" {
  for_each            = var.linux_vms
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

# Key Vault data block
data "azurerm_key_vault" "kv_data" {
  name                = "ganeshkeyvaults"
  resource_group_name = "ganesh_kv"
}

# Key Vault secrets block for users name
data "azurerm_key_vault_secret" "username-blk" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.kv_data.id
}
 # Key Vault data block values for password
data "azurerm_key_vault_secret" "credential-blk" {
  name         = "credential"
  key_vault_id = data.azurerm_key_vault.kv_data.id
}