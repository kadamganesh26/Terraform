

#Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "example" {
  for_each                        = var.vms
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.username.value
  admin_password                  = data.azurerm_key_vault_secret.password.value
  network_interface_ids           = [data.azurerm_network_interface.win_nic-data[each.key].id]
  disable_password_authentication = false


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

data "azurerm_network_interface" "win_nic-data" {
  for_each = var.vms
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}