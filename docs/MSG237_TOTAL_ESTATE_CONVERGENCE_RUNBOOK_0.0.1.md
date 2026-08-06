# MSG237 — Total Estate Convergence Runbook 0.0.1

Product: **8x8 OS 0.0.1 Beta**

## Objective

Converge all current evidence into one canonical estate view while preserving active Claude, Hermes, and scheduler work. This runbook is read-only until exact local leases and targets are known.

## Phase 0 — Freeze assumptions, not systems

- Do not stop Claude or Hermes.
- Do not restart services.
- Do not mutate databases.
- Do not force-push or merge protected branches.
- Record every unavailable source as `UNKNOWN`, not healthy or failed.

## Phase 1 — Ingest current authoritative inputs

1. Claude completion or handoff packet.
2. Hermes current mission, lease, and heartbeat records.
3. Five enabled scheduler lane definitions and current run receipts.
4. GitHub repository heads, open PRs, workflows, releases, and security findings.
5. Samsung Termux and Ubuntu read-only census.
6. Services, processes, ports, packages, storage, and inode observations.
7. Database paths, owners, schema digests, backup state, and runtime references.
8. Agents, bodies, models, providers, connectors, deployments, automations, and assets.
9. Historical receipts and supersession links.

Every source must include observation time, freshness, evidence state, confidence, and digest where available.

## Phase 2 — Assign canonical identities

Every object receives:

- stable `object_id`;
- one canonical owner;
- one constitutional domain;
- one reality;
- optional `PROTECTED_BETA` promotion state;
- independent capability maturity;
- evidence state and confidence;
- dependencies and reverse dependencies;
- active leases;
- tests and receipts;
- rollback reference;
- contradiction references.

Duplicate objects are linked through `supersedes`, `mirrors`, or `duplicates`; they are never silently merged.

## Phase 3 — Compute drift

Compare the new snapshot against the latest accepted snapshot:

- `NEW`: absent before and observed now;
- `CHANGED`: same canonical object, material digest or state change;
- `REMOVED`: previously observed, now absent with sufficient source coverage;
- `STALE`: freshness window exceeded;
- `UNKNOWN`: source unavailable or evidence insufficient;
- `CONFLICT`: authoritative sources disagree or active leases overlap;
- `UNCHANGED`: digest and material state match.

A missing source cannot prove `REMOVED`.

## Phase 4 — Build system graphs

Generate:

- authority map;
- dependency graph;
- contradiction ledger;
- cryptographic proof graph;
- compatibility map;
- release ledger;
- risk register;
- modernization backlog.

Graph edges must identify their source and confidence.

## Phase 5 — Resolve highest-risk contradictions

Priority order:

1. credentials or secret exposure;
2. overlapping live write leases;
3. service ownership and restart loops;
4. database deletion or migration uncertainty;
5. public/private boundary drift;
6. deployment and exact-head mismatch;
7. stale agent, model, connector, or automation claims;
8. repository role and version drift.

Use a temporary safe assumption and assigned resolver for every unresolved contradiction.

## Phase 6 — Repository conformance

For every owned repository, add or verify a machine-readable repository manifest containing:

- `product_version: 0.0.1`;
- repository role;
- canonical owner;
- reality and maturity;
- security boundary;
- supported surfaces;
- exact test commands;
- release and rollback policy;
- public projection eligibility.

Historical implementation generation labels remain intact and are not confused with product version.

## Phase 7 — Public projection

Only `PUBLIC_PRESENT` objects with current, sufficient evidence may be projected publicly.

Reject projection when:

- evidence is stale or unknown;
- a contradiction is unresolved;
- protected identifiers or private paths appear;
- a feature is only designed, simulated, or in Future Lab;
- exact-head tests, privacy, security, accessibility, provenance, compatibility, route verification, or rollback are missing.

## Phase 8 — Activation and rollback

Any local activation requires:

1. exact owner authorization;
2. active nonconflicting lease;
3. target inventory;
4. backup or rollback target;
5. isolated canary;
6. deterministic tests where possible;
7. service and route verification;
8. cleanup proof;
9. digest-bound activation receipt.

## Required outputs

- `GLOBAL_CONTEXT_SNAPSHOT_0.0.1.json`
- `TOTAL_ESTATE_MANIFEST_0.0.1.json`
- `ESTATE_DRIFT_REPORT_0.0.1.json`
- `AUTHORITY_MAP_0.0.1.json`
- `DEPENDENCY_GRAPH_0.0.1.json`
- `CONTRADICTION_LEDGER_0.0.1.json`
- `PROOF_GRAPH_0.0.1.json`
- `COMPATIBILITY_MAP_0.0.1.json`
- `RELEASE_LEDGER_0.0.1.json`
- `RISK_REGISTER_0.0.1.json`
- `MSG237_FINAL_RECEIPT_0.0.1.json`

## Completion rule

MSG237 may be marked complete only when all declared sources are either reconciled or explicitly marked unavailable, all conflicts have safe handling, all outputs validate, hashes are recorded, cleanup is complete, and rollback references exist.

The complete 8x8 estate remains **0.0.1 Beta**. No bounded release-unit result permits whole-system `100/100`, stable, or production-ready claims.
