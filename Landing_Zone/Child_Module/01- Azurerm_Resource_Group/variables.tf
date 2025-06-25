variable "child_resource_group_name" {
    description = "The name of the resource group where the child resources will be created."
    type        = string
    default     = "elern-rg"
}
variable "child_location" {
    description = "The Azure region where the child resources will be created."
    type        = string
    default     = "central india"
}