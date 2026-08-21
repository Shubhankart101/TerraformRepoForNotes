# Question 90: How do you design a safe state migration?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-90"
}

resource "terraform_data" "solution" {
  input = local.solution_name
  lifecycle {
    precondition {
      condition     = contains(["dev", "test", "prod"], var.environment)
      error_message = "environment must be dev, test, or prod"
    }
  }
}

output "solution" {
  value = terraform_data.solution.output
}