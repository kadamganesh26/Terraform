provider "azurerm" {
  features {
    
  }
  subscription_id = "753d99f7-5d27-4a6e-b202-c93666e7dbfe"
}

resource "azurerm_resource_group" "my-rg" {
    name="K8s"
    location = "Norway East"
}