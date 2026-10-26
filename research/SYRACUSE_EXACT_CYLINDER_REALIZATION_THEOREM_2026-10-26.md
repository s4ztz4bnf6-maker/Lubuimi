A strengthened exact-cylinder lemma for accelerated Syracuse

Date: 2026-10-26

## Statement

Fix N >= 1 and positive exponents a_0,...,a_(N-1). Let A_0=0, A_(k+1)=A_k+a_k, C_0=n, and C_(k+1)=3*C_k+2^A_k. For fixed exponent word, C_N is affine in n with coefficient 3^N. Therefore the terminal congruence C_N = 2^A_N modulo 2^(A_N+1) has exactly one solution class for n modulo 2^(A_N+1), since 3^N is invertible modulo this power of two.

## The residue class is odd

Modulo 2, the recurrence expansion gives C_N = 3^N*n + sum_(j<N) 3^(N-1-j)*2^A_j. Since A_0=0 and A_j >= 1 for j>0, the sum is odd. The terminal congruence makes C_N even. Hence n is odd. In particular the unique residue class has a positive odd representative (take its least nonnegative representative, which cannot be zero).

## Terminal exactness propagates backwards

If C_(k+1) is divisible by 2^A_(k+1), then, because A_(k+1)>=A_k+1, it is divisible by 2^(A_k+1). The recurrence gives 3*C_k = -2^A_k modulo 2^(A_k+1). Inverting 3 modulo 2^(A_k+1) yields C_k = 2^A_k modulo 2^(A_k+1). Starting from the terminal condition, backward induction proves this for all k <= N. Thus each C_k has exact 2-adic valuation A_k.

## Recovering a genuine finite accelerated Syracuse orbit

For the positive odd representative n, define n_k = C_k / 2^A_k. Backward exactness ensures these are positive integers and odd. The recurrence gives

2^a_k * n_(k+1) = 3*n_k + 1.

Since n_(k+1) is odd, the exponent a_k is exactly v2(3*n_k+1). Therefore n_(k+1) is precisely the accelerated Syracuse iterate of n_k, and the prescribed word is realized by an actual finite orbit. This closes the earlier concern about needing to establish oddness and exact valuation separately: they follow from the terminal cylinder condition and positivity.

## Exact conclusion and limitation

For every finite positive exponent word, there is exactly one starting residue class modulo 2^(A_N+1) realizing that word as the first N exact valuations of the accelerated odd Syracuse map. This is an exact finite-cylinder classification, not a global convergence proof. It does not show that every infinite exponent sequence corresponds to a positive integer start, nor does it rule out a non-descending or divergent orbit. Any density or measure consequence must remain distinct from pointwise convergence.

## Formalization target

Lean should prove, in order: (1) affine closed form for C_N; (2) invertibility of 3 modulo powers of two; (3) uniqueness of the terminal residue class; (4) oddness of the residue class; (5) backward exactness; (6) divisibility and oddness of n_k=C_k/2^A_k; (7) the exact step equation and equality with the accelerated map. The final theorem should state the finite-word realization theorem explicitly. No Lean compilation is claimed for this document.