variable "services" {
  type        = set(string)
  description = "Services requiring monitoring"
  default     = ["api", "worker", "web"]
}

resource "terraform_data" "observability_contract" {
  for_each = var.services
  input = jsonencode({
    service = each.key
    owner   = "platform-team"
    signals = ["metrics", "logs", "traces"]
    slo     = "99.9%"
    alerts  = ["availability", "latency", "errors"]
  })
}

output "observability_contracts" {
  value = { for service, contract in terraform_data.observability_contract : service => contract.output }
}
