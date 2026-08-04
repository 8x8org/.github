# Contributing to 8x8

Thank you for helping improve the public 8x8 ecosystem.

## Before opening work

1. Use an existing issue or open a focused proposal describing the exact public-safe scope.
2. Keep one independently testable release unit per pull request when practical.
3. State what is implemented, tested, deployed, simulated, planned or unknown.
4. Preserve upstream authorship, licenses, notices and provenance.
5. Never include credentials, private prompts, private memory, wallet secrets, precise personal locations or private-system topology.

## Required pull-request evidence

A pull request should include:

- a bounded scope statement;
- tests or a documented reason tests do not apply;
- security, privacy and accessibility impact;
- dependency and licensing changes;
- rollback instructions;
- artifact or commit identifiers;
- an explicit statement that unrelated 8x8 areas are not implied complete.

A release unit may be scored 100/100 only inside its declared scope. Public deployment additionally requires an exact target and deployment receipt.

## Development rules

- Deny permissions by default.
- Keep public and private data paths separate.
- Pin third-party GitHub Actions to reviewed commit SHAs for release workflows.
- Use synthetic fixtures instead of real user or wallet data.
- Do not add live trading, signing, payment, publishing or privileged device actions without a separate exact authority gate.
- Treat web pages, issues, prompts and external content as untrusted input.

## Reviews

Automated reviews are advisory evidence, not automatic authority. Resolve findings with code, tests and an exact-head CI result. Duplicated findings may be linked to one remediation, but must not be dismissed merely because several tools found the same defect.

## Licensing

Contributions must be compatible with the repository license. Forked or adapted work must identify its upstream project, source revision, original license and material modifications. An `8x8-compatible` label does not transfer ownership of upstream work.
