# Exact arbitrarily long exponent-one Syracuse runs

Date: 2026-10-25

## Result (elementary, exact)

For every integer r >= 1, define
`n_i = 3^i * 2^(r+1-i) - 1`, for `0 <= i <= r`.

Then:
1. Every `n_i` is a positive odd integer.
2. For every `i < r`, `3*n_i + 1 = 2*n_(i+1)`.
3. For every `i < r`, `n_i = 3 (mod 4)), so `v₂(3*n_i+1)=1).
4. Hence the accelerated Syracuse orbit starting at `n_0=2^(r+1)-1` has at least r consecutive exact valuation-one transitions and reaches `n_r=2*3^r-1`.

### Proof

Since `r+1-i >= 1`, the product `3^i 2^(r+1-i)` is even, so `n_i` is odd; it is positive for the stated range. For `i<r`, `r+1-i >= 2), so the power of two is divisible by four and `n_i ≡ -1 ≡ 3 (mod 4)`. Direct calculation gives
`3*n_i+1 = 3^(i+1) 2^(r+1-i)-2 = 2(3^(i+1)2^(r-i)-1)=2*n_(i+1)`.
Because `n_i ≡ 3 (mod 4)), `3*n_i+1 ≡ 2 (mod 4)`; its 2-adic valuation is exactly one. This proves every assertion.

## Why this matters

This is an exact obstruction to a common proof shortcut: there is no uniform finite upper bound on the number of consecutive exponent-one transitions. The sequence is not a counterexample to Collatz; its starting value depends on r, and this only demonstrates arbitrarily long finite stretches.

The existing local lemma says every nondecreasing odd transition must have exponent one and start at residue 3 mod 4. The family above sharpens that local statement by realizing arbitrary run length explicitly. Therefore a valid global descent proof must tolerate long exponent-one blocks and establish compensating descent across larger blocks, or use a different global invariant. It cannot assume a fixed maximum run length.

## Formalization target

Add a Lean theorem parameterized by `r`, with:
- an indexed definition of `n_i`;
- positivity and oddness;
- exact transition equation;
- residue modulo four;
- exact valuation one using the project's actual `v₂`/valuation interface;
- a derived statement that the accelerated orbit follows the constructed sequence for the first r steps.

The arithmetic identities should be formalized first, independently of any global Collatz claim. A CI success should be accompanied by `#print axioms` for the new theorem and the actual imported definitions.

## Status boundary

The identity and proof above are mathematical derivations in this note. They have **not** yet been added as a Lean theorem in the repository. The current weighted-correction branch CI is green for its existing targets; that does not certify this new formalization or prove global Collatz termination.
