# 8x8 Review and Security Gates V1

## Purpose

Use multiple independent evidence sources without treating any automated reviewer as authority.

## Current advisory reviewers

- Qodo
- Augment Code Review
- SonarQube Cloud
- CodeRabbit, subject to plan and target-branch settings
- GitHub Copilot code review where enabled

AI findings are advisory until a maintainer verifies the issue, implements a bounded repair, adds a regression test and records exact-head CI evidence.

## Required deterministic gates

| Gate | Candidate tool | Purpose | Initial mode |
|---|---|---|---|
| Dependency updates | Dependabot and Renovate evaluation | Version and advisory visibility | Pull requests only |
| Dependency and image vulnerabilities | Trivy | Vulnerabilities, misconfiguration, licenses and SBOM | Report-only before enforcement |
| Secret scanning | GitHub secret scanning and Gitleaks evaluation | Prevent credential publication | Blocking after baseline cleanup |
| Static analysis | SonarQube Cloud and Semgrep evaluation | Security and correctness rules | Blocking for new critical/high findings |
| GitHub workflow security | zizmor | Dangerous triggers, permissions and action usage | Blocking after workflow baseline |
| Repository posture | OpenSSF Scorecard | Branch protection, pinning and supply-chain posture | Scheduled report |
| Findings presentation | reviewdog evaluation | Normalize linter annotations | Advisory |
| SBOM and provenance | Syft/Trivy plus artifact attestations | Release inventory and origin | Required for public release units |
| Browser behavior | Playwright plus accessibility checks | End-to-end browser and mobile viewport validation | Required for public web releases |
| License compliance | ScanCode or compatible scanner evaluation | Upstream license and notice preservation | Required before adoption |

## Rules

1. No reviewer receives credentials, production authority or financial authority.
2. Third-party Actions must be pinned to reviewed commit SHAs before becoming release gates.
3. New scanners start in report-only mode to establish a clean baseline without hiding existing findings.
4. A duplicated finding may share one remediation receipt, but each affected path must be covered.
5. A passing AI review cannot override failing tests, deterministic scanners or unresolved high-severity findings.
6. A failing tool caused by configuration must be reported as tool failure, not code failure or code success.
7. CodeRabbit skipped reviews caused by draft, plan or non-default-target settings are coverage gaps, not passes.
8. SonarQube, Qodo and Augment findings remain visible until the exact remediation and regression evidence exist.

## Release decision

A release unit can advance only when every required deterministic gate for its scope passes and all required review threads are resolved. Popularity, model confidence and the number of green badges cannot replace exact artifact identity and rollback.
