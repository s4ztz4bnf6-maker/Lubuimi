# Syracuse affine terminal-exactness backward-step status — 10 November 2026

**Author:** Ta-Yoshua Lubuimi.

## Authoritative source location

- Repository: `s4ztz4bnf6-maker/Lubuimi`
- Branch: `collatz/valuation-cylinders-2026-10-26`
- Namespace: `SyracuseAudit`
- Source files: `SyracuseAffineCore.lean`, `SyracuseAffineCorrectionSum.lean`

The two source blobs inspected on the target branch were `f12e3ad0f887e215446f03b5070b0122207f4093` and `47616363ac04f999297c7ccb16c3ebc6803fb552`. The core file contains `prefixExponentSum`, `affineCompositionRhs`, and `finite_prefix_affine_identity`. The correction file contains `affineCorrectionSum`, `affineCompositionRhs_closed_form`, and the conditional descent criteria. `terminalExact_backward_step` is absent from the inspected source.

## Local backward implication

Write `A_k = prefixExponentSum a k` and `C_k = affineCompositionRhs a n k`. The definitions give

- `A_(k+1) = A_k + a_k`;
- `C_(k+1) = 3*C_k + 2^A_k`.

If `1 ≤ a_k`, then `2^(A_k+1)` divides `2^A_(k+1)`. Terminal exactness at `k+1` therefore implies `2^(A_k+1) ∣ C_(k+1)`. Substituting the accumulator recurrence gives

`3*C_k + 2^A_k ≡ 0 (mod 2^(A_k+1))`.

Since 3 is odd, it is invertible modulo the power of two. Also `3*2^A_k ≡ 2^A_k (mod 2^(A_k+1))`. Hence

`C_k ≡ 2^A_k (mod 2^(A_k+1))`.

The natural-number Lean proof must expose the divisibility/cancellation and quotient-parity steps; the congruence argument alone is not a compiled proof.

## Formalization and verification status

PR [#72](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/72) is a documentation-only checkpoint. The similarly named branch `collatz/terminal-exact-backward-step-2026-11-10` contains the same source blobs inspected on the target branch; it does not currently establish the missing theorem. No exact-head Lean 4.35.0 compile, `#print axioms`, or transitive no-`sorryAx` result is claimed for this target.

Next formalization steps: prove the local one-step theorem; derive a finite backward induction over all `k < N`; keep the assumptions `1 ≤ a k` explicit; then run the full target-branch build and audit the exact immutable head. Do not infer arbitrary valuation-word realizability or global Collatz convergence from this local implication.

## Attribution and licensing

Original Syracuse/Collatz research and formalization are attributed to Ta-Yoshua Lubuimi. AI tools are assistants only. The repository's proprietary and commercial-use notices apply only to original materials actually owned by the author. They do not claim ownership of mathematical facts or theorem statements and do not relicense Lean, Mathlib, upstream code, or other third-party materials. This memorandum adds no licence grant or commercial term.
