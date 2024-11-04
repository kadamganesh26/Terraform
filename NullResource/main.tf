provider "azurerm" {
  features {}
  subscription_id = "753d99f7-5d27-4a6e-b202-c93666e7dbfe"
}

# Create an Azure Resource Group
resource "azurerm_resource_group" "azure_blk" {
  name     = "null-resource-group"
  location = "East US"
}

# Null resource to run a command after the resource group is created
resource "null_resource" "notify_creation" {
  depends_on = [azurerm_resource_group.azure_blk]

  provisioner "local-exec" {
    command = "echo 'Resource Group ${azurerm_resource_group.azure_blk.name} has been created!'"
  }
}
