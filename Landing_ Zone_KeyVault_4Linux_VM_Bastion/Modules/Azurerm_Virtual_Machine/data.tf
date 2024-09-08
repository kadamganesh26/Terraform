data "azurerm_key_vault" "kv_blk" {
  name                = "ganeshkeyvaults"
  resource_group_name = "ganesh_kv"
}

data "azurerm_key_vault_secret" "username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.kv_blk.id
}
data "azurerm_key_vault_secret" "password" {
  name         = "credential"
  key_vault_id = data.azurerm_key_vault.kv_blk.id
}