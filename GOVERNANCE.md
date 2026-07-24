# Governance

This document describes how the **public** 8x8 OS projects are governed. It
applies to the public repositories in the `8x8org` organization. It does not
describe, and does not grant any access to, private owner systems.

## Roles

### Owner
The owner sets overall direction, holds final decision authority for the
organization, and controls the private owner systems that are **not** part of
these public repositories. The current owner is **FlashTM8 (Meher Trabelsi)**.

### Maintainers
Trusted contributors granted write access to one or more public repositories.
Maintainers review and merge pull requests, triage issues, uphold public-safe
scope, and mentor contributors.

### Reviewers
Experienced contributors who review pull requests in their area of expertise.
Reviewers do not need merge rights; their approvals inform maintainer decisions.

### Contributors
Anyone who opens an issue or pull request. No special access is required to
contribute.

## Decision authority

- **Routine changes** (bug fixes, docs, tests within public-safe scope): a
  maintainer review and approval is sufficient to merge.
- **Substantial changes** (features, new dependencies, architecture): require an
  issue-first discussion and maintainer consensus.
- **Boundary-sensitive changes** (anything touching the public/private boundary,
  security posture, or the sponsor/funding model): require **owner** approval.
- The owner may override or defer any decision where public safety, security, or
  legal risk is at stake.

## Conflict handling

Disagreements are resolved by discussion in the relevant issue or PR first.
If consensus cannot be reached, a maintainer escalates to the owner, whose
decision is final. All parties are expected to follow the
[Code of Conduct](CODE_OF_CONDUCT.md).

## Path from contributor to trusted maintainer

There is a merit-based path to increased trust:

1. **Contributor** — sustained, high-quality contributions within public-safe
   scope.
2. **Reviewer** — invited after a track record of good reviews and issue
   participation.
3. **Maintainer** — invited after demonstrated reliability, sound judgment on
   public safety, and consistent respect for the Code of Conduct. Maintainer
   invitations require owner approval.

Trust is earned through public contribution history — not through sponsorship,
fame, or follower count.

## Removal of access

Maintainer or reviewer access may be removed for: violating the Code of Conduct,
compromising the public/private boundary, prolonged inactivity, or acting
against the interests of the community. Access removal is decided by the owner,
normally after a private discussion, and takes effect immediately when public
safety requires it.

## Sponsor non-control clause

Sponsorship is **appreciation and support**, not purchase of authority.
Sponsorship at any tier does **not** grant:

- access to private repositories, the private control plane, private agents,
  private memory, or owner sessions;
- customer data or production credentials;
- authority over security, roadmap, governance, or merge decisions;
- guaranteed feature work or privileged influence over prioritization.

Maintainers must not give sponsors decision-making authority that
non-sponsoring contributors do not have. Sponsorship is never an investment and
carries no financial return, equity, tokens, or governance rights.
