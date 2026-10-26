# Syracuse next-step: cylinder growth is an obstruction to naive compactness arguments

Date: 2026-10-26

## Exact finite-word calculation

For the accelerated Syracuse recurrence
\[
2^{a_j}n_{j+1}=3n_j+1,
\]
put \(A_k=\sum_{j<k}a_j\). Iterating gives
\[
2^{A_k}n_k=3^k n_0+C_k,\qquad
C_k=\sum_{j=0}^{k-1}3^{k-1-j}2^{A_j}.
\]
This identity is exact by induction. It is an affine identity conditional on the recurrence equations; it does not itself show that a proposed exponent word is realizable.

## Constant valuation word a_j=3

For the word of length N with every exponent equal to 3, \(A_j=3j\), and
\[
C_N=\sum_{j=0}^{N-1}3^{N-1-j}8^j=(8^N-3^N)/5.
\]
The terminal condition that the final numerator be divisible by \(2^{3N}\) with odd quotient is equivalent to
\[
5n_0\equiv1\pmod{2^{3N+1}}.
\]
Since 5 is invertible modulo every power of 2, there is a unique residue class. Its least positive representative is the inverse of 5 modulo \(2^{3N+1}\). The exact valuation conditions for every intermediate step must still be checked; terminal congruence alone is not a general word-realizability theorem.

## Growth implication

The least positive representative in this particular residue class grows on the scale of \(2^{3N}=8^N\) (with the exact representative depending on the inverse residue). Thus finite cylinders can exist while their smallest positive integer representatives become very large. A proof of global descent cannot follow from finite-word realizability or 2-adic cylinder existence alone; it needs a uniform bound connecting cylinder constraints to ordinary positive-integer orbit size.

## Audit status

This note records an exact finite calculation and the logical obstruction it illustrates. It is not a proof of the Collatz conjecture, does not claim novelty for finite valuation cylinders, and is not presented as Lean-verified unless a separate compiler and axiom audit is recorded.
