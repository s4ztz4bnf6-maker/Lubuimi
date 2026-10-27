# Explicit all-ones valuation cylinder and constructive fixed-block obstruction

Date: 2026-10-27  
Status: paper proof; not yet Lean-compiled.

## Theorem

For every integer N ≥ 1, every odd start
n₀ = 2^(N+1)m − 1, with m ≥ 1,
has exact accelerated Syracuse valuations k₀ = … = k_(N−1) = 1. Its Nth iterate is
n_N = (3/2)^N(n₀+1) − 1 > n₀.
Thus the all-ones valuation word is realized by an explicit infinite arithmetic progression, and no fixed N gives strict descent for every odd start.

## Proof

Set n_j = 3^j(n₀+1)/2^j − 1 for 0 ≤ j ≤ N. Because n₀+1 is divisible by 2^(N+1) and 3 is odd, the expression 3^j(n₀+1)/2^j is an even integer divisible by 4 whenever j ≤ N−1: indeed 2^(N+1−j) divides it, and N+1−j ≥ 2. Hence n_j ≡ −1 ≡ 3 (mod 4) for every j < N.

Therefore 3n_j+1 ≡ 3·3+1 ≡ 2 (mod 4), so v₂(3n_j+1)=1. The accelerated step is
n_(j+1) = (3n_j+1)/2 = 3^(j+1)(n₀+1)/2^(j+1) − 1,
so induction gives the claimed orbit through step N.

Finally,
n_N+1 = (3/2)^N(n₀+1).
Since 3^N > 2^N and n₀+1 > 0, n_N+1 > n₀+1 and hence n_N > n₀.

## Why this improves the earlier argument

The result no longer relies on an abstract cylinder-existence statement. It explicitly gives the starting residue class n₀ ≡ −1 (mod 2^(N+1)) and a closed form for every iterate in the block. It is still only a fixed-block obstruction: the starting value depends on N, so this does not exhibit a single orbit diverging to infinity.

## Lean proof targets

1. Divisibility: if 2^(N+1) divides n₀+1 and j ≤ N−1, prove 4 divides 3^j * ((n₀+1)/2^j), with divisibility expressed without integer division until the divisibility fact is established.
2. Congruence: derive n_j ≡ 3 modulo 4.
3. Exact valuation: n_j mod 4 = 3 implies the 2-adic valuation of 3*n_j+1 is 1 (use the project's actual valuation definition).
4. Closed form: induct on j.
5. Strict growth: use 3^N > 2^N with exact natural/integer arithmetic, not floating-point logarithms.

Do not declare the final global Collatz conjecture or divergence of a single orbit.
