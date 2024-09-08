variable "child_vms" {}


resource "azurerm_linux_virtual_machine" "vms_blk" {
  for_each                        = var.child_vms
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.username.value
  admin_password                  = data.azurerm_key_vault_secret.password.value
  disable_password_authentication = false
  network_interface_ids           = [data.azurerm_network_interface.nic-data[each.key].id]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

data "azurerm_network_interface" "nic-data" {
  for_each            = var.child_vms
  name                = each.value.network_interface_ids
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "frontendkv" {
  name                = "ganeshkeyvaults"
  resource_group_name = "ganesh_kv"
}

data "azurerm_key_vault_secret" "username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.frontendkv.id
}
data "azurerm_key_vault_secret" "password" {
  name         = "credential"
  key_vault_id = data.azurerm_key_vault.frontendkv.id
}
