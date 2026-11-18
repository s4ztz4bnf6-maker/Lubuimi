# Verification status — 18 November 2026

## Verified in repository source

- The Lean subproject is pinned to Lean 4.28.0 and Mathlib v4.28.0.
- The Lean source defines the weighted sum and an exponent-shift theorem.
- A GitHub Actions workflow is configured to build this subproject and print the axiom dependencies of the exponent-shift theorem.

## Not yet verified

- No successful CI run for this new workflow has yet been inspected.
- The five finite block-certificate tables have not yet been committed to this branch.
- The odd-target induction invariant and block induction are not yet formalized.
- The universal adjacent-values theorem is not yet a Lean declaration and has no Lean kernel or axiom-audit result.

## Audit policy

Never describe a successful library build as verification of a theorem that is absent from the Lean source. Every theorem-level verification statement must identify the exact commit, declaration, Lean/Mathlib versions, workflow run, job, and complete axiom dependency output. Reject sorryAx and do not introduce unproved axioms to close proof obligations.
