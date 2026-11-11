# Isolated Lean audit workspace

Temporary reproducibility workspace for the Erdős–Selfridge Lean source audit. The upstream source is copied without modification and pinned by commit SHA.


## Original-materials licensing

Original materials owned by Ta-Yoshua Lubuimi are subject to the [proprietary rights notice](LICENSE-PROPRIETARY.md) and [commercial licensing policy](LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md). These notices expressly exclude upstream Erdős–Selfridge source files, Lean, Mathlib, dependencies, and all other third-party materials, which remain under their respective licenses. They do not claim exclusive rights over mathematical facts or theorem statements as such.


## Syracuse / Collatz research status — 11 November 2026

This repository also maintains the Syracuse/Collatz research record. The dated [11 November research addendum](SYRACUSE_RESEARCH_UPDATE_2026-11-11.md) records the exact verified checkpoints and the remaining proof obligations.

- Backward terminal-exactness declarations: verified on commit `e44eb4331cc1481e10d6f60780d695412c47a726`.
- Finite-depth Child/Tail partition: PR #76, exact commit `cc63565dd55859a0e6ae8514173967e7d52334d9`, workflow 43026427449 PASS, explicit sorryAx rejection PASS.
- These results do not prove arbitrary valuation-word realizability or global Collatz termination.
- The Chernoff estimate is a correct conditional calculation for an independent geometric model; the iterated Syracuse cylinder product formula and the density-to-pointwise bridge remain open.

The repository's pinned Erdős–Selfridge audit materials remain a separate workstream. Their source and third-party components retain their respective licenses.


### Exact-head one-step mass update — 11 November 2026

PR [#78](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/78) now has an exact-head successful workflow on commit `3af286a1da893fc51b40343412056e0be2b8faa1`: [run 43042316671](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43042316671). The named `childBlock_uniform_mass` declaration reports `[propext, Classical.choice, Quot.sound]`, and the explicit `sorryAx` rejection gate passed. This is a one-step finite counting result only; iterated-cylinder independence/product law, orbit realization, density transfer, and global Collatz termination remain open. See [the append-only research update](SYRACUSE_RESEARCH_UPDATE_2026-11-11.md) §17.


### Iterated Syracuse cylinders — next mathematical obligation

The [11 November research update](SYRACUSE_RESEARCH_UPDATE_2026-11-11.md) now defines the common finite cylinder as an intersection, requires the single cardinality (N_m=|Z_m|) to be determined before any factorization, and treats the product identity as an independent test. PR #76, #78, and #79 remain three exact-head verified finite components; none proves the iterated product law or the actual orbit-fibre realization.