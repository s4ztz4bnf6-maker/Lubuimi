# Syracuse frontier: exact finite-word identity and falsification protocol

Date: 2026-10-26
Status: research note; no global Collatz claim and no Lean compilation claimed.

## 1. Exact identity to make the cylinder computation auditable

Use the accelerated odd Syracuse map
\[
T(x_i)=x_{i+1}=(3x_i+1)/2^{a_i},\qquad a_i=v_2(3x_i+1)\geq 1.
\]
Let \(A_0=0\) and \(A_j=\sum_{i<j}a_i\). Iterating the defining equation gives
\[
2^{A_k}x_k=3^k x_0+\sum_{i=0}^{k-1}3^{k-1-i}2^{A_i}.
\]
This identity follows by induction on \(k\): multiply the equation for step \(k\) by \(2^{A_k}\), then substitute the identity for \(x_k\). It is an exact integer identity, not a probabilistic approximation.

For a proposed finite valuation word \((a_0,\ldots,a_{k-1})\), the identity gives a necessary congruence for \(x_0\) modulo \(2^{A_k}\). The word is valid only if each intermediate numerator has exactly the claimed 2-adic valuation; divisibility by \(2^{a_i}\) alone is insufficient, because it does not exclude divisibility by \(2^{a_i+1}\).

## 2. Reproducible finite-cylinder test

For every word of length k with positive entries and total exponent \(A_k\leq B\):

1. Compute the affine numerator \(N_k=3^k x_0+\sum_{i<k}3^{k-1-i}2^{A_i}\) with integer arithmetic.
2. Solve the congruence \(N_k\equiv0\pmod {2^{A_k}}\) exactly; record whether it has zero, one, or multiple residue classes modulo \(2^{A_k}\).
3. For every candidate residue class, recompute each intermediate \(x_i\) and check \(v_2(3x_i+1)=a_i\), not merely \(a_i\leq v_2(3x_i+1)\).
4. Cross-check the direct recurrence against the closed identity for all prefixes j.
5. Save the word, bound B, residue class, all prefix values, exact valuations, and a hash of the input specification.

The enumeration is a falsification tool for finite claims only. No finite bound B can establish the global Collatz conjecture.

## 3. What this does and does not advance

This isolates the arithmetic interface between valuation cylinders and any proposed window-sparsity estimate. It does not prove the dangerous-window sparsity hypothesis, low-frequency decay, or Collatz. The existing prior-art audit remains in the repository; the finite-cylinder realization itself must not be advertised as new mathematics.

## 4. Lean formalization target

Formalize the recurrence and the identity separately:

- syracuse_step_eq: if 2^a divides 3*x+1 and y = (3*x+1) / 2^a, then 2^a*y = 3*x+1 under explicit positivity/divisibility hypotheses.
- valuation_word_identity: induction over the finite list of exponents, with cumulative sums represented explicitly.
- exact_valuation_prefix: each step includes both divisibility and non-divisibility by the next power of two.

Do not add an axiom for the global conjecture; do not use sorry. Compile and run a transitive axiom audit before reporting any formal status.
