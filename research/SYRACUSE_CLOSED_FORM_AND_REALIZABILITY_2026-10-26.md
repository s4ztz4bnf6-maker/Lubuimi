# Syracuse finite-prefix closed form and realizability obligations

Date: 2026-10-26

## Status

The CI-confirmed module `SyracuseAffineCore.lean` proves the finite-prefix identity

\[
2^{A_N} n_N=C_N,\qquad
A_0=0,\ A_{k+1}=A_k+a_k,\quad
C_0=n_0,\ C_{k+1}=3C_k+2^{A_k},
\]

assuming the local equations \(2^{a_k}n_{k+1}=3n_k+1\). This is conditional algebra, not global Collatz convergence.

## Derived closed form

Repeatedly expanding the recurrence gives

\[
C_N=3^N n_0+\sum_{j=0}^{N-1}3^{N-1-j}2^{A_j}.
\]

Proof: induction on \(N\). At \(N=0\), the sum is empty. If the formula holds at \(N\), then
\[
C_{N+1}=3C_N+2^{A_N}
=3^{N+1}n_0+\sum_{j=0}^{N-1}3^{N-j}2^{A_j}+2^{A_N},
\]
which is exactly the formula for \(N+1\).

## Formalization target

Add a Lean theorem equating `affineCompositionRhs a n N` with the closed finite sum, using `Finset.sum_range_succ` and explicit exponent arithmetic. Compile in the repository's pinned Lean/Mathlib environment before reporting it as verified.

## The crucial next bridge: exact valuations

A genuine Syracuse step requires more than the equation. For the usual odd map,
\[
T(n)=(3n+1)/2^{v_2(3n+1)},
\]
one needs \(n_k\) odd and positive, \(2^{a_k}\mid 3n_k+1\), and \(2^{a_k+1}\nmid 3n_k+1\), with \(n_{k+1}\) equal to the resulting quotient. These conditions must be encoded explicitly; arbitrary exponent words need not be realizable.

## Audit guardrails

- Do not infer convergence from compactness of \(\mathbb Z_2\).
- Do not infer global descent from a mean multiplier.
- Separate finite-prefix identities, realizability, and global convergence as distinct theorem layers.
