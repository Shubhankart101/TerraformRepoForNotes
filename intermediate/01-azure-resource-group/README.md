# Intermediate 01: Azure resource group

A minimal Azure provider example. Authenticate with Azure CLI or workload identity before running it.

```bash
az login
terraform init
terraform plan -var="name=rg-example"
terraform apply -var="name=rg-example"
```

Do not hardcode subscription IDs, client secrets, or tenant credentials in this folder.
