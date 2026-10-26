# Exact finite valuation-word realization

## Statement

Let N be a positive integer and let a_0, ..., a_{N-1} be any prescribed positive integers. There exists a positive odd integer x_0 whose first N accelerated Syracuse valuations are exactly this word:

x_{i+1} = (3 x_i + 1) / 2^{a_i},   v_2(3 x_i + 1) = a_i  for 0 ≤ i < N.

This is a finite-word existence result only. It does not say that one fixed starting value realizes an arbitrary infinite word, and it does not imply Collatz convergence.

## Proof idea by a single congruence cylinder

Put A_i = sum_{j<i} a_j and

C_N = sum_{j<N} 3^{N-1-j} 2^{A_j}.

Repeated substitution gives the affine identity

2^{A_N} x_N = 3^N x_0 + C_N.

Because 3^N is invertible modulo 2^{A_N}, there is a unique residue class x_0 modulo 2^{A_N} for which 3^N x_0 + C_N is divisible by 2^{A_N}. Choose a representative x_0 in that class and vary it by t 2^{A_N}. This changes the quotient x_N by 3^N t, an odd multiple of t, so the parity of x_N can be selected. Choose t so that x_N is odd, and then choose t sufficiently large with that parity to ensure x_0 > 0.

It remains to verify all prefixes. For i ≤ N, write

F_i = 3^i x_0 + C_i.

The affine sums satisfy

F_N = 3^{N-i} F_i + sum_{j=i}^{N-1} 3^{N-1-j} 2^{A_j}.

Every term in the latter sum is divisible by 2^{A_i}. Since 2^{A_N} divides F_N and 3 is invertible modulo every power of 2, it follows that 2^{A_i} divides F_i. Thus every intermediate x_i = F_i / 2^{A_i} is an integer. Since a_i ≥ 1, divisibility of 3x_i+1 by 2 forces x_i to be odd. The chosen quotient x_N is odd; therefore each quotient relation gives

3 x_i + 1 = 2^{a_i} x_{i+1}

with x_{i+1} odd, proving that the valuation is exactly a_i at every step.

## Why this helps and what it does not solve

This separates two questions that must not be conflated:

1. **Finite-word realizability:** every positive-integer valuation word can occur for some positive odd starting value.
2. **Fixed-start infinite compatibility:** can a single fixed positive integer realize arbitrarily long prefixes of a particular infinite word, or satisfy a uniform descent property?

The first follows from an explicit 2-adic congruence cylinder. The second is the genuine obstruction for turning finite residue calculations into a global Collatz argument. A proof of convergence must control the actual orbit of each fixed starting value, not merely show that every finite pattern occurs somewhere.
