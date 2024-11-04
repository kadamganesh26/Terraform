
resource "azurerm_key_vault" "example" {
for_each = var.child_keyvalult
  name                        = each.value.name
  location                    = each.value.name
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = "standard"
}