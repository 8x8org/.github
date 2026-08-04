# 8x8 Capability Intake: 35 Repository Candidates V1

## Intake rule

A repository appearing here is a research candidate, not an installed dependency, approved fork, live service or 8x8-owned asset.

Before adoption, each candidate requires:

1. exact repository identity and current upstream commit;
2. license, notices and commercial-use review;
3. security and maintenance review;
4. bounded capability and permission manifest;
5. data-class and privacy review;
6. Termux, Ubuntu, browser and cloud resource budget;
7. isolated tests and adversarial fixtures;
8. SBOM, provenance and rollback;
9. an `8x8-compatible` adapter or clean-room implementation where appropriate;
10. no relabeling of upstream ownership.

## A. Immediate technical intake

| Candidate | Intended 8x8 power | Initial boundary |
|---|---|---|
| `microsoft/playwright` | Deterministic browser automation and pixel/browser assertions | Isolated browser contexts; no private profile by default |
| `microsoft/playwright-mcp` | Agent browser tool surface | Public and test accounts first; persistent sessions separately gated |
| `browserbase/stagehand` | Natural-language plus code browser actions | Preview/sandbox only until deterministic receipts exist |
| `firecrawl/firecrawl` | Public web extraction, crawling and structured research | Respect robots, terms, rate limits and data licenses |
| `iOfficeAI/OfficeCLI` | Headless Word, Excel and PowerPoint workflows | Public/synthetic documents first |
| `OpenCut-app/OpenCut` | Browser video creation and editing | Isolated media workspace; preserve upstream license |
| `Zackriya-Solutions/meeting-minutes` | Local transcription and meeting summaries | Consent required; local/private data class |
| `aquasecurity/trivy` | Vulnerability, configuration, license and SBOM scanning | Report-only baseline, then block new critical findings |
| `ossf/scorecard` | Repository supply-chain posture | Scheduled read-only report |
| `gitleaks/gitleaks` | Secret scanning | Report-only baseline before blocking |
| `renovatebot/renovate` | Dependency update automation | Draft PRs only until policy is proven |
| `woodruffw/zizmor` | GitHub Actions security analysis | Blocking after existing workflows are baselined |
| `backstage/backstage` | Developer portal and component catalog | Metadata-only first; no private catalog exposure |
| `maplibre/maplibre-gl-js` | Privacy-safe 2D global and regional maps | Simulated and opt-in approximate presence only |
| `CesiumGS/cesium` | 3D globe, world layers and spatial simulation | Public fixture and mobile performance canary |
| `Arize-ai/phoenix` | Agent tracing, evaluation and experiments | Redacted OpenTelemetry-compatible events |
| `langfuse/langfuse` | LLM observability, datasets and prompt/eval management | Evaluate against Phoenix; avoid duplicate source of truth |
| `open-telemetry/opentelemetry-collector-contrib` | Common telemetry pipeline | Sanitized schemas and bounded exporters |
| `Arize-ai/openinference` | Agent and model trace semantics | Public/private attribute allowlist |

## B. Architecture evaluation

| Candidate | Intended 8x8 power | Decision question |
|---|---|---|
| `diegosouzapw/OmniRoute` | Multi-provider routing, fallback and compression | Adopt adapter ideas or retain existing 8x8 router? |
| `browser-use/browser-use` | Agentic web navigation | Does it add value beyond Playwright plus Stagehand? |
| `daijro/camoufox` | Firefox-based anti-detection testing | Isolated compatibility lane only; never for evasion or abuse |
| `openai/openai-agents-python` | Agent orchestration, guardrails and tracing | Adapter only; private Control Fabric remains authoritative |
| `langchain-ai/langgraph` | Durable agent graphs | Use for bounded workflows without creating a second control plane |
| `microsoft/agent-framework` | Multi-agent enterprise patterns | Compare against Agents SDK and LangGraph before adoption |
| `All-Hands-AI/OpenHands` | Software-development agents | License, sandbox and resource review required |
| `mem0ai/mem0` | Long-term agent memory | Compare provenance and deletion semantics with current memory fabric |
| `getzep/graphiti` | Temporal knowledge graph | Candidate for changing-fact and provenance graph |
| `microsoft/graphrag` | Graph-based retrieval and research | Batch research lane, not universal default |
| `supermemoryai/supermemory` | User and agent context layer | Compare with Mem0 and existing memory stores |
| `Comfy-Org/ComfyUI` | Visual generation workflows | Reuse current local install; models remain separately licensed |
| `n8n-io/n8n` | Workflow automation and integrations | License and control-plane duplication review |
| `activepieces/activepieces` | Agent and MCP-oriented workflows | Compare with n8n for public/community use |

## C. Research-only or tightly isolated

| Candidate | Research value | Prohibition |
|---|---|---|
| `asgeirtj/system_prompts_leaks` | Prompt-injection threat models and historical research | Do not republish proprietary prompts or use leaked material as product assets |
| `HKUDS/Vibe-Trading` | Strategy research, simulation and backtesting ideas | No live execution, wallet authority or autonomous financial action |
| `usestrix/strix` | Authorized vulnerability assessment patterns | Sandboxed targets with explicit authorization only |
| `MadsLorentzen/ai-job-search` | Personal job-analysis and document workflows | Treat job pages as untrusted; no automatic submissions |
| `obra/superpowers` | Agentic development methodology and skills | Extract compatible workflow ideas, not a second autonomous authority system |

## Browser architecture decision

8x8 should build its **browser control plane and user experience**, not a new Chromium/Firefox rendering engine from zero.

The first browser stack should be:

- Playwright for deterministic navigation, DOM, network, screenshot and browser-context control;
- Playwright MCP for agent-facing tools;
- Stagehand as an optional semantic layer;
- Firecrawl for read-oriented public web extraction;
- Browser-use as an evaluated alternative, not a simultaneous default;
- Camoufox only in an isolated policy-compliant compatibility lane;
- an 8x8 Pixel Contract that records viewport, selectors, screenshots, interaction receipts and latency;
- separate PUBLIC, TEST, OWNER_PRIVATE and HIGH_RISK browser profiles;
- no inherited personal cookies or unrestricted social-media manipulation.

## Next release units

1. Browser read-only public research canary.
2. Browser screenshot and accessibility canary.
3. Pixel-level public Art Board test lane.
4. Authenticated test-account lane.
5. Office and media adapter canaries.
6. Security tool baseline reports.
7. Memory and observability comparison benchmarks.
8. Developer catalog entries and plugin conformance receipts.

No tool advances to production merely because its README contains the words AI, autonomous or enterprise.
