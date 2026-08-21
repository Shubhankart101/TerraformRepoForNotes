# Question 57: How do you use `for_each` with a map of environments?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-57"
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