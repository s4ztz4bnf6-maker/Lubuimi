# Offset locality and admissible-word audit (2026-10-23)

## Exact local congruence theorem

Let
`C_0=0` and `C_{n+1}=3C_n+2^{A_n}`, with `A_n\in\mathbb N`.
Iterating the recurrence gives
`C_N = sum_{i=0}^{N-1} 3^{N-1-i} 2^{A_i}`.

For every integer r with 0 <= r <= N, the terms with
`i < N-r` are divisible by `3^r`. Hence

`C_N = sum_{i=N-r}^{N-1} 3^{N-1-i} 2^{A_i} (mod 3^r)`.

This is a finite-memory congruence: the residue of the accumulated offset
modulo `3^r` depends only on the last r exponent entries, not on the earlier
prefix. The existing modulo-3 lemma is exactly the r=1 case.

## Why this is useful, and what it does not prove

This yields a rigorous pruning layer for candidate valuation words: if a
candidate block also asserts a terminal congruence for `2^{A_N} n_N =
3^N n_0 + C_N`, its last r exponents determine the offset residue modulo
`3^r`. Such tests can reject inconsistent certificates cheaply.

It does **not** show that a surviving word is realizable by an odd Syracuse
orbit, and it does not prove descent. Those require the exact divisibility
condition `2^{A_N} | 3^N n_0 + C_N`, positivity/oddness of each intermediate
iterate, and the strict margin
`C_N < (2^{A_N} - 3^N) n_0` when `3^N <= 2^{A_N}`.

## Next formalization target

Formalize the finite-memory congruence as a Lean theorem parameterized by
`r <= N`, then build a certificate checker that combines:
1. the affine identity;
2. terminal divisibility;
3. the local odd-transition valuation constraints;
4. the strict offset margin.

The checker should classify a word as *rejected*, *arithmetically admissible*,
or *orbit-certified*. It must never conflate the latter two categories.

## Mathematical status

The finite-memory congruence follows directly from the weighted-sum formula
already present in `SyracuseOffsetIdentity.lean`; it is a proposed next lemma,
not a claim that it has already been compiled or added to that Lean file.
The global Collatz conjecture remains open; finite local filters do not
establish universal termination.
