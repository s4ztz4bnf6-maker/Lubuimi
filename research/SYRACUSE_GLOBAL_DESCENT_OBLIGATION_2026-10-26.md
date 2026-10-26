# Syracuse global-descent obligation: exact block analysis
Date: 2026-10-26

## Definitions and exact identity

For exponents a_0,...,a_(N-1) >= 1, put
A = sum_i a_i, p_j = sum_{i<j} a_i, and
C = sum_{j=0}^{N-1} 3^(N-1-j) 2^p_j.
Every realized odd-only block satisfies
2^A n_N = 3^N n_0 + C.
The Lean development in SyracuseBlockDescent.lean proves the exact recurrence-based identity and the equivalent exact descent criterion.

## A uniform correction bound

Because every exponent is at least one, p_j <= A-N+j. Therefore
C <= sum_{j=0}^{N-1} 3^(N-1-j) 2^(A-N+j)
  = 2^(A-N) sum_{j=0}^{N-1} 3^(N-1-j) 2^j
  = 2^(A-N)(3^N-2^N).
The last finite sum identity follows by induction on N. The exponent A-N is nonnegative.

Consequently, a sufficient condition for n_N < n_0 is
(2^A-3^N)n_0 > 2^(A-N)(3^N-2^N).
This is sufficient, not necessary.

## Why the mean exponent threshold is insufficient

The inequality 2^A > 3^N only makes the coefficient of n_0 positive. It does not by itself imply the strict inequality above. A realizable finite block already gives a counterexample to the stronger claim that mean exponent above log_2(3) forces every block to descend: start 165, length 17, exponent sequence
(4,1,1,1,1,2,2,1,2,1,1,2,1,1,1,2,3),
with A=27. Its realized endpoint is 167, so it increases despite 27/17 > log_2(3). This is not a counterexample to Collatz convergence.

## The actual global obligation

The next theorem must use the realizability equations
2^(a_i)n_(i+1)=3n_i+1, with n_i,n_(i+1) odd and a_i >= 1,
to derive a stronger constraint than arbitrary positive exponents provide. Promising proof targets are:

1. a realizability-sensitive upper bound for C, using residue constraints at every prefix;
2. a potential V(n) with a blockwise descent inequality for every realized block, not just a density or average condition;
3. a finite-state residue lemma whose invariant controls the correction term and composes over arbitrary block lengths.

A valid global proof must quantify over every realizable block and handle all positive odd starts. Averages, finite searches, and CI success do not discharge this obligation. The conditional Lean theorem is a reusable bridge, not the missing global lemma.
