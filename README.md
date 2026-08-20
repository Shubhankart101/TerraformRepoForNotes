# Terraform Reference Notes

A practical Terraform reference library organized by learning level. Examples are intentionally small, reusable, and designed for future project bootstrapping.

## Learning path

| Level | Focus | Start here |
| --- | --- | --- |
| Beginner | HCL syntax, variables, locals, outputs, data sources, and lifecycle basics | [beginner/01-basic-resource](beginner/01-basic-resource) |
| Intermediate | Azure providers, modules, `for_each`, validation, and environment patterns | [intermediate/01-azure-resource-group](intermediate/01-azure-resource-group) |
| Advanced | Remote state, reusable platform composition, policy-minded inputs, and CI/CD | [advanced/01-remote-state](advanced/01-remote-state) |

## Structure

```text
beginner/
	01-basic-resource/
	02-variables-locals-outputs/
	03-data-and-lifecycle/
intermediate/
	01-azure-resource-group/
	02-reusable-module/
	03-for-each-and-validation/
advanced/
	01-remote-state/
	02-platform-composition/
	03-github-actions/
```

## Common commands

Run commands from the selected example directory:

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
```

Never commit real secrets, `.tfstate` files, plan files, cloud credentials, or generated `.terraform/` directories.

## Safety notes

- Provider-free examples can be run locally with no cloud account.
- Azure examples require an authenticated Azure subscription and should be reviewed with `terraform plan` before apply.
- Remote state examples require an existing backend and storage permissions; treat backend configuration as environment-specific.
- The advanced GitHub Actions example uses placeholders for secrets and should be adapted to repository environments.