provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location
  tags     = var.tags
}

variable "name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "eastus"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default = {
    managed_by = "terraform"
  }
}

output "resource_group_id" {
  value = azurerm_resource_group.this.id
}
