variable "windows_vm" {}

resource "azurerm_windows_virtual_machine" "windows_vm_blk" {
  for_each              = var.windows_vm
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  size                  = each.value.size
  admin_username        = data.azurerm_key_vault_secret.username.value
  admin_password        = data.azurerm_key_vault_secret.password.value
  network_interface_ids = [data.azurerm_network_interface.nic_data[each.key].id]
  

  os_disk {
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}

data "azurerm_network_interface" "data_nic_blk" {
  for_each            = var.windows_vm
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

#  Network Interface ids data block 
data "azurerm_network_interface" "nic_data" {
  for_each            = var.windows_vm
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "key_vault_block" {
  name                = "ganeshkeyvaults"
  resource_group_name = "ganesh_kv"
}

data "azurerm_key_vault_secret" "username" {
  name         = "usernamewin"
  key_vault_id = data.azurerm_key_vault.key_vault_block.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "passwordwin"
  key_vault_id = data.azurerm_key_vault.key_vault_block.id
}
