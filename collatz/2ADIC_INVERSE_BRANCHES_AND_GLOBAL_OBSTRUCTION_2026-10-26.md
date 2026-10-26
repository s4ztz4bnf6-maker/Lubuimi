# Exact 2-adic inverse branches for odd Syracuse — 2026-10-26

## Purpose and status
This note develops a mathematically exact structural lemma, not a proof of Collatz. It separates a useful continuous 2-adic coding from the missing Archimedean descent statement.

Let Z₂ be the 2-adic integers and let Z₂^odd={y∈Z₂ : y≡1 mod 2}. For each integer a≥1 define
U_a={x∈Z₂ : v₂(3x+1)=a}.
The exceptional point x_* = -1/3 ∈ Z₂ has 3x_*+1=0 and is outside every U_a.

## Exact branch characterization
For a≥1, U_a is a single residue class modulo 2^(a+1): it is the unique class x mod 2^(a+1) satisfying
3x+1 ≡ 2^a (mod 2^(a+1)).
Reason: 3 is invertible modulo every power of 2, so the congruence has exactly one residue solution. That solution is odd and has valuation exactly a.

Define T_a:U_a→Z₂^odd by T_a(x)=(3x+1)/2^a. This is well-defined and continuous on U_a. It is bijective, with inverse
S_a(y)=(2^a y−1)/3, for y∈Z₂^odd.
Indeed 2^a y−1 is odd, division by the 2-adic unit 3 preserves oddness, and 3S_a(y)+1=2^a y, whose valuation is exactly a.

For y,z∈Z₂^odd,
S_a(y)−S_a(z)=(2^a/3)(y−z),
so |S_a(y)−S_a(z)|₂=2^(−a)|y−z|₂.
Thus each inverse branch is a strict 2-adic contraction. This is an exact theorem from the metric and algebra, not a numerical observation.

## What this gives
- Every finite valuation word a₀,…,a_{N−1} determines a composition S_{a₀}∘…∘S_{a_{N−1}} on odd 2-adics.
- The corresponding cylinder is a nested 2-adic residue class, with contraction factor 2^(−Σaᵢ).
- This is the inverse-branch interpretation of the parity/valuation cylinders and can guide a Lean formalization of exact cylinders and their moduli.

## What it does NOT give
2-adic contraction concerns distance in the 2-adic metric, not ordinary size in ℕ. It does not show that positive integer forward orbits decrease, reach 1, or cannot escape to infinity in the ordinary metric. Compactness of Z₂ alone does not create a unique global attracting sink: a compact dynamical system can have many invariant sets and recurrent orbits.

The exact missing bridge would need an additional arithmetic theorem linking these inverse cylinders to Archimedean magnitude, for example a universal descent bound or a contradiction for every positive integer orbit that never descends. No such theorem is established here. K-theory or general topological-dynamical language cannot replace this missing implication without a specific proven invariant.

## Lean target
Formalize in order:
1. `U_a` as a congruence class and prove the valuation characterization.
2. Define `S_a` on odd 2-adics and prove `T_a (S_a y)=y` and `S_a (T_a x)=x`.
3. Prove the exact distance identity `dist (S_a y) (S_a z)= (2:ℝ)⁻¹^a * dist y z` after fixing the Mathlib metric convention, or prove it directly with 2-adic norms.
4. Derive cylinder modulus 2^(Σaᵢ), carefully distinguishing residue-class depth from the ordinary-time parity prefix length.
5. Keep the global Archimedean descent theorem as a separate target; do not infer it from contraction.

## Source-faithful bridge
The accelerated Collatz map D(n)=n/2 for even n and (3n+1)/2 for odd n differs from the odd-only map T by grouping a variable number of D-steps. On a positive odd integer with valuation a, D^a(n)=T(n). On the raw map R(n)=n/2 if even and 3n+1 if odd, R^(a+1)(n)=T(n). These identities should be separately formalized and used for all time-bound conversions.

## Audit requirements
- No `sorry`, `admit`, custom axiom, or unchecked external theorem for the structural lemmas.
- Run `#print axioms` on each exported theorem.
- Verify exact source statement and Lean/Mathlib pin.
- Regression tests are diagnostic only; they are not substitutes for the universal theorem.

