# 8x8 Public Repository Standard V1

Every public 8x8 repository should help a visitor understand the product, current evidence and safe contribution path within five minutes.

## Required public surfaces

1. Clear one-sentence purpose.
2. Current maturity and deployment state.
3. Public/private boundary.
4. Architecture diagram or structured explanation.
5. Evidence-backed implementation status.
6. Local run instructions.
7. Tests and CI status.
8. Security policy and private reporting route.
9. Contribution guide and issue labels.
10. License, upstream attribution and modification notices.
11. Release manifests, SBOM and provenance when artifacts ship.
12. Screenshots or demos that are labeled fixture, preview or live.

## Status vocabulary

Use only:

- `CLAIMED`
- `DESIGNED`
- `IMPLEMENTED`
- `TESTED`
- `RECEIPT_VERIFIED`
- `RUNNING`
- `DEPLOYED`
- `PUBLICLY_RELEASED`
- `ADOPTED`
- `STALE`
- `BLOCKED`
- `UNKNOWN`

Never use “complete,” “live,” “autonomous,” “secure,” or “production-ready” without current evidence and declared scope.

## Progressive releases

A bounded release unit can ship independently when:

- its declared scope is complete;
- its score is 100/100;
- tests, security, privacy, accessibility and rollback gates pass;
- dependencies are satisfied;
- exact target is resolved;
- artifact hashes and provenance exist;
- the release does not imply completion of unrelated areas.

## Visual quality

Public repositories should include:

- readable mobile-first documentation;
- concise status tables;
- screenshots or diagrams with alt text;
- consistent color semantics;
- accessible contrast and non-color status labels;
- links among User Edition, Protocol and organization governance;
- no fake telemetry or decorative financial claims.

## Developer compatibility

An `8x8-compatible` project must declare:

- stable ID and version;
- capabilities;
- deny-by-default permissions;
- resource limits;
- data classes;
- source and upstream provenance;
- license;
- SBOM and signature for releases;
- conformance tests;
- rollback.

The 8x8 label is a compatibility statement, not a claim of ownership over upstream work.

## Forbidden public material

- credentials and tokens;
- wallet keys, seeds or signing authority;
- private prompts, memory or messages;
- exact private topology;
- personal identifiers or precise location without explicit consent;
- proprietary upstream code without permission;
- unreviewed executors or remote-shell paths;
- fabricated user, revenue, balance, agent or model counts.
