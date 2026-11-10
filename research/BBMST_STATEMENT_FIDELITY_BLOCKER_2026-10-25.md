# Statement-fidelity audit: theorem strength vs. source scope
Date: 2026-10-25

## Finding from the current Lean source
In `ErdosSelfridge_v17_fixed.lean`, the structure `CoveringSystem` assumes:
- moduli greater than one,
- pairwise distinct moduli,
- a covering of every integer.

It does **not** require square-free moduli. The final declaration `erdos_selfridge` quantifies over this general structure and concludes that no such covering system can have all moduli odd.

The source-file header itself warns that the cited paper's theorem concerns square-free moduli, while the current theorem statement does not impose square-freeness. The two admitted declarations `sieve_criterion` and `sf_sieve_lt_one` remain in the dependency chain.

## Why this is a blocking issue
A formal proof of a theorem with a broader domain is not automatically a faithful formalization of a narrower source theorem. Conversely, if the intended target is the unrestricted distinct-odd-moduli conjecture, a square-free theorem cannot simply be substituted for it.

Before pursuing the final theorem, choose and state one of these targets explicitly:

A. **Source-faithful square-free theorem:** add `CS_squarefree cs` as a hypothesis to the target theorem, and prove that the cited source actually establishes the exact resulting statement.

B. **Unrestricted Erdős–Selfridge conjecture:** retain the current broader statement, but prove the missing sieve interfaces from arguments that genuinely establish this stronger result. A square-free-only citation is insufficient.

## Required audit checks
1. Identify the exact primary paper/version and its theorem number; distinguish similarly abbreviated author groups and papers.
2. Compare the paper's definitions of covering, distinctness, square-freeness, and any assumptions on the moduli against Lean's `CoveringSystem`.
3. Inspect the transitive axiom graph of `erdos_selfridge`; the current source explicitly documents `sieve_criterion` and `sf_sieve_lt_one` as admitted assumptions.
4. Do not use a successful build as evidence that either admitted mathematical assumption is true.

This is a statement-fidelity blocker, not a cosmetic naming issue.
