# Syracuse block-descent obligations (2026-10-23)

## Proven interface currently available

For a certified accelerated block, the Lean development uses the exact identity

`2^A * n_j = 3^j * n_0 + C`

and a lower bound `3^j ≤ C`. The current lemmas characterize strict descent by the offset margin and derive the necessary condition

`3^j * (n_0 + 1) < 2^A * n_0`

and, for `n_0 > 0`, the weaker comparison `3^j < 2^A`.

These are conditional implications from an exact certified block. They do not establish that the margin occurs on every orbit.

## Source-aware proof discipline

The current research map includes the published/formalized natural-density result by Idris Ali Shaik, *Quantitative Collatz Descent to Stretched-Logarithmic Scale in Natural Density*, version 2.0.3 (2026), DOI 10.5281/zenodo.21982543. Its advertised scope is almost-all results in natural density, not a pointwise proof for every positive integer. It can motivate quantitative block estimates, but it cannot be used as a universal descent lemma.

A separate public conditional-cycle formalization at collatz-lab.org records an October 2026 erratum: a large-cycle bound was an assumption rather than a derived consequence. This is a useful adversarial-audit warning. Any proposed global result must list all hypotheses and inspect the exact Lean axiom dependencies, not merely rely on a passing build.

## Next formalization targets

1. Define a certified block record that packages `n_0`, `n_j`, `A`, `C`, the exact offset identity, and the proof that the removed exponent is maximal.
2. For each residue branch modulo 16, record the proven transition and the exact comparison target. Keep `T^3(n) < T^2(n)` distinct from `T^3(n) < n`.
3. Search for a finite residue-block certificate proving the margin for a stated residue family. State its domain and all lower-bound hypotheses explicitly.
4. If a branch cannot force descent in its current block, do not discard it: prove a transition to a new state and continue the finite-state analysis.
5. Add `#print axioms` for every new main lemma and audit the dependency closure.

## Explicit non-claims

This note does not claim a proof of the Collatz conjecture, a universal stopping-time bound, or a new theorem from the density literature. The new exponent inequalities are necessary conditions only; the unresolved task is to prove sufficient descent coverage for every orbit.
