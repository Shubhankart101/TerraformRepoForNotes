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
2. What is infrastructure as code?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
3. What is an HCL configuration?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
4. What is a Terraform provider?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
5. What is a resource?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
6. What is a data source?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
7. What is a variable?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
8. What is an output?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
9. What is a local value?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
10. What is a resource address?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
11. What does `terraform init` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
12. What does `terraform plan` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
13. What does `terraform apply` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
14. What does `terraform destroy` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
15. Why review a plan before applying?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
16. What is Terraform state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
17. Why does Terraform need state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
18. What is a backend?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
19. What is a resource dependency?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
20. How does Terraform infer dependencies?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
21. What does `depends_on` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
22. What is interpolation?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
23. How do you reference a resource attribute?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
24. What is a list type?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
25. What is a map type?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
26. What is a set type?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
27. What is a conditional expression?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
28. What does `for_each` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
29. What does `count` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
30. What is a module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
31. How do you call a module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
32. What is a module input?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
33. What is a module output?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
34. What does `terraform fmt` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
35. What does `terraform validate` do?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
36. What is a lifecycle block?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
37. What does `create_before_destroy` do?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
38. What is a sensitive value?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
39. Why should secrets not be committed to state or code?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
40. How do you pin a provider version?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.

## Intermediate: 41-80

41. Explain Terraform dependency graph construction.
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
42. How does Terraform refresh state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
43. What is state drift?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
44. How do you detect drift safely?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
45. How do you import an existing resource?
**Answer:** Define the smallest required traffic path, restrict it with policy and identity, and verify connectivity from the same network boundary as the workload.
46. What is a moved block?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
47. How do you rename a resource without recreation?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
48. How do you remove a resource from state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
49. What causes state locking?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
50. How does a remote backend improve collaboration?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
51. How do you secure an Azure Storage backend?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
52. How do you secure an S3 and DynamoDB backend?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
53. How do workspaces differ from separate state files?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
54. When should you avoid workspaces?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
55. How do variable validation blocks work?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
56. What are preconditions and postconditions?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
57. How do you use `for_each` with a map of environments?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
58. What are common `count` indexing pitfalls?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
59. How do you flatten nested data?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
60. How do dynamic blocks work?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
61. How do you design a reusable module interface?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
62. What belongs in module documentation?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
63. How do you version a module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
64. How do you test a module?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
65. What are Terraform test files?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
66. How do Terratest and native tests differ?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
67. How do you run Terraform in CI?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
68. Which checks should run before plan?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
69. How do you create a plan artifact safely?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
70. How do you approve production apply?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
71. How do provider aliases work?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
72. How do you deploy to multiple Azure subscriptions?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
73. How do you deploy to multiple AWS regions?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
74. How do you pass provider configuration into a module?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
75. How do data sources create hidden dependencies?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
76. How do you handle eventual consistency after resource creation?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
77. How do you use timeouts in resources?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
78. How do lifecycle ignore changes work?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
79. What are the risks of `ignore_changes`?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
80. How do you troubleshoot an unexpected replacement?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.

## Advanced: 81-120

81. Design a multi-account Terraform platform.
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
82. Design a multi-subscription Azure Terraform platform.
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
83. How do you structure root modules and child modules?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
84. How do you separate platform and workload state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
85. How do you define state ownership boundaries?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
86. How do you recover a corrupted state file?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
87. How do you test backend disaster recovery?
**Answer:** Keep the previous known-good version, validate the replacement, and automate a tested rollback or restore path with clear ownership and audit output.
88. How do you rotate backend credentials without downtime?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
89. How do you prevent concurrent applies?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
90. How do you design a safe state migration?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
91. How do you manage provider upgrades?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
92. How do you test a provider upgrade before production?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
93. How do you handle breaking module changes?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
94. How do you publish private modules securely?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
95. How do you enforce semantic versioning for modules?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
96. How do you implement policy as code for Terraform?
**Answer:** Apply least privilege, isolate trust boundaries, validate policy in CI or admission, and record auditable changes.
97. Compare Sentinel, OPA, and Checkov-style controls.
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
98. How do you prevent public storage resources with policy?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
99. How do you enforce mandatory tags?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
100. How do you scan Terraform for secrets?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
101. How do you integrate Terraform with GitHub Actions?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
102. How do you integrate Terraform with GitLab CI?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
103. How do you use OIDC instead of cloud keys?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
104. How do you protect plan and state artifacts?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
105. How do you handle sensitive values in plan output?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
106. How do you implement drift detection on a schedule?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
107. How do you distinguish intentional change from drift?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
108. How do you coordinate Terraform with Ansible?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
109. How do you manage Kubernetes resources with Terraform?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
110. When should Kubernetes resources use Helm instead?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
111. How do you design blue-green infrastructure changes?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
112. How do you design zero-downtime database changes?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
113. How do you handle dependency cycles?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
114. How do you reduce graph execution time?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
115. How do you design parallel-safe modules?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
116. How do you recover from a failed apply halfway through?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
117. How do you build an approval and rollback process?
**Answer:** Keep the previous known-good version, validate the replacement, and automate a tested rollback or restore path with clear ownership and audit output.
118. How do you measure Terraform delivery quality?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
119. What are the risks of provisioners?
**Answer:** A strong answer should define the concept, show a small Terraform implementation, explain failure behavior, and describe how it would be tested in CI.
120. Design a secure, policy-controlled, multi-cloud Terraform delivery platform.
**Answer:** Apply least privilege, isolate trust boundaries, validate policy in CI or admission, and record auditable changes.

## HackerRank-Style Terraform Challenges: 121-150

121. Define a typed variable with a default value.
122. Reject an invalid environment with variable validation.
123. Create a local map of environment-specific sizes.
124. Use `for_each` to create one resource per subnet.
125. Use `count` for optional monitoring resources.
126. Output resource IDs.
127. Look up an existing network with a data source.
128. Create a module with required inputs and outputs.
129. Create replacements before destroy with lifecycle.
130. Reject an unencrypted resource with a precondition.
131. Verify required tags with a postcondition.
132. Generate firewall rules with a dynamic block.
133. Flatten nested application configuration.
134. Configure provider aliases for two Azure subscriptions.
135. Configure provider aliases for two AWS regions.
136. Import an existing resource and document state.
137. Rename a resource with a `moved` block.
138. Configure an Azure Storage remote backend.
139. Configure an S3 backend with state locking.
140. Reject public storage with policy as code.
141. Require an owner tag with policy as code.
142. Test invalid module input.
143. Test a required module output.
144. Create a CI plan job that never applies automatically.
145. Create an approval-gated production apply.
146. Detect drift in a scheduled plan.
147. Expose a sensitive output safely.
148. Build Azure and AWS implementations behind one module interface.
149. Separate platform and workload state.
150. Build a tested multi-environment module with policy and safe promotion.

## Executable Answers

- [Beginner answers](interview-answers/beginner.tf): typed variables, validation, locals, and outputs.
- [Intermediate answers](interview-answers/intermediate.tf): `for_each`, tags, and map outputs.
- [Advanced answers](interview-answers/advanced.tf): remote state and approval preconditions.
