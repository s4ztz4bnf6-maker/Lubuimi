# Syracuse continuation: exact valuation cylinders and affine descent

Date: 2026-10-27  
Status: exact arithmetic reduction and next proof obligations; **not** a proof of universal Collatz termination.

## 1. Exact valuation cylinder

For odd n, let a = v₂(3n+1) ≥ 1. The condition v₂(3n+1)=a is equivalent to
3n+1 ≡ 2^a (mod 2^{a+1}),
hence to the single residue class
n ≡ r_a := 3^{-1}(2^a-1) (mod 2^{a+1}).
Here 3^{-1} is the inverse of 3 modulo 2^{a+1}, which exists because 3 is odd. This is a precise cylinder statement; the weaker congruence modulo 2^a only says v₂(3n+1) ≥ a and does not determine the exact valuation.

Examples: a=1 gives n ≡ 3 (mod 4); a=2 gives n ≡ 1 (mod 8); a=3 gives n ≡ 5 (mod 16).

## 2. Affine orbit identity

For a prescribed valuation word a₀,…,aₖ₋₁, put Aⱼ = sum of aᵢ for i<j, C₀=0, and
Cⱼ₊₁ = 3Cⱼ + 2^{Aⱼ}.
Whenever the word is realized by an actual odd Syracuse orbit, induction gives
nₖ = (3^k n₀ + Cₖ)/2^{Aₖ}.
Thus the exact strict-descent criterion is
nₖ < n₀ iff Cₖ < (2^{Aₖ} - 3^k)n₀.
If Dₖ = 2^{Aₖ} - 3^k ≤ 0, strict descent is impossible because Cₖ ≥ 0. If Dₖ > 0, descent is equivalent to the integer inequality Cₖ < Dₖ n₀; prefer this division-free form in Lean.

## 3. The missing global step

This reduction is conditional on a valuation word being realizable. It does not show that every orbit has a block whose offset margin is positive, nor that the positive contributions from high valuations dominate the valuation-1 losses uniformly along every orbit. Density or average-drift statements cannot substitute for a pointwise universal argument: an exceptional infinite path could have zero density.

The next formal milestone should therefore be split into two independent lemmas:

- exact_valuation_iff_residue: prove the displayed residue characterization for each a ≥ 1.
- realized_word_affine_descent_iff: from explicit transition equations and positivity of Dₖ, prove the exact affine descent equivalence.

After that, the genuinely global obligation is a separate theorem about all realizable valuation words/orbits. Do not infer it from compactness of Z₂: the accelerated Syracuse map is not automatically a globally continuous self-map with the claimed convergence property, and 2-adic convergence is not ordinary integer descent.

## 4. Acceptance gates

- Lean compilation on the pinned toolchain.
- #print axioms for both lemmas and all dependencies; reject sorryAx and unproved project-specific assumptions.
- Exhaustive checks for small valuation exponents as regression tests, while retaining a symbolic proof.
- Keep the universal termination claim open until the orbit-level margin or a valid alternative global invariant is proved.
