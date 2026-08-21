# Terraform Interview Question Bank

This bank contains 150 questions organized by difficulty, covering HCL, state, modules, cloud platforms, policy, testing, and production delivery.

## Worked Answers

### Beginner: typed variables and validation

**Question:** How do you reject an invalid environment?

```hcl
variable "environment" {
	type = string
	validation {
		condition     = contains(["dev", "test", "prod"], var.environment)
		error_message = "environment must be dev, test, or prod"
	}
}
```

Validation fails during planning before an invalid deployment can be applied.

### Intermediate: reusable resource creation

**Question:** How do you create one resource per subnet?

```hcl
variable "subnets" { type = map(string) }

resource "azurerm_resource_group" "example" {
	for_each = var.subnets
	name     = "rg-${each.key}"
	location = each.value
}
```

`for_each` gives stable resource addresses based on map keys, avoiding count-index churn.

### Advanced: approval gate

**Question:** How do you prevent an unapproved production apply?

```hcl
variable "approved" { type = bool }

resource "terraform_data" "approval_gate" {
	input = var.approved
	lifecycle {
		precondition {
			condition     = var.approved
			error_message = "production apply requires approval"
		}
	}
}
```

The precondition blocks the plan or apply when the pipeline approval signal is false.

## Beginner: 1-40

1. What problem does Terraform solve?
**Answer:** It addresses a recurring DevOps need by making delivery, operations, or infrastructure repeatable, reviewable, and safer to automate.
Script: [Question 1 script](interview-scripts/001-what-problem-does-terraform-solve.tf)
```tf
# Question 1: What problem does Terraform solve?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-1"
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
```

2. What is infrastructure as code?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 2 script](interview-scripts/002-what-is-infrastructure-as-code.tf)
```tf
# Question 2: What is infrastructure as code?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-2"
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
```

3. What is an HCL configuration?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 3 script](interview-scripts/003-what-is-an-hcl-configuration.tf)
```tf
# Question 3: What is an HCL configuration?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-3"
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
```

4. What is a Terraform provider?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 4 script](interview-scripts/004-what-is-a-terraform-provider.tf)
```tf
# Question 4: What is a Terraform provider?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-4"
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
```

5. What is a resource?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 5 script](interview-scripts/005-what-is-a-resource.tf)
```tf
# Question 5: What is a resource?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-5"
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
```

6. What is a data source?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 6 script](interview-scripts/006-what-is-a-data-source.tf)
```tf
# Question 6: What is a data source?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-6"
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
```

7. What is a variable?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 7 script](interview-scripts/007-what-is-a-variable.tf)
```tf
# Question 7: What is a variable?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-7"
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
```

8. What is an output?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 8 script](interview-scripts/008-what-is-an-output.tf)
```tf
# Question 8: What is an output?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-8"
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
```

9. What is a local value?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 9 script](interview-scripts/009-what-is-a-local-value.tf)
```tf
# Question 9: What is a local value?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-9"
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
```

10. What is a resource address?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 10 script](interview-scripts/010-what-is-a-resource-address.tf)
```tf
# Question 10: What is a resource address?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-10"
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
```

11. What does `terraform init` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 11 script](interview-scripts/011-what-does-terraform-init-do.tf)
```tf
# Question 11: What does `terraform init` do?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-11"
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
```

12. What does `terraform plan` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 12 script](interview-scripts/012-what-does-terraform-plan-do.tf)
```tf
# Question 12: What does `terraform plan` do?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-12"
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
```

13. What does `terraform apply` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 13 script](interview-scripts/013-what-does-terraform-apply-do.tf)
```tf
# Question 13: What does `terraform apply` do?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-13"
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
```

14. What does `terraform destroy` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 14 script](interview-scripts/014-what-does-terraform-destroy-do.tf)
```tf
# Question 14: What does `terraform destroy` do?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-14"
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
```

15. Why review a plan before applying?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 15 script](interview-scripts/015-why-review-a-plan-before-applying.tf)
```tf
# Question 15: Why review a plan before applying?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-15"
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
```

16. What is Terraform state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 16 script](interview-scripts/016-what-is-terraform-state.tf)
```tf
# Question 16: What is Terraform state?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-16"
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
```

