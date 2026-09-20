# One-Fabric 24-Repository Upgrade Program — 2026-09-20

Canonical root: `fabric://8x8/core`

This document defines the coordinated upgrade contract for the 24 repositories currently visible through the installed GitHub estate. It does **not** erase historical donors or make unverified capability claims.

## Invariants

- One Fabric, one provenance graph, no silent loss of historical work.
- `REGISTERED != REACHABLE != HEALTHY != AUTHENTICATED != GRANTED != LEASED != STARTED != PRODUCTIVE != VERIFIED`.
- Public repositories remain public-safe. Owner secrets, private messages, private keys, wallet seeds, raw credentials and protected topology never belong in public Git.
- Old work is classified and linked, not silently discarded: `PAST_PRESERVED`, `DORMANT`, `SUPERSEDED`, `FAILED_WITH_LESSON`, `UNFINISHED`, `FUTURE_GATED`.
- Claims such as 100%, AGI, Top-1, revenue, deployment, publication or live financial execution require reproducible evidence.

## Required repository contract

Every repository should converge toward:
1. clear role and canonical authority boundary;
2. README with current evidence state and predecessor/successor links;
3. SECURITY / privacy boundary appropriate to visibility;
4. CONTRIBUTING or maintainer workflow;
5. architecture / dependency map;
6. test and verification instructions;
7. provenance / receipt policy;
8. release / changelog policy;
9. machine-readable repo metadata where useful;
10. agent instructions describing permitted autonomous work and authority limits.

## Current 24-repository estate

1. horbolsi/8x8
2. horbolsi/8x8-mail
3. horbolsi/8x8-memory
4. horbolsi/8x8-tools
5. horbolsi/8x8-logs
6. 8x8org/8x8-protocol
7. horbolsi/8x8-databases
8. horbolsi/8x8-messages
9. horbolsi/8x8-os-backup
10. horbolsi/8x8-blockchain
11. horbolsi/8x8-os-hub
12. horbolsi/8x8-os-private
13. 8x8org/8x8-user-edition
14. 8x8org/8x8-venture-operator
15. horbolsi/8x8-OS-unified
16. horbolsi/8x8-device-fabric
17. horbolsi/8x8-agent-fabric
18. horbolsi/8x8-OS-Ecosystem
19. horbolsi/8x8-os-a-z
20. horbolsi/8x8-os-june2026
21. 8x8org/.github
22. horbolsi/census-and-consensus
23. horbolsi/AGI-100-100-100
24. horbolsi/flash-hermes-sync-safe

## Upgrade scoring

Each repo is scored on: role clarity, documentation completeness, tests, CI, security, provenance, dependency clarity, freshness, release reproducibility, public/private boundary, agent-readiness and rollback readiness.

A candidate upgrade is promoted only when it improves measured quality without weakening authority, privacy, security or historical provenance.

## Known contradiction requiring resolution

The current `horbolsi/8x8-blockchain` README describes the dedicated 8x8 Network as the native home and Bitcoin as an external adapter. Other preserved One-Fabric policy has described canonical 8x8 as Bitcoin-only. This contradiction must be resolved from the latest signed/owner-authoritative evidence before either statement is propagated to the rest of the estate.

## Continuous loop

`DISCOVER -> CENSUS -> RECONCILE -> CLASSIFY -> PLAN -> IMPLEMENT -> TEST -> VERIFY -> RECEIPT -> SCORE -> PROMOTE/ROLLBACK -> RESEARCH -> REPEAT`
