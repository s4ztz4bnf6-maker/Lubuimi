# Syracuse valuation-word residue and offset program — 2026-10-24

## Status
Research note only. No global Collatz/Syracuse theorem is claimed. Existing Lean theorems must be checked in CI before any new formal statement is treated as verified.

## Exact transition arithmetic
For an accelerated odd transition with exponent a,
`2^a * next = 3*n + 1`, and odd `next`, the exponent is maximal:
`2^(a+1)` does not divide `3*n+1`. This is stronger and safer than merely knowing the scaled equality. The existing file contains the maximality lemma and the residue filters for small exponents.

A uniform congruence target is
`(3*n + 1) % 2^(a+1) = 2^a`.
It follows because `next = 2*q+1` for some q, so
`2^a*next = 2^(a+1)*q + 2^a`. The remaining residue of n is unique modulo `2^(a+1)), since 3 is invertible modulo every power of two. Formalizing the first congruence is the clean generic lemma; deriving a closed residue formula for n should be a second theorem, not hard-coded cases.

## Affine block identity and offset
For exponent word a_0,...,a_(k-1), let A_0=0, A_(j+1)=A_j+a_j, and
`C_(j+1)=3*C_j+2^A_j`. Then
`2^A_k*n_k = 3^k*n_0 + C_k`, with
`C_k = sum_{j<k} 3^(k-1-j)*2^A_j`.
This is an exact identity. It does not imply descent.

The exact descent margin is
`C_k < (2^A_k - 3^k)*n_0`,
provided `3^k ≤ 2^A_k`. This makes two separate obstructions explicit:
1. exponent growth: A_k must be large enough relative to k;
2. offset control: even if 2^A_k > 3^k, the weighted sum C_k may still exceed the available margin.

## Proposed formal milestones
1. Prove the generic congruence `(3*n+1) % 2^(a+1)=2^a` from a certified odd quotient.
2. Prove the unique residue class for n modulo `2^(a+1)` without enumerating exponents.
3. Define a finite valuation word as a structure carrying exact transition equations and oddness at every step; distinguish this from an arbitrary list of positive integers.
4. Prove the offset concatenation law and use it to formulate sufficient conditions on consecutive blocks.
5. Search for counterexamples to proposed universal upper bounds on C_k before attempting formal proofs.

## What would count as a breakthrough
A lemma proving a uniform, orbit-valid upper bound on the canonical offset in terms of the descent margin would be materially stronger than further lower bounds on C_k. No such bound is established by this note. A mean multiplier or density theorem cannot replace it for every starting value.
