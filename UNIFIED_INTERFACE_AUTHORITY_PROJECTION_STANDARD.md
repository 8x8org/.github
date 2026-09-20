# 8x8 Unified Interface & Authority Projection Standard

Canonical root: `fabric://8x8/core`

## Objective

The 8x8 interface is one coherent operating surface over the One-Fabric capability graph. It must not fragment the system into unrelated dashboards or duplicate authority.

Every capability is registered once and projected according to identity, tenant, authority, evidence state and device context.

## Projection classes

### OWNER_PRIVATE
Visible only to FlashTM8 OWNER_ROOT or explicitly delegated owner agents.
Examples: sovereign runtime controls, private topology, secret/Vault administration, private memory/messages, raw receipts, protected deployments, owner device control, economic/signing gates.

### TENANT_PRIVATE
Per-user isolated workspace.
Examples: tenant agents, projects/files, memory, connectors, Studio jobs, devices explicitly enrolled by that tenant, analytics, subscriptions, safe automation and user-authorized actions.

### PUBLIC_SAFE
Logged-out/public-safe product and evidence.
Examples: product discovery, documentation, public World, demos, public agents where intended, public benchmarks/receipts, community surfaces, verified status, tutorials and non-sensitive ecosystem information.

### FUTURE_GATED
Discoverable as roadmap/research/status but not executable until its promotion gates pass.
Examples: unreleased value-bearing functions, experimental bridges, unreleased hardware/robotics controls, unfinished models, research prototypes.

## Three gates

- **Gate 1 — Discover / Public:** identity-safe discovery, public evidence, onboarding and ecosystem entry.
- **Gate 2 — Identity / Connect / Compose:** authentication, 8x8 ID, tenant creation, connector/device enrollment, permission composition and capability selection.
- **Gate 3 — Operate / Build / Control:** the dynamic sovereign/tenant workspace. It renders the capabilities actually granted to that identity.

Gate 3 is not a static dashboard. It is a capability projection over the registry.

## Capability object

Each UI capability should resolve to machine-readable metadata:
- capability_id / version;
- source repo/service;
- lifecycle state;
- authority class;
- tenant scope;
- required grant/lease;
- secret boundary;
- input/output schemas;
- health/productivity/verification state;
- dependencies;
- tests and receipts;
- rollback/revocation path;
- UI renderer;
- API/MCP/A2A endpoints where applicable.

## Required inside-interface control families

The interface should converge, subject to authority, all appropriate One-Fabric families including:
- FlashTM8 Agent, specialist agents, councils and model/provider routing;
- projects, files, code, terminal/workspaces and deployments;
- Shared Brain, memory, messages, research, evidence and receipts;
- Studio: text/image/audio/video/3D/cinema/publishing;
- social/community/publishing/CRM/revenue operations;
- World / Spatial / Jarvis / BareHand / device embodiment;
- S22/iPhone/future-device enrollment and sensor permissions;
- automation/tasks/work graph/mission queue;
- observability, health, benchmarks, security and incident state;
- native 8x8 Network/blockchain/explorer/wallet-facing safe surfaces;
- external +N network adapters;
- market/trading intelligence and separately gated execution controls;
- subscriptions, products, entitlements and ordinary payments;
- competitions/hackathons/projects;
- accessibility/humanitarian/robotics/drones/satellites/Earth/energy work;
- settings, connectors/plugins, permissions, privacy, audit and recovery.

## Security law

UI visibility never equals backend authority.

`VISIBLE != AUTHENTICATED != GRANTED != LEASED != AUTHORIZED_TO_EFFECT != VERIFIED`

Raw secrets remain in Vault/broker boundaries and are represented by opaque handles/status, not plaintext.

## Completion standard

A feature is not considered integrated merely because its card/button appears. Integration requires a reachable backend, correct permission projection, working action path, observable state, acceptance test, rollback/revocation and receipt.
