# JARVIS Platform — isolated integration area

> This directory belongs exclusively to the JARVIS platform integration work.
> It is not part of the Syracuse/Collatz mathematics project in this repository.

## Project boundaries

- `JARVIS_PLATFORM/`: JARVIS orchestration, deployment notes, monitoring and integration contracts.
- Syracuse/Collatz source files outside this directory: unchanged and out of scope.
- APW4/BBMST work in the separate `Lubuimi-` repository: unchanged and out of scope.
- No JARVIS secrets, API keys, session cookies, wallet private keys or seed phrases may be committed here.

## A/B/C architecture

- **A — Railway (coordination core):** existing JARVIS gateway, companion app, PostgreSQL and autonomous worker. The existing app/login/session and database are protected; integration work must not rewrite their authentication flow.
- **B — GitHub Actions (build/verification):** this isolated branch contains a health monitor for A. It is not yet a task-execution or payout connector.
- **C — Render (external worker/monitor):** Render account connection exists, but no Render service is currently provisioned. A Render job must use this same isolated directory/branch and a free plan only.

## Current verified interface

Railway gateway health endpoint:
`https://jarvis-gateway-production-c03df2bc.up.railway.app/health`

The public health endpoint confirms gateway liveness only. It does not expose owner data, task payloads, claims, wallet addresses or payout credentials.

## Shared-state contract (target)

All components must use A/PostgreSQL as the authoritative ledger. Events should carry:
- `event_id`, `component` (A/B/C), `event_type`, `task_id` (nullable), `status`,
- `created_at`, `observed_at`, `attempt`, `result_ref`, `error_code`.

Task states must distinguish internal completion, external submission, external acceptance, payable, payout requested and paid. A task is not paid until an actual receipt is verified. BTC wallet accounting is watch-only; never sign or spend.

## Status

- Isolated Git branch created: `jarvis-platform/bootstrap-2026-11-19`.
- GitHub Actions health monitor is being added.
- Railway currently hosts A; current worker health must be checked from Railway before claiming the income pipeline is running.
- Render has not yet been provisioned. No paid plan or billing activation is authorized.
- Full bidirectional A↔B↔C task/event synchronization is **not yet verified**.
