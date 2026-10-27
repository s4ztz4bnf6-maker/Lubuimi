# Collatz global-bridge audit — 2026-10-27

## Status boundary

This is a research checkpoint, not a proof of the Collatz conjecture. The exact carry-cocycle algebra in `SyracuseCarryCocycle.lean` is verified locally in the formal development, but it does not force descent on every orbit.

## New external theorem interface to exploit

Two recent formalized results suggest a sharper global route:

1. A conditional theorem of the form
   `(∃ n > 0, CollatzOrbit n never reaches 1) → positive lower natural density of such n`.
2. A power-saving upper bound for starts whose orbits stay above a fixed barrier N₀, with relative density bounded by K N₀^{-c}.

These are not contradictory. A nonconvergent orbit can visit arbitrarily small values relative to its starting height without ever reaching 1; the barrier theorem does not prohibit that. In particular, do not infer density-one convergence from the barrier estimate alone.

## Exact missing bridge

Let `Bad` be the positive integers whose orbit never reaches 1. The density implication would close Collatz if one could prove
`∀ ε > 0, ∃ X₀, ∀ X ≥ X₀, |Bad ∩ [1,X]| / X < ε`.
Mazur's conditional theorem then supplies the contradiction if Bad is nonempty.

A useful intermediate target must control **recurrent low visits**, not just a single visit below a barrier. For example, seek a uniform statement that for every fixed B, the upper density of starts whose orbit visits [1,B] infinitely often while avoiding 1 is zero. This statement is not currently proved here and is not claimed to follow from the cited barrier estimate.

## Carry-cocycle obstruction

For a block B, write
`2^A y = 3^N x + C`, `λ=2^A/3^N`, `q=C/3^N`. Then
`y=(x+q)/λ` and descent is equivalent to `q < (λ-1)x`.

For composable blocks,
`λ₁₂=λ₁λ₂`, `q₁₂=q₁+λ₁q₂`. If λ₁,λ₂>1, the threshold
`θ=q/(λ-1)` of the composite is a convex weighted mean of the component thresholds. Therefore concatenation alone cannot improve the minimum threshold. Any successful block-potential proof needs an additional orbit-admissibility theorem that bounds the carry threshold, not merely more composition identities.

## Falsifiable next targets

A. Prove a recurrent-low-visit density lemma from the exact inverse-tree structure, or produce a counterexample to the proposed lemma in a finite analogue.

B. Formalize a theorem connecting a positive-density bad set to a uniform lower bound on recurrent visits to a finite set, with every quantifier explicit.

C. Search for a finite-state obstruction at residue depth k: if all admissible length-L parity/valuation words compatible with a candidate nonconvergent orbit force a strict descent potential, certify the finite search and isolate the exact infinite extension still needed.

## Audit rules

- A density-one premise must be proved, never assumed.
- A power-saving bound for orbits that stay above B is not a bound for all nonconvergent orbits.
- A verified block identity is not a global descent theorem.
- Any claim of global resolution requires statement fidelity, transitive axiom audit, no `sorry`/admitted constants, and a proof that covers cycles and unbounded nonconvergent trajectories.
