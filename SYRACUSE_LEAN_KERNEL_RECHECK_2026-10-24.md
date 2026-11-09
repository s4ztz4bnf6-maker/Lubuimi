# Syracuse Lean toolchain and independent recheck plan — 2026-10-24

## Current baseline

The baseline branch `collatz/offset-margin-roadmap-2026-10-23` pins Lean 4.34.1 and Mathlib v4.34.1. The known 2026 Lean kernel/runtime soundness fixes discussed in the Lean FRO postmortems were incorporated before this release line. This is a better trust baseline than the BBMST repository's legacy Lean 4.28.0 pin, but a patched official kernel alone is not an absolute guarantee of soundness.

Sources:
- Lean FRO postmortem for kernel bug #14576: https://leodemoura.github.io/blog/2026-8-1-postmortem-for-kernel-soundness-bug-14576/
- Lean FRO kernel bug-hunt postmortem: https://leodemoura.github.io/blog/2026-8-24-postmortem-for-the-kernel-soundness-bug-hunt/
- Official Lean releases: https://github.com/leanprover/lean4/releases

## Recheck experiment

An isolated branch `collatz/lean-435-recheck-2026-10-24` upgrades Lean and Mathlib to v4.35.0 and adds `lake check` after the existing library build and focused file compiles. This tests whether the current formalization survives a newer toolchain and exported-declaration rechecking without modifying the baseline branch.

A green result must be verified from the actual workflow run before being claimed. If the migration fails because of Mathlib API changes, repair the experiment branch rather than weakening theorem statements or adding axioms.

## What the current formalization does and does not establish

The new `terminal_offset_residue` theorem is an exact finite-word constraint derived from the affine offset identity and an odd terminal state:
`(3^N * n₀ + C) % 2^(A+1) = 2^A`.
It does not yet prove uniqueness of the initial residue class in a way that is linked to every prefix valuation constraint, and it does not establish universal Collatz termination. The finite-word density calculations remain probabilistic/finite-prefix facts, not a universal-orbit argument.

## Required trust layers

1. Build and compile the intended theorem statements.
2. Inspect `#print axioms` for each claimed theorem; reject project-specific axioms and `sorryAx`.
3. Run `lake check` on the upgraded toolchain.
4. Where practical, recheck with a current independent checker such as nanoda/comparator.
5. Separately audit whether the formal theorem says the intended mathematical statement. A soundly checked proof of a weaker or mismatched statement is not a proof of Collatz.

## Current limitation

The baseline CI run `40130524233` completed successfully on 2026-10-24, including compilation of `SyracuseOffsetIdentity.lean` with the new `terminal_offset_residue` theorem. This is compile evidence only; the run is not a global Collatz proof, and the independent-recheck experiment has not yet been confirmed green.
