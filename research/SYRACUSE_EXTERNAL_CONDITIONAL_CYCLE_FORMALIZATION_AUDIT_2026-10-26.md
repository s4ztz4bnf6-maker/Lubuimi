# External Collatz formalization audit — 2026-10-26

## Why this source is relevant

The public project https://collatz-lab.org/ describes a Lean formalization of a conditional no-nontrivial-cycle theorem. Its own page explicitly labels the result conditional, not a proof of the Collatz conjecture. It lists three external assumptions:
- `BakerSeparation`, a working strengthening of published linear-forms-in-logarithms estimates;
- `BarinaVerification`, a finite computational verification bound;
- `DerivedLargeKBound`, a project-derived bridge that the page itself says is not a published theorem.

Primary project statements:
- Main page: https://collatz-lab.org/
- Explicit hypothesis ledger: https://github.com/ericmerle3789/collatz-conditional-cycles/blob/main/HYPOTHESES.md
- Lean kernel soundness incident: https://leodemoura.github.io/blog/2026-8-1-postmortem-for-kernel-soundness-bug-14576/
- Follow-up kernel/runtime audit: https://leodemoura.github.io/blog/2026-8-24-postmortem-for-the-kernel-soundness-bug-hunt/

## Mathematical scope distinction

“No nontrivial finite cycle” does not imply that every positive orbit reaches 1: an orbit could in principle be unbounded without repeating a state. Therefore, even if the conditional cycle theorem were made unconditional, it would not by itself prove the full Collatz conjecture.

Likewise, the current repository's accelerated odd-step map and finite valuation-cylinder identities do not directly discharge the Diophantine cycle obstruction used by this external project. A transfer would need explicit definitions and a theorem connecting the two formulations.

## Formal-verification implications

The external project reports its main theorem checked with Lean 4 / Mathlib v4.27 and three named external assumptions. The page separately reports a later recheck of part of its import closure on Lean 4.34; it does not claim every later phase was rechecked. Treat these as source-reported status, not as a verification performed by this repository.

The official Lean postmortems document a kernel soundness bug exploited by a bogus Collatz disproof, followed by additional kernel/runtime issues and fixes. This supports a layered audit policy:
1. pin and record the Lean toolchain;
2. rebuild from source on a patched version;
3. inspect transitive axioms and explicit project hypotheses separately;
4. where threat model warrants it, export and check proof artifacts with independent tools;
5. audit whether the formal theorem matches the intended mathematical claim.

No checker eliminates the need to inspect the statement or external assumptions.

## Actionable reuse

The useful reusable part is not the conditional no-cycle conclusion itself, but the explicit hypothesis ledger and the disciplined separation between published theorem, finite computation, and project-derived bridge. For our Syracuse project, any future cycle-related lemma should carry a similar assumption ledger and must not be presented as a convergence theorem unless it rules out unbounded nonrepeating trajectories too.
