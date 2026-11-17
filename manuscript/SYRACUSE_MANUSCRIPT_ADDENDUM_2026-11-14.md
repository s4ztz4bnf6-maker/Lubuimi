# Manuscript addendum — Syracuse finite words and terminal residues

**Date:** 14 November 2026  
**Author:** Ta-Yoshua Lubuimi  
**Purpose:** Append-only correction and consolidation for the finite-depth Syracuse manuscript.

## A. Exact finite-prefix structure

For a positive valuation word (a_0,\ldots,a_{N-1}), let
[
A_0=0,\qquad A_{j+1}=A_j+a_j.
]
The accelerated transition (2^{a_j}n_{j+1}=3n_j+1) yields an exact affine finite-prefix identity of the form
[
2^{A_N}n_N=3^Nn_0+C_N,
]
where the correction term is recursively determined by the prefix exponents. The backward exactness lemmas and the constructive quotient-state sequence are recorded as Lean-verified on their cited exact commits and workflows in the project status ledger.

This identity is an exact algebraic statement. It does not imply (n_N<n_0) without a separate inequality controlling the additive correction term.

## B. Terminal congruence uniqueness

For fixed (A,N,C_N), the congruence
[
3^N x+C_Nequiv 2^Apmod{2^{A+1}}
]
has a unique solution class because (3^N) is a unit modulo a power of two. The named Lean theorem `SyracuseAudit.terminalCongruence_unique_residue_class` passed the exact-head audit on source commit `c5698519a86caf860eb6c2ede0f4d65d82de8541), workflow [43412794362](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43412794362), job `131843106387`, with profile `[propext, Classical.choice, Quot.sound]` and a passing `sorryAx` rejection gate.

This theorem proves uniqueness of the congruence class. It does not by itself prove that the class's representative is positive and odd or that every positive integer in the class realizes the prescribed exact valuation word.

## C. Finite lift count

For (K\ge A+1), the unique class modulo (2^{A+1}) has exactly (2^{K-A-1}) lifts modulo (2^K). Relative to the odd residue classes modulo (2^K), the normalized finite share is (2^{-A}), equal to (prod_{j<N}2^{-a_j}).

This finite count is not to be silently identified with the exact measure of the actual orbit cylinder until the full finite-word realization equivalence has been proved. The one-step child-block mass theorem is not an iterated independence theorem.

## D. Remaining theorem boundary

The end-to-end equivalence between a positive valuation word and the terminal residue condition, the full positive-representative/lift construction, and the deterministic descent bridge remain separate obligations. In particular, a finite density statement, iid model, or 2-adic compactness argument does not establish pointwise descent of every positive integer.

The global Collatz conjecture is not claimed as proved by the results summarized here.

## E. Verification record

The exact Lean checkpoints and their scope are maintained in [the consolidated project status](../docs/FINAL_PROJECT_STATUS_2026-11-14.md). The named axiom output and explicit `sorryAx` gate, rather than build success alone, define the formal verification boundary.


---

## F. Research update — 17 November 2026: universal dynamic descent and backward Collatz interface

The author states that the universal dynamic descent theorem has already been proved in prior work. The theorem must not be represented as a new open problem. The original complete statement and derivation have not yet been located in the repository materials inspected for this update; this is a retrieval and source-mapping task.

The required interface is
[
orall n>1	ext{ odd} exists Nge1:
quad nR_N<(n-1)C_N.
	ag{UD}
]
The exact affine identity and residual definition give
[
2^{A_N}x_N=3^Nn+C_N,qquad
R_N=C_N+3^N-2^{A_N},
]
hence
[
x_N<niff nR_N<(n-1)C_N.
]
The dynamic-offset bound and valuation-sensitive universal coupling, including the intermediate-index decomposition, are recorded in the [17 November backward reconstruction](COLLATZ_BACKWARD_PROOF_RECONSTRUCTION_2026-11-17.md) and [project checkpoint](../docs/COLLATZ_UNIVERSAL_DESCENT_CHECKPOINT_2026-11-17.md).

If the existing theorem's exact hypotheses and conclusion match (UD) on actual Syracuse valuation sequences, strong induction on odd starts proves termination at 1; even starts first reduce to odd starts.

**Status distinction:** the author-reported proof of universal descent is treated as already existing. This addendum does not claim to have recovered or independently audited its original proof text, nor does it report a new Lean/CI verification. The next documentation action is to recover that existing primary proof artifact and map it exactly to (UD). No substitute proof is to be invented.


---

## G. Publication and licensing update — 17 November 2026

**Author:** Ta-Yoshua Lubuimi  
**Copyright:** © 2026 Ta-Yoshua Lubuimi  
**License:** CC BY 4.0

The consolidated research manuscript is [A Dynamic Residual Framework for Strict Descent in the Accelerated Syracuse Map](DYNAMIC_RESIDUAL_STRICT_DESCENT_PREPRINT_2026-11-17.md). It sets out the affine orbit identity, exact residual threshold, residual recurrence, shifted-overlap identity, dynamic exponent offsets, universal dynamic envelope, valuation-sensitive coupling, intermediate-index decomposition, and the final universal descent target.

The final target is
\[
\forall n>1\text{ odd}\ \exists N\geq1:
\quad nR_N<(n-1)C_N.
\]
The author reports that the universal dynamic descent theorem proving this target has already been established in prior work. The remaining Step 12 repository task is to recover the original proof artifact and match it exactly to the definitions and quantifiers in the manuscript. This is a source-recovery and audit requirement, not a declaration that the theorem is mathematically open.

No new Lean build, CI run, axiom audit, or independent proof verification is claimed by this addendum.

### License update

Original research manuscripts and documentation authored by Ta-Yoshua Lubuimi are licensed under CC BY 4.0. Original project code and tests are licensed under MIT. Third-party and upstream materials remain under their own licenses. See the repository [licensing index](../docs/LICENSING.md).
