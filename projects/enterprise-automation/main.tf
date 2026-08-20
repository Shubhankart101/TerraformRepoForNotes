variable "teams" {
  type = map(object({
    owner       = string
    environments = set(string)
  }))

  default = {
    platform = { owner = "platform-team", environments = ["dev", "prod"] }
    product  = { owner = "product-team", environments = ["dev", "test", "prod"] }
  }
}

locals {
  ownership = flatten([
    for team, definition in var.teams : [
      for environment in definition.environments : {
        team        = team
        owner       = definition.owner
        environment = environment
      }
    ]
  ])
}

resource "terraform_data" "ownership" {
  for_each = {
    for item in local.ownership : "${item.team}-${item.environment}" => item
  }
  input = jsonencode(each.value)
}

output "ownership_matrix" {
  value = { for key, item in terraform_data.ownership : key => item.output }
}
