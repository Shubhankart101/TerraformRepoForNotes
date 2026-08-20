terraform {
  required_version = ">= 1.5.0"
}

variable "project_name" {
  type        = string
  description = "Short project name"
  default     = "demo"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
  default     = "dev"
}

locals {
  resource_name = "${var.project_name}-${var.environment}"
  tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}

output "resource_name" {
  value = local.resource_name
}

output "tags" {
  value = local.tags
}
