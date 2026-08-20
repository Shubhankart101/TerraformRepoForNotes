# Terraform interview preparation

These are interview-style prompts for Terraform, cloud infrastructure, and platform engineering. They are study questions, not claims about any company's exact interview loop.

## Microsoft-oriented questions

1. How would you design a multi-environment Azure landing zone with Terraform?
2. How do you use modules without creating an abstraction that hides important Azure behavior?
3. How would you secure Terraform state in Azure Storage and prevent concurrent state corruption?
4. How would you authenticate Terraform in GitHub Actions or Azure DevOps without storing long-lived secrets?
5. How would you implement Azure policy, tagging, diagnostics, and managed identity as platform guardrails?
6. A deployment fails halfway through. How do you diagnose state, provider errors, drift, and partial resources?
7. How would you communicate an infrastructure risk or destructive plan to a customer and obtain approval?
8. How would you design a reusable module for a web application platform used by several teams?

## MAANG-oriented questions

1. Design a Terraform platform for hundreds of services and multiple regions. Where are the state boundaries?
2. How would you prevent a single state file or module registry from becoming a scalability bottleneck?
3. Explain dependency graphs, refresh, plan, apply, replacement, and eventual consistency.
4. How would you detect and remediate infrastructure drift without creating an unsafe auto-apply loop?
5. How would you test Terraform modules: static checks, contract tests, integration tests, and ephemeral environments?
6. How would you version modules and roll out a breaking change across hundreds of consumers?
7. How would you design a safe, idempotent, retryable provider integration?
8. What metrics show that an infrastructure platform is reliable and effective?

## Project mapping

- **Web application platform:** module boundaries, identity, secrets, networking, and deployment slots.
- **Containerized microservices:** typed service objects, `for_each`, scaling, registry, ingress, and workload identity.
- **Data platform:** encryption, retention, private access, orchestration, and data-domain ownership.
- **Enterprise automation:** module contracts, versioning, policy-as-code, drift, and approvals.
- **Observability platform:** diagnostic settings, SLOs, alert coverage, and ownership metadata.

## SRE and DevOps Engineering questions

1. Define availability, latency, durability, and recovery objectives for the platform you provision.
2. How would you design error budgets and release policies around infrastructure reliability?
3. How would you detect Terraform drift, prioritize it, and remediate it without unsafe automation?
4. How would you design observability for Terraform changes, Azure resources, and deployment pipelines?
5. How would you reduce infrastructure toil through modules, automation, self-service, and runbooks?
6. Describe an incident where a deployment caused impact. How would you contain, recover, and prevent recurrence?
7. How would you design disaster recovery, backup, restore, and regional failover for a critical Azure platform?
8. How do you review a Terraform plan for security, cost, blast radius, and operational risk?

## Strong answer checklist

Use this structure: clarify constraints, state assumptions, propose architecture, explain trade-offs, describe failure handling, define security boundaries, identify observability, and finish with rollout or rollback strategy.