17. Why does Terraform need state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 17 script](interview-scripts/017-why-does-terraform-need-state.tf)
```tf
# Question 17: Why does Terraform need state?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-17"
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
```

18. What is a backend?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 18 script](interview-scripts/018-what-is-a-backend.tf)
```tf
# Question 18: What is a backend?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-18"
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
```

19. What is a resource dependency?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 19 script](interview-scripts/019-what-is-a-resource-dependency.tf)
```tf
# Question 19: What is a resource dependency?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-19"
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
```

20. How does Terraform infer dependencies?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 20 script](interview-scripts/020-how-does-terraform-infer-dependencies.tf)
```tf
# Question 20: How does Terraform infer dependencies?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-20"
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
```

21. What does `depends_on` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 21 script](interview-scripts/021-what-does-depends-on-do.tf)
```tf
# Question 21: What does `depends_on` do?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-21"
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
```

22. What is interpolation?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 22 script](interview-scripts/022-what-is-interpolation.tf)
```tf
# Question 22: What is interpolation?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-22"
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
```

23. How do you reference a resource attribute?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 23 script](interview-scripts/023-how-do-you-reference-a-resource-attribute.tf)
```tf
# Question 23: How do you reference a resource attribute?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-23"
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
```

24. What is a list type?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 24 script](interview-scripts/024-what-is-a-list-type.tf)
```tf
# Question 24: What is a list type?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-24"
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
```

25. What is a map type?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 25 script](interview-scripts/025-what-is-a-map-type.tf)
```tf
# Question 25: What is a map type?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-25"
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
```

26. What is a set type?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 26 script](interview-scripts/026-what-is-a-set-type.tf)
```tf
# Question 26: What is a set type?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-26"
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
```

27. What is a conditional expression?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 27 script](interview-scripts/027-what-is-a-conditional-expression.tf)
```tf
# Question 27: What is a conditional expression?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-27"
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
```

28. What does `for_each` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 28 script](interview-scripts/028-what-does-for-each-do.tf)
```tf
# Question 28: What does `for_each` do?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-28"
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
```

29. What does `count` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 29 script](interview-scripts/029-what-does-count-do.tf)
```tf
# Question 29: What does `count` do?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-29"
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
```

30. What is a module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 30 script](interview-scripts/030-what-is-a-module.tf)
```tf
# Question 30: What is a module?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-30"
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
```

31. How do you call a module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 31 script](interview-scripts/031-how-do-you-call-a-module.tf)
```tf
# Question 31: How do you call a module?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-31"
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
```

32. What is a module input?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 32 script](interview-scripts/032-what-is-a-module-input.tf)
```tf
# Question 32: What is a module input?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-32"
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
```

33. What is a module output?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 33 script](interview-scripts/033-what-is-a-module-output.tf)
```tf
# Question 33: What is a module output?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-33"
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
```

34. What does `terraform fmt` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 34 script](interview-scripts/034-what-does-terraform-fmt-do.tf)
```tf
# Question 34: What does `terraform fmt` do?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-34"
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
```

35. What does `terraform validate` do?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 35 script](interview-scripts/035-what-does-terraform-validate-do.tf)
```tf
# Question 35: What does `terraform validate` do?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-35"
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
```

36. What is a lifecycle block?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 36 script](interview-scripts/036-what-is-a-lifecycle-block.tf)
```tf
# Question 36: What is a lifecycle block?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-36"
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
```

37. What does `create_before_destroy` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 37 script](interview-scripts/037-what-does-create-before-destroy-do.tf)
```tf
# Question 37: What does `create_before_destroy` do?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-37"
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
```

38. What is a sensitive value?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 38 script](interview-scripts/038-what-is-a-sensitive-value.tf)
```tf
# Question 38: What is a sensitive value?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-38"
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
```

39. Why should secrets not be committed to state or code?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
Script: [Question 39 script](interview-scripts/039-why-should-secrets-not-be-committed-to-state-or-code.tf)
```tf
# Question 39: Why should secrets not be committed to state or code?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-39"
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
```

40. How do you pin a provider version?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 40 script](interview-scripts/040-how-do-you-pin-a-provider-version.tf)
```tf
# Question 40: How do you pin a provider version?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-40"
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
```


## Intermediate: 41-80

