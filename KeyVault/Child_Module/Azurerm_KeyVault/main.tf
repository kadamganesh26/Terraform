resource "azurerm_key_vault" "keyvault_blk" {
    for_each = var.key_vault 
    name= each.value.name
    location= each.value.location
    resource_group_name = each.value.resource_group_name
    sku_name = each.value.sku_name
    tenant_id = each.value.tenant_id
}