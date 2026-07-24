# Security Policy

The 8x8 OS organization takes the security and public/private boundary of its
projects seriously.

## Reporting a vulnerability (private)

**Do not open a public issue for a security vulnerability.**

Use **GitHub private vulnerability reporting** for the affected repository:
open the repository's **Security → Report a vulnerability** page (Security
Advisories). This keeps the report private to maintainers.

A good report includes:

- the affected public repository, path, and revision;
- the vulnerability class (for example: XSS, header misconfiguration, boundary
  leak);
- reproduction steps using **public-safe, non-secret test data**;
- expected vs. observed behavior;
- suggested remediation, if known.

**Never include real credential values, wallet material, private-system logs, or
another person's private data.** Report the path, the pattern class, and the
remediation — not the secret itself.

## Prohibited public disclosure

Please practice **coordinated disclosure**. Do not publicly disclose an
unpatched vulnerability — in issues, pull requests, discussions, or elsewhere —
until maintainers have had a reasonable opportunity to investigate and ship a
fix and have agreed the report can be made public.

## Supported public repositories

| Repository | Supported |
|---|---|
| [`8x8-user-edition`](https://github.com/8x8org/8x8-user-edition) | Yes (public beta `0.1.x`) |
| [`8x8-protocol`](https://github.com/8x8org/8x8-protocol) | Yes |
| [`.github`](https://github.com/8x8org/.github) | Yes |

Private repositories are out of scope for public reporting.

## Acknowledgment windows (targets, not guarantees)

These are **best-effort targets** for an emerging project, not contractual
guarantees:

- initial acknowledgment: within ~5 business days;
- triage / severity assessment: within ~10 business days;
- status update cadence: as material progress occurs.

## No bug-bounty promise

There is currently **no paid bug-bounty program**. Reports are handled on a
best-effort basis, and no monetary reward is offered or implied. If a separately
funded bounty program is ever established, it will be documented here with its
own scope and terms.