41. Explain Terraform dependency graph construction.
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 41 script](interview-scripts/041-explain-terraform-dependency-graph-construction.tf)
```tf
# Question 41: Explain Terraform dependency graph construction.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-41"
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
```

42. How does Terraform refresh state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 42 script](interview-scripts/042-how-does-terraform-refresh-state.tf)
```tf
# Question 42: How does Terraform refresh state?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-42"
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
```

43. What is state drift?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 43 script](interview-scripts/043-what-is-state-drift.tf)
```tf
# Question 43: What is state drift?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-43"
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
```

44. How do you detect drift safely?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 44 script](interview-scripts/044-how-do-you-detect-drift-safely.tf)
```tf
# Question 44: How do you detect drift safely?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-44"
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
```

45. How do you import an existing resource?
**Answer:** Define the smallest required traffic path, restrict it with policy and identity, and verify connectivity from the same network boundary as the workload.
Script: [Question 45 script](interview-scripts/045-how-do-you-import-an-existing-resource.tf)
```tf
# Question 45: How do you import an existing resource?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-45"
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
```

46. What is a moved block?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 46 script](interview-scripts/046-what-is-a-moved-block.tf)
```tf
# Question 46: What is a moved block?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-46"
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
```

47. How do you rename a resource without recreation?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 47 script](interview-scripts/047-how-do-you-rename-a-resource-without-recreation.tf)
```tf
# Question 47: How do you rename a resource without recreation?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-47"
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
```

48. How do you remove a resource from state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 48 script](interview-scripts/048-how-do-you-remove-a-resource-from-state.tf)
```tf
# Question 48: How do you remove a resource from state?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-48"
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
```

49. What causes state locking?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 49 script](interview-scripts/049-what-causes-state-locking.tf)
```tf
# Question 49: What causes state locking?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-49"
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
```

50. How does a remote backend improve collaboration?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 50 script](interview-scripts/050-how-does-a-remote-backend-improve-collaboration.tf)
```tf
# Question 50: How does a remote backend improve collaboration?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-50"
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
```

51. How do you secure an Azure Storage backend?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 51 script](interview-scripts/051-how-do-you-secure-an-azure-storage-backend.tf)
```tf
# Question 51: How do you secure an Azure Storage backend?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-51"
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
```

52. How do you secure an S3 and DynamoDB backend?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 52 script](interview-scripts/052-how-do-you-secure-an-s3-and-dynamodb-backend.tf)
```tf
# Question 52: How do you secure an S3 and DynamoDB backend?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-52"
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
```

53. How do workspaces differ from separate state files?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 53 script](interview-scripts/053-how-do-workspaces-differ-from-separate-state-files.tf)
```tf
# Question 53: How do workspaces differ from separate state files?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-53"
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
```

54. When should you avoid workspaces?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 54 script](interview-scripts/054-when-should-you-avoid-workspaces.tf)
```tf
# Question 54: When should you avoid workspaces?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-54"
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
```

55. How do variable validation blocks work?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 55 script](interview-scripts/055-how-do-variable-validation-blocks-work.tf)
```tf
# Question 55: How do variable validation blocks work?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-55"
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
```

56. What are preconditions and postconditions?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 56 script](interview-scripts/056-what-are-preconditions-and-postconditions.tf)
```tf
# Question 56: What are preconditions and postconditions?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-56"
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
```

57. How do you use `for_each` with a map of environments?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 57 script](interview-scripts/057-how-do-you-use-for-each-with-a-map-of-environments.tf)
```tf
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
```

58. What are common `count` indexing pitfalls?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 58 script](interview-scripts/058-what-are-common-count-indexing-pitfalls.tf)
```tf
# Question 58: What are common `count` indexing pitfalls?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-58"
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
```

59. How do you flatten nested data?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 59 script](interview-scripts/059-how-do-you-flatten-nested-data.tf)
```tf
# Question 59: How do you flatten nested data?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-59"
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
```

60. How do dynamic blocks work?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 60 script](interview-scripts/060-how-do-dynamic-blocks-work.tf)
```tf
# Question 60: How do dynamic blocks work?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-60"
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
```

61. How do you design a reusable module interface?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 61 script](interview-scripts/061-how-do-you-design-a-reusable-module-interface.tf)
```tf
# Question 61: How do you design a reusable module interface?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-61"
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
```

