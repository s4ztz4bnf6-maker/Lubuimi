# External Collatz frontier scan: ProofAtlas result and project implications

Date: 2026-10-26
Branch: collatz/valuation-cylinders-2026-10-26

## Candidate external result to inspect

ProofAtlas publishes Lech Mazur's *Natural-Density Almost-Bounded Collatz Orbits in Logarithmic Time* (version 2, 21 July 2026), alongside a Lean-checked theorem dossier:
- https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
- https://www.proofatlas.ai/proofs/artifact.known-nd-rhin-log-time.paper-package.v002.html

The page states two distinct conclusions:
1. For any threshold f tending to infinity along odd inputs, odd-relative natural density one of odd starts have an accelerated Syracuse iterate below f(N) within fewer than 145 log N odd-to-odd steps.
2. For any threshold f tending to infinity on positive inputs, ordinary natural density one of positive starts have a raw Collatz iterate below f(N) within fewer than 436 log N raw steps.

The described proof route uses a quantitative Diophantine phase gap for multiples of log_2(3), scheduled-passage bounds, a fixed-exponent telescoping argument, then a two-adic lift from odd starts to all positive starts. The separate Terras-style companion theorem gives an explicit power-saving upper bound on the proportion of starts that fail to descend below their starting value within a logarithmic accelerated clock.

## Exact boundary

The ProofAtlas dossier explicitly says these results do not prove convergence for every start or arrival at 1. A density-zero exceptional set may remain. The 145 constant counts accelerated odd-to-odd Syracuse steps; the 436 constant counts raw Collatz steps. These are different clocks and cannot be conflated.

This is a useful external frontier, not a replacement for the present project's global proof target. It shows that average-case logarithmic-time descent is a tractable and formally checked target in a neighboring development. The current repository's affine correction-sum and valuation-cylinder work addresses a different route and should not claim this result unless the exact source, dependencies, theorem statement, and checker evidence are imported and independently replayed.

## Proposed integration experiment

1. Download the commit-pinned first-party Lean source and evidence bundle from ProofAtlas.
2. Record its exact commit, Lean toolchain, Mathlib revision, transitive axioms, and checker versions; reproduce its stated check.
3. Extract the smallest relevant lemmas for parity/valuation-word residue classes and affine iterate identities, not the entire 599-file dependency closure by default.
4. Compare the phase-gap route with the existing affine correction identity
   [
   2^{A_N}n_N=3^Nn_0+C_N.
   ]
   Determine whether the global phase-gap estimate can produce a useful deterministic bound on the correction term for the density-one population.
5. Keep a separate theorem boundary: density-one descent below every diverging threshold is not universal Collatz convergence.

## Current repository contribution and open gap

The project now has a separate exact paper argument that k consecutive valuation-one steps from a fixed positive odd start x imply
[
2^{k+1}mid x+1.
]
This gives the state-dependent run bound (kle v_2(x+1)-1), but not a uniform bound and not global descent. It is a candidate local lemma to formalize and compare against parity-word cylinders.

The external result is presented here as a research lead. It has not been imported or independently rebuilt by this repository.
