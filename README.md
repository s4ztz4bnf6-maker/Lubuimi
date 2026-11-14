# Lubuimi — Syracuse / Collatz research and Lean audit

**Research author:** Ta-Yoshua Lubuimi  
**Status date:** 14 November 2026

This repository contains the Syracuse/Collatz finite-prefix arithmetic, exact valuation and terminal-residue work, Lean formalizations, reproducible CI audits, and research manuscripts. It does **not** contain a proof of the global Collatz conjecture.

## Project status and manuscripts

- [Consolidated project status and results (14 Nov 2026)](docs/FINAL_PROJECT_STATUS_2026-11-14.md)
- [Finite-word / terminal-residue manuscript addendum (14 Nov 2026)](manuscript/SYRACUSE_MANUSCRIPT_ADDENDUM_2026-11-14.md)

## Verified finite results

- Exact affine finite-prefix identities and backward reconstruction lemmas, on their documented source snapshots.
- Constructive quotient-state sequence, PR [#81](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/81), exact-head workflow [43121953918](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43121953918).
- Child/tail finite partition, PR [#76](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/76), workflow [43026427449](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43026427449).
- One-step child-block uniform mass, PR [#78](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/78), workflow [43042316671](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43042316671).
- Unique terminal congruence class, PR [#82](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/82), exact-head workflow [43412794362](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43412794362), named profile `[propext, Classical.choice, Quot.sound]`, `sorryAx` gate passed.

Each result is restricted to its exact theorem, source commit, and CI run. A one-step mass identity is not an iterated product law; terminal-class uniqueness is not full word realization.

## Open mathematical frontier

The full terminal-congruence iff finite-word-realization theorem, positive representative/lift construction, affine-offset-to-strict-descent bridge, exclusion of all infinite non-descending paths, and global Collatz termination remain open. No density or compactness argument is presented as a substitute for pointwise descent.

## Reproducibility and integrity

- Keep the named `#print axioms` output and explicit `sorryAx` rejection gate for each promoted Lean theorem.
- Record every result against the exact source SHA and workflow/job.
- Preserve earlier successful checks for their own source snapshots; do not transfer them to later commits.
- Keep mathematical proof, finite arithmetic, manuscript exposition, and Lean verification as separate evidence categories.

## Original-materials licensing

## Original-materials licensingOriginal materials owned by Ta-Yoshua Lubuimi are subject to the [proprietary rights notice](LICENSE-PROPRIETARY.md) and [commercial licensing policy](LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md). These notices expressly exclude upstream Erdős–Selfridge source files, Lean, Mathlib, dependencies, and all other third-party materials, which remain under their respective licenses. They do not claim exclusive rights over mathematical facts or theorem statements as such.
