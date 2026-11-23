# Audit of proposed Collatz manuscript, Theorem 10.1

**Status: OPEN — not a proof of Collatz.** The manuscript's claim
of a complete proof must be withdrawn pending a global descent lemma.

## Verified algebraic implications (paper level)

For the accelerated odd Syracuse orbit,
`2^A_k x_k = 3^k n + C_k`.
Put `D_k = 2^A_k - C_k - 3^k` and
`R_k = C_k + 3^k - 2^A_k = -D_k`.
Then

`x_k < n ↔ n D_k + (n-1) C_k > 0`.

Thus `D_k > 0` is sufficient (since `C_k ≥ 0` and `n>1`)
but not necessary. The manuscript's statement that the
post-valuation-one-block inequality `D_(r+1)>0` is **the exact
condition** for descent is false.

The residual recurrence is algebraically correct:
`R_(j+1)-3 R_j = 4*2^A_j - 2^A_(j+1)`.
With `c_j=A_(j+1)-j` and `d_j=A_j+2-j`,
this is `2^j(2^d_j-2^c_j)`, **provided the integer exponents
are nonnegative** (which follows from `g_i≥1`).
Do not mislabel this identity as an error.

## Missing global implication

Theorem 10.1 step 6 argues that a finite exponent threshold is
eventually attained along each fixed orbit. That is not established:
the existence of an admissible cylinder with a favorable valuation
does not imply that a prescribed trajectory enters that cylinder.

A precise open obligation is:

`∀ n : ℕ, Odd n → 1 < n → ∃ k ≥ 1, S^[k](n) < n`.

This is essentially the global strict-descent formulation of Collatz,
not an independent shortcut. Any stronger intermediate lemma must
have hypotheses that are provable for **every** relevant orbit.

## Example correction

Accelerated odd Syracuse orbit from 7:
`7 → 11 → 17 → 13 → 5 → 1`.
The first descent below 7 is at step 4; `x_7=2` is false.
For 27, the initial valuation-one run length is one.

## Other audit requirements

- Section 4 uses both `g_j` and `g_(j+1)`; align indexing.
- The residue class modulo `2^(A_k+1)` has density
  `2^(-A_k)` **among odd positive integers**.
- Section 7's corridor needs a complete proof, not a statement
  that monotonicity makes it follow.
- Section 8's prefix-tail exponents, indices, and signs must be
  checked independently before use.
- Section 9's `M_k=-2^A_k z_k` is consistent with the affine identity,
  but it does not force `z_k<0`.
- Distinguish algebraic derivations, GitHub commits, successful
  Lean kernel checks, and unproved global claims.

**Publication wording:** 'A partial formalization and research
program for Syracuse valuation cylinders and descent margins.'
Do not claim a complete Collatz proof or kernel verification of
Theorem 10.1.
