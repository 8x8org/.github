# 8x8 Public Repository Standard V2

A public 8x8 repository exists to let people **use, understand or integrate with an intentionally public 8x8 product, protocol or community surface**. Public visibility does not imply that the private One-Fabric implementation, OWNER_ROOT controls, research estate or proprietary source is open.

## Default publication rule

**Consumer surface by default; source publication only by explicit owner-approved open-source decision.**

A public product repository should normally expose only what a user, customer, integrator, contributor or verifier needs to consume the public product safely:

1. clear product/service purpose;
2. current maturity and evidence state;
3. user-facing documentation and supported workflows;
4. approved public API/SDK contracts and examples;
5. intentionally public schemas, verifiers or interoperability standards;
6. public/private authority boundary;
7. security/privacy reporting route;
8. release/status/provenance information appropriate for public consumption;
9. screenshots/demos labeled as fixture, preview or live;
10. license/terms for the material that is intentionally public.

Architecture or source sufficient to reproduce the private system is **not** a required public surface.

## Open-source exception

Source code, local-run instructions, implementation architecture, tests and build details belong in a public repository only when that specific component has an explicit owner-approved open-source/public-source scope. A public-facing product may instead be delivered as a hosted service, client application, binary, package, public API or documentation-only integration surface while its implementation remains private.

Publishing a public protocol or schema does not automatically publish the private implementation that powers it.

## Status vocabulary

Use evidence-bound states such as:

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

Never use “complete,” “live,” “autonomous,” “secure,” “production-ready,” “100/100” or “Top-1” without a declared denominator and current evidence.

## Product / implementation boundary

Allowed public material may include:

- product UI and approved public assets;
- user/account/profile documentation;
- public pricing, release, support and competition information;
- public API schemas and consumer examples;
- receipt/verifier formats deliberately designed for public verification;
- public interoperability contracts;
- public research summaries that do not disclose proprietary implementation.

OWNER_PRIVATE material includes by default:

- One-Fabric orchestration/control-plane implementation;
- private capability lattice, dormant/estate census and donor-selection logic;
- private agent SOUL/body/authority and mission execution internals;
- canonical memory/context graphs and continuity/anti-loop internals;
- secret/vault/broker implementation and credential topology;
- private device, deployment, incident, rollback and runtime topology;
- proprietary parity/frontier/benchmark algorithms and private research deltas;
- unpublished economic, treasury, custody, signing or settlement controls;
- source sufficient to clone the private 8x8 system.

## Public integration pattern

Prefer:

```text
public user / integrator
        ↓
public product, client, API or documented contract
        ↓ authenticated / policy boundary
private One-Fabric implementation
```

Public users receive the capability of the product, not OWNER_ROOT authority or the internal system that produces it.

## Security and IP gate

Before any public release, verify:

- no credentials, tokens, keys, seeds or private account data;
- no private prompts, memories, messages or personal data;
- no private repository/dormant/source inventory;
- no exact private runtime/device/deployment topology;
- no owner/admin/control-plane route graph or recovery procedure;
- no proprietary internal implementation unless that component is explicitly approved for public source;
- no fabricated telemetry or economic claims;
- historical disclosure is treated separately from current-HEAD cleanup.

If a real secret was ever public, rotate/revoke it. Removing it from the current branch does not revoke prior exposure.

## Public evidence

Public evidence should prove only the public claim it accompanies. It may expose release identifiers, artifact hashes and privacy-safe receipts where intentional, but must not leak private runtime topology or owner-control details merely to make a claim look more technical.
