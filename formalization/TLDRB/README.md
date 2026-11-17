# TL-DRB Lean formalization

**Toolchain:** Lean 4.35.0  
**Mathlib:** v4.35.0  
**Main file:** TLDRB.lean  
**Status date:** 17 November 2026

## What is formalized

| Declaration | Formal content | CI axiom profile |
|---|---|---|
| affine_trajectory_identity | Finite-prefix affine identity for any sequence satisfying the exact division-witness recurrence | [propext] |
| dynamicResidual_eq_affineCorrection | Exact embedding of the dynamic residual recurrence into the affine correction | [propext, Quot.sound] |
| overlap_identity | Weighted overlapping-word residual identity | [propext, Quot.sound] |
| overlapResidual_succ | One-step overlap-residual recurrence | [propext, Quot.sound] |
| descent_threshold | Generic exact threshold equivalence under explicit affine and positive-denominator hypotheses | [propext, Classical.choice, Quot.sound] |

All five named profiles were printed in CI. The explicit workflow gate rejected any occurrence of sorryAx; the gate passed.

## Exact verification record

- PR: [#90](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/90) (still draft)
- Head commit: 1a7c7a7df4c5ba014c3a6a932d2bdcb2d8d6c42d
- Tested merge ref: 1c9e501699557cccfeb8c97f96fc3f2ca5bb1593
- Workflow run: [#44026016138](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/44026016138)
- Job: 133846418781
- Build: lake build TLDRB, successful, 9048 jobs
- Axiom output: all profiles listed above
- sorryAx gate: passed

See [the full CI audit report](../../docs/TLDRB_LEAN_CI_AUDIT_2026-11-17.md).

## What is not yet formalized

- The actual accelerated Syracuse function with its concrete 2-adic valuation.
- Proof that the abstract division witness g(k+1) equals the actual valuation of 3*x_k+1.
- An end-to-end instantiation of the generic descent threshold for an actual Syracuse orbit.
- The universal dynamic descent theorem.
- Exclusion of all infinite non-descending paths.
- Global Collatz termination.

A successful package build is not a proof of any of these open statements. The current CI is a focused package build and named axiom-output gate; it is not lake check --paranoid.

## Reproduce locally

From this directory, with Lean 4.35.0 installed, run lake update, lake build TLDRB, then lake env lean TLDRB.lean. Inspect the named #print axioms output. Do not promote a theorem without checking the exact source SHA and the explicit sorryAx gate.

## Rights and third-party components

Original project-authored formalization material is identified by the SPDX-style LicenseRef-Lubuimi-Commercial-Revenue-Share notice at the top of the Lean source. See the repository [proprietary rights notice](../../LICENSE-PROPRIETARY.md) and [commercial licensing policy](../../LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md). Lean, Mathlib, package dependencies, and third-party contributions retain their own licences.