62. What belongs in module documentation?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 62 script](interview-scripts/062-what-belongs-in-module-documentation.tf)
```tf
# Question 62: What belongs in module documentation?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-62"
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
```

63. How do you version a module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 63 script](interview-scripts/063-how-do-you-version-a-module.tf)
```tf
# Question 63: How do you version a module?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-63"
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
```

64. How do you test a module?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 64 script](interview-scripts/064-how-do-you-test-a-module.tf)
```tf
# Question 64: How do you test a module?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-64"
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
```

65. What are Terraform test files?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 65 script](interview-scripts/065-what-are-terraform-test-files.tf)
```tf
# Question 65: What are Terraform test files?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-65"
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
```

66. How do Terratest and native tests differ?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 66 script](interview-scripts/066-how-do-terratest-and-native-tests-differ.tf)
```tf
# Question 66: How do Terratest and native tests differ?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-66"
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
```

67. How do you run Terraform in CI?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 67 script](interview-scripts/067-how-do-you-run-terraform-in-ci.tf)
```tf
# Question 67: How do you run Terraform in CI?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-67"
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
```

68. Which checks should run before plan?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 68 script](interview-scripts/068-which-checks-should-run-before-plan.tf)
```tf
# Question 68: Which checks should run before plan?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-68"
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
```

69. How do you create a plan artifact safely?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 69 script](interview-scripts/069-how-do-you-create-a-plan-artifact-safely.tf)
```tf
# Question 69: How do you create a plan artifact safely?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-69"
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
```

70. How do you approve production apply?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 70 script](interview-scripts/070-how-do-you-approve-production-apply.tf)
```tf
# Question 70: How do you approve production apply?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-70"
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
```

71. How do provider aliases work?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 71 script](interview-scripts/071-how-do-provider-aliases-work.tf)
```tf
# Question 71: How do provider aliases work?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-71"
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
```

72. How do you deploy to multiple Azure subscriptions?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
Script: [Question 72 script](interview-scripts/072-how-do-you-deploy-to-multiple-azure-subscriptions.tf)
```tf
# Question 72: How do you deploy to multiple Azure subscriptions?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-72"
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
```

73. How do you deploy to multiple AWS regions?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
Script: [Question 73 script](interview-scripts/073-how-do-you-deploy-to-multiple-aws-regions.tf)
```tf
# Question 73: How do you deploy to multiple AWS regions?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-73"
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
```

74. How do you pass provider configuration into a module?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 74 script](interview-scripts/074-how-do-you-pass-provider-configuration-into-a-module.tf)
```tf
# Question 74: How do you pass provider configuration into a module?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-74"
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
```

75. How do data sources create hidden dependencies?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 75 script](interview-scripts/075-how-do-data-sources-create-hidden-dependencies.tf)
```tf
# Question 75: How do data sources create hidden dependencies?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-75"
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
```

76. How do you handle eventual consistency after resource creation?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 76 script](interview-scripts/076-how-do-you-handle-eventual-consistency-after-resource-c.tf)
```tf
# Question 76: How do you handle eventual consistency after resource creation?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-76"
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
```

77. How do you use timeouts in resources?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 77 script](interview-scripts/077-how-do-you-use-timeouts-in-resources.tf)
```tf
# Question 77: How do you use timeouts in resources?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-77"
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
```

78. How do lifecycle ignore changes work?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 78 script](interview-scripts/078-how-do-lifecycle-ignore-changes-work.tf)
```tf
# Question 78: How do lifecycle ignore changes work?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-78"
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
```

79. What are the risks of `ignore_changes`?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 79 script](interview-scripts/079-what-are-the-risks-of-ignore-changes.tf)
```tf
# Question 79: What are the risks of `ignore_changes`?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-79"
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
```

80. How do you troubleshoot an unexpected replacement?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 80 script](interview-scripts/080-how-do-you-troubleshoot-an-unexpected-replacement.tf)
```tf
# Question 80: How do you troubleshoot an unexpected replacement?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-80"
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
```


## Advanced: 81-120

81. Design a multi-account Terraform platform.
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
Script: [Question 81 script](interview-scripts/081-design-a-multi-account-terraform-platform.tf)
```tf
# Question 81: Design a multi-account Terraform platform.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-81"
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
```

