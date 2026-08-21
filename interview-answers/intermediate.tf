variable "subnets" {
  type = map(string)
}

resource "azurerm_resource_group" "example" {
  for_each = var.subnets
  name     = "rg-${each.key}"
  location = each.value
  tags = {
    Owner = "platform"
  }
}

output "resource_groups" {
  value = { for key, resource in azurerm_resource_group.example : key => resource.id }
}
