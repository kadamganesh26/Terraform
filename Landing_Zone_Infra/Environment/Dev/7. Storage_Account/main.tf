
resource "azurerm_storage_account" "st_blk" {
for_each = var.child_store
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}
resource "azurerm_storage_container" "container_blk" {
    depends_on = [ azurerm_storage_account.st_blk ]
  name                  = "vhds"
  storage_account_name  = "rksotre"
  container_access_type = "private"
}