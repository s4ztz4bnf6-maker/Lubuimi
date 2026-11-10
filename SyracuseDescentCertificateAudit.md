# Syracuse: exact descent certificate audit

Date: 2026-10-26
Branch: collatz/valuation-cylinders-2026-10-26

## Purpose

This note separates a valuation-surplus certificate from an actual descent proof. It is a research audit, not a proof of the Syracuse conjecture.

## Exact block identity

For an odd orbit satisfying 2^a_j n_{j+1}=3n_j+1, define A_0=0 and A_j=sum_{i<j} a_i. Iteration gives

2^A_N n_N = 3^N n_0 + C_N,

where C_N = sum_{j=0}^{N-1} 3^(N-1-j) 2^A_j > 0.

Therefore the exact criterion for strict descent at block length N is

n_N < n_0 iff C_N < (2^A_N - 3^N)n_0.

In particular, descent requires 2^A_N > 3^N and a separate upper bound on the positive correction term C_N. A lower bound on A_N alone is not enough.

## Audit of the surplus certificate

The condition 5 A_N - 9 N >= 0 implies A_N/N >= 9/5. Since 9/5 > log_2(3), it implies 2^A_N > 3^N for N>0; this comparison can be formalized using 3^5 < 2^9. But it does not by itself imply n_N < n_0, because C_N is positive and can exceed the available margin (2^A_N - 3^N)n_0.

Thus threshold crossing is only a multiplicative-factor certificate. It is not yet the required descent theorem. Any route using it must additionally prove one of:

1. A uniform bound C_N < (2^A_N - 3^N)n_0 for some block.
2. A different block criterion that directly forces descent.
3. A global contradiction from assuming no block ever descends.

## Moving-anchor obstruction remains

Finite valuation words specify residue classes modulo 2^(A_N+1). Once this modulus exceeds a fixed start value, the least positive representative equals that start value, but this is an identity, not a contradiction. A proof must exploit compatibility of all prefixes and the affine correction term simultaneously.

## Lean targets

Formalize and keep separate: the affine block identity; the implication 5*A_N >= 9*N -> 3^N < 2^(A_N); the exact iff descent criterion; and the missing uniform correction-term estimate.

Do not name the second item a descent lemma. Do not infer pointwise convergence from a density-one theorem. No universal Syracuse theorem is claimed here.
