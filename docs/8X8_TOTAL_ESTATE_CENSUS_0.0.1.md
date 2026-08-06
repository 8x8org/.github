# 8x8 Total Estate Census 0.0.1

**Product version:** `0.0.1`  
**Maturity:** Beta  
**Owner:** FlashTM8 ⚡️ / Meher Trabelsi  
**Reality model:** `PRIVATE_PAST`, `PUBLIC_PRESENT`, `FUTURE_LAB`; `PROTECTED_BETA` is a promotion state.

## Purpose

This is the canonical scope definition for the complete 8x8 estate. GitHub repositories are only one projection. A complete census must include local devices, Termux, Ubuntu PRoot, services, databases, agents, bodies, models, connectors, automations, deployments, visual assets, missions, evidence, backups, security state, public products, Studio, blockchain/testnet research, venture operations and external research candidates.

No component is considered fully inventoried merely because it appears in memory, a README, a screenshot, an issue or a repository.

## Twelve constitutional domains

1. **Sovereignty** — owner identity, devices, keys, approvals, emergency stop and recovery authority.
2. **Runtime** — nodes, filesystems, services, processes, storage, networking and execution environments.
3. **Coordination** — Hermes, fallback coordinators, councils, dispatch, queues, leases and task identity.
4. **Intelligence** — models, providers, routing, research, reasoning, evaluation and synthetic intelligence.
5. **Memory** — context, knowledge, messages, continuity, contradictions, supersession and retention.
6. **Evidence** — events, hashes, tests, receipts, provenance, freshness, cleanup and rollback.
7. **Security** — workload identity, permissions, secrets, policies, incident response and supply chain.
8. **Reality** — Private Past, Public Present, Future Lab, protected-beta promotion and demotion.
9. **Experience** — terminal, mobile, web, voice, spatial interfaces, worlds and agent bodies.
10. **Studio** — images, audio, video, content pipelines, publishing, asset registry and provenance.
11. **Economy** — venture operations, verified contribution value, testnet systems, markets and crypto research.
12. **Ecosystem** — repositories, connectors, community, Academy, plugins and external capability intake.

## Required census records

Every record must contain:

```yaml
product_version: 0.0.1
object_id: globally-stable-id
object_type: HUMAN|AGENT|BODY|NODE|SERVICE|REPOSITORY|DATABASE|MODEL|PROVIDER|CONNECTOR|CAPABILITY|MISSION|ARTIFACT|ASSET|AUTOMATION|DEPLOYMENT|RECEIPT|POLICY|PROJECT
canonical_owner: owner-id
constitutional_domain: one-of-12-domains
reality: PRIVATE_PAST|PUBLIC_PRESENT|FUTURE_LAB
promotion_state: PROTECTED_BETA|null
evidence_state: UNKNOWN|REPORTED|OBSERVED|IMPLEMENTED|TESTED|VERIFIED|RUNNING|DEPLOYED|PUBLICLY_RELEASED|REVOKED|SUPERSEDED
source_location: redacted-or-public-safe-reference
observed_at: ISO-8601|null
fresh_until: ISO-8601|null
digest: sha256-or-null
sensitivity: PUBLIC|INTERNAL|PRIVATE|SECRET
canonical: true|false
supersedes: []
depends_on: []
rollback_reference: null
open_blockers: []
```

## Census lanes

### A. GitHub estate

- all owned repositories, including repositories not exposed to the current GitHub App installation;
- visibility, default branch, exact head, canonical role, reality, README, license, workflows, releases, issues, PRs, topics and social preview;
- duplicates, mirrors, backups, migration lanes, archived and quarantined repositories;
- external candidate repositories retained as upstream research inputs.

### B. Device and filesystem estate

- Samsung Android shared storage;
- Termux home and prefix;
- Ubuntu PRoot rootfs and `/root`;
- iPhone/iSH and any additional nodes;
- Acode, Vectras, Codespaces, Replit and external-storage copies;
- mounted or exported archives and recovery media.

### C. Runtime and services

- runit and other service managers;
- control fabric, mission executor, continuity supervisor, model router and gateways;
- web services, APIs, bots, workers, tunnels and collectors;
- process identity, executable digest, port, owner, health, restart policy and latest receipt.

### D. Data and memory

- every database and schema;
- memory files, SOUL files, thread memories and knowledge stores;
- messages, event buses, content stores and evidence stores;
- missing, stale, duplicated, orphaned and superseded stores;
- retention, deletion, backup and recovery rules.

### E. Agents, bodies and councils

- canonical agent and body IDs;
- persona, role, specialization, avatar and voice provenance;
- model/provider routes, tools, connectors and memory scope;
- authority ceiling, supported nodes, health, active mission and latest receipt;
- councils, memberships, quorum, termination and fallback rules.

### F. Models and providers

- local model files and exact digests;
- hosted providers, routes, budgets and fallback policy;
- modality, context limits, data handling and permitted realities;
- evaluation evidence, license and model-card references.

### G. Connectors and communications

- GitHub, email, calendar, Drive, Telegram, Discord and every other linked platform;
- OAuth scopes, accounts, workspaces, channels, labels and sync freshness;
- draft/send, read/write and owner-approval boundaries;
- revocation, cleanup and incident status.

### H. Automations and missions

- scheduled tasks, cron jobs, runit loops and cloud workflows;
- mission IDs, parent programs, coordinator, lease and current state;
- acceptance evidence, receipts, cleanup, rollback and supersession;
- duplicate or overlapping automations.

### I. Public products and deployments

- User Edition, World, Art Board, Missions, Plugins, Marketplace, 8x8Scan, Studio, Protocol, Academy and any other public surface;
- exact route, deployment provider, release unit, reality, evidence state and rollback;
- logged-out validation and mobile/desktop evidence;
- public claims generated only from approved Present evidence.

### J. Studio and visual assets

- all registered images, including the 14-image registry target and SHA-256 deduplication relationships;
- audio, video, avatars, voices, scenes and generated media;
- source, license, generation metadata, approval, reality and publication state;
- ComfyUI, media tools, model dependencies and storage cost.

### K. Security and recovery

- keys and credentials without exposing secret values;
- suspected or confirmed compromise state;
- secret rotation evidence;
- SBOM, provenance and workflow-security findings;
- backup coverage, continuity capsules and restoration tests;
- emergency-stop and owner-recovery verification.

### L. Economy, blockchain and venture

- blockchain/testnet code, synthetic trading and risk engines;
- token and NFT research classified as historical, experimental or public;
- wallets and financial authority kept outside public or autonomous scope unless separately approved;
- venture, commercialization, contribution-value and community programs.

## Completion rule

The census is complete only when every accessible object has a stable ID, constitutional domain, reality, evidence state, owner, source, freshness and canonical/superseded relationship; inaccessible or unknown areas are recorded explicitly; local evidence and connected-platform evidence are reconciled; and no public claim exceeds the approved `PUBLIC_PRESENT` evidence.

The product remains `0.0.1 Beta` after census completion. Census completion proves inventory coverage, not whole-system stability or 100/100 completion.
