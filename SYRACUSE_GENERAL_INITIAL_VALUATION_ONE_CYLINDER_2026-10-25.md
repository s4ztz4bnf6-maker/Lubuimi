# Syracuse initial valuation-one cylinders: general theorem and proof plan

Date: 2026-10-25

## Statement

Let the accelerated odd Syracuse map be T(n)=(3n+1)/2^{v_2(3n+1)} on positive odd integers. Write n_{j+1}=T(n_j). For every integer k≥1,

v₂(3n_j+1)=1 for 0≤j<k iff n₀ ≡ −1 (mod 2^{k+1}).

Equivalently, the set of odd starting integers with an initial run of at least k valuation-one steps is exactly one residue class modulo 2^{k+1}, hence has relative density 2^{-k} among odd integers.

## Proof

When a step has valuation exactly one, n_{j+1}=(3n_j+1)/2. If the first j steps all have valuation one, induction gives

2^j n_j = 3^j n₀ + (3^j−2^j) = 3^j(n₀+1)−2^j,

so n_j = 3^j(n₀+1)/2^j−1.

If n₀ ≡ −1 (mod 2^{k+1}), then for every j<k, the integer 3^j(n₀+1)/2^j is divisible by 2^{k+1−j}, hence by four. Thus n_j ≡ −1 (mod 4), and 3n_j+1 ≡ 2 (mod 4), forcing valuation exactly one. This proves the construction inductively.

Conversely, suppose the first k valuations are one. For each j<k the affine identity gives 2^j(n_j+1)=3^j(n₀+1). Since n_j ≡ 3 (mod 4), the left side is divisible by 2^{j+2}. Hence 2^{j+2} divides 3^j(n₀+1). As 3^j is odd, it is invertible modulo every power of two, so 2^{j+2} divides n₀+1. Taking j=k−1 yields n₀ ≡ −1 (mod 2^{k+1}). This proves the converse directly from the affine identity, without an informal lift-counting step.

## Scope and audit boundary

The density claim is elementary counting: among odd residues modulo 2^{k+1}, there are 2^k residues, and exactly one is −1. This is a finite-prefix statement only. It does not imply global descent, termination, or that every positive integer reaches a smaller iterate.

For Lean formalization, prefer a recursively defined finite-prefix predicate over writing a deeply nested term for every fixed k. Prove the affine identity by induction, then prove the residue characterization by induction on the prefix length. A kernel build and transitive axioms audit remain required before calling the formal result verified.
