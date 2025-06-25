variable "key_vault_name" {
  type        = string
  default     = "elaren-vault"
  description = "This is a Azure KeyVault"
}

variable "resource_group_name" {
  description = "The name of the resource group where the child resources will be created."
  type        = string
  default     = "elern-rg"
}
variable "location" {
  type        = string
  default     = "central india"
  description = "This is a Azure KeyVault location"
}

variable "enabled_for_disk_encryption" {
  type        = bool
  default     = true
  description = "enabled_for_disk_encryption for this storge"
}

variable "soft_delete_retention_days" {
  type        = number
  default     = 7
  description = "data softdelete period"
}

variable "purge_protection_enabled" {
  type        = bool
  default     = false
  description = "permanent deletion of data "
}

variable "sku_name" {
  default     = "standard"
  description = "THis is a stock keeping of AZURE keyVault"
  type        = string
}

variable "tenant_id" {
    type = string
    description = "Azure Tenant ID"
}