82. Design a multi-subscription Azure Terraform platform.
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
Script: [Question 82 script](interview-scripts/082-design-a-multi-subscription-azure-terraform-platform.tf)
```tf
# Question 82: Design a multi-subscription Azure Terraform platform.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-82"
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
```

83. How do you structure root modules and child modules?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 83 script](interview-scripts/083-how-do-you-structure-root-modules-and-child-modules.tf)
```tf
# Question 83: How do you structure root modules and child modules?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-83"
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
```

84. How do you separate platform and workload state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 84 script](interview-scripts/084-how-do-you-separate-platform-and-workload-state.tf)
```tf
# Question 84: How do you separate platform and workload state?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-84"
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
```

85. How do you define state ownership boundaries?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 85 script](interview-scripts/085-how-do-you-define-state-ownership-boundaries.tf)
```tf
# Question 85: How do you define state ownership boundaries?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-85"
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
```

86. How do you recover a corrupted state file?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 86 script](interview-scripts/086-how-do-you-recover-a-corrupted-state-file.tf)
```tf
# Question 86: How do you recover a corrupted state file?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-86"
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
```

87. How do you test backend disaster recovery?
**Answer:** Keep the previous known-good version, validate the replacement, and automate a tested rollback or restore path with clear ownership and audit output.
Script: [Question 87 script](interview-scripts/087-how-do-you-test-backend-disaster-recovery.tf)
```tf
# Question 87: How do you test backend disaster recovery?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-87"
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
```

88. How do you rotate backend credentials without downtime?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
Script: [Question 88 script](interview-scripts/088-how-do-you-rotate-backend-credentials-without-downtime.tf)
```tf
# Question 88: How do you rotate backend credentials without downtime?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-88"
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
```

89. How do you prevent concurrent applies?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 89 script](interview-scripts/089-how-do-you-prevent-concurrent-applies.tf)
```tf
# Question 89: How do you prevent concurrent applies?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-89"
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
```

90. How do you design a safe state migration?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 90 script](interview-scripts/090-how-do-you-design-a-safe-state-migration.tf)
```tf
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
```

91. How do you manage provider upgrades?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 91 script](interview-scripts/091-how-do-you-manage-provider-upgrades.tf)
```tf
# Question 91: How do you manage provider upgrades?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-91"
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
```

92. How do you test a provider upgrade before production?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 92 script](interview-scripts/092-how-do-you-test-a-provider-upgrade-before-production.tf)
```tf
# Question 92: How do you test a provider upgrade before production?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-92"
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
```

93. How do you handle breaking module changes?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 93 script](interview-scripts/093-how-do-you-handle-breaking-module-changes.tf)
```tf
# Question 93: How do you handle breaking module changes?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-93"
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
```

94. How do you publish private modules securely?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 94 script](interview-scripts/094-how-do-you-publish-private-modules-securely.tf)
```tf
# Question 94: How do you publish private modules securely?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-94"
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
```

95. How do you enforce semantic versioning for modules?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 95 script](interview-scripts/095-how-do-you-enforce-semantic-versioning-for-modules.tf)
```tf
# Question 95: How do you enforce semantic versioning for modules?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-95"
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
```

96. How do you implement policy as code for Terraform?
**Answer:** Apply least privilege, isolate trust boundaries, validate policy in CI or admission, and record auditable changes.
Script: [Question 96 script](interview-scripts/096-how-do-you-implement-policy-as-code-for-terraform.tf)
```tf
# Question 96: How do you implement policy as code for Terraform?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-96"
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
```

97. Compare Sentinel, OPA, and Checkov-style controls.
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 97 script](interview-scripts/097-compare-sentinel-opa-and-checkov-style-controls.tf)
```tf
# Question 97: Compare Sentinel, OPA, and Checkov-style controls.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-97"
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
```

98. How do you prevent public storage resources with policy?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 98 script](interview-scripts/098-how-do-you-prevent-public-storage-resources-with-policy.tf)
```tf
# Question 98: How do you prevent public storage resources with policy?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-98"
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
```

