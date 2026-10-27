# Explicit all-ones valuation cylinder and constructive fixed-block obstruction

Date: 2026-10-27  
Status: paper proof; not yet Lean-compiled.

## Theorem

For every integer N ≥ 1 and m ≥ 1, the odd start n₀ = 2^(N+1)m − 1 has exact accelerated Syracuse valuations k₀ = … = k_(N−1) = 1. Its Nth iterate is n_N = 2·3^N m − 1 > n₀. Thus the all-ones valuation word is realized by an explicit infinite arithmetic progression, and no fixed N gives strict descent for every odd start.

## Proof

For 0 ≤ j ≤ N, set n_j = 3^j(n₀+1)/2^j − 1 = 3^j·2^(N+1−j)m − 1. For j < N, the exponent N+1−j is at least 2, so n_j ≡ −1 ≡ 3 (mod 4). Therefore 3n_j+1 ≡ 2 (mod 4), giving v₂(3n_j+1)=1. Direct substitution yields n_(j+1)=(3n_j+1)/2, so induction proves this is the accelerated orbit for the first N steps.

At j=N, n_N=2·3^N m−1. Since 3^N>2^N, we have n_N>2^(N+1)m−1=n₀.

This refutes only universal strict descent at a fixed block length. The starting value depends on N; the result does not exhibit a single orbit diverging to infinity and does not refute the Collatz conjecture.

## Lean targets

Formalize (i) the closed form by induction, (ii) n_j mod 4 = 3 for j<N, (iii) exact valuation one from the mod-4 fact, and (iv) strict growth via 3^N>2^N using exact arithmetic. Do not use floating-point logarithms.
