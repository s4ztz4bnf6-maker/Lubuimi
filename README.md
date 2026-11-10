# Isolated Lean audit workspace

Temporary reproducibility workspace for the Erdős–Selfridge Lean source audit. The upstream source is copied without modification and pinned by commit SHA.


## Terminal exactness backward-step checkpoint — 10 November 2026

An append-only derivation of the local accumulator implication and the intended Lean signature is recorded in [the terminal exactness backward-step note](research/SYRACUSE_TERMINAL_EXACT_BACKWARD_STEP_2026-11-10.md). The one-step mathematics is derived under `a k ≥ 1`; its Lean implementation, backward induction, named axiom audit, and CI remain **OFFEN – NICHT VERIFIZIERT**. This is not a claim of general valuation-word realizability or global Collatz convergence.


## Syracuse affine correction compile repair — 10 November 2026

The branch build exposed a pre-existing redundant tactic in `SyracuseAffineCorrectionSum.lean:108`. Commit `b9a89872e39b6688f7c7ef567755beceb0c1e5f9` removes only the `omega` tactic that followed a `simp` which already closed the goal. Exact-head CI is pending; no compile success is claimed yet. See the [backward-step status note](research/SYRACUSE_TERMINAL_EXACT_BACKWARD_STEP_2026-11-10.md).