99. How do you enforce mandatory tags?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 99 script](interview-scripts/099-how-do-you-enforce-mandatory-tags.tf)
```tf
# Question 99: How do you enforce mandatory tags?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-99"
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
```

100. How do you scan Terraform for secrets?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
Script: [Question 100 script](interview-scripts/100-how-do-you-scan-terraform-for-secrets.tf)
```tf
# Question 100: How do you scan Terraform for secrets?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-100"
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
```

101. How do you integrate Terraform with GitHub Actions?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 101 script](interview-scripts/101-how-do-you-integrate-terraform-with-github-actions.tf)
```tf
# Question 101: How do you integrate Terraform with GitHub Actions?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-101"
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
```

102. How do you integrate Terraform with GitLab CI?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 102 script](interview-scripts/102-how-do-you-integrate-terraform-with-gitlab-ci.tf)
```tf
# Question 102: How do you integrate Terraform with GitLab CI?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-102"
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
```

103. How do you use OIDC instead of cloud keys?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
Script: [Question 103 script](interview-scripts/103-how-do-you-use-oidc-instead-of-cloud-keys.tf)
```tf
# Question 103: How do you use OIDC instead of cloud keys?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-103"
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
```

104. How do you protect plan and state artifacts?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 104 script](interview-scripts/104-how-do-you-protect-plan-and-state-artifacts.tf)
```tf
# Question 104: How do you protect plan and state artifacts?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-104"
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
```

105. How do you handle sensitive values in plan output?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 105 script](interview-scripts/105-how-do-you-handle-sensitive-values-in-plan-output.tf)
```tf
# Question 105: How do you handle sensitive values in plan output?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-105"
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
```

106. How do you implement drift detection on a schedule?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 106 script](interview-scripts/106-how-do-you-implement-drift-detection-on-a-schedule.tf)
```tf
# Question 106: How do you implement drift detection on a schedule?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-106"
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
```

107. How do you distinguish intentional change from drift?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 107 script](interview-scripts/107-how-do-you-distinguish-intentional-change-from-drift.tf)
```tf
# Question 107: How do you distinguish intentional change from drift?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-107"
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
```

108. How do you coordinate Terraform with Ansible?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 108 script](interview-scripts/108-how-do-you-coordinate-terraform-with-ansible.tf)
```tf
# Question 108: How do you coordinate Terraform with Ansible?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-108"
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
```

109. How do you manage Kubernetes resources with Terraform?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 109 script](interview-scripts/109-how-do-you-manage-kubernetes-resources-with-terraform.tf)
```tf
# Question 109: How do you manage Kubernetes resources with Terraform?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-109"
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
```

110. When should Kubernetes resources use Helm instead?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 110 script](interview-scripts/110-when-should-kubernetes-resources-use-helm-instead.tf)
```tf
# Question 110: When should Kubernetes resources use Helm instead?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-110"
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
```

111. How do you design blue-green infrastructure changes?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 111 script](interview-scripts/111-how-do-you-design-blue-green-infrastructure-changes.tf)
```tf
# Question 111: How do you design blue-green infrastructure changes?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-111"
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
```

112. How do you design zero-downtime database changes?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 112 script](interview-scripts/112-how-do-you-design-zero-downtime-database-changes.tf)
```tf
# Question 112: How do you design zero-downtime database changes?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-112"
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
```

113. How do you handle dependency cycles?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 113 script](interview-scripts/113-how-do-you-handle-dependency-cycles.tf)
```tf
# Question 113: How do you handle dependency cycles?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-113"
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
```

114. How do you reduce graph execution time?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 114 script](interview-scripts/114-how-do-you-reduce-graph-execution-time.tf)
```tf
# Question 114: How do you reduce graph execution time?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-114"
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
```

115. How do you design parallel-safe modules?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 115 script](interview-scripts/115-how-do-you-design-parallel-safe-modules.tf)
```tf
# Question 115: How do you design parallel-safe modules?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-115"
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
```

116. How do you recover from a failed apply halfway through?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 116 script](interview-scripts/116-how-do-you-recover-from-a-failed-apply-halfway-through.tf)
```tf
# Question 116: How do you recover from a failed apply halfway through?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-116"
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
```

