# Research continuation — 2026-10-26: density bridge audit

## Newly identified reusable formal result

ProofAtlas records a Lean-checked theorem `nonconvergence_positive_lower_density_of_counterexample`: if any positive ordinary-Collatz starting value never reaches 1, then the set of positive starting values that never reaches 1 has positive lower natural density. The theorem's own boundary is explicit: it does not assert a counterexample exists. The public record reports a successful source-pinned build and an axiom audit for its advertised roots; its own source/provenance caveats must be retained when citing it.

The separate power-saving theorem bounds the fraction of starts below N with no descent under the half-step accelerated map `n ↦ n/2` for even n and `(3n+1)/2` for odd n, within k ≤ log n, by `10^7 N^(-1/100)` for N ≥ 15552. These two statements do not yet contradict each other: the failure predicates differ. One is eventual nonconvergence under ordinary iteration; the other is failure of a short-time descent under a particular accelerated map.

## Exact missing bridge

To derive a contradiction, prove a quantitative implication from the ordinary nonconvergence set to the short-time no-descent set, or establish a separate power-saving estimate for the exact ordinary-iteration nonconvergence predicate. The implication must preserve the counting interval, logarithmic clock, and map convention. It cannot be inferred merely because both sets are described as “bad starts.”

A disciplined formalization should first define both predicates explicitly, then state a conditional theorem with all constants and cutoffs visible. Attempt to prove the bridge from predecessor/tree structure; if the statement is false as written, search for a finite counterexample or a counterexample to its abstract combinatorial lemma and weaken the target honestly.

## BBMST independent track

Keep the ratio-free finite-fiber partition lemma independent of the source-specific geometry. Prove exact coverage and pairwise disjointness, then sum additivity; only a separate lemma uses nonnegative weights to infer each mass vanishes when total mass is zero. Do not let the high-level sieve criterion enter the imports of this base lemma.

## Verification status

This is a source-analysis note, not a Lean implementation or build. The external ProofAtlas statements are not claims proved by this repository. The global Collatz and unrestricted Erdős–Selfridge conjectures remain open in these projects.
