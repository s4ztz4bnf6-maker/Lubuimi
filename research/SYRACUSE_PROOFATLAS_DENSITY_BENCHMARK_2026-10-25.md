# Collatz external benchmark: density-one descent is not the all-orbits theorem

Date: 2026-10-25

## Source result inspected

ProofAtlas lists Lech Mazur's *Natural-Density Almost-Bounded Collatz Orbits in Logarithmic Time* (version 2, 21 July 2026) as an accepted, Lean-checked formalization:

https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/

Its stated conclusions are carefully scoped:
- for thresholds tending to infinity along odd inputs, odd-relative-density-one many odd starts have a Syracuse hit below the threshold within 145·log N odd-to-odd steps;
- for thresholds tending to infinity on all positive inputs, ordinary-natural-density-one many positive starts have a raw Collatz hit below the threshold within 436·log N raw steps.

The page explicitly says the theorem does not prove the Collatz conjecture, convergence of every start, or arrival at 1; a density-zero exceptional set may remain. Its odd-relative and ordinary-density claims have different domains and clocks and must not be conflated.

## How this relates to this repository

The result is a valuable benchmark for the project’s quantitative direction, not a replacement for the all-start theorem. The current local modules prove residue-class descent/growth and a two-step exact identity. Those are deterministic local facts. The density-one result is a global asymptotic theorem with substantial analytic inputs and a permitted exceptional set. There is no automatic implication from either direction.

The new local identity in `SyracuseBlockIdentity.lean` is:
\[
2^{a+b}n_2=9n_0+3+2^a
\]
whenever \(2^a n_1=3n_0+1\) and \(2^b n_2=3n_1+1\). It retains an exact positive additive correction. This may serve as a small deterministic accounting interface, but it does not establish the global phase-gap or density estimates used in the external theorem.

## Research tasks extracted from the comparison

1. Pin and inspect the exact Lean declaration and source commit for the external theorem before reusing any lemma.
2. Identify which quantitative input drives its density-one conclusion (the ProofAtlas page names a Rhin phase gap and a quantitative rate engine).
3. Determine whether any of those inputs can be stated for the present accelerated-map convention without changing domains, time units, or hypotheses.
4. Keep the exceptional-set boundary explicit. To prove all-start Collatz, an additional argument must eliminate every exceptional start or prove a stronger theorem; density one alone cannot do that.
5. Avoid importing a large transitive closure merely for prestige. Prefer a small, pinned, source-faithful lemma with its own axiom and statement audit.

## Status

This note records a literature comparison and a formalization target, not a new proof of the density theorem or of the Collatz conjecture.