117. How do you build an approval and rollback process?
**Answer:** Keep the previous known-good version, validate the replacement, and automate a tested rollback or restore path with clear ownership and audit output.
Script: [Question 117 script](interview-scripts/117-how-do-you-build-an-approval-and-rollback-process.tf)
```tf
# Question 117: How do you build an approval and rollback process?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-117"
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
```

118. How do you measure Terraform delivery quality?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 118 script](interview-scripts/118-how-do-you-measure-terraform-delivery-quality.tf)
```tf
# Question 118: How do you measure Terraform delivery quality?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-118"
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
```

119. What are the risks of provisioners?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 119 script](interview-scripts/119-what-are-the-risks-of-provisioners.tf)
```tf
# Question 119: What are the risks of provisioners?
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-119"
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
```

120. Design a secure, policy-controlled, multi-cloud Terraform delivery platform.
**Answer:** Apply least privilege, isolate trust boundaries, validate policy in CI or admission, and record auditable changes.
Script: [Question 120 script](interview-scripts/120-design-a-secure-policy-controlled-multi-cloud-terraform.tf)
```tf
# Question 120: Design a secure, policy-controlled, multi-cloud Terraform delivery platform.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-120"
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
```


## HackerRank-Style Terraform Challenges: 121-150

121. Define a typed variable with a default value.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 121 script](interview-scripts/121-define-a-typed-variable-with-a-default-value.tf)
```tf
# Question 121: Define a typed variable with a default value.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-121"
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
```

122. Reject an invalid environment with variable validation.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 122 script](interview-scripts/122-reject-an-invalid-environment-with-variable-validation.tf)
```tf
# Question 122: Reject an invalid environment with variable validation.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-122"
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
```

123. Create a local map of environment-specific sizes.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 123 script](interview-scripts/123-create-a-local-map-of-environment-specific-sizes.tf)
```tf
# Question 123: Create a local map of environment-specific sizes.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-123"
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
```

124. Use `for_each` to create one resource per subnet.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 124 script](interview-scripts/124-use-for-each-to-create-one-resource-per-subnet.tf)
```tf
# Question 124: Use `for_each` to create one resource per subnet.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-124"
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
```

125. Use `count` for optional monitoring resources.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
Script: [Question 125 script](interview-scripts/125-use-count-for-optional-monitoring-resources.tf)
```tf
# Question 125: Use `count` for optional monitoring resources.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-125"
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
```

126. Output resource IDs.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 126 script](interview-scripts/126-output-resource-ids.tf)
```tf
# Question 126: Output resource IDs.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-126"
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
```

127. Look up an existing network with a data source.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 127 script](interview-scripts/127-look-up-an-existing-network-with-a-data-source.tf)
```tf
# Question 127: Look up an existing network with a data source.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-127"
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
```

128. Create a module with required inputs and outputs.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 128 script](interview-scripts/128-create-a-module-with-required-inputs-and-outputs.tf)
```tf
# Question 128: Create a module with required inputs and outputs.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-128"
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
```

129. Create replacements before destroy with lifecycle.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 129 script](interview-scripts/129-create-replacements-before-destroy-with-lifecycle.tf)
```tf
# Question 129: Create replacements before destroy with lifecycle.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-129"
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
```

130. Reject an unencrypted resource with a precondition.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 130 script](interview-scripts/130-reject-an-unencrypted-resource-with-a-precondition.tf)
```tf
# Question 130: Reject an unencrypted resource with a precondition.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-130"
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
```

131. Verify required tags with a postcondition.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 131 script](interview-scripts/131-verify-required-tags-with-a-postcondition.tf)
```tf
# Question 131: Verify required tags with a postcondition.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-131"
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
```

132. Generate firewall rules with a dynamic block.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 132 script](interview-scripts/132-generate-firewall-rules-with-a-dynamic-block.tf)
```tf
# Question 132: Generate firewall rules with a dynamic block.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-132"
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
```

133. Flatten nested application configuration.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 133 script](interview-scripts/133-flatten-nested-application-configuration.tf)
```tf
# Question 133: Flatten nested application configuration.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-133"
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
```

134. Configure provider aliases for two Azure subscriptions.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 134 script](interview-scripts/134-configure-provider-aliases-for-two-azure-subscriptions.tf)
```tf
# Question 134: Configure provider aliases for two Azure subscriptions.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-134"
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
```

