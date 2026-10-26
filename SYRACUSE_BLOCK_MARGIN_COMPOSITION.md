# Syracuse: exact composition law for signed block margins

This is a derived algebraic identity and a formalization target. It is not a proof that every orbit descends.

Let \(a_j\) be a certified exponent word and \(A_{j+1}=A_j+a_j\), with \(A_0=0\). Let
\[
C_N=\sum_{j<N}3^{N-1-j}2^{A_j},\qquad
D_N=2^{A_N}-C_N-3^N.
\]
Split a word after \(m\) steps and define the relative suffix exponents
\[
B_i=A_{m+i}-A_m.
\]
The suffix offset is
\[
C^{\mathrm{tail}}_n=\sum_{i<n}3^{n-1-i}2^{B_i},
\quad D^{\mathrm{tail}}_n=2^{B_n}-C^{\mathrm{tail}}_n-3^n.
\]
The offset recurrence gives
\[
C_{m+n}=3^n C_m+2^{A_m}C^{\mathrm{tail}}_n,
\qquad A_{m+n}=A_m+B_n.
\]
Consequently the signed margin obeys the exact block-composition identity
\[
\boxed{D_{m+n}=3^nD_m+2^{A_m}D^{\mathrm{tail}}_n.}
\]

## Why this helps

This is stronger structurally than considering each one-step contribution in isolation. It says a long block's margin is the sum of the earlier margin amplified by \(3^n\) and the suffix margin amplified by \(2^{A_m}\). It gives a precise way to reason about concatenated blocks and to identify when a positive suffix can or cannot compensate for a negative prefix.

The identity alone is not a descent proof. A useful Lean theorem must prove the suffix exponent recurrence, relate the suffix offset to the canonical offset, and require that the exponent word is realized by genuine odd Syracuse transitions when translating the margin into an orbit statement.

## Formalization discipline

- Keep the algebraic word identity separate from orbit realizability.
- Preserve maximality of each valuation exponent, equivalently oddness of the next iterate.
- Do not infer global termination from a finite collection of positive-margin blocks.
- Audit the theorem's axiom dependencies and the exact compiled statement.
