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


## Kernel trust and independent rechecking (2026-10-23)

The project is now pinned to Lean/Mathlib v4.34.1. This is a deliberate trust-boundary upgrade, not a mathematical strengthening: Lean's official v4.34.1 release notes describe fixes for three routes to an invalid proof of `False` and additional kernel hardening. See https://lean-lang.org/doc/reference/latest/releases/v4.34.1/ . Earlier releases, including the former v4.28.0 pin, predate these fixes.

The workflow's explicit elan default toolchain was updated as well as `lean-toolchain` and `lakefile.lean`; all three must agree or CI may silently test a different toolchain than the project pin.

Trust status remains conditional until the new CI jobs finish. A successful ordinary Lean build checks proof terms with the selected kernel, but does not by itself establish independent-kernel agreement. Before treating any result as a high-assurance certificate, re-run the relevant closure with a current independent checker (for example current `nanoda`) and preserve the checker version, commit SHA, command, and output. `#print axioms` is necessary for dependency auditing but is not a substitute for a sound kernel or independent recheck.
