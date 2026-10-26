# Syracuse: terminal-cylinder lemma, proof boundary, and next formalization gate

Date: 2026-10-26

## Exact statement

Fix a finite word of positive exponents a_0,...,a_{N-1}. Define A_0=0,
A_{k+1}=A_k+a_k and C_0=n, C_{k+1}=3 C_k+2^{A_k}. For every k,
C_k=3^k n + sum_{j<k} 3^{k-1-j} 2^{A_j}.
This is a finite algebraic identity obtained by induction.

The terminal condition C_N ≡ 2^{A_N} (mod 2^{A_N+1}) says that C_N has exact 2-adic valuation A_N, for positive C_N.

## Backward exactness lemma

Assume a_k >= 1 for every k<N. If the terminal condition holds, then for every k<=N,
C_k ≡ 2^{A_k} (mod 2^{A_k+1}).

Proof: suppose the congruence is known at k+1. Since A_{k+1}=A_k+a_k >= A_k+1, the congruence at k+1 implies C_{k+1} ≡ 0 (mod 2^{A_k+1}). But C_{k+1}=3C_k+2^{A_k}, hence
3C_k ≡ -2^{A_k} (mod 2^{A_k+1}). Since 3 is invertible modulo every power of 2 and its inverse is odd, multiplication by that inverse gives
C_k ≡ 2^{A_k} (mod 2^{A_k+1}).
Thus the terminal condition propagates to every prefix valuation.

## Unique residue class

For fixed exponent word, C_N is affine in n with coefficient 3^N. Since gcd(3^N,2^{A_N+1})=1, the terminal congruence has exactly one residue class n modulo 2^{A_N+1}. This is uniqueness for the affine congruence, not by itself a proof that the residue is a positive odd integer or that every intended map-domain constraint holds.

## Essential distinction

The recurrence C_{k+1}=3C_k+2^{A_k} records the affine numerator after clearing accumulated powers of two. To identify it with an actual accelerated Syracuse orbit, separately establish:
1. n is in the required domain (positive odd integer);
2. each prescribed exponent is the exact valuation of 3n_k+1;
3. the quotient n_{k+1} is an integer in the intended domain;
4. the finite recurrence agrees with the actual map at every step.

The backward lemma handles valuation congruences once the terminal condition and positive exponent word are fixed. It does not establish global convergence, exclude all infinite non-descending trajectories, or turn a density identity into a pointwise theorem.

## Lean target sequence

Formalize in this order:
1. Prefix-exponent recurrence and monotonicity under positive exponents.
2. The affine closed form for the composition accumulator.
3. A modular lemma: if B >= A+1, then 2^B is divisible by 2^(A+1).
4. The one-step backward implication using Nat.ModEq and invertibility of 3 modulo 2^(A+1).
5. Induction backward from N to every prefix.
6. Only then connect to the actual valuation definition and audit positivity hypotheses.

This is a proof specification; no Lean compilation is claimed for this document.
