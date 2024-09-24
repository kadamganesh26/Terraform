variable "child_linux_VM" {}
data "azurerm_network_interface" "nic_data" {
    for_each = var.child_linux_VM
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_linux_virtual_machine" "linuxvm_lk" {
    for_each = var.child_linux_VM
  name                =each.value.name
  resource_group_name =each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password =     each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [data.azurerm_network_interface.nic_data[each.key].id]

 
  os_disk {
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

  }
}