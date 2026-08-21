variable "environment" {
  type        = string
  description = "Deployment environment"
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "environment must be dev, test, or prod"
  }
}

locals {
  name = "devtrack-${var.environment}"
}

output "deployment_name" {
  value = local.name
}
