# Universal Syracuse threshold: arithmetic obstruction and proof obligations

Date: 2026-10-26
Branch: collatz/valuation-cylinders-2026-10-26

## The universal statement we actually need

For every positive odd start n, let n_{i+1}=T(n_i), a_i=v₂(3n_i+1), A_N=Σ_{i<N}a_i, and S_N=5A_N-9N. The current certificate route needs a theorem of the form

[
\forall n\in 2\mathbb N+1,\ \exists N\ge1:\ S_N(n)\ge0.
]

The density-one result proves this only for all starts outside a set of relative natural density zero. It does not prove the displayed universal quantifiers.

## What a hypothetical exceptional integer orbit must satisfy

If an odd start never crosses the threshold, then for every N≥1,
[
5A_N\le9N-1,\qquad A_N\le\left\lfloor\frac{9N-1}{5}\right\rfloor.
]
This is a global prefix restriction on its actual valuation sequence. It is not a restriction that can be contradicted by forbidding one finite word: every finite positive valuation word is realized by a nonempty odd residue class.

The exact affine identity for every actual orbit is
[
2^{A_N}n_N=3^Nn_0+C_N,\qquad
C_N=\sum_{j=0}^{N-1}3^{N-1-j}2^{A_j}.
]
The term C_N is positive and odd. The identity gives additional integer divisibility information, but the prefix bound A_N<9N/5 alone does not contradict positivity or integrality of n_N. In particular, it would be invalid to claim that low average valuation forces a contradiction merely because 3^N/2^{A_N} is large: the positive correction term C_N/2^{A_N} must be retained.

## Exact point where the present certificate route stops

The suffix certificate uses lower bounds on every suffix increment A_N-A_j, not only on the total A_N. A record-time argument can turn certain endpoint surplus statements into descent, but it does not establish that every actual orbit has such an endpoint. The statement “typical valuation increments have mean 2” is a probability statement about natural density/Haar measure, not a deterministic constraint on every integer orbit.

Thus there are two honest routes:
1. prove the universal threshold-crossing theorem above; or
2. find a different descent certificate that is satisfied by every actual orbit without requiring S_N≥0.

Neither follows from the current density argument.

## A candidate arithmetic bridge, stated as a target rather than a result

The next mathematically meaningful target is to combine the affine identity with a uniform lower bound on suffix exponents. For constants q>3 and K≥0, a condition of the form
[
A_N-A_j\ge (N-j)\log_2 q-K\quad(0\le j<N)
]
bounds the correction sum geometrically (up to the factor 2^K) and controls the main term 3^N/2^{A_N}. One can then derive a quantitative descent/finite-state consequence. The missing universal lemma is to show that every integer orbit admits enough such suffix control, or to prove a different arithmetic obstruction to an orbit lacking it.

This target must not be weakened to an average-only statement without checking the correction sum. Average growth of A_N does not automatically bound every suffix A_N-A_j.

## Formalization sequence now tracked

1. Exact residue-class cylinder equivalence and relative density.
2. Finite indexing of bad words from coordinate bounds.
3. Pairwise disjointness of cylinders and finite-union density sum.
4. Exact finite geometric product law.
5. Rational Chernoff constant (the exact inequality is now isolated in SyracuseDensityArithmetic.lean).
6. Count monotonicity under E ⊆ B_N and upper-density/limsup transfer.
7. Separately, the universal arithmetic lemma; do not identify it with steps 1–6.

The first five are finite arithmetic/probability obligations. Step 6 is an asymptotic transfer obligation. Step 7 is the open mathematical bottleneck. The Lean CI can verify encoded lemmas but cannot supply the missing theorem automatically.

## Status

This note is a research checkpoint, not a proof of universal threshold crossing. No universal Collatz result is claimed.
