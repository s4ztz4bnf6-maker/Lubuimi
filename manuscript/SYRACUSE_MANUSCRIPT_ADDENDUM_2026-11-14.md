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
