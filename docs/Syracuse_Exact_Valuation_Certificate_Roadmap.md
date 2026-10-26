# Syracuse audit: exact finite valuation-word certificates

Status: specification / proof plan, not a proof of the global Collatz conjecture.

## Algebraic core

For an exponent word a : Fin N -> Nat, define prefix sums A_0 = 0 and
A_(k+1) = A_k + a_k, and affine offsets C_0 = 0,
C_(k+1) = 3*C_k + 2^A_k. Then any certified odd trajectory satisfies

  2^A_k * n_k = 3^k * n_0 + C_k.

The existing theorem `offset_identity_of_certified_steps` proves this identity
from the transition equations. This identity alone does not establish that an
arbitrary exponent word is realizable.

## Proposed next interface: a finite certificate

A certificate for a word of length N should contain natural numbers
`n : Fin (N+1) -> Nat`, `a : Fin N -> Nat`, and `A : Fin (N+1) -> Nat`
with the following independent obligations:

1. `n 0 > 0`, every `n k` is odd, and each exponent `a k > 0`.
2. `A 0 = 0` and `A (k+1) = A k + a k`.
3. Exact transition: `2^(a k) * n(k+1) = 3*n(k) + 1`.
4. Exact valuation, not merely divisibility: `2^(a k) ∣ 3*n(k)+1` and
   `2^(a k+1) ∤ 3*n(k)+1`. A cleaner implementation may define exact
   2-adic valuation through Mathlib's existing valuation API, after confirming
   its convention at zero and on natural numbers.
5. The affine offset recurrence and identity are derived consequences, not
   duplicate axioms/fields unless packaging them improves proof ergonomics.

Target theorem pair:
- soundness: a certificate induces a genuine finite accelerated-odd orbit;
- completeness: every finite accelerated-odd orbit yields such a certificate.

Completeness and soundness must explicitly preserve the *exact* valuation.
Residue filters (for example exponent 1 forcing n mod 4 = 3; exponent 2
forcing n mod 8 = 1; exponent 3 forcing n mod 16 = 13; exponent 4 forcing
n mod 32 = 5) are necessary filters only.

## Strict descent interface

From `2^A * nN = 3^N * n0 + C`, with `n0 > 0`, `C > 0`, and
`nN < n0`, the current lemma derives `3^N < 2^A`. This is necessary,
not sufficient. A future stopping-time theorem must retain the offset term
and the exact initial value; replacing the problem by the average heuristic
`A/N > log_2(3)` is not justified for every finite word.

## Research guardrails

Terras-style parity-vector and stopping-time results concern distributional or
finite-prefix structure; they do not by themselves imply pointwise termination.
Large-scale computation is bounded verification, not a proof for all integers.
The new 2026 parity-vector preprint by Tong Niu explicitly distinguishes its
unconditional finite-length results from a numerical observation and makes no
claim to prove Collatz. See https://arxiv.org/abs/2605.13886.
