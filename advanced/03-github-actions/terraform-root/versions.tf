terraform {
  required_version = ">= 1.5.0"
}

resource "terraform_data" "pipeline_example" {
  input = "validated-by-github-actions"
}
