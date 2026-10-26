# Syracuse finite-cylinder theorem: general proof route

Date: 2026-10-25
Branch: collatz/offset-margin-roadmap-2026-10-23

## Exact statement

For the accelerated odd Syracuse map T(n)=(3n+1)/2^{v₂(3n+1)}, the first k valuations all equal one exactly when n₀ ≡ -1 (mod 2^{k+1}). The current Lean file has expanded instances for k=2,3,4,5. These are finite-prefix classifications, not a proof of global Collatz descent.

## Algebraic invariant

During a run where each valuation equals one, the update is n_{j+1}=(3n_j+1)/2, so

  2^j(n_j+1)=3^j(n₀+1).

This is the useful invariant: it removes deeply nested divisions from the statement and exposes the exact power of two.

### Forward direction

If the valuation at stage j is one, then n_j ≡ 3 (mod 4), hence 4 divides n_j+1. From the invariant, 2^{j+2} divides 3^j(n₀+1). Since 3^j is odd, it is invertible modulo every power of two, so 2^{j+2} divides n₀+1. Taking j=k-1 yields 2^{k+1} divides n₀+1.

### Reverse direction

If n₀+1=2^{k+1}q, then for every j<k, the invariant gives n_j+1=2^{k+1-j}3^jq, which is divisible by four. Thus n_j ≡ 3 (mod 4), equivalent to v₂(3n_j+1)=1. This also inductively certifies that the accelerated update used to reach the next state is the unaccelerated division by two.

## Formalization strategy

1. Define the one-step map U(n)=(3n+1)/2 on odd n, separately from accelerated T.
2. Prove a recurrence lemma for U(n)+1=3(n+1)/2 under the required divisibility hypothesis.
3. State the finite-prefix property recursively, rather than repeating a deeply nested expression.
4. Prove the general cylinder theorem by induction on k, then derive k=2,3,4,5 as corollaries.
5. Keep the v₂ formulation and the modular formulation linked by explicit lemmas; do not treat a remainder condition alone as a global trajectory theorem.

This route should remove the heartbeat-sensitive giant omega goal. It is a proof plan until implemented and compiled; the existing expanded five-step theorem must not be reported as passing until CI completes.

## Continuous / 2-adic audit boundary

The accelerated map on Z₂ is not globally continuous by simply substituting 2-adic inputs into the valuation formula: the valuation is locally constant on cylinders away from 3x+1=0, but becomes unbounded near x=-1/3. Compactness of Z₂ does not imply that every positive-integer orbit converges, nor does a Haar-almost-everywhere statement settle the countable set of positive integers (which has Haar measure zero). Any continuous model must specify its domain, exceptional set, and the map or semiflow it actually represents before compactness or K-theoretic tools can be applied.

## Status

Research note only. No global Collatz theorem is claimed. Required evidence for the formal result: completed CI, #print axioms inspection for the general theorem and corollaries, and no sorryAx or unjustified project axioms.
