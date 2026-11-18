# Verification status — updated 18 November 2026

## Current Lean source

- Lean toolchain: 4.28.0.
- Mathlib dependency: pinned to tag v4.28.0 in the Lake project.
- The Lean source defines the weighted sum, admissibility as strict monotonicity, and the exponent-shift identity.
- AxiomAudit.lean currently audits only AdjacentValues.exponentShift.

## CI workflow corrections

The workflow:
- scans only Lean source files under this project directory and prunes .lake, so Mathlib's own test sources are not mistaken for project placeholders;
- invokes lake env lean AxiomAudit.lean from the configured AdjacentValues/ working directory;
- rejects sorry, sorryAx, native_decide, and explicit project axiom declarations in project Lean files;
- enforces the explicit axiom allowlist {propext, Classical.choice, Quot.sound} on each #print axioms result it finds.

The corrected workflow has been committed to the research branch. **A successful run has not yet been observed in the available GitHub status data.** Do not report the workflow as passing until the run and job logs have been inspected.

## Mathematical claim status

The latest independently retrievable v0.6.0 validation record dated 17 November 2026 says the universal adjacent-value conjecture remains **OPEN — NOT PROVED**.

A later block-induction proof and five certificate tables, said to contain 89,824 witnesses plus an independent verifier and proof script, have been reported in the current research session. The archive and patch were not available among the accessible conversation uploads or Library search results at this update. Thus:
- reported certificate count: 89,824;
- independent verifier result: reported by the user, not independently replayed here;
- exact certificate contents and hashes: not inspected here;
- formalization of the block induction and universal theorem: not yet present;
- Lean kernel verification of the universal theorem: **NOT ACHIEVED**.

## Audit policy

Never describe a successful library build as verification of a theorem absent from the Lean source. Every theorem-level verification statement must identify the exact commit, declaration, Lean/Mathlib versions, workflow run, job, and full axiom dependency output. Reject sorryAx, project-specific unproved axioms, and Lean.ofReduceBool / native_decide in the trusted proof path.
