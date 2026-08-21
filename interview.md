# Terraform Interview Question Bank

This bank contains 150 questions organized by difficulty, covering HCL, state, modules, cloud platforms, policy, testing, and production delivery.

## Worked Answers

### Beginner: typed variables and validation

**Question:** How do you reject an invalid environment?

```hcl
variable "environment" {
	type = string
	validation {
		condition     = contains(["dev", "test", "prod"], var.environment)
		error_message = "environment must be dev, test, or prod"
	}
}
```

Validation fails during planning before an invalid deployment can be applied.

### Intermediate: reusable resource creation

**Question:** How do you create one resource per subnet?

```hcl
variable "subnets" { type = map(string) }

resource "azurerm_resource_group" "example" {
	for_each = var.subnets
	name     = "rg-${each.key}"
	location = each.value
}
```

`for_each` gives stable resource addresses based on map keys, avoiding count-index churn.

### Advanced: approval gate

**Question:** How do you prevent an unapproved production apply?

```hcl
variable "approved" { type = bool }

resource "terraform_data" "approval_gate" {
	input = var.approved
	lifecycle {
		precondition {
			condition     = var.approved
			error_message = "production apply requires approval"
		}
	}
}
```

The precondition blocks the plan or apply when the pipeline approval signal is false.

## Beginner: 1-40

1. What problem does Terraform solve?
**Answer:** It addresses a recurring DevOps need by making delivery, operations, or infrastructure repeatable, reviewable, and safer to automate.
Script: [Question 1 script](interview-scripts/001-what-problem-does-terraform-solve.tf)
2. What is infrastructure as code?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 2 script](interview-scripts/002-what-is-infrastructure-as-code.tf)
3. What is an HCL configuration?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 3 script](interview-scripts/003-what-is-an-hcl-configuration.tf)
4. What is a Terraform provider?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 4 script](interview-scripts/004-what-is-a-terraform-provider.tf)
5. What is a resource?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 5 script](interview-scripts/005-what-is-a-resource.tf)
6. What is a data source?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 6 script](interview-scripts/006-what-is-a-data-source.tf)
7. What is a variable?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 7 script](interview-scripts/007-what-is-a-variable.tf)
8. What is an output?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 8 script](interview-scripts/008-what-is-an-output.tf)
9. What is a local value?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 9 script](interview-scripts/009-what-is-a-local-value.tf)
10. What is a resource address?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 10 script](interview-scripts/010-what-is-a-resource-address.tf)
11. What does `terraform init` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 11 script](interview-scripts/011-what-does-terraform-init-do.tf)
12. What does `terraform plan` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 12 script](interview-scripts/012-what-does-terraform-plan-do.tf)
13. What does `terraform apply` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 13 script](interview-scripts/013-what-does-terraform-apply-do.tf)
14. What does `terraform destroy` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 14 script](interview-scripts/014-what-does-terraform-destroy-do.tf)
15. Why review a plan before applying?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 15 script](interview-scripts/015-why-review-a-plan-before-applying.tf)
16. What is Terraform state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 16 script](interview-scripts/016-what-is-terraform-state.tf)
17. Why does Terraform need state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 17 script](interview-scripts/017-why-does-terraform-need-state.tf)
18. What is a backend?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 18 script](interview-scripts/018-what-is-a-backend.tf)
19. What is a resource dependency?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 19 script](interview-scripts/019-what-is-a-resource-dependency.tf)
20. How does Terraform infer dependencies?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 20 script](interview-scripts/020-how-does-terraform-infer-dependencies.tf)
21. What does `depends_on` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 21 script](interview-scripts/021-what-does-depends-on-do.tf)
22. What is interpolation?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 22 script](interview-scripts/022-what-is-interpolation.tf)
23. How do you reference a resource attribute?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 23 script](interview-scripts/023-how-do-you-reference-a-resource-attribute.tf)
24. What is a list type?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 24 script](interview-scripts/024-what-is-a-list-type.tf)
25. What is a map type?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 25 script](interview-scripts/025-what-is-a-map-type.tf)
26. What is a set type?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 26 script](interview-scripts/026-what-is-a-set-type.tf)
27. What is a conditional expression?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 27 script](interview-scripts/027-what-is-a-conditional-expression.tf)
28. What does `for_each` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 28 script](interview-scripts/028-what-does-for-each-do.tf)
29. What does `count` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 29 script](interview-scripts/029-what-does-count-do.tf)
30. What is a module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 30 script](interview-scripts/030-what-is-a-module.tf)
31. How do you call a module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 31 script](interview-scripts/031-how-do-you-call-a-module.tf)
32. What is a module input?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 32 script](interview-scripts/032-what-is-a-module-input.tf)
33. What is a module output?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 33 script](interview-scripts/033-what-is-a-module-output.tf)
34. What does `terraform fmt` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 34 script](interview-scripts/034-what-does-terraform-fmt-do.tf)
35. What does `terraform validate` do?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 35 script](interview-scripts/035-what-does-terraform-validate-do.tf)
36. What is a lifecycle block?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 36 script](interview-scripts/036-what-is-a-lifecycle-block.tf)
37. What does `create_before_destroy` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 37 script](interview-scripts/037-what-does-create-before-destroy-do.tf)
38. What is a sensitive value?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 38 script](interview-scripts/038-what-is-a-sensitive-value.tf)
39. Why should secrets not be committed to state or code?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
Script: [Question 39 script](interview-scripts/039-why-should-secrets-not-be-committed-to-state-or-code.tf)
40. How do you pin a provider version?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 40 script](interview-scripts/040-how-do-you-pin-a-provider-version.tf)

