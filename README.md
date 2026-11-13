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


## Current exact-head quotient-sequence status — 12 November 2026

The current PR #81 source head is `2f7f3e3aabf4b05b8097228f7fe6ae433ae85b3e`, not the earlier checkpoint head `44b7ce6e991e6b975a5f85fe3a34babe4bec68d5`. Its exact workflow [43121953918](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43121953918) passed the Lean job (130864363776): 8,933 jobs built, named profiles printed for all five declarations, and the explicit `sorryAx` rejection gate passed. See the [superseding exact-head checkpoint](docs/SYRACUSE_QUOTIENT_SEQUENCE_CI_CHECKPOINT_2026-11-12.md). PR #81 remains Draft/open/unmerged. Full word-realization equivalence, residue uniqueness, lift counting, product density, and global Collatz termination remain unproved/unverified.




## 13 November 2026 — terminal residue and finite density

The new [terminal residue-class counting note](docs/SYRACUSE_RESIDUE_CLASS_COUNTING_2026-11-13.md) proves algebraically that the terminal congruence has one odd residue class modulo \(2^{A+1}\), that it has \(2^{K-A-1}\) lifts modulo \(2^K\), and that its normalized density among odd residues is \(2^{-A}=\prod_i2^{-a_i}\). These are finite congruence facts. The Lean formalizations remain open, and the density is not identified with the exact valuation-word cylinder until the full word-realization equivalence is proved. No infinite-path exclusion or global Collatz termination is claimed.




## 13 November 2026 — SYR-02 Lean candidate

PR [#82](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/82) adds a candidate Lean theorem for uniqueness of the terminal congruence class in ZMod (2^(A+1)). Exact source head bf814a9e7ee30b23e3c90d10ee3553cb4fb71f8c; workflow [43410857139](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43410857139), job 131836620024, is in progress. No formal pass is claimed. The candidate covers uniqueness only, not representative oddness, lift counting, product density, complete word realization, or global termination.




## 13 November 2026 — PR #82 exact-head correction and retry

The first PR #82 source head bf814a9e7ee30b23e3c90d10ee3553cb4fb71f8c failed because the coprime power lemmas take their exponents explicitly and ZMod.isUnit_iff_coprime takes the natural representative and modulus explicitly. The proof script has been corrected to pass these arguments.

Current PR #82 head: e0c275fd94d8ee24c3348888952335b06657ce41. Exact workflow [43411256426](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43411256426), Lean job 131837949086, is **IN PROGRESS**. No compile success, axiom profile, or sorryAx conclusion is claimed yet. The initial failure remains preserved for its own source head.




## 13 November 2026 — ZMod cast-alignment retry

The second exact-head run 43411256426 confirmed that the coprime-power construction and unit criterion elaborate, but exposed a mismatch between the cast of the natural power \(3^r\) and the power of the cast in ZMod. The theorem coefficient is now explicitly written as the cast of the natural power, matching the unit witness.

Current PR #82 head: 4c782523c9e86d22b1267e8ebfc3d99cccdf9e1d. Exact workflow [43411629727](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43411629727) is **QUEUED** at this update. No compile or axiom result is claimed.




## 13 November 2026 — unit-witness type correction

The exact run 43411629727 still failed at the hunit declaration: the left side used the power of the ZMod cast, while ZMod.isUnit_iff_coprime returns IsUnit of the cast of the natural power. The local hunit target is now written explicitly as IsUnit (↑(3^r) : ZMod ...), matching the theorem's coefficient and the unit criterion.

Current PR #82 source head: 926f0fd2f627d504e1f32c61a00d38e763afea38. Exact workflow [43412074002](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43412074002), Lean job 131840693951, is **IN PROGRESS**. No compile success or axiom profile is claimed yet.
