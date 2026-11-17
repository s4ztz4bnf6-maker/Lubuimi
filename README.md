# Lubuimi — Syracuse / Collatz research and Lean audit

**Research author:** Ta-Yoshua Lubuimi  
**Status date:** 17 November 2026

This repository contains the Syracuse/Collatz finite-prefix arithmetic, exact valuation and terminal-residue work, Lean formalizations, reproducible CI audits, and research manuscripts. The 17 November checkpoint records the author's statement that the universal dynamic descent theorem has already been proved in prior work. Its original full proof text has not yet been located in the repository materials inspected for that checkpoint; the checkpoint records the exact interface to recover and audit. It does not claim that the Collatz conjecture has already received an independent repository-level or Lean verification.

## Current research checkpoint

- [Universal dynamic descent — project checkpoint (17 Nov 2026)](docs/COLLATZ_UNIVERSAL_DESCENT_CHECKPOINT_2026-11-17.md)
- [Backward reconstruction manuscript (17 Nov 2026)](manuscript/COLLATZ_BACKWARD_PROOF_RECONSTRUCTION_2026-11-17.md)
- [Consolidated historical project status (14 Nov 2026)](docs/FINAL_PROJECT_STATUS_2026-11-14.md) — historical snapshot, superseded where it conflicts with the 17 Nov checkpoint.
- [Finite-word / terminal-residue manuscript addendum (14 Nov 2026)](manuscript/SYRACUSE_MANUSCRIPT_ADDENDUM_2026-11-14.md)

## Core backward interface

For the accelerated odd Syracuse sequence, the affine identity, residual threshold, residual recurrence, overlap representation, dynamic-offset bound, and universal valuation coupling are consolidated in the 17 November checkpoint.

The decisive theorem interface is
`forall n > 1 odd, exists N >= 1, n * R_N < (n - 1) * C_N`.
The author reports that the universal dynamic descent theorem proving this interface already exists. Its primary statement and derivation must be recovered and matched exactly; do not mislabel it as a newly open theorem or claim it was independently verified by this documentation update.

## Previously recorded finite and Lean-verified results

- Exact affine finite-prefix identities and backward reconstruction lemmas, on their documented source snapshots.
- Constructive quotient-state sequence, PR [#81](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/81), exact-head workflow [43121953918](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43121953918).
- Child/tail finite partition, PR [#76](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/76), workflow [43026427449](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43026427449).
- One-step child-block uniform mass, PR [#78](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/78), workflow [43042316671](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43042316671).
- Unique terminal congruence class, PR [#82](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/82), exact-head workflow [43412794362](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43412794362), named profile `[propext, Classical.choice, Quot.sound]`, `sorryAx` gate passed.

Each result is restricted to its exact theorem, source commit, and CI run. A one-step mass identity is not an iterated product law; terminal-class uniqueness is not full word realization.

## Reproducibility and integrity

- Keep named `#print axioms` output and explicit `sorryAx` rejection for every promoted Lean theorem.
- Record every result against its exact source SHA and workflow/job.
- Preserve earlier successful checks for their own source snapshots; do not transfer them to later commits.
- Separate mathematical proof status, author-reported prior results, finite arithmetic, manuscript exposition, and Lean verification.
- Do not infer global Collatz termination from finite-prefix identities alone.

## Licensing

- [Licensing index](docs/LICENSING.md)
- [Proprietary rights notice](LICENSE-PROPRIETARY.md)
- [Commercial licensing and remuneration policy](LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md)

These are the repository's current proprietary notices, not MIT or CC BY. Third-party materials remain under their own licenses. The separate Adjacent-Values project's licensing choice does not automatically apply here.

## Parallel research note

- [Quantum-operator reformulations: literature, exact encodings, and proof criteria](research/QUANTUM_OPERATOR_BRIDGE_NOTE_2026-11-14.md) — exploratory only, not part of the descent proof.