## Intermediate: 41-80

41. Explain Terraform dependency graph construction.
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 41 script](interview-scripts/041-explain-terraform-dependency-graph-construction.tf)
42. How does Terraform refresh state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 42 script](interview-scripts/042-how-does-terraform-refresh-state.tf)
43. What is state drift?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 43 script](interview-scripts/043-what-is-state-drift.tf)
44. How do you detect drift safely?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 44 script](interview-scripts/044-how-do-you-detect-drift-safely.tf)
45. How do you import an existing resource?
**Answer:** Define the smallest required traffic path, restrict it with policy and identity, and verify connectivity from the same network boundary as the workload.
Script: [Question 45 script](interview-scripts/045-how-do-you-import-an-existing-resource.tf)
46. What is a moved block?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 46 script](interview-scripts/046-what-is-a-moved-block.tf)
47. How do you rename a resource without recreation?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 47 script](interview-scripts/047-how-do-you-rename-a-resource-without-recreation.tf)
48. How do you remove a resource from state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 48 script](interview-scripts/048-how-do-you-remove-a-resource-from-state.tf)
49. What causes state locking?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 49 script](interview-scripts/049-what-causes-state-locking.tf)
50. How does a remote backend improve collaboration?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 50 script](interview-scripts/050-how-does-a-remote-backend-improve-collaboration.tf)
51. How do you secure an Azure Storage backend?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 51 script](interview-scripts/051-how-do-you-secure-an-azure-storage-backend.tf)
52. How do you secure an S3 and DynamoDB backend?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 52 script](interview-scripts/052-how-do-you-secure-an-s3-and-dynamodb-backend.tf)
53. How do workspaces differ from separate state files?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 53 script](interview-scripts/053-how-do-workspaces-differ-from-separate-state-files.tf)
54. When should you avoid workspaces?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 54 script](interview-scripts/054-when-should-you-avoid-workspaces.tf)
55. How do variable validation blocks work?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 55 script](interview-scripts/055-how-do-variable-validation-blocks-work.tf)
56. What are preconditions and postconditions?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 56 script](interview-scripts/056-what-are-preconditions-and-postconditions.tf)
57. How do you use `for_each` with a map of environments?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 57 script](interview-scripts/057-how-do-you-use-for-each-with-a-map-of-environments.tf)
58. What are common `count` indexing pitfalls?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 58 script](interview-scripts/058-what-are-common-count-indexing-pitfalls.tf)
59. How do you flatten nested data?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 59 script](interview-scripts/059-how-do-you-flatten-nested-data.tf)
60. How do dynamic blocks work?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 60 script](interview-scripts/060-how-do-dynamic-blocks-work.tf)
61. How do you design a reusable module interface?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 61 script](interview-scripts/061-how-do-you-design-a-reusable-module-interface.tf)
62. What belongs in module documentation?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 62 script](interview-scripts/062-what-belongs-in-module-documentation.tf)
63. How do you version a module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 63 script](interview-scripts/063-how-do-you-version-a-module.tf)
64. How do you test a module?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 64 script](interview-scripts/064-how-do-you-test-a-module.tf)
65. What are Terraform test files?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 65 script](interview-scripts/065-what-are-terraform-test-files.tf)
66. How do Terratest and native tests differ?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 66 script](interview-scripts/066-how-do-terratest-and-native-tests-differ.tf)
67. How do you run Terraform in CI?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 67 script](interview-scripts/067-how-do-you-run-terraform-in-ci.tf)
68. Which checks should run before plan?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 68 script](interview-scripts/068-which-checks-should-run-before-plan.tf)
69. How do you create a plan artifact safely?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 69 script](interview-scripts/069-how-do-you-create-a-plan-artifact-safely.tf)
70. How do you approve production apply?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 70 script](interview-scripts/070-how-do-you-approve-production-apply.tf)
71. How do provider aliases work?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 71 script](interview-scripts/071-how-do-provider-aliases-work.tf)
72. How do you deploy to multiple Azure subscriptions?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
Script: [Question 72 script](interview-scripts/072-how-do-you-deploy-to-multiple-azure-subscriptions.tf)
73. How do you deploy to multiple AWS regions?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
Script: [Question 73 script](interview-scripts/073-how-do-you-deploy-to-multiple-aws-regions.tf)
74. How do you pass provider configuration into a module?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 74 script](interview-scripts/074-how-do-you-pass-provider-configuration-into-a-module.tf)
75. How do data sources create hidden dependencies?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 75 script](interview-scripts/075-how-do-data-sources-create-hidden-dependencies.tf)
76. How do you handle eventual consistency after resource creation?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 76 script](interview-scripts/076-how-do-you-handle-eventual-consistency-after-resource-c.tf)
77. How do you use timeouts in resources?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 77 script](interview-scripts/077-how-do-you-use-timeouts-in-resources.tf)
78. How do lifecycle ignore changes work?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 78 script](interview-scripts/078-how-do-lifecycle-ignore-changes-work.tf)
79. What are the risks of `ignore_changes`?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 79 script](interview-scripts/079-what-are-the-risks-of-ignore-changes.tf)
80. How do you troubleshoot an unexpected replacement?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 80 script](interview-scripts/080-how-do-you-troubleshoot-an-unexpected-replacement.tf)

