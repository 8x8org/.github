# ©️8x8 by FlashTM8 ⚡️🌎🤖 — Evidence Benchmark & Rank Program V1

Canonical root: `fabric://8x8/core`  
Public tracker: https://github.com/8x8org/.github/issues/24  
Truth rule: **proof before score; comparable proof before rank**

## Purpose

8x8 should continuously measure itself against explicit internal and external benchmarks, turn gaps into work, and publish leadership only when the same comparable evidence supports it.

This program does **not** promise permanent rank #1. It creates the mechanism required to know when 8x8 leads, when it does not, and exactly what must improve next.

## Historical score evidence

A June 12, 2026 SOMA scorecard is preserved as `PAST_PRESERVED` self-evaluation evidence. It recorded:

| Dimension | Historical value | Historical note |
|---|---:|---|
| Stability | 85/100 | self-healing tested; 30-day soak still required |
| Security | 90/100 | crypto/zero-trust controls present; PQC work pending |
| Autonomy | 80/100 | capability-gate integration incomplete |
| Recovery | 85/100 | crash restart tested; full DR incomplete |
| Cost efficiency | 95/100 | routing design emphasized lower-cost models |
| Observability | 90/100 | tamper-evident event logging claimed/tested in that scope |
| Integrity | 100/100 | hash-chain/tamper detection in that historical scope |
| Historical overall | 89/100 | self-score, not an external rank |

These values are **not the current whole-system score**. The current denominator is still being reconciled; therefore the current global score remains `UNMEASURED_PENDING_DENOMINATOR`.

## Benchmark object

Every benchmark receipt should identify at least:

- `benchmark_id`
- `benchmark_name`
- `benchmark_version`
- `scope`
- `denominator`
- `source_head`
- `runtime_identity`
- `model_provider_config`
- `policy_config`
- `hardware_environment`
- `started_at` / `completed_at`
- `raw_result_ref`
- `reproduction_command_or_harness_ref`
- `score`
- `unit`
- `comparison_set`
- `external_authority_ref` when applicable
- `fresh_until` or invalidation conditions
- `truth_class`

## Rank state machine

`UNMEASURED → BASELINED → REPRODUCED → COMPARABLE → EXTERNALLY_VERIFIED → RANKED`

A benchmark returns to `NEEDS_REVERIFY` if a material factor changes, including the benchmark version, denominator, source head, runtime, Universal Router, model/provider, policy, dependency set, device class, data set or execution path.

## Benchmark families

### 1. Reliability and recovery
- process/service restart success;
- mean time to recovery;
- unattended soak duration;
- crash-loop containment;
- checkpoint recovery;
- rollback success;
- data-integrity recovery.

### 2. Security and authority
- least-privilege scope correctness;
- forged/expired lease rejection;
- secret-leak prevention;
- prompt/instruction-injection resistance;
- revoked authority denial;
- high-impact action step-up enforcement;
- public/private boundary tests.

### 3. Agent autonomy and mission execution
- compiled vs dispatched vs started vs productive vs verified counts;
- mission success rate;
- tool-use correctness;
- long-horizon completion;
- retry/recovery quality;
- evidence-receipt completeness.

### 4. Model and Universal Router quality
- task success by model/provider;
- latency and cost per verified outcome;
- fallback quality;
- routing regret against the best eligible model;
- context/large-file performance;
- multimodal performance where applicable.

### 5. Software engineering
Where license/rules allow, run recognized reproducible software-engineering benchmark harnesses against the exact model/router/tool configuration. Never compare different benchmark versions or harnesses as though they were identical.

### 6. Memory and retrieval
- durable write/read integrity;
- retrieval precision/recall;
- stale-context rejection;
- provenance preservation;
- conflict/correction behavior;
- recovery after interruption.

### 7. Connector execution
- authentication/scope verification;
- lease issuance/expiry/revocation;
- provider read/action success;
- provider error classification;
- no-secret-to-agent invariant;
- receipt coverage.

### 8. Mobile/device execution
- Android/Arm64 CPU/RAM/storage/thermal behavior;
- iPhone/device-bridge round trips;
- local inference/resource efficiency;
- battery and sustained-run behavior where measurable;
- offline/degraded behavior.

### 9. Public UX and accessibility
- performance metrics;
- responsive/mobile visual smoke;
- keyboard/screen-reader/accessibility checks;
- route correctness;
- user-task completion;
- privacy-safe public-data integrity.

### 10. Competition-specific rubrics
Each competition gets its own independent rubric and external result lane. Internal 8x8 scores may help prepare for judging but never substitute for organizer results.

## Score law

A score is meaningful only inside a declared denominator.

Examples:

- `connector-negative-tests = 20/20` may be 100% for that exact test scope;
- `global One-Fabric = 100/100` is forbidden until the global denominator is frozen and every required current evidence gate is satisfied;
- a historical `85/100` remains historical unless the same dimension is rerun under a current methodology.

Do not average incompatible score families into a global number merely because each uses a 0–100 scale.

## Rank #1 law

8x8 may publish `RANK_1` only when:

1. the benchmark and version are explicit;
2. 8x8 and compared systems were measured comparably;
3. the comparison set is explicit;
4. the result is current;
5. raw evidence is reproducible or externally authoritative;
6. ties and uncertainty are represented honestly;
7. no benchmark rule or eligibility condition was bypassed.

If a competitor/reference performs better, record the gap and create remediation work. A lower current rank is useful evidence; hiding it is not.

## Public leaderboard integration

The future Community Network may display benchmark achievements, but benchmark rank must be separate from social contribution points. A user/community leaderboard cannot silently alter technical benchmark rank, and neither can imply financial value or system authority.

## Automation target

Agents may automatically:

- detect stale benchmark receipts;
- schedule/recommend safe re-runs;
- compare exact-head results;
- create gap tasks;
- update public-safe scorecards after verification;
- refuse unsupported `TOP_1`/`100/100` claims.

Agents must not fabricate competitor measurements, edit external leaderboards, or promote a score without its evidence chain.

## Current state

`HISTORICAL_SOMA_SCORECARD = PAST_PRESERVED`  
`GLOBAL_CURRENT_SCORE = UNMEASURED_PENDING_DENOMINATOR`  
`GLOBAL_CURRENT_RANK = UNMEASURED`  
`BENCHMARK_PROGRAM = ACTIVE`

**©️8x8 by FlashTM8 ⚡️🌎🤖 — measure, reproduce, compare, improve, then rank.**
