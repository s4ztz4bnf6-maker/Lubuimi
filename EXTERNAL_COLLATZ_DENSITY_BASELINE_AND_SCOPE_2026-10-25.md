# External Collatz baseline and scope boundary

Date: 2026-10-25
Branch: collatz/offset-margin-roadmap-2026-10-23

## External benchmark located

ProofAtlas publishes a Lean-checked formalization titled *Natural-Density Collatz Descent in Logarithmic Time* (Lech Mazur, version 2, 21 July 2026): https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/.

The page states two results: (i) odd-relative natural-density-one many odd starts descend below a threshold tending to infinity within fewer than 145 log N accelerated Syracuse steps; (ii) ordinary natural-density-one many positive starts descend below a threshold tending to infinity within fewer than 436 log N ordinary Collatz steps. The page reports a successful Lean build, no unfinished proof steps, and an accepted formalization review. This note records the external source's stated evidence; it is not an independent replay or audit of its source package.

The page explicitly does not claim the full Collatz conjecture, convergence for every start, or arrival at 1. A density-zero exceptional set may remain. The two conclusions have different domains and time conventions and must not be conflated.

## Relation to this repository

The current branch's local results concern exact finite valuation cylinders, affine offset identities, strict-margin consequences, and short modular transitions. They are compatible with, but do not establish, the external density theorem. Conversely, a density-one result cannot close the exceptional set needed for universal convergence.

## Useful research interface

1. Keep finite-prefix valuation cylinders as a standalone exact layer.
2. Compare any proposed 2-adic/Haar argument with the explicit distinction between density-one descent and universal convergence.
3. If attempting a stronger density result, identify a precise missing quantitative estimate (exceptional-set decay, stopping-time tail, or a uniform bound) instead of citing density one as if it implied every orbit converges.
4. Do not import an external theorem as an axiom. Any reuse must pin the exact source commit, import closure, theorem declaration, dependencies, and statement alignment, then independently run the chosen build and axiom audit.

## Status

Research boundary note only. No new Collatz theorem is claimed and no external ProofAtlas package has been imported into this repository.