## Advanced: 81-120

81. Design a multi-account Terraform platform.
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
Script: [Question 81 script](interview-scripts/081-design-a-multi-account-terraform-platform.tf)
82. Design a multi-subscription Azure Terraform platform.
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
Script: [Question 82 script](interview-scripts/082-design-a-multi-subscription-azure-terraform-platform.tf)
83. How do you structure root modules and child modules?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 83 script](interview-scripts/083-how-do-you-structure-root-modules-and-child-modules.tf)
84. How do you separate platform and workload state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 84 script](interview-scripts/084-how-do-you-separate-platform-and-workload-state.tf)
85. How do you define state ownership boundaries?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 85 script](interview-scripts/085-how-do-you-define-state-ownership-boundaries.tf)
86. How do you recover a corrupted state file?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 86 script](interview-scripts/086-how-do-you-recover-a-corrupted-state-file.tf)
87. How do you test backend disaster recovery?
**Answer:** Keep the previous known-good version, validate the replacement, and automate a tested rollback or restore path with clear ownership and audit output.
Script: [Question 87 script](interview-scripts/087-how-do-you-test-backend-disaster-recovery.tf)
88. How do you rotate backend credentials without downtime?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
Script: [Question 88 script](interview-scripts/088-how-do-you-rotate-backend-credentials-without-downtime.tf)
89. How do you prevent concurrent applies?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 89 script](interview-scripts/089-how-do-you-prevent-concurrent-applies.tf)
90. How do you design a safe state migration?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 90 script](interview-scripts/090-how-do-you-design-a-safe-state-migration.tf)
91. How do you manage provider upgrades?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 91 script](interview-scripts/091-how-do-you-manage-provider-upgrades.tf)
92. How do you test a provider upgrade before production?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 92 script](interview-scripts/092-how-do-you-test-a-provider-upgrade-before-production.tf)
93. How do you handle breaking module changes?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 93 script](interview-scripts/093-how-do-you-handle-breaking-module-changes.tf)
94. How do you publish private modules securely?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 94 script](interview-scripts/094-how-do-you-publish-private-modules-securely.tf)
95. How do you enforce semantic versioning for modules?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 95 script](interview-scripts/095-how-do-you-enforce-semantic-versioning-for-modules.tf)
96. How do you implement policy as code for Terraform?
**Answer:** Apply least privilege, isolate trust boundaries, validate policy in CI or admission, and record auditable changes.
Script: [Question 96 script](interview-scripts/096-how-do-you-implement-policy-as-code-for-terraform.tf)
97. Compare Sentinel, OPA, and Checkov-style controls.
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 97 script](interview-scripts/097-compare-sentinel-opa-and-checkov-style-controls.tf)
98. How do you prevent public storage resources with policy?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 98 script](interview-scripts/098-how-do-you-prevent-public-storage-resources-with-policy.tf)
99. How do you enforce mandatory tags?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 99 script](interview-scripts/099-how-do-you-enforce-mandatory-tags.tf)
100. How do you scan Terraform for secrets?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
Script: [Question 100 script](interview-scripts/100-how-do-you-scan-terraform-for-secrets.tf)
101. How do you integrate Terraform with GitHub Actions?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 101 script](interview-scripts/101-how-do-you-integrate-terraform-with-github-actions.tf)
102. How do you integrate Terraform with GitLab CI?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 102 script](interview-scripts/102-how-do-you-integrate-terraform-with-gitlab-ci.tf)
103. How do you use OIDC instead of cloud keys?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
Script: [Question 103 script](interview-scripts/103-how-do-you-use-oidc-instead-of-cloud-keys.tf)
104. How do you protect plan and state artifacts?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 104 script](interview-scripts/104-how-do-you-protect-plan-and-state-artifacts.tf)
105. How do you handle sensitive values in plan output?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 105 script](interview-scripts/105-how-do-you-handle-sensitive-values-in-plan-output.tf)
106. How do you implement drift detection on a schedule?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 106 script](interview-scripts/106-how-do-you-implement-drift-detection-on-a-schedule.tf)
107. How do you distinguish intentional change from drift?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 107 script](interview-scripts/107-how-do-you-distinguish-intentional-change-from-drift.tf)
108. How do you coordinate Terraform with Ansible?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 108 script](interview-scripts/108-how-do-you-coordinate-terraform-with-ansible.tf)
109. How do you manage Kubernetes resources with Terraform?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 109 script](interview-scripts/109-how-do-you-manage-kubernetes-resources-with-terraform.tf)
110. When should Kubernetes resources use Helm instead?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 110 script](interview-scripts/110-when-should-kubernetes-resources-use-helm-instead.tf)
111. How do you design blue-green infrastructure changes?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 111 script](interview-scripts/111-how-do-you-design-blue-green-infrastructure-changes.tf)
112. How do you design zero-downtime database changes?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 112 script](interview-scripts/112-how-do-you-design-zero-downtime-database-changes.tf)
113. How do you handle dependency cycles?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 113 script](interview-scripts/113-how-do-you-handle-dependency-cycles.tf)
114. How do you reduce graph execution time?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 114 script](interview-scripts/114-how-do-you-reduce-graph-execution-time.tf)
115. How do you design parallel-safe modules?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 115 script](interview-scripts/115-how-do-you-design-parallel-safe-modules.tf)
116. How do you recover from a failed apply halfway through?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 116 script](interview-scripts/116-how-do-you-recover-from-a-failed-apply-halfway-through.tf)
117. How do you build an approval and rollback process?
**Answer:** Keep the previous known-good version, validate the replacement, and automate a tested rollback or restore path with clear ownership and audit output.
Script: [Question 117 script](interview-scripts/117-how-do-you-build-an-approval-and-rollback-process.tf)
118. How do you measure Terraform delivery quality?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 118 script](interview-scripts/118-how-do-you-measure-terraform-delivery-quality.tf)
119. What are the risks of provisioners?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 119 script](interview-scripts/119-what-are-the-risks-of-provisioners.tf)
120. Design a secure, policy-controlled, multi-cloud Terraform delivery platform.
**Answer:** Apply least privilege, isolate trust boundaries, validate policy in CI or admission, and record auditable changes.
Script: [Question 120 script](interview-scripts/120-design-a-secure-policy-controlled-multi-cloud-terraform.tf)

