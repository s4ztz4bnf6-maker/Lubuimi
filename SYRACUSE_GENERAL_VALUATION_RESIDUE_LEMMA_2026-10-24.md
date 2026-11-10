# General exact valuation residue lemma (2026-10-24)

## Statement

For an accelerated odd Syracuse transition

`2^a m = 3n+1`

with odd successor `m`, the exponent is exact precisely because `m` is odd. Consequently,

`3n+1 ≡ 2^a (mod 2^(a+1))`.

Equivalently, `n` lies in the unique residue class modulo `2^(a+1)` solving

`3n ≡ 2^a - 1 (mod 2^(a+1))`.

Since 3 is invertible modulo every power of two, this defines one residue class modulo `2^(a+1)` for each exact exponent `a`. The existing low-exponent lemmas are instances:
- `a=1`: `n ≡ 3 (mod 4)`;
- `a=2`: `n ≡ 1 (mod 8)`;
- `a=3`: `n ≡ 5 (mod 16)` (the exact class follows from the congruence);
- higher exponents likewise impose increasingly fine local filters.

## Why this is useful

Instead of maintaining unrelated residue facts for exponents 1, 2, 3, ... individually, the formal development should prove one parameterized congruence theorem and derive each fixed-exponent theorem as a corollary. A further layer can compose these congruence constraints backward along a finite exponent word, producing a single admissibility class modulo a power of two for the entire word.

This gives a rigorous local sieve on exponent words. It does **not** prove that an arbitrary admissible word is globally realizable, nor that its terminal iterate is smaller than its start. The main Collatz obstacle remains quantitative control of the signed offset margin for all actual trajectories.

## Important correction and scope

A finite run of exponent-one steps is bounded in terms of its start, but not uniformly over all starts. The parity of the residual quotient determines whether the run continues. No argument may infer a uniform bound on all negative margin contributions from this fact alone.

This note records a mathematical target for a parameterized Lean theorem; it is not a claim that the new theorem has already been added to the Lean source or kernel-checked.
