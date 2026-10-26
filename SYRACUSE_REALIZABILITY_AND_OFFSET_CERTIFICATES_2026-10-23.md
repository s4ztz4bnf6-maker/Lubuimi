# Syracuse: realizable block certificates and offset barriers (2026-10-23)

## Scope

This is a proof roadmap, not a proof of the Collatz conjecture. The exact algebraic offset identity is already represented in SyracuseOffsetIdentity.lean. The missing global statement is a uniform descent certificate for every odd start greater than one.

## Certificate design

For a proposed odd-to-odd block of length k, record (n_0,...,n_k; a_0,...,a_{k-1}) with:

1. every n_i positive and odd;
2. 2^{a_i} n_{i+1}=3n_i+1;
3. the quotient n_{i+1} is odd, certifying maximality of the removed power of two;
4. A_0=0, A_{i+1}=A_i+a_i;
5. C_0=0, C_{i+1}=3C_i+2^{A_i};
6. the affine identity 2^{A_k}n_k=3^k n_0+C_k.

Items 2 and 3 prevent a free valuation word from masquerading as a genuine orbit. The existing theorem exponent_is_maximal_of_odd_quotient addresses the exactness component; offset_identity_of_certified_steps propagates the affine identity.

## Exact descent test

The block descends strictly iff 3^k n_0+C_k < 2^{A_k}n_0. Equivalently, with G=2^{A_k}-3^k, descent requires G n_0>C_k. If G<=0, descent is impossible for positive n_0 and nonnegative C_k. If G>0, the exact integer threshold is n_0>=floor(C_k/G)+1.

This is an equivalence, not an estimate on C_k. The global obligation is to show that every start either has a certified descending block or is handled by another rigorously proved case.

## A finite-state exploration that does not overclaim

For a fixed cutoff K, residue transitions modulo 2^K can classify which low-order valuation prefixes are forced by a residue class. The result is a finite certificate for those prefixes only. It must not be extended to unbounded valuations without a separate argument: a residue modulo 2^K cannot decide divisibility by every higher power of two.

A sound research loop is therefore:
- enumerate residue classes and certified valuation prefixes for a chosen K;
- compute exact integer bounds on G n_0-C_k;
- emit counterexample witnesses whenever a proposed universal block bound fails;
- formalize the finite result and its precise scope in Lean;
- increase K only after boundary cases are accounted for.

## Falsification gates

Reject a proposed global argument if it relies only on average valuation, a favourable multiplier 2^{A_k}>3^k, or a block word that has not been shown realizable. These conditions alone do not control the additive offset.

## External status

The full Collatz conjecture remains open. Finite verification (including published verification below 2^71) and almost-all results are important evidence but do not establish universal termination.