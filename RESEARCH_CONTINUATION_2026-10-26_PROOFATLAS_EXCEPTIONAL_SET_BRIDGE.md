# Research continuation — 2026-10-26: ProofAtlas comparison and the exceptional-set gap

## External checked results worth reusing as targets

ProofAtlas publishes two relevant, separately scoped results:
- A power-saving bound for the proportion of starts below N with no accelerated descent within k ≤ log n steps: at most 10^7 N^(-1/100), for N ≥ 15552. Its public record reports a pinned Lean source and a successful build.
- A positive lower-density theorem for starts reaching 1 within 10.46 ln n ordinary steps, also with a pinned checked Lean package. Its record explicitly says positive lower density does not imply universal convergence.

These are external results, not results proved in this repository. Before porting any lemma, compare the exact definitions of the accelerated map, clock convention, counting interval, constants, source commit, imports, and axiom report. In particular the ProofAtlas accelerated map uses odd branch (3*n+1)/2, which is not the fully accelerated odd Syracuse map dividing by the full 2-adic valuation.

## Logical obstruction: exceptional density is not empty

A bound |Bad ∩ [0,N)| / N ≤ C N^(-ε) for every sufficiently large N implies upper natural density zero for Bad. It does not imply Bad is empty: a finite set, or an infinite set of zero density, can satisfy such a bound after adjusting constants/cutoffs.

Therefore the power-saving theorem cannot by itself prove Collatz for every start. To upgrade it to universality, one needs an additional propagation principle showing that any hypothetical nonconvergent orbit forces a positive-density family of bad starting values, with quantitative constants compatible with the power-saving bound. The positive-lower-density predecessor result is a potential direction, but its exact hypotheses and conclusion must be audited before using it; density-one convergence is not established merely by having positive density for convergent starts.

## Local exact certificate

For an odd-to-odd fully accelerated transition, the equation 2^a m = 3n + 1, with a > 0 and m odd, already implies that the 2-adic valuation of 3n+1 is exactly a: m odd means 2 does not divide m. Thus a separate condition that 2^(a+1) does not divide 3*n+1 is mathematically redundant if these other hypotheses are all present. Keeping it can be useful as a checked derived invariant, but it should be proved, not independently supplied as an unconstrained field.

For a certified chain, prove the affine identity by induction. It only tracks exact arithmetic; strict descent remains a separate inequality. Do not conflate the ProofAtlas half-step accelerated map with the fully accelerated odd Syracuse map.

## Next implementation target

1. Import or independently rederive the exact parity-word counting lemma from the pinned ProofAtlas source, with provenance recorded.
2. Translate it to the project’s chosen transition convention via an explicit conjugacy/block lemma, not by changing the definition silently.
3. State a precise conditional bridge: hypothetical nonconvergence -> positive lower density of starts with no logarithmic descent, then compare it to the power-saving bound.
4. Attempt to prove that bridge or find a counterexample to the bridge hypotheses. Do not claim global Collatz termination from density estimates alone.

No new Lean build or independent checker replay is claimed in this note.
