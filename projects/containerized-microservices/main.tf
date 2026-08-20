variable "services" {
  type = map(object({
    image = string
    port  = number
    tier  = string
  }))

  default = {
    api    = { image = "api:latest", port = 8080, tier = "backend" }
    worker = { image = "worker:latest", port = 8081, tier = "background" }
  }
}

resource "terraform_data" "service" {
  for_each = var.services
  input    = jsonencode(merge(each.value, { name = each.key }))
}

output "service_definitions" {
  value = { for name, service in terraform_data.service : name => service.output }
}
