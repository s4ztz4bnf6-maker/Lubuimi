# Syracuse / Collatz — Lean research and verification record

**Author:** Ta-Yoshua Lubuimi  
**Scope:** accelerated Syracuse valuation cylinders, finite-depth fibre partitions, exact affine transitions, and separately tracked Collatz descent obligations.

## Current dated status — 11 November 2026

The append-only correction is recorded in [the Syracuse status addendum](docs/SYRACUSE_STATUS_CORRECTION_2026-11-11.md) and proposed in [PR #80](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/80).

- The backward congruence/affine lemma is already mathematically and Lean-formally closed on its exact audited source snapshot: terminalExact_backward_step, terminalExact_backward_prefix, and finite_prefix_affine_identity in SyracuseAffineCore.lean.
- Workflow [43076503425](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43076503425) reports the standard profile [propext, Classical.choice, Quot.sound] and passed the explicit sorryAx gate for the named audited declarations.
- affineCompositionRhs_closed_form in SyracuseAffineCorrectionSum.lean has the separately reported profile [propext].
- The next open formalization layer is the constructive quotient sequence, full finite-word realization equivalence, unique residue class modulo 2^(A+1), lift counting modulo 2^K, and the resulting product density.
- PR #76 (finite Child/Tail partition), PR #78 (one-step uniform mass), and PR #79 (exact initial valuation) remain separate, commit-bound results. Their verification is not transferred to later source heads or to the full finite-word theorem.
- No global Collatz termination proof is claimed.

## Manuscripts and research notes

- [Finite-depth uniform-fibre bridge](SYRACUSE_FINITE_DEPTH_UNIFORM_FIBRE_BRIDGE_2026-11-10.md) — finite-depth construction; not the historical APW4 event map and not a global descent proof.
- [Dated formal-status correction](docs/SYRACUSE_STATUS_CORRECTION_2026-11-11.md) — exact boundary of the verified backward lemma and remaining formalization tasks.

## Verification discipline

Every Lean claim is source-commit and declaration scoped. A successful module compile is not a proof of the global theorem. No status is promoted without exact-head integrated CI, named theorem output, and a transitive axiom audit that rejects sorryAx.

## Original-materials licensing

Original materials owned by Ta-Yoshua Lubuimi are subject to the [proprietary rights notice](LICENSE-PROPRIETARY.md) and [commercial licensing policy](LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md). These notices exclude upstream Erdős–Selfridge source files, Lean, Mathlib, dependencies, and other third-party materials, which remain under their respective licenses. They do not claim exclusive rights over mathematical facts or theorem statements as such. The 11 November documentation updates do not change the licensing terms.


## Exact quotient-sequence checkpoint — 12 November 2026

The append-only [Syracuse quotient-sequence CI checkpoint](docs/SYRACUSE_QUOTIENT_SEQUENCE_CI_CHECKPOINT_2026-11-12.md) records PR #81 / exact head `44b7ce6e991e6b975a5f85fe3a34babe4bec68d5`, workflow 43115942497: Lean build SUCCESS, named axiom output recorded, explicit `sorryAx` gate passed. The quotient states, oddness, and accelerated transition are formalized. Complete word-realization equivalence, residue uniqueness, lift counting, and product density remain open; no global Collatz termination is claimed.
