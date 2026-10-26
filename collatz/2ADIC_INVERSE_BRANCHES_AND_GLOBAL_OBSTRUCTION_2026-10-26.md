# Exact 2-adic inverse branches for odd Syracuse — 2026-10-26

## Purpose and status
This note develops exact structural lemmas, not a proof of Collatz. It separates a useful continuous 2-adic coding from the missing Archimedean descent statement.

Let Z₂ be the 2-adic integers and let Z₂^odd={y∈Z₂ : y≡1 mod 2}. For each integer a≥1 define U_a={x∈Z₂ : v₂(3x+1)=a}. The exceptional point x_* = -1/3 ∈ Z₂ has 3x_*+1=0 and is outside every U_a.

## Exact branch characterization
For a≥1, U_a is a single residue class modulo 2^(a+1): it is the unique class x mod 2^(a+1) satisfying 3x+1 ≡ 2^a (mod 2^(a+1)). Reason: 3 is invertible modulo every power of 2, so the congruence has exactly one residue solution. That solution is odd and has valuation exactly a.

Define T_a:U_a→Z₂^odd by T_a(x)=(3x+1)/2^a. This is well-defined and continuous on U_a. It is bijective, with inverse S_a(y)=(2^a y−1)/3, for y∈Z₂^odd. Indeed 2^a y−1 is odd, division by the 2-adic unit 3 preserves oddness, and 3S_a(y)+1=2^a y, whose valuation is exactly a.

For y,z∈Z₂^odd, S_a(y)−S_a(z)=(2^a/3)(y−z), so |S_a(y)−S_a(z)|₂=2^(−a)|y−z|₂. Thus each inverse branch is a strict 2-adic contraction. This is an exact theorem from the metric and algebra, not a numerical observation.

## New exact affine formula for a finite valuation word
Fix positive integers a₀,…,a_{N−1}, let A=Σᵢ aᵢ, and suppose an integer orbit follows exactly these valuations: n_{i+1}=(3n_i+1)/2^{aᵢ}, for 0≤i<N. Define prefix sums p₀=0 and p_j=Σ_{i<j}aᵢ. Iterating the inverse relation n_i=(2^{aᵢ}n_{i+1}−1)/3 gives the identity

    3^N n₀ = 2^A n_N − Σ_{j=0}^{N−1} 3^j 2^{p_j}.

Proof is by induction on N: the case N=0 is immediate; applying the one-step inverse to the length-N identity multiplies the terminal term by 2^{a₀}, subtracts the appropriate factor, and yields the displayed prefix sum. A Lean proof should state the induction invariant with the prefix sums explicit, avoiding any informal simplification of exponents.

Consequently every such valuation word forces the terminal congruence

    2^A n_N ≡ Σ_{j=0}^{N−1}3^j 2^{p_j} (mod 3^N).

Since 2^A is invertible modulo 3^N, the word determines one residue class for n_N modulo 3^N. This is an arithmetic constraint complementary to the 2-adic cylinder modulus: valuation data controls a residue class at a power of 2 on the starting side and a residue class at a power of 3 on the terminal side.

This cross-modulus constraint is exact and potentially useful for ruling out proposed finite valuation patterns or cycles. It does not by itself rule out every infinite positive orbit; no universal contradiction or descent bound has been obtained from it.

## What this gives
- Every finite valuation word determines a composition S_{a₀}∘…∘S_{a_{N−1}} on odd 2-adics.
- The corresponding 2-adic cylinder has contraction factor 2^(−Σaᵢ).
- The same word imposes the explicit 3^N terminal congruence above.
- These two moduli provide independent formal invariants for future cylinder-intersection and cycle-exclusion work.

## What it does NOT give
2-adic contraction concerns distance in the 2-adic metric, not ordinary size in ℕ. It does not show that positive integer forward orbits decrease, reach 1, or cannot escape to infinity in the ordinary metric. Compactness of Z₂ alone does not create a unique global attracting sink: a compact dynamical system can have many invariant sets and recurrent orbits.

The exact missing bridge would need an additional arithmetic theorem linking these cylinders and congruences to Archimedean magnitude, for example a universal descent bound or a contradiction for every positive integer orbit that never descends. No such theorem is established here. K-theory or general topological-dynamical language cannot replace this missing implication without a specific proven invariant.

## Lean target
Formalize in order:
1. U_a as a congruence class and prove the valuation characterization.
2. Define S_a on odd 2-adics and prove T_a(S_a y)=y and S_a(T_a x)=x.
3. Prove the exact distance identity dist(S_a y,S_a z)= (2:ℝ)⁻¹^a * dist y z after fixing the Mathlib metric convention, or prove it directly with 2-adic norms.
4. Prove the finite affine iterate identity by induction on N.
5. Derive the terminal congruence modulo 3^N and explicitly prove invertibility of 2^A modulo 3^N.
6. Derive cylinder modulus 2^(Σaᵢ), carefully distinguishing residue-class depth from the ordinary-time parity prefix length.
7. Keep the global Archimedean descent theorem as a separate target; do not infer it from contraction.

## Source-faithful bridge
The accelerated Collatz map D(n)=n/2 for even n and (3n+1)/2 for odd n differs from the odd-only map T by grouping a variable number of D-steps. On a positive odd integer with valuation a, D^a(n)=T(n). On the raw map R(n)=n/2 if even and 3n+1 if odd, R^(a+1)(n)=T(n). These identities should be separately formalized and used for all time-bound conversions.

## Audit requirements
- No sorry, admit, custom axiom, or unchecked external theorem for the structural lemmas.
- Run #print axioms on each exported theorem.
- Verify exact source statement and Lean/Mathlib pin.
- Regression tests are diagnostic only; they are not substitutes for the universal theorem.
