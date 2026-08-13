# ©️8x8 by FlashTM8 ⚡️🌎🤖 — Community, Social, Referral & Project Graph V1

Canonical root: `fabric://8x8/core`  
Public tracker: https://github.com/8x8org/.github/issues/28  
State: `ARCHITECTURE_ACTIVE / RUNTIME_FUTURE_GATED`

## Objective

Extend the unified 8x8 product into an evidence-backed community where users can connect identities, selectively share projects, discover builders, collaborate, complete agent-managed missions, earn non-financial reputation/points and participate in transparent leaderboards without exposing private repositories, credentials or sovereign owner controls.

## Canonical flow

`8x8 Account → 8x8 ID → connected identity → consented public profile → selected project/repository share → project graph/global feed/chat → follows/channels/missions → verified receipts → points/reputation → leaderboard → opportunities`

This is a One-Fabric subsystem, not a separate social network authority root.

## Identity and authority

Every community action is performed for a subject resolved through `8x8 Account + 8x8 ID`.

Connection authority follows the connector/Vault contract:

`8x8 ID → provider connection → auth/scope receipts → opaque vault:// handle → grant → short lease → provider action → receipt`

The community layer consumes approved connector capabilities; it does not store raw OAuth tokens, API keys, passwords, cookies, wallet keys or recovery secrets.

## GitHub project sharing

Connecting GitHub does not imply blanket repository disclosure.

A user must be able to:

- link/unlink their GitHub identity;
- see which GitHub scopes are active;
- select individual public repositories/projects for community exposure;
- explicitly opt a selected project into the global feed/chat/project graph;
- choose a project-card description, tags and collaboration interests;
- request agent help preparing a README, project card or public-safe summary;
- remove a project from current discovery while preserving privacy-safe audit/provenance receipts;
- keep private repositories, private issues, private metadata and organization data unshared by default.

A private repository may only be represented publicly by user-supplied public metadata or an explicitly authorized sanitization/export flow. Its private source must never be inferred as public from the GitHub connection itself.

## Project graph object

A public project node should carry:

- `project_id`
- `owner_8x8_id` or privacy-safe public alias
- `provider`
- `provider_project_ref`
- `visibility`
- `title`
- `summary`
- `tags`
- `capabilities`
- `collaboration_interests`
- `evidence_refs`
- `latest_activity_receipt`
- `created_at`
- `updated_at`
- `sharing_consent_version`
- `moderation_state`

The public graph stores references/metadata, not raw provider secrets.

## Global feed and chat

The feed/chat should support evidence-linked cards rather than anonymous unsupported claims.

Initial content types:

- project showcases;
- verified releases;
- benchmark results;
- requests for feedback/help;
- contribution opportunities;
- Academy achievements;
- competition participation/results;
- Studio/media posts;
- official 8x8 announcements;
- community mission cards.

Feed ranking must not silently privilege users based on owner/private authority. Ranking should be explainable and include anti-spam/diversity/freshness controls.

## Official social/channel graph

Official ©️8x8 by FlashTM8 ⚡️🌎🤖 social accounts/channels should be registered as connector identities only after each account is independently verified.

For each channel record:

- provider/platform;
- canonical public handle/reference;
- ownership verification receipt;
- connection/auth/scope state;
- eligible agent families;
- allowed actions;
- rate policy;
- last successful receipt;
- pause/revoke state.

Agents may prepare campaigns/posts, but external publishing authority is lease-based. No global `social.post` permission should exist without subject/provider/action binding.

## Community missions and tasks

Agents may create bounded missions such as:

- reproduce a benchmark;
- write or improve documentation;
- submit a verified bug report;
- contribute tests/fixtures;
- translate public-safe documentation;
- complete an Academy exercise;
- help another user resolve a public project issue;
- submit a tutorial or project showcase;
- join a community event or competition;
- follow an official channel when platform rules permit;
- provide a verified referral.

Every mission declares:

