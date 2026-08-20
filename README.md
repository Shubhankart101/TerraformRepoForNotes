# Terraform Reference Notes

A practical Terraform reference library organized by learning level. Examples are intentionally small, reusable, and designed for future project bootstrapping.

## Learning path

| Level | Focus | Start here |
| --- | --- | --- |
| Beginner | HCL syntax, variables, locals, outputs, data sources, and lifecycle basics | [beginner/01-basic-resource](beginner/01-basic-resource) |
| Intermediate | Azure providers, modules, `for_each`, validation, and environment patterns | [intermediate/01-azure-resource-group](intermediate/01-azure-resource-group) |
| Advanced | Remote state, reusable platform composition, policy-minded inputs, and CI/CD | [advanced/01-remote-state](advanced/01-remote-state) |

## Project-oriented use cases

Every project track contains a practical scenario, Terraform design notes, and an advanced implementation direction:

- [Azure use cases](projects/use-cases/azure.md)
- [AWS use cases](projects/use-cases/aws.md)
- [On-premises use cases](projects/use-cases/on-premises.md)

- [Web application platform](projects/web-application-platform)
- [Containerized microservices](projects/containerized-microservices)
- [Data platform](projects/data-platform)
- [Enterprise automation](projects/enterprise-automation)
- [Observability platform](projects/observability-platform)

The weekly use-case index is refreshed every Monday at **7:00 AM IST** by [update-project-use-cases.yml](.github/workflows/update-project-use-cases.yml).

Read the current rotation in [projects/DAILY_USE_CASES.md](projects/DAILY_USE_CASES.md) and preserved weekly snapshots in [projects/use-case-history](projects/use-case-history). Historical use cases are never deleted.

Prepare with [Terraform interview questions](interview-prep/README.md) covering Microsoft customer delivery and MAANG-scale infrastructure design.

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
projects/
	DAILY_USE_CASES.md
	web-application-platform/
	containerized-microservices/
	data-platform/
	enterprise-automation/
	observability-platform/
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