# Lubuimi — Syracuse / Collatz research and Lean audit

**Named method:** Ta-Yoshua Lubuimi Dynamic Residual Bound (**TL-DRB**); German: Ta-Yoshua-Lubuimi-Dynamische-Residuen-Schranke.

**Research author:** Ta-Yoshua Lubuimi  
**Status date:** 17 November 2026

This repository contains the Syracuse/Collatz finite-prefix arithmetic, exact valuation and terminal-residue work, Lean formalizations, reproducible CI audits, and research manuscripts. It does **not** contain a proof of the global Collatz conjecture.

## Project status and manuscripts

- [Consolidated project status and results (17 Nov 2026)](docs/FINAL_PROJECT_STATUS_2026-11-17.md)
- [TL-DRB Lean CI audit report — exact head and axiom profiles](docs/TLDRB_LEAN_CI_AUDIT_2026-11-17.md)
- [TL-DRB Lean formalization guide](formalization/TLDRB/README.md)
- [Previous dated status (14 Nov 2026)](docs/FINAL_PROJECT_STATUS_2026-11-14.md)
- [Ta-Yoshua Lubuimi Dynamic Residual Bound (TL-DRB): exact Collatz identity and state-dependent descent threshold (17 Nov 2026)](research/DYNAMIC_RESIDUAL_COLLATZ_BRIDGE_2026-11-17.md)
- [TL-DRB — manuscript (17 Nov 2026)](manuscript/DYNAMIC_RESIDUAL_COLLATZ_BRIDGE_2026-11-17.md)
- [Finite-word / terminal-residue manuscript addendum (14 Nov 2026)](manuscript/SYRACUSE_MANUSCRIPT_ADDENDUM_2026-11-14.md)

## TL-DRB: exact Collatz application (17 Nov 2026)

The Ta-Yoshua Lubuimi Dynamic Residual Bound (TL-DRB) is the name used in this project for the state-dependent, set-valued residual construction developed in the separate research project. Its Collatz specialization yields the exact overlapping-word identity and, crucially, the start-value-dependent descent criterion below. This is a proved algebraic contribution to the Collatz descent analysis: it gives an exact residual coordinate and a sharper criterion than the sign of the residual alone. It does **not** prove a global descent theorem or the Collatz conjecture. The underlying mathematical method is not claimed as exclusively owned by copyright; see the licensing notices.

## New exact cross-project identity (17 Nov 2026)

For the valuation partial sums
\[
A_0=0,\qquad A_{k+1}=A_k+a_{k+1},
\]
and the Collatz affine correction
\[
C_0=0,\qquad C_{k+1}=3C_k+2^{A_k},
\]
define
\[
D_0=0,\qquad D_{k+1}=3D_k+2^{A_k}(2^{a_{k+1}}-4).
\]
With
\[
T_k(x_0,\ldots,x_{k-1})=\sum_{j=0}^{k-1}3^{k-1-j}2^{x_j},
\]
the overlapping exponent words \(u=(A_0,\ldots,A_{k-1})\) and \(v=(A_1,\ldots,A_k)\) satisfy the exact identity
\[
\boxed{4T_k(u)-T_k(v)=-D_k=:R_k.}
\]
The exact ordinary-size descent test is
\[
\boxed{S^k(n_0)<n_0\iff n_0R_k<(n_0-1)C_k.}
\]
This is an algebraic bridge and a state-dependent descent criterion, not a global descent proof. The exponent words overlap and therefore form a constrained subclass of the general dynamic-residual construction. The residual recursion does not by itself provide a uniform finite horizon.

## Verified finite results

