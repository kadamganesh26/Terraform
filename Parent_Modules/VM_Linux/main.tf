variable "linux_vms" {}

resource "azurerm_linux_virtual_machine" "linuxvm_blk" {
  for_each                        = var.linux_vms
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.username-blk.value
  admin_password                  = data.azurerm_key_vault_secret.credential-blk.value
  network_interface_ids           = [data.azurerm_network_interface.nic_data[each.key].id]
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





