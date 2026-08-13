# ©️8x8 by FlashTM8 ⚡️🌎🤖 — Authority, Tenancy & Agent Isolation V1

Canonical root: `fabric://8x8/core`  
Architecture class: `ONE_INTERFACE_MULTI_AUTHORITY_PROJECTION`  
State: `ARCHITECTURE_ACTIVE / RUNTIME_PROMOTION_EVIDENCE_GATED`

## Purpose

Define one coherent authority model for the owner, ordinary 8x8 users, user-scoped agents, delegated community roles and exceptional human developer/operator access without creating a second control plane or allowing tenant data/authority to bleed into the sovereign owner estate.

## 1. Constitutional authority

There is one sovereign owner authority for the private One-Fabric estate. The owner retains final control over canonical architecture, private repositories, private runtime, global policy, privileged connectors, release promotion, security recovery and any financial/signing authority that is separately activated.

This does **not** mean every routine action is performed manually. It means all delegated authority is derived, bounded, revocable and auditable; no agent, employee, community role, developer, provider or user becomes a second sovereign root.

## 2. Realm model

Use explicit authority realms:

- `realm://8x8/owner` — sovereign owner realm and owner-scoped fleet.
- `realm://8x8/user/{8x8_id}` — isolated tenant realm for each ordinary 8x8 user.
- `realm://8x8/community` — shared public/community resources only.
- `realm://8x8/program/{program_id}` — bounded competition, moderation, production or contributor program.
- `realm://8x8/system` — platform services that enforce policy but do not own user/owner data.

A realm is an authorization boundary, not a separate One-Fabric root. Every realm resolves upward to `fabric://8x8/core`.

## 3. Owner fleet vs user fleet

The platform may run the same agent framework for many subjects, but authority is never shared implicitly.

### Owner-scoped agents

Owner agents may be granted access to private owner resources only through explicit owner-scoped grants/leases. Their identity records must bind:

`agent_id + owner_8x8_id + realm://8x8/owner + mission + capability set + connector set + authority ceiling + lease expiry + receipt chain`.

### User-scoped agents

A user's agents operate only inside that user's account/8x8-ID realm and explicitly shared community resources. A user agent must be denied access to:

- owner private repositories;
- owner private connectors and Vault handles;
- private system memory/messages;
- owner devices/shell/runtime;
- global policy mutation;
- other users' private realms;
- signing/treasury/admin authority not explicitly granted.

A shared model/provider or shared execution worker does not imply shared authorization state. Tenant context, secrets, handles and receipts remain subject-isolated.

## 4. Delegated human roles

The owner may appoint selected users or external humans to bounded roles such as:

- contributor;
- moderator;
- reviewer;
- program lead;
- content/Studio producer;
- competition operator;
- support/community operator;
- repository maintainer;
- developer;
- infrastructure operator;
- security reviewer.

A title or badge is display/reputation metadata by default. **A badge never grants authority by itself.** Authority requires a separate capability grant.

Every privileged human grant should specify:

`subject_8x8_id + role + realm + exact resources + allowed actions + denied actions + start + expiry + step-up requirements + approval rules + audit target + revocation path`.

## 5. Private-system developer access

Exceptional developer/operator access to private internal systems is allowed only through explicit owner delegation. Use least privilege and preferably short-lived, repository/service-specific access.

Recommended properties:

- deny by default;
- exact repository/service allowlist;
- branch/environment restrictions;
- no secret export;
- protected branch/review requirements;
- short TTL for elevated sessions;
- command/action logging where appropriate;
- break-glass path controlled by owner;
- automatic expiry;
- immediate revoke;
- independent review for high-impact changes.

A developer can be powerful in a bounded mission without becoming owner-equivalent.

## 6. Role hierarchy is not ownership hierarchy

Use two separate dimensions:

1. **Identity/reputation:** titles, badges, levels, community standing, contribution history.
2. **Authority:** explicit capabilities over exact resources for a bounded time.

Never infer authority from leaderboard position, contribution score, badge color, social influence, employment title or competition result.

## 7. Interface projection

One application shell can render different views safely:

`8x8 Account → 8x8 ID → realm → role/entitlement → capability policy → field/action projection`.

Owner projection may show global administration, private system controls, private connector/Vault metadata, fleet governance, dormant revival, deployments and evidence. Ordinary users receive only their own realm plus public/community capabilities. Delegated staff see the union of their user realm and explicit program/resource grants.

Backend authorization must decide every sensitive field/action. Hiding a control in the frontend is not authorization.

## 8. Connector/Vault isolation

Every connector belongs to a subject and realm. Use opaque handles:

`vault://{realm}/{subject}/{connection}`

Agents receive handles and capability leases, not raw secrets. Cross-realm credential resolution is denied unless an explicit owner-approved delegation exists and the broker verifies the full tuple.

## 9. Mission and agent lease law

Every privileged execution should bind:

`subject → realm → mission → agent → capability → resource → connector/handle → action → expiry → effect_id → receipt`.

Leases are non-transferable between agents/subjects/realms. Replays and stale leases fail closed.

## 10. Community sharing law

Users may explicitly share selected public repositories/projects, posts, profile fields or artifacts into community surfaces. Connecting GitHub or another provider never means all private content becomes visible. A share event has its own consent record and can be revoked prospectively while preserving minimal audit provenance.

## 11. Owner continuity tradeoff

Sole owner control maximizes constitutional clarity but creates availability/recovery risk. The architecture may support recovery helpers or owner-required quorum mechanisms, but no recovery party should gain unilateral sovereign authority unless the owner explicitly changes that constitutional policy. Offline owner recovery material and tested recovery procedures are preferred to hidden permanent co-owner privileges.

## 12. Evidence states

Do not label this model live from documentation alone. Track separately:

`DESIGNED → IMPLEMENTED → TESTED → TENANT_ISOLATION_VERIFIED → OWNER_REALM_VERIFIED → DELEGATION_CANARY_VERIFIED → REVOCATION_VERIFIED → DEPLOYED`.

Until end-to-end tests prove the boundaries, this document is an architecture contract.

## 13. Required negative tests

At minimum prove:

1. user A agent cannot read user B private resource;
2. ordinary user cannot read owner private resource;
3. public/community role cannot mutate private system;
4. badge/title alone grants no capability;
5. expired developer grant is denied;
6. revoked grant invalidates outstanding lease;
7. lease cannot be replayed by a different agent;
8. connector handle cannot resolve across realm/subject mismatch;
9. frontend-hidden action is still denied server-side;
10. owner can revoke delegated access and receive an evidence receipt.

## 14. Canonical rule

`ONE PRODUCT / MANY REALMS / EXPLICIT AUTHORITY / ONE SOVEREIGN ROOT`.

©️8x8 by FlashTM8 ⚡️🌎🤖
