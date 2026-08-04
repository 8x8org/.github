# 8x8 Browser Control Plane V1

## Decision

Build an 8x8-controlled browser **orchestration, safety and observability layer** on top of maintained browser engines. Do not fork Chromium or Firefox as the first release.

## Objectives

- Give agents deterministic access to approved public and private web surfaces.
- Support DOM, accessibility tree, network, screenshot and pixel assertions.
- Test every public release on mobile and desktop viewports.
- Separate public research, test accounts and owner-private sessions.
- Produce receipts for navigation, actions, screenshots, latency and policy decisions.
- Fail closed when the target, authority, profile, expected state or rollback is unresolved.

## Engine and tool layers

1. **Browser engines:** maintained Chromium, Firefox and WebKit builds through Playwright.
2. **Deterministic controller:** Playwright library and CLI.
3. **Agent tool protocol:** Playwright MCP with an explicit capability allowlist.
4. **Semantic action layer:** Stagehand evaluation for resilient natural-language tasks.
5. **Read extraction:** Firecrawl adapter for approved public sites.
6. **Alternative agent runner:** Browser-use evaluation, disabled by default.
7. **Compatibility lane:** Camoufox in an isolated sandbox only when legitimate browser compatibility requires it.
8. **8x8 shell:** tabs, worlds, evidence panel, action queue, screenshots, pixel IDs, health colors and owner gates.

## Browser profiles

| Profile | Data | Authority | Persistence |
|---|---|---|---|
| PUBLIC_RESEARCH | Public pages only | Read, screenshot, extract | Ephemeral |
| PUBLIC_RELEASE_TEST | Public 8x8 previews | Read and bounded UI interaction | Ephemeral |
| TEST_ACCOUNT | Synthetic or dedicated test accounts | Bounded writes to test targets | Expiring |
| OWNER_PRIVATE | Owner-approved services | Exact task capability | Encrypted and revocable |
| HIGH_RISK | Financial, government, health, legal or destructive surfaces | Observation only unless separately approved | No default persistence |

Personal browser profiles, cookies and social sessions are never inherited automatically.

## Pixel contract

Every browser action receipt should record:

- task and agent identity;
- browser engine and version;
- profile class;
- exact URL and redirect chain;
- viewport and device scale;
- DOM or accessibility selector;
- before and after screenshot digest;
- pixel-region digest when applicable;
- network request summary with sensitive fields redacted;
- action result and latency;
- policy and authority decision;
- rollback or cleanup result.

The target is measured low latency, not a fictional guarantee of zero milliseconds.

## Social and platform boundaries

Agents may monitor public pages and draft content. Posting, messaging, following, reacting, purchasing, submitting forms or changing accounts requires platform-specific policy, rate limits and owner or user authority. Scraping and automation must respect applicable terms, robots directives, privacy law and account rules.

## End-to-end reach

The browser control plane may connect to sanitized adapters for GitHub, Vercel, Render, Neon, Replit, Base44, Gmail, Canvas-style workspaces and future services. Native connectors remain preferred when they offer safer structured APIs. Browser manipulation is a fallback or testing surface, not an excuse to bypass connector permissions.

## Release train

- BCP-01: public read-only navigation and screenshot receipts.
- BCP-02: Art Board desktop/mobile visual regression.
- BCP-03: accessibility tree and keyboard test lane.
- BCP-04: public web extraction adapter.
- BCP-05: synthetic authenticated test account.
- BCP-06: owner-private profile vault and revocation.
- BCP-07: cross-device Termux/Ubuntu runner.
- BCP-08: agent tool catalog and world-map visualization.

Each release unit is independently scored and cannot widen another profile's authority.
