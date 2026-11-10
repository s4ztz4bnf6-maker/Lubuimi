# Fixed-start compatibility across all horizons: research route

Date: 2026-10-26

## Exact target

For the accelerated odd Syracuse orbit of one fixed odd positive integer n₀, let
`a_j = v₂(3 n_j + 1) ≥ 1`, `A_N = Σ_{j<N} a_j`, and
`C_N = Σ_{j<N} 3^{N-1-j} 2^{A_j}`. Then
`2^{A_N} n_N = 3^N n₀ + C_N` for every N.

The target is not merely to show that the set of start values whose valuation surplus stays negative has density zero. It is to exclude one fixed positive n₀ from satisfying every bad-prefix condition
`5 A_N < 9 N`.

## New literature lead: the first-passage/reset route

ProofAtlas' public Collatz research map identifies a different, specific open obligation: a “reset first-passage diagonal theorem” for every infinite post-reset address of one fixed positive equality owner. It proposes classifying exact bridge exits, high-action overshoots, subcritical loops, and bridge-free addresses under one authenticated state convention:
https://www.proofatlas.ai/collaboration/collatz-conjecture/

This is a research lead, not a theorem already proved. It appears conceptually relevant to our fixed-start problem because it explicitly treats one fixed owner and infinite address compatibility, rather than only the distribution of finite valuation words. Before adopting it, we must retrieve the exact definitions and show how their state variables map to our `(n₀, A_N, C_N)` recurrence. No equivalence is asserted yet.

## Three mathematically distinct objects

1. **Finite cylinder:** a finite valuation word determines a congruence class modulo a power of 2. Every admissible finite word is realizable, so excluding finite bad words cannot work in general.
2. **Infinite address:** an infinite valuation sequence determines compatible residue data at every finite horizon. Density estimates constrain how many finite prefixes are common, but do not show that a particular integer cannot realize one infinite address.
3. **Fixed integer owner:** a single positive n₀ must satisfy all affine identities simultaneously, with the same n₀ and the actual orbit n_N. This coherence is the desired deterministic obstruction.

A promising route must prove a new implication between (2) and (3), or exploit the correction term C_N in the affine identity more strongly than the existing sufficient descent criterion.

## Candidate lemma families (unproved targets)

A. **First-passage reset lemma.** After each return to a designated arithmetic region, prove that every infinite address belonging to a fixed positive n₀ has a later first passage satisfying a uniform action bound. The state, reset condition, and action need explicit definitions; no probabilistic “typical” statement may substitute for the universal quantifier.

B. **Affine correction obstruction.** From
`n_N < n₀ ↔ C_N < (2^{A_N} - 3^N)n₀`
(when `3^N ≤ 2^{A_N}`), derive a necessary condition for an all-prefix-bad fixed orbit that cannot hold at arbitrarily large horizons. The current equivalence is bookkeeping only; it does not itself yield the needed contradiction.

C. **Nested-cylinder representative bound.** For all-prefix-bad words, bound the least positive representative of the compatible cylinder in terms of N and A_N. To close the proof this bound must contradict the fact that a fixed n₀ becomes the least positive representative once the cylinder modulus exceeds n₀. This lower bound is not currently known.

## Known external results and the exact boundary

- Tao's almost-bounded-orbit theorem is a logarithmic-density result, not a universal theorem.
- The ProofAtlas natural-density/logarithmic-time formalization gives 145 odd-to-odd Syracuse steps and 436 raw Collatz steps for density-one statements, not all starts:
  https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
- A separate ProofAtlas result gives positive lower density of starts reaching any fixed positive target not divisible by 3. Its companion proves conditionally that upper-natural-density-one convergence to 1 would imply universal convergence; it does not prove that density premise:
  https://www.proofatlas.ai/formalizations/positive-lower-density-collatz-predecessors/

These results motivate a route, but none supplies the missing universal bridge.

## Formal audit and current repository state

The bad-prefix arithmetic implication now has a corrected proof-order commit `cd05024abd586be80832faac9b2835785ba883e1`; a prior revision failed because the theorem goal was not explicitly instantiated before applying the helper. The subsequent run was still in progress at the last status check. A related older run for the affine-correction module passed, but this does not certify the newest branch head.

CI status:
https://github.com/s4ztz4bnf6-maker/Lubuimi/actions

Audit rules: no `sorryAx`; record exact `#print axioms`; pin Lean/Mathlib; state whether the conclusion concerns raw Collatz or odd-to-odd Syracuse steps; do not treat finite computational searches as evidence for an infinite universal claim.
