# Syracuse frontier: density-one descent versus pointwise descent (2026-10-26)

## External result to audit

ProofAtlas currently lists an accepted, Lean-checked result titled "Natural-density Collatz descent in logarithmic time": for thresholds tending to infinity, a set of positive starting integers of natural density one descends within 436 log N raw Collatz steps (the displayed page links to its accepted result and review record). Source: https://www.proofatlas.ai/

This is stronger in its quantitative clock than a bare statement that almost all starts eventually descend, but it is still a density-one theorem, not the full Collatz conjecture. Before relying on it as a dependency, inspect the linked theorem statement, exact version, proof source, pinned Lean/mathlib toolchain, and transitive axioms; also verify that the phrase "thresholds tending to infinity" and the step convention match our accelerated odd map S(n)=(3n+1)/2^v2(3n+1).

## Connection to our valuation-cylinder route

Our local route models the valuation sum A_k as a sum of geometric variables under normalized Haar measure on odd 2-adic starts. It yields an exact distribution and a Chernoff lower-tail estimate in the 2-adic/Haar setting. The ProofAtlas claim is formulated in natural density on positive integers and uses raw Collatz steps. These are different measures and different clocks. One cannot transfer the Chernoff bound directly to natural density, nor infer pointwise descent from density one.

The useful research question is whether the finite-cylinder counts can be converted into uniform counting estimates on intervals [1,X], with explicit boundary errors, and whether those estimates can be coupled to the additive correction in the Syracuse affine identity. Any such bridge must state the error term and quantify it uniformly in X and k; otherwise it remains a heuristic analogy.

## Audit gate

Do not cite the ProofAtlas item as a result of this repository until the exact linked Lean artifact is fetched and checked. ProofAtlas's public page reports acceptance and Lean checking; this note records the reported status, not an independent verification. A full Collatz proof or counterexample is not claimed.
