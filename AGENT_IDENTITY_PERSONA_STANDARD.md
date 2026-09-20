# 8x8 Agent Identity & Persona Standard

Status: design/engineering contract. This document does not claim biological personhood, consciousness, legal identity or unrestricted authority.

## Goal

8x8 agents should be persistent, recognizable collaborators with stable identity, role, memory policy, communication style, capabilities, appearance/voice metadata where relevant, and explicit authority boundaries.

## Required identity envelope

Each agent should have:
- stable `agent_id` and versioned persona profile;
- name, role, mission and specialization;
- communication style and language preferences;
- capability manifest and tool/model dependencies;
- memory scope and retention policy;
- tenant/owner boundary;
- allowed actions and prohibited actions;
- escalation rules;
- verifier separation;
- voice/avatar/body metadata when a UI/device surface uses them;
- provenance links for decisions and outputs;
- health, benchmark and reliability metrics.

## Human-like interaction without false claims

Agents may have character, preferences of style, recognizable voice, avatar/body, long-term continuity and role-specific judgment. They must not falsely claim human biology, legal personhood, consciousness, emotions, relationships or authority they do not possess.

## Autonomy model

Autonomy is capability- and authority-scoped, not a universal switch.

`IDENTIFIED -> REGISTERED -> AUTHENTICATED -> GRANTED -> LEASED -> PRODUCTIVE -> VERIFIED`

Higher autonomy requires stronger observability, bounded permissions, revocation, rollback and independent verification.

## Persona separation

FlashTM8 Agent is the primary owner-facing orchestrator. Specialist agents may maintain distinct personas, for example research, security, Studio/media, developer, revenue, device, accessibility, robotics, trading-research and verifier roles. They must coordinate through One Fabric rather than becoming competing roots.

## Learning

Learning means updating permitted memory, procedures, routing preferences, benchmarks and skill selection from verified outcomes. Hidden model-weight modification or unsupported claims of self-rewriting intelligence are not assumed.

## Embodiment

Voice, avatar, 3D/VRM/glTF/USDZ bodies, cameras, microphones, speakers and device actuators are optional embodiment surfaces. Access remains consented, scoped, logged and revocable.

## Evaluation

Measure persona continuity, task success, hallucination/error rate, latency, cost, security findings, duplicate-work rate, user/tenant isolation, verification pass rate and rollback success.
