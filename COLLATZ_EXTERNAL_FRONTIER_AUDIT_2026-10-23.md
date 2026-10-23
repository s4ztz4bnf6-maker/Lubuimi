# Collatz/Syracuse external frontier audit — 2026-10-23

## Purpose

This is a source-status audit, not a proof of the Collatz conjecture. It records which external ideas are worth importing as *targets for independent reconstruction* and which claims must not be treated as established global results.

## Local repository status

The branch `collatz/offset-margin-roadmap-2026-10-23` has a successful Lean 4.34.1 workflow at commit `45e66743`. The checked modules include `SyracuseOffsetIdentity.lean`, `SyracuseQuarterDescent.lean`, `IterationLemmas.lean`, `ThresholdLemmas.lean`, and `SyracuseReferenceTest.lean`. This is a successful build of the listed local statements, not a proof of global convergence or absence of all cycles.

The current exact arithmetic identity for a certified accelerated-odd block is

`2^(A_N) x_N = 3^N x_0 + C_N`,

where `A_(j+1)=A_j+a_j` and `C_(j+1)=3 C_j+2^(A_j)`. Descent is equivalent to the strict margin

`3^N x_0 + C_N < 2^(A_N) x_0`.

The open obligation is to prove an orbit-compatible upper control on the correction term / strict margin, or find a genuine orbit violating the hoped-for bound. Exponent surplus alone is insufficient.

## External formalization audit: conditional cycle exclusion

The public project at https://collatz-lab.org/ reports a formalized conditional result excluding nontrivial cycles with at most 1322 odd terms under named hypotheses H1 and H2. Its 2 October 2026 erratum states that H3, a large-cycle bound, was assumed rather than derived; under H2, H3 itself excludes every nontrivial cycle and is equivalent to the conclusion. The report says the main theorem's import closure was rechecked on Lean 4.34.0 in October, but later phases were not rechecked. This is a valuable example of why a kernel-clean theorem is not enough: the strength and provenance of hypotheses must be audited separately.

The project's own account also states that prior computational verification implies any nontrivial cycle must have at least 137.5 billion odd terms. That is a lower bound on a hypothetical cycle, not nonexistence.

## Kernel version gate

The current workflow uses Lean 4.34.1. Retaining a current Lean toolchain matters: Lean 4.32.2 fixed soundness issue #14576, and Lean 4.34.0 included further kernel/runtime hardening. Do not infer that an older green CI run is equivalent to a fresh run on the current kernel. For any future claim, record:
1. the exact theorem statement and all transitive axioms;
2. all named hypotheses and whether they are proved, imported, or conjectural;
3. Lean/Mathlib versions;
4. a clean reproducible build and source commit.

## Concrete next research targets

1. **Finite valuation-word criterion.** Formalize the endpoint congruence and prove both directions between the prescribed positive valuation word and its odd residue class. Keep endpoint and prefix indexing explicit. The existing note `SYRACUSE_REALIZABLE_WORD_CONGRUENCE_2026-10-23.md` contains the algebraic reduction; it is still a target for formalization, not a Lean theorem.
2. **Orbit-compatible correction bound.** Avoid assuming the exponents behave independently or follow a typical random distribution. Any bound must be derived for an actual trajectory and remain valid as the valuation word changes.
3. **Cycle obstruction lane.** If exploring cycles, formulate exact integer constraints for a hypothetical cycle and compare them with source-checked cycle-length bounds. Do not import a conditional theorem without proving its hypotheses.
4. **Adversarial counterexample search.** Search short exact valuation words and residue classes for false strengthening of the margin. Computation can reject a proposed lemma, but cannot prove universal convergence.

## External references

- Conditional-cycle formalization and erratum: https://collatz-lab.org/
- Erratum / source chronology: https://collatz-lab.org/changelog/
- Lean 4.32.2 soundness fix: https://lean-lang.org/doc/reference/latest/releases/v4.32.2/
- Lean 4.34.0 release: https://lean-lang.org/doc/reference/latest/releases/v4.34.0/

## Explicit boundary

No new global Collatz proof is claimed. No conditional cycle-exclusion result is promoted to an unconditional theorem. The useful progress here is a sharper, source-audited list of proof obligations and a reproducibility gate for the next formal step.
