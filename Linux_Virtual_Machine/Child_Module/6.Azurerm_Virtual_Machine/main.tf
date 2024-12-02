resource "azurerm_linux_virtual_machine" "vm-blk" {
  for_each              = var.child-vm
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  size                  = each.value.size
  admin_password        = data.azurerm_key_vault_secret.userpassword-blk.value
  admin_username        = data.azurerm_key_vault_secret.username-blk.value
  network_interface_ids = [data.azurerm_network_interface.nic-data[each.value.nic_id].id]


  disable_password_authentication = false

  os_disk {
    storage_account_type = each.value.os_disk.storage_account_type
    caching              = each.value.os_disk.caching
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

data "azurerm_network_interface" "nic-data" {
  for_each            = var.child_nic
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}


data "azurerm_key_vault" "key-data" {
  
  name                = "mohit1"
  resource_group_name = "todoapp-rg"
}

data "azurerm_key_vault_secret" "username-blk" {
  name         = "un"
  key_vault_id = data.azurerm_key_vault.key-data.id
}

data "azurerm_key_vault_secret" "userpassword-blk" {
  name         = "upass"
  key_vault_id = data.azurerm_key_vault.key-data.id
}

