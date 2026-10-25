# Exact accelerated-block identity and a necessary descent criterion

Date: 2026-10-25

## Scope

This is an exact arithmetic identity for any finite certified sequence of accelerated Syracuse transitions. It is not a proof that every positive odd integer reaches 1, and it does not assume a probabilistic distribution of valuations.

## Definitions

Let \(n_0,\ldots,n_k\in\mathbb N\) and let exponents \(a_0,\ldots,a_{k-1}\in\mathbb N\) satisfy
\[
2^{a_j}n_{j+1}=3n_j+1\quad(0\le j<k).
\]
Set \(A_0=0\) and \(A_j=\sum_{i<j}a_i\). Iterating the transition equation after multiplying the \(j\)-th equation by \(2^{A_j}\) yields
\[
2^{A_k}n_k
=3^k n_0+\sum_{j=0}^{k-1}3^{k-1-j}2^{A_j}.
\]
The correction sum is strictly positive for \(k>0\).

## What this gives, and what it does not

If \(k>0\) and \(n_k<n_0\), then
\[
3^k n_0
<2^{A_k}n_k
<2^{A_k}n_0,
\]
so necessarily \(3^k<2^{A_k}\), equivalently the total valuation must cross the multiplicative threshold \(A_k>k\log_2 3\).

This is only a necessary condition. It is not sufficient: the positive additive correction
\[
C_k=\sum_{j<k}3^{k-1-j}2^{A_j}
\]
must also fit inside the descent margin:
\[
(2^{A_k}-3^k)n_0>C_k.
\]
Thus the familiar average-valuation heuristic loses a real, explicit term. Any claimed block-descent theorem must bound this correction from the actual orbit, not discard it.

## Formalization target

1. Define \(A_j\) by a prefix sum of the exponent list.
2. Prove the exact identity by induction on \(k\), with the transition equation as the only orbit hypothesis.
3. Prove the necessary threshold \(3^k<2^{A_k}\) from strict block descent.
4. Keep the correction-term bound as a separate obligation. Do not silently promote the necessary threshold to a sufficient criterion.

## Adversarial checks

- \(k=0\): the identity is \(n_0=n_0\), and no strict-descent claim is allowed.
- Exponent list containing only 1s: the multiplicative factor is \(3^k/2^k\), already showing the threshold fails.
- Mixed exponents: even when \(2^{A_k}>3^k\), test whether the correction term prevents descent.
- The recurrence must use the actual certified quotient \(n_{j+1}\); natural-number division conventions alone are not a substitute for the transition equation.

## Four-pillar consequence

The candidate invariant is not just average \(v_2(3n+1)\), but the pair \((A_k,C_k)\): accumulated 2-adic valuation plus an exact additive correction. This creates a testable bridge between local residue certificates and finite-block descent. The identity is elementary and source-independent; the missing global work is to prove an orbit-uniform bound on \(C_k\) or a different mechanism forcing descent.
