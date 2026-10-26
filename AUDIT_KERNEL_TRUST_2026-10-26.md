# Formal trust audit — 2026-10-26

## Scope
This note records trust-boundary checks for the Syracuse/Collatz and BBMST formalizations. It does not assert that either mathematical problem is solved.

## Observed toolchain (checked against branch files)
The current `lean-toolchain` on both active branches is `leanprover/lean4:v4.34.1`. This supersedes the older 4.28.0 / Mathlib 4.28.0 note in earlier project history. Record the exact Mathlib revision actually resolved by CI for every run; this repository's workflow generates/resolves the Lake manifest, so do not infer the dependency revision from the Lean pin alone.

Lean's official release notes state that Lean 4.32.2 fixed a kernel soundness bug involving nested inductive types and phantom type parameters (issue #14576 / PR #14577). The current 4.34.1 pin is newer than that stated fix. This reduces the specific known-version concern; it does not certify all theorem dependencies or eliminate other trust assumptions.
References:
- https://lean-lang.org/doc/reference/latest/releases/v4.32.2/
- https://github.com/leanprover/lean4/issues/14576
- https://github.com/leanprover/lean4/pull/14577

Lean 4.35.0 introduced `lake comparator` / `lake check` support for independent checking workflows. The current 4.34.1 branch cannot be assumed to have those commands. To use them, upgrade Lean and Mathlib as a compatible pair, then record the exact independent checker and version that actually ran. An independent checker reduces common-mode risk; it is not a proof that all checkers are sound.

## Required gates before calling a result trusted
1. Record exact commit SHA, `lean-toolchain`, resolved Mathlib revision, workflow definition, and CI run URL.
2. Rebuild theorem targets from a clean checkout and retain logs.
3. Audit each final theorem with transitive `#print axioms`; distinguish foundational axioms from project-introduced assumptions and inspect all dependencies.
4. Use independent checkers only when the pinned toolchain supports them, and document which checker versions actually ran.
5. Review theorem statements against the intended source problem, including degenerate cases, empty sets/fibers, and division denominators.
6. Never infer a global conjecture from finite computation, positive density, or a conditional lemma.

## Project-specific mathematical gates

### Syracuse / Collatz
The valuation estimate recorded in the project is a conditional/local lemma, not a proof of global convergence. Preserve the exact accelerated map and 2-adic valuation. The finite-word realization note is an exact finite existence result only: different finite words may require different starting values, so it does not establish arbitrary infinite-word realizability or convergence of a fixed orbit.

### BBMST / Erdős–Selfridge
The sharp finite-fiber estimate alpha(1-alpha) >= (q-1)/q^2 for a nonempty proper subset of a finite fiber is a combinatorial ingredient only. The source-geometric step still has to derive a positive-mass proper fiber from the BBMST construction without assuming the desired nondegeneracy. Do not conflate the square-free-moduli theorem with the unrestricted Erdős–Selfridge problem. The current audit file itself identifies the admitted `sieve_criterion` and `sf_sieve_lt_one` placeholders; those must be removed or proven before the top-level theorem can count as solved.

## Status vocabulary
- CI-passed: a specified commit completed the stated workflow successfully.
- Kernel-revalidated: the theorem was rebuilt with the recorded patched toolchain and the checker run is identified.
- Axiom-audited: transitive dependencies were inspected; permitted foundational axioms are explicitly listed and project assumptions are resolved.
- Source-faithful: statement and definitions were compared with the intended source.
- Conjecture solved: only after the full intended theorem is established and all prior gates pass.

These labels are independent. CI-passed alone must not be reported as kernel-revalidated or as a solved conjecture.
