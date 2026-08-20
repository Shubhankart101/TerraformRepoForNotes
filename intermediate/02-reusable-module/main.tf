module "resource_group" {
  source = "./modules/resource-group"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
  default     = "rg-module-demo"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "eastus"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}

output "resource_group_id" {
  value = module.resource_group.id
}
