variable "child_rg" {}

resource "azurerm_resource_group" "rg_blk" {
name = "ganesh"
location = "west us"
}