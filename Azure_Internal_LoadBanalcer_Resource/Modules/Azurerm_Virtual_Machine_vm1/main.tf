resource "azurerm_linux_virtual_machine" "vm-blk" {
  for_each              = var.vm
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = "Standard_F2"
  admin_username        = each.value.admin_password
  admin_password        = each.value.admin_password
  network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }

  custom_data = base64encode(<<EOT
#!/bin/bash
echo "Hello from VM1" > /tmp/hello.txt
apt-get update -y
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx
EOT
  )
}