- Exact affine finite-prefix identities and backward reconstruction lemmas, on their documented source snapshots.
- Constructive quotient-state sequence, PR [#81](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/81), exact-head workflow [43121953918](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43121953918).
- Child/tail finite partition, PR [#76](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/76), workflow [43026427449](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43026427449).
- One-step child-block uniform mass, PR [#78](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/78), workflow [43042316671](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43042316671).
- Unique terminal congruence class, PR [#82](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/82), exact-head workflow [43412794362](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43412794362), named profile `[propext, Classical.choice, Quot.sound]`, `sorryAx` gate passed.

Each result is restricted to its exact theorem, source commit, and CI run. A one-step mass identity is not an iterated product law; terminal-class uniqueness is not full word realization.

## Open mathematical frontier

The full terminal-congruence iff finite-word-realization theorem, positive representative/lift construction, affine-offset-to-strict-descent bridge, exclusion of all infinite non-descending paths, and global Collatz termination remain open. The new residual identity sharpens the exact bookkeeping of the descent margin but does not close these obligations.

## Reproducibility and integrity

- Keep the named `#print axioms` output and explicit `sorryAx` rejection gate for each promoted Lean theorem.
- Record every result against the exact source SHA and workflow/job.
- Preserve earlier successful checks for their own source snapshots; do not transfer them to later commits.
- Keep mathematical proof, finite arithmetic, manuscript exposition, and Lean verification as separate evidence categories.

## Original-materials licensing

For new releases, original materials owned or controlled by Ta-Yoshua Lubuimi are subject to the [proprietary rights notice](LICENSE-PROPRIETARY.md). Commercial exploitation requires a separate written licence under the [commercial licensing policy](LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md); the default proposed term is 10% of attributable gross receipts, with the stated allocation/net-profit fallback and reporting/audit terms. Original source files may carry [LicenseRef-Lubuimi-Commercial-Revenue-Share](LICENSE-REF-LUBUIMI-COMMERCIAL-REVENUE-SHARE.md). Existing valid grants remain effective for copies already distributed under those terms; no third-party rights are overridden.

Valid earlier AGPL/MIT/CC or other grants remain effective for copies already distributed under those terms; this update is prospective and does not retroactively revoke them. Upstream Erdős–Selfridge source files, Lean, Mathlib, dependencies, external contributions, and all other third-party materials remain under their own rights and licences. The policy does not claim exclusive rights over mathematical facts, abstract ideas, or theorem statements as such.

## Parallel research note — quantum/operator formulations

- [Quantum-operator reformulations: literature, exact encodings, and proof criteria](research/QUANTUM_OPERATOR_BRIDGE_NOTE_2026-11-14.md)

This is an exploratory note only. It is not part of the established proof chain and claims no new theorem.


## Lean formalization — initial exact audit scope (17 Nov 2026)

A separate Lean 4.35.0 / Mathlib project is now present at [formalization/TLDRB](formalization/TLDRB/). It contains named declarations for the abstract finite-prefix affine trajectory identity, the exact dynamic-residual embedding, the overlapping-word identity and one-step residual update, and the generic positive-denominator descent-threshold equivalence. The actual 2-adic valuation of the concrete Syracuse map has not yet been instantiated.

The dedicated workflow is [TL-DRB Lean formalization audit](.github/workflows/tldrbaudit.yml). Exact-head run [44026016138](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/44026016138) completed successfully on 17 November 2026 for PR #90 (head `1a7c7a7df4c5ba014c3a6a932d2bdcb2d8d6c42d`; GitHub tested merge ref `1c9e501699557cccfeb8c97f96fc3f2ca5bb1593`). `lake build TLDRB` completed successfully (9048 jobs), the named theorem axiom profiles were printed, and the explicit `sorryAx` rejection gate passed. This is a successful formalization build and axiom-output gate for the declarations currently in `TLDRB.lean`; it is not a global theorem audit, `lake check --paranoid`, or proof of the global descent statement. See the [full audit report](docs/TLDRB_LEAN_CI_AUDIT_2026-11-17.md). The separate legacy workflow's success on this documentation-only repository snapshot only reflects its root-project detection/skip path and is not a Lean verification result.
