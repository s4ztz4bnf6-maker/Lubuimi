# Syracuse valuation words via one exact congruence

Date: 2026-10-26

## New proof compression
Fix positive exponents a_1,...,a_L. Put K_0=0 and K_j=sum_{i=1}^j a_i. Define the integer-affine expression

F_a(n) = 3^L n + sum_{j=1}^L 3^(L-j) 2^(K_{j-1}).

Repeatedly clearing denominators in the accelerated Syracuse recurrence gives

2^(K_L) T^L(n) = F_a(n)

whenever the first L valuation exponents are exactly a_1,...,a_L.

The stronger converse is the key target: for odd n, the exact valuation word a should be equivalent to

F_a(n) ≡ 2^(K_L) (mod 2^(K_L+1)),

or equivalently v2(F_a(n))=K_L.

## Why the converse is plausible and how to prove it
Write
F_a(n)=3^(L-1)(3n+1)+2^(a_1)G,
where G is odd: the first term in the remaining sum after factoring 2^(a_1) is 3^(L-2), and all subsequent terms are even multiples of it. If v2(F_a(n))=K_L>a_1, then valuation separation forces v2(3n+1)=a_1; if the valuation were smaller, the first summand would control F, and if larger, the odd G term would force v2(F)=a_1. Divide by 2^(a_1), subtract the first step, and apply the same argument inductively to the tail word (a_2,...,a_L).

The base case L=1 is exactly v2(3n+1)=a_1 iff 3n+1 ≡ 2^(a_1) mod 2^(a_1+1).

This gives a single congruence for the entire word. Since the coefficient 3^L is invertible modulo 2^(K_L+1), the congruence F_a(n) ≡ 2^(K_L) mod 2^(K_L+1) determines exactly one residue class modulo 2^(K_L+1). It therefore offers a shorter route to the finite-cylinder theorem than iterated pullback.

## Important proof obligation
The oddness of G and the valuation-separation step must be written with careful hypotheses, especially when applying induction to the tail. This document records a mathematical proof strategy, not a fully checked proof. No Lean compilation or computational regression is claimed.

## Consequence if formalized
The normalized Haar measure of this word cylinder among odd 2-adic inputs is 2^(-K_L)=product_i 2^(-a_i). This remains a finite-cylinder distribution result, not a pointwise Collatz convergence theorem.