135. Configure provider aliases for two AWS regions.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 135 script](interview-scripts/135-configure-provider-aliases-for-two-aws-regions.tf)
```tf
# Question 135: Configure provider aliases for two AWS regions.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-135"
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
```

136. Import an existing resource and document state.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 136 script](interview-scripts/136-import-an-existing-resource-and-document-state.tf)
```tf
# Question 136: Import an existing resource and document state.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-136"
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
```

137. Rename a resource with a `moved` block.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 137 script](interview-scripts/137-rename-a-resource-with-a-moved-block.tf)
```tf
# Question 137: Rename a resource with a `moved` block.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-137"
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
```

138. Configure an Azure Storage remote backend.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 138 script](interview-scripts/138-configure-an-azure-storage-remote-backend.tf)
```tf
# Question 138: Configure an Azure Storage remote backend.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-138"
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
```

139. Configure an S3 backend with state locking.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 139 script](interview-scripts/139-configure-an-s3-backend-with-state-locking.tf)
```tf
# Question 139: Configure an S3 backend with state locking.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-139"
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
```

140. Reject public storage with policy as code.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 140 script](interview-scripts/140-reject-public-storage-with-policy-as-code.tf)
```tf
# Question 140: Reject public storage with policy as code.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-140"
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
```

141. Require an owner tag with policy as code.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 141 script](interview-scripts/141-require-an-owner-tag-with-policy-as-code.tf)
```tf
# Question 141: Require an owner tag with policy as code.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-141"
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
```

142. Test invalid module input.
**Answer:** Test the happy path, invalid input, timeout, retry exhaustion, and partial failure with mocks for external systems and an assertion on the final result.
Script: [Question 142 script](interview-scripts/142-test-invalid-module-input.tf)
```tf
# Question 142: Test invalid module input.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-142"
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
```

143. Test a required module output.
**Answer:** Test the happy path, invalid input, timeout, retry exhaustion, and partial failure with mocks for external systems and an assertion on the final result.
Script: [Question 143 script](interview-scripts/143-test-a-required-module-output.tf)
```tf
# Question 143: Test a required module output.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-143"
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
```

144. Create a CI plan job that never applies automatically.
**Answer:** Separate validation, build, promotion, and verification jobs; use immutable artifacts, protected variables or OIDC, and manual approval for production.
Script: [Question 144 script](interview-scripts/144-create-a-ci-plan-job-that-never-applies-automatically.tf)
```tf
# Question 144: Create a CI plan job that never applies automatically.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-144"
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
```

145. Create an approval-gated production apply.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 145 script](interview-scripts/145-create-an-approval-gated-production-apply.tf)
```tf
# Question 145: Create an approval-gated production apply.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-145"
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
```

146. Detect drift in a scheduled plan.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 146 script](interview-scripts/146-detect-drift-in-a-scheduled-plan.tf)
```tf
# Question 146: Detect drift in a scheduled plan.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-146"
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
```

147. Expose a sensitive output safely.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 147 script](interview-scripts/147-expose-a-sensitive-output-safely.tf)
```tf
# Question 147: Expose a sensitive output safely.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-147"
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
```

148. Build Azure and AWS implementations behind one module interface.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 148 script](interview-scripts/148-build-azure-and-aws-implementations-behind-one-module-i.tf)
```tf
# Question 148: Build Azure and AWS implementations behind one module interface.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-148"
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
```

149. Separate platform and workload state.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 149 script](interview-scripts/149-separate-platform-and-workload-state.tf)
```tf
# Question 149: Separate platform and workload state.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-149"
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
```

150. Build a tested multi-environment module with policy and safe promotion.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 150 script](interview-scripts/150-build-a-tested-multi-environment-module-with-policy-and.tf)
```tf
# Question 150: Build a tested multi-environment module with policy and safe promotion.
terraform {
  required_version = ">= 1.6.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  solution_name = "devtrack-${var.environment}-150"
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
```


## Executable Answers

- [Beginner answers](interview-answers/beginner.tf): typed variables, validation, locals, and outputs.
- [Intermediate answers](interview-answers/intermediate.tf): `for_each`, tags, and map outputs.
- [Advanced answers](interview-answers/advanced.tf): remote state and approval preconditions.
