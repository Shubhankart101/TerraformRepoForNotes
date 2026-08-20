# Terraform Interview Question Bank

This bank contains 120 questions organized by difficulty, covering HCL, state, modules, cloud platforms, policy, testing, and production delivery.

## Beginner: 1-40

1. What problem does Terraform solve?
2. What is infrastructure as code?
3. What is an HCL configuration?
4. What is a Terraform provider?
5. What is a resource?
6. What is a data source?
7. What is a variable?
8. What is an output?
9. What is a local value?
10. What is a resource address?
11. What does `terraform init` do?
12. What does `terraform plan` do?
13. What does `terraform apply` do?
14. What does `terraform destroy` do?
15. Why review a plan before applying?
16. What is Terraform state?
17. Why does Terraform need state?
18. What is a backend?
19. What is a resource dependency?
20. How does Terraform infer dependencies?
21. What does `depends_on` do?
22. What is interpolation?
23. How do you reference a resource attribute?
24. What is a list type?
25. What is a map type?
26. What is a set type?
27. What is a conditional expression?
28. What does `for_each` do?
29. What does `count` do?
30. What is a module?
31. How do you call a module?
32. What is a module input?
33. What is a module output?
34. What does `terraform fmt` do?
35. What does `terraform validate` do?
36. What is a lifecycle block?
37. What does `create_before_destroy` do?
38. What is a sensitive value?
39. Why should secrets not be committed to state or code?
40. How do you pin a provider version?

## Intermediate: 41-80

41. Explain Terraform dependency graph construction.
42. How does Terraform refresh state?
43. What is state drift?
44. How do you detect drift safely?
45. How do you import an existing resource?
46. What is a moved block?
47. How do you rename a resource without recreation?
48. How do you remove a resource from state?
49. What causes state locking?
50. How does a remote backend improve collaboration?
51. How do you secure an Azure Storage backend?
52. How do you secure an S3 and DynamoDB backend?
53. How do workspaces differ from separate state files?
54. When should you avoid workspaces?
55. How do variable validation blocks work?
56. What are preconditions and postconditions?
57. How do you use `for_each` with a map of environments?
58. What are common `count` indexing pitfalls?
59. How do you flatten nested data?
60. How do dynamic blocks work?
61. How do you design a reusable module interface?
62. What belongs in module documentation?
63. How do you version a module?
64. How do you test a module?
65. What are Terraform test files?
66. How do Terratest and native tests differ?
67. How do you run Terraform in CI?
68. Which checks should run before plan?
69. How do you create a plan artifact safely?
70. How do you approve production apply?
71. How do provider aliases work?
72. How do you deploy to multiple Azure subscriptions?
73. How do you deploy to multiple AWS regions?
74. How do you pass provider configuration into a module?
75. How do data sources create hidden dependencies?
76. How do you handle eventual consistency after resource creation?
77. How do you use timeouts in resources?
78. How do lifecycle ignore changes work?
79. What are the risks of `ignore_changes`?
80. How do you troubleshoot an unexpected replacement?

## Advanced: 81-120

81. Design a multi-account Terraform platform.
82. Design a multi-subscription Azure Terraform platform.
83. How do you structure root modules and child modules?
84. How do you separate platform and workload state?
85. How do you define state ownership boundaries?
86. How do you recover a corrupted state file?
87. How do you test backend disaster recovery?
88. How do you rotate backend credentials without downtime?
89. How do you prevent concurrent applies?
90. How do you design a safe state migration?
91. How do you manage provider upgrades?
92. How do you test a provider upgrade before production?
93. How do you handle breaking module changes?
94. How do you publish private modules securely?
95. How do you enforce semantic versioning for modules?
96. How do you implement policy as code for Terraform?
97. Compare Sentinel, OPA, and Checkov-style controls.
98. How do you prevent public storage resources with policy?
99. How do you enforce mandatory tags?
100. How do you scan Terraform for secrets?
101. How do you integrate Terraform with GitHub Actions?
102. How do you integrate Terraform with GitLab CI?
103. How do you use OIDC instead of cloud keys?
104. How do you protect plan and state artifacts?
105. How do you handle sensitive values in plan output?
106. How do you implement drift detection on a schedule?
107. How do you distinguish intentional change from drift?
108. How do you coordinate Terraform with Ansible?
109. How do you manage Kubernetes resources with Terraform?
110. When should Kubernetes resources use Helm instead?
111. How do you design blue-green infrastructure changes?
112. How do you design zero-downtime database changes?
113. How do you handle dependency cycles?
114. How do you reduce graph execution time?
115. How do you design parallel-safe modules?
116. How do you recover from a failed apply halfway through?
117. How do you build an approval and rollback process?
118. How do you measure Terraform delivery quality?
119. What are the risks of provisioners?
120. Design a secure, policy-controlled, multi-cloud Terraform delivery platform.
