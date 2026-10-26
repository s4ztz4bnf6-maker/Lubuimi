# Formal trust audit — 2026-10-26

## Scope

This note records a trust-boundary check for the Syracuse/Collatz and BBMST formalizations. It does not assert that either mathematical problem is solved.

## Kernel-version gate

The project history records Lean 4.28.0 / Mathlib v4.28.0. Lean's official release notes state that Lean 4.32.2 fixed a kernel soundness bug involving nested inductive types and phantom type parameters (Lean issue #14576 / PR #14577). See:
- https://lean-lang.org/doc/reference/latest/releases/v4.32.2/
- https://github.com/leanprover/lean4/issues/14576
- https://github.com/leanprover/lean4/pull/14577

Therefore, a successful build using an affected toolchain is not by itself a sufficient trust certificate. This is a toolchain risk, not evidence that the project's particular arithmetic/combinatorial lemmas are false.

## Required gates before calling a result trusted

1. Record exact lean-toolchain, lake-manifest.json, Mathlib revision, and CI run SHA.
2. Upgrade to a patched, project-compatible Lean release (at least 4.32.2); resolve Mathlib compatibility explicitly rather than changing the toolchain pin blindly.
3. Rebuild all theorem targets from a clean checkout and retain logs.
4. Audit each final theorem with #print axioms; distinguish foundational axioms from project-introduced assumptions and inspect transitive dependencies.
5. Use lake comparator / independent checkers where supported by the selected toolchain, and document which checker versions actually ran. Independent checkers reduce common-mode risk but are not a substitute for understanding their trust assumptions.
6. Review theorem statements against the intended source problem, including degenerate cases, empty sets/fibers, and division denominators.
7. Never infer a global conjecture from finite computation, positive density, or a conditional lemma.

## Project-specific mathematical gates

### Syracuse / Collatz

The valuation estimate currently recorded in the project is a conditional/local lemma, not a proof of global convergence. Preserve exact definitions of the accelerated map and 2-adic valuation; test finite valuation words for realizability and extension, but do not treat finite pattern exclusion as a global argument.

### BBMST / Erdős–Selfridge

The sharp finite-fiber estimate α(1−α) ≥ (q−1)/q² for a nonempty proper subset of a finite fiber is a combinatorial ingredient only. The source-geometric step still has to derive a positive-mass proper fiber from the BBMST construction without assuming the desired nondegeneracy. Do not conflate the square-free-moduli theorem with the unrestricted Erdős–Selfridge problem.

## Status vocabulary

- CI-passed: a specified commit completed the stated workflow successfully.
- Kernel-revalidated: the theorem was rebuilt with a patched toolchain and the checker run is recorded.
- Axiom-audited: transitive dependencies were inspected; any permitted foundational axioms are explicitly listed.
- Source-faithful: statement and definitions were compared with the intended source.
- Conjecture solved: only after the full intended theorem is established and all prior gates pass.

These labels are independent. CI-passed alone must not be reported as kernel-revalidated or as a solved conjecture.
