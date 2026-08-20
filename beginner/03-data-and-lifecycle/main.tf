terraform {
  required_version = ">= 1.5.0"
}

resource "terraform_data" "application" {
  input = var.application_version

  lifecycle {
    create_before_destroy = true
    prevent_destroy        = false
  }
}

variable "application_version" {
  type        = string
  description = "Version to deploy"
  default     = "1.0.0"
}

output "application_version" {
  value = terraform_data.application.output
}
