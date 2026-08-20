variable "environment" {
  type        = string
  description = "Deployment environment"
  default     = "dev"
}

variable "application_name" {
  type        = string
  description = "Application name"
  default     = "webapp"
}

locals {
  name = "${var.application_name}-${var.environment}"
  tags = {
    application = var.application_name
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "terraform_data" "application_platform" {
  input = jsonencode({
    name = local.name
    tags = local.tags
    components = ["network", "runtime", "secrets", "monitoring"]
  })
}

output "platform_definition" {
  value = terraform_data.application_platform.output
}