## HackerRank-Style Terraform Challenges: 121-150

121. Define a typed variable with a default value.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 121 script](interview-scripts/121-define-a-typed-variable-with-a-default-value.tf)
122. Reject an invalid environment with variable validation.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 122 script](interview-scripts/122-reject-an-invalid-environment-with-variable-validation.tf)
123. Create a local map of environment-specific sizes.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 123 script](interview-scripts/123-create-a-local-map-of-environment-specific-sizes.tf)
124. Use `for_each` to create one resource per subnet.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 124 script](interview-scripts/124-use-for-each-to-create-one-resource-per-subnet.tf)
125. Use `count` for optional monitoring resources.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
Script: [Question 125 script](interview-scripts/125-use-count-for-optional-monitoring-resources.tf)
126. Output resource IDs.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 126 script](interview-scripts/126-output-resource-ids.tf)
127. Look up an existing network with a data source.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 127 script](interview-scripts/127-look-up-an-existing-network-with-a-data-source.tf)
128. Create a module with required inputs and outputs.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 128 script](interview-scripts/128-create-a-module-with-required-inputs-and-outputs.tf)
129. Create replacements before destroy with lifecycle.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 129 script](interview-scripts/129-create-replacements-before-destroy-with-lifecycle.tf)
130. Reject an unencrypted resource with a precondition.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 130 script](interview-scripts/130-reject-an-unencrypted-resource-with-a-precondition.tf)
131. Verify required tags with a postcondition.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 131 script](interview-scripts/131-verify-required-tags-with-a-postcondition.tf)
132. Generate firewall rules with a dynamic block.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 132 script](interview-scripts/132-generate-firewall-rules-with-a-dynamic-block.tf)
133. Flatten nested application configuration.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 133 script](interview-scripts/133-flatten-nested-application-configuration.tf)
134. Configure provider aliases for two Azure subscriptions.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 134 script](interview-scripts/134-configure-provider-aliases-for-two-azure-subscriptions.tf)
135. Configure provider aliases for two AWS regions.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 135 script](interview-scripts/135-configure-provider-aliases-for-two-aws-regions.tf)
136. Import an existing resource and document state.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 136 script](interview-scripts/136-import-an-existing-resource-and-document-state.tf)
137. Rename a resource with a `moved` block.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 137 script](interview-scripts/137-rename-a-resource-with-a-moved-block.tf)
138. Configure an Azure Storage remote backend.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 138 script](interview-scripts/138-configure-an-azure-storage-remote-backend.tf)
139. Configure an S3 backend with state locking.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 139 script](interview-scripts/139-configure-an-s3-backend-with-state-locking.tf)
140. Reject public storage with policy as code.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 140 script](interview-scripts/140-reject-public-storage-with-policy-as-code.tf)
141. Require an owner tag with policy as code.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 141 script](interview-scripts/141-require-an-owner-tag-with-policy-as-code.tf)
142. Test invalid module input.
**Answer:** Test the happy path, invalid input, timeout, retry exhaustion, and partial failure with mocks for external systems and an assertion on the final result.
Script: [Question 142 script](interview-scripts/142-test-invalid-module-input.tf)
143. Test a required module output.
**Answer:** Test the happy path, invalid input, timeout, retry exhaustion, and partial failure with mocks for external systems and an assertion on the final result.
Script: [Question 143 script](interview-scripts/143-test-a-required-module-output.tf)
144. Create a CI plan job that never applies automatically.
**Answer:** Separate validation, build, promotion, and verification jobs; use immutable artifacts, protected variables or OIDC, and manual approval for production.
Script: [Question 144 script](interview-scripts/144-create-a-ci-plan-job-that-never-applies-automatically.tf)
145. Create an approval-gated production apply.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 145 script](interview-scripts/145-create-an-approval-gated-production-apply.tf)
146. Detect drift in a scheduled plan.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 146 script](interview-scripts/146-detect-drift-in-a-scheduled-plan.tf)
147. Expose a sensitive output safely.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Terraform.
Script: [Question 147 script](interview-scripts/147-expose-a-sensitive-output-safely.tf)
148. Build Azure and AWS implementations behind one module interface.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 148 script](interview-scripts/148-build-azure-and-aws-implementations-behind-one-module-i.tf)
149. Separate platform and workload state.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 149 script](interview-scripts/149-separate-platform-and-workload-state.tf)
150. Build a tested multi-environment module with policy and safe promotion.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 150 script](interview-scripts/150-build-a-tested-multi-environment-module-with-policy-and.tf)

## Executable Answers

- [Beginner answers](interview-answers/beginner.tf): typed variables, validation, locals, and outputs.
- [Intermediate answers](interview-answers/intermediate.tf): `for_each`, tags, and map outputs.
- [Advanced answers](interview-answers/advanced.tf): remote state and approval preconditions.
