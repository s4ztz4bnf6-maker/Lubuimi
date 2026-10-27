# Mazur–Tao bridge audit: the exact global Collatz bottleneck
Date: 2026-10-27
Status: source synthesis; no new global theorem claimed

## The decisive conditional theorem now available

Lech Mazur's 2026 ProofAtlas formalization records the following exact implication for the ordinary Collatz map:

- If any positive integer never reaches 1, then the set of positive starts that never reaches 1 has positive lower natural density.
- Consequently, if convergence to 1 has upper natural density one, every positive integer reaches 1.

The second statement is already a Lean-checked conditional theorem in the published ProofAtlas record. Its density-one premise is not proved. This changes the project strategy: we do not need to derive a separate orbit-by-orbit conclusion from a hypothetical density-one theorem; the implication from density-one to all-start convergence is already available and formally checked elsewhere.

## What this does not let us infer from Tao

Tao's almost-all Collatz result is formulated in logarithmic density and allows the small target bound to grow with the starting scale. It does not assert that a natural-density-one set reaches 1, nor does it give a fixed barrier H that every exceptional orbit must eventually avoid.

Mazur's conditional theorem concerns the set of starts that never reach 1. Tao's theorem concerns a different scale-dependent orbit statistic. A positive-lower-natural-density set is also positive in logarithmic density, but that observation alone does not contradict Tao's theorem: a nonconvergent orbit could still visit values bounded by a slowly growing function without ever reaching 1. Therefore the missing implication is not “logarithmic density implies natural density”; it is a new uniform orbit-entry estimate strong enough to force the convergence set to have upper natural density one, or an explicit counterexample.

## Revised global decision tree

The project now has a clean two-branch endpoint:

1. **Proof branch:** prove that for every epsilon > 0 and every cutoff N, some X >= N has at least (1-epsilon)X positive starts below X reaching 1. By the already checked Mazur implication, the Collatz conjecture follows.
2. **Refutation branch:** exhibit a positive integer whose orbit never reaches 1. Mazur's theorem then forces a positive lower natural density of such starts. This is a strong testable consequence, but not an algorithm for finding the initial counterexample.

The two branches are exhaustive at the level of the conjecture, but neither branch is solved by the existing project audits. Positive lower density of starts reaching 1, positive lower density of starts reaching a fixed target, or logarithmic-density almost-all results are all weaker than the density-one premise above.

## New candidate interface: a uniform entry-time tail

A potentially useful intermediate object is
\[
E_H(X,T)=\#\{1\le n<X:\exists t\le T(n,X)\text{ with }T^t(n)\le H\},
\]
where H is fixed and the time budget T(n,X) is explicitly specified. A result useful for the global proof must control the natural-density tail uniformly in X, not merely for each fixed starting integer or with a time cutoff that grows without a summable error. One possible target is a bound
\[
\#\{n<X:\text{orbit avoids }[1,H]\text{ for all }t\le T_X\}=o(X)
\]
with a single explicit T_X and then a separate argument controlling later avoidance. This expression alone is not sufficient: the post-T_X tail must also be bounded uniformly, or the argument must use Mazur's positive-lower-density consequence to derive a contradiction.

This makes the gap falsifiable: any proposed proof must identify the exact uniform tail term and show it tends to zero. A countable union of density-zero exceptional sets is not enough.

## Formal reliability

The Mazur result is an external, source-cited formal theorem, not imported into this repository and not independently rebuilt here. The present project must still pin the exact source release, reproduce its dependencies if integrated, and audit its transitive axioms. Tao's original theorem, Mazur's conditional theorem, and any new lemma must remain distinct in the formal dependency graph.

References:
- Mazur, *Positive Lower Density of Collatz Predecessors* and its conditional density-one theorem, ProofAtlas (2026): https://www.proofatlas.ai/formalizations/positive-lower-density-collatz-predecessors/
- Tao, *Almost all orbits of the Collatz map attain almost bounded values*, Forum of Mathematics, Pi 10 (2022), e12; logarithmic-density result, not density-one convergence to 1.
- Hales, guest post on Lean reliability and statement fidelity, Tao's blog, 9 October 2026: https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/

No unconditional Collatz proof, counterexample, or Lean build in this repository is claimed.
