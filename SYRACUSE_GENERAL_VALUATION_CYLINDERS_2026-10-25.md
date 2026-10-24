# General finite Syracuse valuation cylinders — 2026-10-25

## Scope

This note records a finite-prefix theorem target. It is not a proof of the global Collatz conjecture and is not yet Lean-checked.

For an odd positive integer x, write S(x)=(3x+1)/2^{v_2(3x+1)}. Fix a finite word of positive integers a=(a_0,...,a_{k-1}). The cylinder consists of odd starting values whose first k accelerated Syracuse valuations equal this word.

## Structural claim to formalize

Whenever the word is realizable, its cylinder among odd integers is a single residue class modulo 2^{1+sum a_i}. Consequently its relative natural density among odd integers is 2^{-sum a_i}.

The all-ones case gives the special family n ≡ -1 (mod 2^{k+1}), with relative density 2^{-k}. The current repository proves several low-length instances (k=2 through 5); the goal is to replace these repeated, deeply nested formulas with one recursive valuation-word predicate and one induction theorem.

## Why the modulus is the sum of valuations

At step j, the exact valuation a_j specifies 3x_j+1 ≡ 2^{a_j} (mod 2^{a_j+1}). The transition x_{j+1}=(3x_j+1)/2^{a_j} transports the next valuation constraint to a finer congruence condition on x_j. Iterating lifts the required residue precision by a_j bits at step j. The accumulated precision is therefore sum(a_j), plus the parity condition that the initial value is odd.

This is a proof roadmap, not yet a completed induction: the formal proof must explicitly show uniqueness and existence of the residue class, handle natural-number division via divisibility lemmas, and avoid treating a congruence as sufficient until all intermediate states are shown to be odd.

## Lean decomposition

1. Define the finite word predicate recursively on an odd start.
2. Prove a one-step congruence-lifting lemma for prescribed valuation a.
3. Prove the induction theorem for a word of length k, with modulus 2^(1 + word.sum).
4. Prove the density statement by counting one residue class in odd residue classes.
5. Recover the existing all-ones theorems as corollaries.

## Global obstruction that remains

Finite cylinders partition starts by finite valuation words; their densities do not control the long-term size of the resulting integer states. No finite-prefix density result alone rules out an exceptional infinite positive-integer orbit. The global problem still requires a uniform arithmetic descent or another argument excluding all nontrivial cycles and divergent trajectories.

## Audit requirements

- Lean 4 / Mathlib versions pinned by the repository.
- No sorry or sorryAx in the dependency closure.
- print axioms recorded for the general theorem and density corollary.
- Check the exact statement against the definition of accelerated Syracuse, including the domain of v₂ and all positivity assumptions.
- CI must pass before calling this formalized.
