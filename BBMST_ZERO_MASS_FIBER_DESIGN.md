# BBMST Lemma 2.1 — zero-mass-safe fiber construction

Status: design note for the next formalization step; **not** a proof of Lemma 2.1.

## Why the existing squeeze is not yet the paper's lemma

The current interface starts with a label map and pointwise bounds on
`alpha (label x)`. That proves a finite weighted-average statement, but it
does not construct the measure or show that the local coefficient is the
conditional probability induced by the hyperplane family. The geometric
incidence and the source-specific measure estimates remain the hard part.

## Ratio-free construction

Fix a finite coordinate box
`Ω = ∀ i : I, R i` (implemented as a finite product, with each `R i`
finite), a finite hyperplane family `𝓗`, and a finite measure
`μ : Ω → ℚ` with `μ x ≥ 0`. Let `F` be a fiber of the projection used
in the source proof. Define directly, without conditional division,

- `mass(F) = ∑ x ∈ F, μ x`,
- `removed(F) = ∑ x ∈ F, if x lies in the source-defined removed set then μ x else 0`,
- `surviving(F) = ∑ x ∈ F, if x lies in the source-defined surviving set then μ x else 0`.

The first local theorem should be the exact partition identity
`removed(F) + surviving(F) = mass(F)`, proved from an explicit disjoint
cover of the fiber. This statement remains valid when `mass(F) = 0`; no
ratio or division is used.

Only after the source proves its relevant inequalities should one introduce a
conditional ratio. For a positive-mass fiber, define it by
`removed(F) / mass(F)` and derive the ratio bounds by multiplying through
by `mass(F) > 0`. For a zero-mass fiber, do **not** assign a ratio and do
not divide by zero. Instead use nonnegativity to prove every submass in that
fiber is zero, then show that the fiber contributes zero to the global sum.

## Lean decomposition (proposed module boundaries)

1. `BBMSTFiniteBox.lean`: finite coordinate box, explicit hyperplane predicate,
   projection/fiber definition, and the paper's exact incidence convention.
2. `BBMSTFiberPartition.lean`: removed/surviving sets, disjointness,
   coverage, and the ratio-free fiber partition identity.
3. `BBMSTConditionalFiberBounds.lean`: positive-mass and zero-mass cases
   separated; no totalized rational division is allowed to hide the zero case.
4. `BBMSTLemma21.lean`: sum the source-specific local inequalities using
   the already checked weighted-fiber partition theorem.

## Mandatory source-mapping table

Before implementing the local bounds, record for every inequality in the
published Lemma 2.1: (i) exact source equation/line, (ii) the corresponding
Lean set, (iii) the measure being used, (iv) hypotheses needed for the
inequality, and (v) whether the zero-mass case is covered. This avoids
translating an abstract envelope theorem and mislabelling it as the geometric
lemma.

## Acceptance gates

- The finite measure is defined explicitly, not hidden behind a free parameter.
- Every fiber is induced by a projection; no independently supplied fiber
  weights.
- Hyperplane membership is represented in the actual finite box.
- Removed and surviving sets are shown disjoint and exhaustive inside each
  fiber.
- Zero-mass fibers are handled without division.
- The source's conditional estimates are proved from the published hypotheses.
- The final theorem's axiom footprint is checked, including transitive imports.
- Compilation is reported only after a CI run for the commit has completed.

This construction is a proposed formal architecture, not a claim that the
published geometric estimates have already been derived.
