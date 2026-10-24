# Research update: existing Lean-checked logarithmic-time Collatz descent — 2026-10-24

## Result found and exact scope

ProofAtlas lists an accepted, Lean-checked formalization by Lech Mazur, “Natural-Density Almost-Bounded Collatz Orbits in Logarithmic Time” (version 2, 2026-07-21). Its pinned source package includes `Erdos1135/ND/LogTime/Paper.lean` at commit `ca3dd0d63920411213403092aecc6946619eb082`.

Public evidence page:
https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/

Pinned source:
https://www.proofatlas.ai/sources/natural-density-log-time-collatz/commits/ca3dd0d63920411213403092aecc6946619eb082/Erdos1135/ND/LogTime/Paper.lean

The package records two distinct results:
1. For every threshold function tending to infinity along odd inputs, odd-relative natural-density-one many odd starts have an odd-to-odd Syracuse iterate below that threshold within at most (145\log N) Syracuse steps.
2. For every threshold function tending to infinity on all positive inputs, ordinary-natural-density-one many positive starts have a raw Collatz iterate below that threshold within at most (436\log N) raw steps.

The formal package identifies the exact constants
`C_syr = 501501 / (5000 * log 2) < 145` and
`C_coll = 1509503 / (5000 * log 2) < 436`.
Its quantitative rate engine records exponent `d = 6993/200000`, below the phase-gap cap `5/143`. The stated route uses a global power-law phase gap for multiples of `log₂ 3`, scheduled passage estimates, telescoping at a fixed exponent, a density-one transfer from fixed targets to arbitrary diverging thresholds, and a two-adic lift from odd Syracuse starts to raw Collatz starts.

## Critical boundary

This does **not** prove the full Collatz conjecture, universal descent, or arrival at 1. The source explicitly allows a density-zero exceptional set. It also distinguishes odd-relative density for Syracuse from ordinary natural density for the raw map, and distinguishes odd-to-odd steps from raw steps. These distinctions must be preserved.

## Relevance to this repository

Our local project studies the accelerated odd map
`T(n) = (3n+1)/2^{v₂(3n+1)}` and the exact finite-word affine identity
`2^(A_j) n_j = 3^j n_0 + C_j`.
The ProofAtlas result is a useful external benchmark and a promising route for a separate density theorem. It is not automatically a lemma in our Lean environment: the public package has a 599-file first-party import closure and imports its own Tao/Terras/Rhin development. We should not claim that the result has been proved in our repository merely because a separate project has formalized it.

## Concrete next steps

1. Compare our exact exponent-word coding with the source's `Tao.syracuse` and parity/residue coding. Prove the conversion between their maps only after confirming the exact definitions and domain conventions.
2. Extract the smallest dependency slice needed for the phase-gap and density argument, rather than importing the whole 599-file closure blindly.
3. First target a local theorem with explicit hypotheses and an exact density notion; keep universal termination as a separate target.
4. Reuse the already-proved terminal-offset congruence as a finite-word consistency check, not as a substitute for the analytic phase-gap argument.
5. Preserve a theorem-alignment record and independently replay the source before relying on the external result in any claimed proof.

## Evidence standard

ProofAtlas reports a successful Lean build, no unfinished proof steps, and accepted review gates for formal evidence, statement alignment, result boundary, public wording, and pinned source. These are meaningful external evidence, but the current repository has not imported or independently replayed that source package. See also the evidence boundary described on the public page.
