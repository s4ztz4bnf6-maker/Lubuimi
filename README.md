# Isolated Lean audit workspace

Temporary reproducibility workspace for the Erdős–Selfridge Lean source audit. The upstream source is copied without modification and pinned by commit SHA.


## Syracuse affine terminal-exactness backward step — 10 November 2026

The required working target remains repository `s4ztz4bnf6-maker/Lubuimi`, branch `collatz/valuation-cylinders-2026-10-26`, namespace `SyracuseAudit`. The source files `SyracuseAffineCore.lean` (blob `f12e3ad0f887e215446f03b5070b0122207f4093`) and `SyracuseAffineCorrectionSum.lean` (blob `47616363ac04f999297c7ccb16c3ebc6803fb552`) were inspected on that branch. They contain the prefix sum, affine accumulator recurrence, finite-prefix affine identity, and correction-sum decomposition. The declaration `terminalExact_backward_step` is not present in the inspected source.

The local mathematical target is: from `1 ≤ a k` and terminal exactness at `k+1`, derive `affineCompositionRhs a n k % 2^(prefixExponentSum a k + 1) = 2^prefixExponentSum a k`. The recurrence is `C_(k+1)=3*C_k+2^A_k`; since `A_(k+1)=A_k+a_k`, terminal exactness makes `C_(k+1)` divisible by `2^(A_k+1)`. The remaining local arithmetic is odd-factor cancellation for 3 modulo the power of two, with the quotient parity stated explicitly.

PR [#72](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/72) is documentation-only; it does not add or compile the Lean theorem. The similarly named branch `collatz/terminal-exact-backward-step-2026-11-10` currently contains the same inspected source blobs, not a completed implementation. Do not mistake the branch name or the documented signature for a proof.

**OFFEN – NICHT VERIFIZIERT:** the Lean declaration, finite backward induction, and exact-head Lean 4.35.0 integrated build, named axiom audit, and no-`sorryAx` scan remain pending. This local lemma does not prove arbitrary valuation-word realizability, the general density statement, or global Collatz convergence. Existing verified Syracuse results at their own exact commits remain unchanged.

### Licence boundary

The repository's existing `LICENSE-PROPRIETARY.md` and `LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md` notices apply only to original materials owned by Ta-Yoshua Lubuimi, subject to third-party rights. They do not claim copyright ownership over mathematical facts or theorem statements and do not relicense Lean, Mathlib, upstream sources, or other third-party materials. This status entry grants no additional rights or licence terms.


## Original-materials licensing

The project-specific [proprietary rights notice](LICENSE-PROPRIETARY.md) and [commercial licensing and remuneration policy](LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md) apply only to original materials owned by Ta-Yoshua Lubuimi. They do not claim ownership over mathematical facts or theorem statements and do not relicense Lean, Mathlib, upstream code, dependencies, or other third-party materials, which remain under their respective licences. These notices grant no automatic commercial licence or fixed royalty; any commercial permission requires a separate express written agreement.
