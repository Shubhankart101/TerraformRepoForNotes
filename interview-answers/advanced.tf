terraform {
  required_version = ">= 1.6.0"
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "replace-me"
    container_name       = "state"
    key                  = "platform.tfstate"
  }
}

resource "terraform_data" "policy_gate" {
  input = {
    approved = var.approved
  }
  lifecycle {
    precondition {
      condition     = var.approved
      error_message = "production apply requires approval"
    }
  }
}