- mission ID;
- issuer/agent identity;
- eligibility;
- required evidence;
- points/reputation award;
- anti-abuse rules;
- start/end time if applicable;
- review/appeal path;
- completion receipt.

No points are awarded merely because a user or model states that a task was completed.

## Points and reputation ledger

Points are an auditable community accounting mechanism, not money.

Suggested dimensions remain separate:

- `CONTRIBUTION`
- `HELPFULNESS`
- `BENCHMARK_REPRODUCTION`
- `MISSION_COMPLETION`
- `ACADEMY`
- `COMPETITION`
- `VERIFIED_REFERRAL`
- `COMMUNITY_STEWARDSHIP`

A total display score may exist for UX, but the underlying dimensions and receipts remain inspectable.

Do not represent points as token value, investment return, wages, equity, ownership or financial entitlement unless a separately reviewed economic program explicitly creates that legal/technical relationship.

## Referral program

Referral flow:

`referrer 8x8 ID → signed/opaque referral ID → new user consented signup → anti-Sybil checks → qualifying activity → referral receipt → points/reputation`

Required protections:

- no self-referral farming;
- no fake-account rewards;
- rate/velocity controls;
- duplicate-device/account heuristics only where privacy policy permits;
- no sale of personal data;
- clear eligibility and reversal policy;
- no financial reward until legal/economic activation is separately approved.

## Leaderboards

Leaderboards should expose category, denominator/window and evidence freshness.

Examples:

- top contributors this week/month/all time;
- benchmark reproducers;
- project helpers;
- Academy learners;
- verified referrals;
- competition achievements;
- mission streaks where healthy and non-compulsive.

Technical benchmark rank remains governed by the Benchmark & Rank Program and must not be mixed with social popularity.

## Moderation, trust and appeals

Minimum controls before public runtime promotion:

- report/block/mute;
- rate limiting;
- spam and bot-abuse detection;
- transparent moderation state;
- appeal/correction channel;
- provenance for agent-generated public content;
- protection against private-data leakage;
- user deletion/export semantics consistent with retention/evidence law;
- child/minor and jurisdictional safeguards if relevant to future user population.

## Privacy states

Suggested project/profile visibility:

- `PRIVATE`
- `CONNECTION_ONLY`
- `COMMUNITY_VISIBLE`
- `PUBLIC_WEB`
- `PAUSED`
- `REMOVED_FROM_DISCOVERY`

Historical evidence retention must be privacy-safe. Removing a project from discovery does not justify retaining its full content indefinitely.

## Agent roles

- communications agents: community replies, triage and channel preparation;
- research agents: discovery, benchmark/competition opportunities;
- builder agents: README/project-card/code contribution preparation;
- content/social agents: approved public content workflows;
- security agents: scope/Vault/moderation/anomaly checks;
- operations agents: mission/project scheduling;
- Academy agents: learning paths and evidence-backed achievement;
- owner/system agents: global policy and recovery controls.

Authority comes from grants/leases, never from an agent family name.

## Runtime promotion gates

Do not call the Community Network live until at least:

1. account + 8x8 ID subject isolation passes;
2. GitHub connection uses brokered credentials and verified scopes;
3. private repositories are deny-by-default;
4. explicit share/revoke flow passes;
5. global feed/chat authorization passes;
6. points ledger is deterministic and receipt-backed;
7. referral anti-abuse tests pass;
8. leaderboard derivation is reproducible;
9. moderation/report/revoke paths pass;
10. mobile/public privacy and accessibility tests pass.

Current runtime state remains `FUTURE_GATED`.

## One-interface projection

The target route family belongs inside the same `ONE_INTERFACE_MULTI_AUTHORITY_PROJECTION` shell. Ordinary users see their own profile/connections/projects/missions/points. Owner projection additionally sees global policy, system connectors, moderation/audit controls and recovery functions without exposing those controls to ordinary users.

**©️8x8 by FlashTM8 ⚡️🌎🤖 — community through consent, capability through leases, reputation through receipts.**
