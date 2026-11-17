# Lubuimi — Syracuse / Collatz research and Lean audit

**Named method:** Ta-Yoshua Lubuimi Dynamic Residual Bound (**TL-DRB**); German: Ta-Yoshua-Lubuimi-Dynamische-Residuen-Schranke.

**Research author:** Ta-Yoshua Lubuimi  
**Status date:** 17 November 2026

This repository contains the Syracuse/Collatz finite-prefix arithmetic, exact valuation and terminal-residue work, Lean formalizations, reproducible CI audits, and research manuscripts. It does **not** contain a proof of the global Collatz conjecture.

## Project status and manuscripts

- [Consolidated project status and results (17 Nov 2026)](docs/FINAL_PROJECT_STATUS_2026-11-17.md)
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

Original materials owned by Ta-Yoshua Lubuimi are subject to the [proprietary rights notice](LICENSE-PROPRIETARY.md) and [commercial licensing policy](LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md). This includes the new research note and manuscript unless a later file-specific written license expressly says otherwise. These notices exclude upstream Erdős–Selfridge source files, Lean, Mathlib, dependencies, and all other third-party materials, which remain under their respective licenses. They do not claim exclusive rights over mathematical facts or theorem statements as such.

## Parallel research note — quantum/operator formulations

- [Quantum-operator reformulations: literature, exact encodings, and proof criteria](research/QUANTUM_OPERATOR_BRIDGE_NOTE_2026-11-14.md)

This is an exploratory note only. It is not part of the established proof chain and claims no new theorem.


## Lean formalization — initial exact audit scope (17 Nov 2026)

A separate Lean 4.35.0 / Mathlib project is now present at [formalization/TLDRB](formalization/TLDRB/). It contains named declarations for the overlap identity, its one-step residual update, and the generic positive-denominator descent-threshold equivalence. The latter is an abstract arithmetic interface: the Syracuse-specific affine/valuation hypotheses have not yet been connected to the existing trajectory definitions.

The dedicated workflow is [TL-DRB Lean formalization audit](.github/workflows/tldrbaudit.yml). Exact-head run [43997407311](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43997407311) is in progress as of this update. An initial setup attempt failed because the Lake manifest had not been generated; the workflow was corrected to install the pinned toolchain and run lake update first. No Lean pass or axiom profile is claimed until the corrected run completes and its logs are inspected. The separate legacy workflow's success on this documentation-only repository snapshot only reflects its root-project detection/skip path and is not a Lean verification result.
