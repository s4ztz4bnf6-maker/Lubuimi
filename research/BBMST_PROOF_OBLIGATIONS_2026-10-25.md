# BBMST next-step proof obligations — 2026-10-25

## Status boundary
The CI run for commit 7d16e2875f166182145b3500d7bb64e279f4ab0f completed successfully (run 40216659489). This certifies compilation of that revision only. It does not discharge the project-level mathematical assumptions or establish the original Erdős–Selfridge conjecture.

## Exact algebraic identity
For a finite probability vector p_i >= 0 with sum p_i = 1 and alpha_i in [0,1], define
mu = sum_i p_i alpha_i,
V = sum_i p_i (alpha_i - mu)^2,
Q = sum_i p_i alpha_i (1-alpha_i).
Then
Q = mu(1-mu) - V.
Proof: expand V = sum p_i alpha_i^2 - mu^2 and use sum p_i alpha_i = mu.

This identity is useful as a diagnostic, not by itself a positivity theorem. For p=(1/2,1/2), alpha=(0,1), one has mu=1/2 and Q=0. Thus a mean-only estimate cannot force Q>0.

## Required proof-obligation split
1. Combinatorial partition: prove the finite set split and its cardinality identity directly from disjointness/complementarity.
2. Probability normalization: prove weights are nonnegative and sum exactly to one, including empty-index and degenerate cases.
3. Geometric interior mass: derive a positive lower bound for mass on epsilon <= alpha_i <= 1-epsilon from the original BBMST hypotheses; do not postulate it.
4. Sieve implication: derive the strict sieve bound from the source-faithful definitions, including zero denominators and empty delta cases.
5. Audit all transitive axioms of the final theorem and compare its statement with the original theorem.

## Stop condition
Do not describe the conjecture as proved while any project-specific axiom such as sieve_criterion or sf_sieve_lt_one remains in the dependency graph. Standard Lean foundations (propext, Classical.choice, Quot.sound) are not themselves project-specific mathematical assumptions.
