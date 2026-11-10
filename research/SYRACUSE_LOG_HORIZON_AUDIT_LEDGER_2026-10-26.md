# Syracuse logarithmic-horizon bound: audit ledger

Date: 2026-10-26
Related note: SYRACUSE_LOG_HORIZON_BAD_VALUATION_DENSITY_2026-10-26.md

## Claim being isolated

For fixed c in (1,2), alpha>0, and k=floor(alpha log X), count odd n<=X with A_k(n)<=floor(ck). Under the exact valuation-cylinder lemma, the bound is

#E_X <= (X/2) exp(-k I(c)) + binomial(floor(ck),k),

up to the chosen endpoint convention. Here I(c)=c log(2(c-1)/c)-log(c-1). Since binomial(floor(ck),k) <= exp(k H(c)+O(log k)), with H(c)=c log(c)-(c-1)log(c-1), this is o(X) if alpha>0 and alpha H(c)<1.

## Explicit numerical check

For c=8/5, alpha=1/2: H(c) is approximately 1.0585; alpha H(c) is approximately 0.5293; the combinatorial discrepancy is X^(0.5293+o(1)), hence o(X). I(c)>0, so the Chernoff term is X^(1-alpha I(c)+o(1)), also o(X).

The exact decimal value of I(c) should be generated with a reproducible high-precision script before being included in a formal theorem; positivity alone suffices for the density-zero conclusion.

## Proof obligations (not yet discharged in Lean)

A. Exact cylinders: a word w of positive valuations with total a determines one odd residue class modulo 2^(a+1), and every positive odd integer in that class has exactly that word.

B. Counting: each residue class has X/2^(a+1)+epsilon elements in [1,X], with |epsilon|<=1.

C. Disjointness: distinct words at fixed length are disjoint cylinder classes.

D. Composition count: number of positive words of length k and sum a is binomial(a-1,k-1); summing through floor(ck) gives binomial(floor(ck),k).

E. Tail: the negative-binomial distribution for normalized odd 2-adic measure and the stated Chernoff bound.

F. Floors: Lean statement must handle k=floor(alpha log X), floor(ck), small X, and k>=1 explicitly. The asymptotic statement should be derived from an explicit eventual inequality, not inserted as an informal premise.

## Critical non-implication

Density-zero of E_X only shows that most starts do not have an unusually small valuation sum at this horizon. It does not prove S^k(n)<n, because

2^(A_k) S^k(n)=3^k n+c_k, with c_k=sum_{j=0}^{k-1}3^(k-1-j)2^(A_j)>0.

Even 2^(A_k)>3^k is insufficient unless (2^(A_k)-3^k)n>c_k. A future descent theorem must control this additional term or use a different Lyapunov/renewal argument.

## Status

Research derivation, not a Lean-checked result. No claim of global Collatz proof. CI has no run associated with this documentation-only commit at time of recording.