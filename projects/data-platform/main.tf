variable "data_domains" {
  type        = set(string)
  description = "Business data domains"
  default     = ["finance", "customer", "operations"]
}

resource "terraform_data" "data_domain" {
  for_each = var.data_domains
  input = jsonencode({
    domain       = each.key
    classification = "internal"
    encrypted    = true
    retention_days = 365
  })
}

output "data_domains" {
  value = { for domain, item in terraform_data.data_domain : domain => item.output }
}
