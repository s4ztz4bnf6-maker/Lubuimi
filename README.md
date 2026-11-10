# Isolated Lean audit workspace

Temporary reproducibility workspace for the Erdős–Selfridge Lean source audit. The upstream source is copied without modification and pinned by commit SHA.


## Terminal exactness backward-step checkpoint — 10 November 2026

An append-only derivation of the local accumulator implication and the intended Lean signature is recorded in [the terminal exactness backward-step note](research/SYRACUSE_TERMINAL_EXACT_BACKWARD_STEP_2026-11-10.md). The one-step mathematics is derived under `a k ≥ 1`; its Lean implementation, backward induction, named axiom audit, and CI remain **OFFEN – NICHT VERIFIZIERT**. This is not a claim of general valuation-word realizability or global Collatz convergence.


## Syracuse affine correction compile repair — 10 November 2026

The branch build exposed a pre-existing redundant tactic in `SyracuseAffineCorrectionSum.lean:108`. Commit `b9a89872e39b6688f7c7ef567755beceb0c1e5f9` removes only the `omega` tactic that followed a `simp` which already closed the goal. Exact-head CI is pending; no compile success is claimed yet. See the [backward-step status note](research/SYRACUSE_TERMINAL_EXACT_BACKWARD_STEP_2026-11-10.md).


## One-step backward lemma source candidate — 10 November 2026

The previously documented target signature has now been added as `SyracuseAudit.terminalExact_backward_step` in `SyracuseAffineCore.lean`. Source commit: `0cd469f27477d9ac8364e3feb8d462f280e546cd`; resulting blob: `1826d5bea4b7d20d94904032037ebd97720bdfef`.

The proof script follows the explicit natural-number divisibility route: the terminal remainder identity is expanded with `Nat.mod_add_div`; the higher power divisibility gives divisibility of (3C_k+2^{A_k}) by (2^{A_k+1}); coprimality of (2^{A_k}) and 3 gives (2^{A_k}\mid C_k); cancellation then forces the quotient to be odd, yielding the desired remainder.

**Status: OFFEN – NICHT VERIFIZIERT.** No exact-head Actions run or status check has been returned for this commit. The theorem has not been reported as elaborated or kernel-checked. The finite backward induction is not yet added. The existing target branch `collatz/valuation-cylinders-2026-10-26` remains unchanged; this is an isolated candidate branch. No result is transferred to arbitrary-word realizability, the general density theorem, or global Collatz convergence.
