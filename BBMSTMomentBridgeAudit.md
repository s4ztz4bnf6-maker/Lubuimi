# BBMST: geometric-to-moment bridge audit

Date: 2026-10-26
Branch: audit/lean4-erdos-selfridge

## Status boundary

The companion Lean module proves a finite combinatorial fact: if each last-coordinate fiber has at most one point, then the union of a finite family has cardinality at most the number of family members. This is valid and useful, but is not yet the probabilistic or second-moment estimate required by the BBMST argument.

## Exact gap

A cardinality estimate for one fiber does not, by itself, give a probability estimate for a non-uniform product measure. To pass from the geometric statement to a source-faithful moment bound, the formal development must define the actual finite probability space and prove the relevant weighting identities.

The missing bridge should be split into explicit lemmas:

1. **Finite model:** define the coordinate alphabets, product sample space, probability weights, and hyperplane events exactly as in the chosen source.
2. **Fiber measure:** prove the conditional/weighted measure of each last-coordinate fiber, not only its cardinality. If the coordinate is uniform on a finite set S, a fiber of size at most one has conditional probability at most 1/|S|; for a non-uniform coordinate, the correct bound is the maximum atom, not 1/|S|.
3. **Union estimate:** combine the fiber bounds with a finite union bound, preserving overlaps rather than assuming disjointness.
4. **Pair expansion:** expand the second moment as a sum over ordered pairs of events and prove the claimed intersection bounds from the actual hyperplane geometry.
5. **Parameter existence:** derive the admissible parameters and their positivity/range hypotheses from the source construction.
6. **Strict sieve conclusion:** prove the numerical/algebraic inequality that yields the strict bound needed by the final exclusion criterion.
7. **Statement fidelity:** compare the final theorem statement and all hypotheses with the source theorem; no unproved project-specific axiom may encode the conclusion.

## Important distinction

The current lemma nonempty_small_hyperplane_union_has_strict_interior_fraction is a counting statement about a nonempty union smaller than the full finite set. It does not establish positive probability mass under an arbitrary measure, nor does it establish the BBMST moment bounds. Positive cardinality implies positive mass only after the measure is known to assign positive weight to every point in question.

## Formal audit checklist

- Compile the exact pinned Lean/Mathlib version.
- Search transitively for sorry, admit, project-specific axiom, and unsafe escape hatches.
- Inspect #print axioms for the final theorem and every theorem in its dependency chain.
- Check denominator positivity before every division-based inequality.
- Verify empty-family and zero-mass edge cases explicitly.
- Ensure the final theorem is not weakened or made vacuous by its parameter type or hypotheses.

This note records the proof obligations and does not claim the global BBMST result has been completed.
