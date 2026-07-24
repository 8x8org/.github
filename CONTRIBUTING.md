# Contributing to 8x8 OS

Thank you for your interest in contributing. 8x8 OS is an emerging project built
on **bounded-autonomy, human-controlled AI** principles, public protocols, and
verifiable receipts. Contributions of code, tests, documentation, accessibility,
and security review are all welcome.

Please also read our [Code of Conduct](CODE_OF_CONDUCT.md).

## Public-safe scope

You may only contribute to work that is **public-safe**. Contributions must never
add, reference, or depend on:

- owner credentials, API keys, tokens, or authorization headers;
- wallet private keys, seed phrases, or signing authority;
- private repositories, private messages, private memory, or private agents;
- the private 8x8 control plane or any private owner-system topology;
- private endpoints, internal filesystem paths, or raw logs;
- remote-shell, arbitrary-execution, live-trading, or asset-movement paths.

The public repositories are **isolated public clients** of public services. They
are not a copy of the owner system.

## Before you start

1. **Search first.** Check existing issues and pull requests.
2. **Issue-first rule.** For anything **substantial** (new features, behavior
   changes, refactors, new dependencies), open an issue and get maintainer
   agreement on the approach *before* writing code. Small, obvious fixes
   (typos, broken links, tiny bug fixes) can go straight to a PR.
3. Look for issues labeled `good first issue` and `help wanted` to get started.

## Contribution workflow

1. **Fork** the repository and create a branch from `main`:
   `git checkout -b my-change`
2. Make focused changes with clear commit messages.
3. **Test** locally (see below).
4. Push to your fork and open a **pull request** against `main` using the PR
   template.
5. Respond to review feedback. A maintainer will merge once the acceptance
   criteria are met.

## Testing requirements

- All changes must keep the project's validation/CI green.
- For the public client, run the local validation described in each repository's
  README before opening a PR.
- New behavior should include or update tests where a test harness exists.
- Do not weaken or delete existing public-boundary checks to make a change pass.

## Secret-handling rules

- **Never** commit secrets, `.env` files, tokens, private keys, or real
  credential values — not even in tests, fixtures, or examples.
- Use clearly fake, public-safe placeholder data.
- If you believe a secret has been committed anywhere, treat it as a security
  report (see [SECURITY.md](SECURITY.md)) — do not open a public issue.

## AI-generated contribution disclosure

AI assistance is allowed and does not disqualify a contribution. If a
contribution was generated or substantially assisted by an AI tool, **disclose
it** in the PR (the template has a checkbox). You remain responsible for the
correctness, licensing, and safety of anything you submit.

## Authorship & sign-off

- Only submit work you have the right to contribute under the repository's
  license.
- If a repository has adopted the **Developer Certificate of Origin**, add a
  `Signed-off-by: Your Name <you@example.com>` line to each commit
  (`git commit -s`). Where sign-off is not yet required, honest authorship is
  still expected.

## Review & acceptance criteria

A maintainer review is required before merge. Contributions are evaluated on:

- correctness and scope (does it do what the issue agreed?);
- public-safety (no private-system leakage);
- tests and passing validation;
- code clarity and consistency with surrounding code;
- documentation for any behavior change.

## No guarantee of merge

Opening a PR does not guarantee it will be merged. Maintainers may decline
contributions that fall outside public-safe scope, conflict with the roadmap, or
cannot reach the acceptance bar — and will explain why when they do.

## Respectful conduct

Be kind, assume good faith, and keep discussion technical and constructive. See
the [Code of Conduct](CODE_OF_CONDUCT.md).
