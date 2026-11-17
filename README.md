# Lubuimi — Syracuse / Collatz research

**Research author:** Ta-Yoshua Lubuimi  
**Latest research checkpoint:** 17 November 2026  
**Repository:** `s4ztz4bnf6-maker/Lubuimi`

This repository contains the Syracuse/Collatz research programme: exact affine and valuation identities, dynamic residual bounds, valuation-dependent coupling, finite-residue and terminal-congruence work, Lean formalizations, CI audit records, and manuscripts.

## Latest research checkpoint — 17 November 2026

The author reports completion of the universal dynamic Syracuse descent argument in the preceding research work. The 17 November reconstruction records the backward implication from that descent theorem to Collatz, using the exact affine identity and residual descent threshold.

The central research contributions identified by the author are:

- a **dynamic bound** with exponent windows that update with the realized valuation sequence;
- a **dynamic coupling** that combines positive, neutral, and negative valuation contributions and retains intermediate-block information;
- a **third theorem** from the same research line, whose exact statement and name are to be inserted from its original source;
- the recognition of valuation-driven structure changes and recurring patterns, developed through an exploratory and alternative approach.

See:
- [17 Nov dynamic residual/coupling checkpoint](docs/RESEARCH_CHECKPOINT_2026-11-17_DYNAMIC_RESIDUAL_COUPLING.md)
- [17 Nov conversation research log](docs/CHAT_RESEARCH_LOG_2026-11-17.md)
- [Working manuscript draft: dynamic residual coupling](manuscript/DYNAMIC_RESIDUAL_COUPLING_WORKING_DRAFT_2026-11-17.md)

**Proof-integrity note:** the 17 November backward chain proves that the universal descent theorem implies Collatz. The independent proof of the universal descent theorem is reported by the author as completed in prior work, but its exact source derivation has not yet been attached to this repository checkpoint. Therefore this README does not yet label the global Collatz result as independently audited or Lean-verified. The next publication pass must insert that exact proof, state all three theorems precisely, and complete the relevant independent/formal checks.

## Earlier verified finite results

The following earlier results remain valid only for their exact source snapshots and named CI runs:

- Constructive quotient-state sequence, PR [#81](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/81), workflow [43121953918](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43121953918).
- Child/tail finite partition, PR [#76](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/76), workflow [43026427449](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43026427449).
- One-step child-block uniform mass, PR [#78](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/78), workflow [43042316671](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43042316671).
- Unique terminal congruence class, PR [#82](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/82), workflow [43412794362](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43412794362), named profile `[propext, Classical.choice, Quot.sound]`, explicit `sorryAx` gate passed.

The 14 November status report preserves the scope and limitations of those results: [consolidated project status](docs/FINAL_PROJECT_STATUS_2026-11-14.md).

## Reproducibility and formal verification

- A successful build alone is not a proof audit.
- Record exact source SHA, Lean/toolchain version, workflow and job.
- Preserve the named `#print axioms` output and explicit `sorryAx` rejection gate.
- Never transfer a CI result to a different source commit.
- Keep hand proofs, exact finite computation, manuscript claims, and Lean verification as separate evidence categories.

## Licensing and commercial model

The project uses a file-specific, revenue-oriented dual-licensing plan:
- **Original code:** GNU AGPL-3.0, where an individual source file carries an explicit AGPL notice, with a separately negotiated paid commercial license available for closed-source integration, OEM, embedded, and enterprise use.
- **Research manuscripts and non-code documentation:** all rights reserved; commercial republication or substantial reuse of protected expression requires a separate written license.
- **Third-party materials:** remain under their own licenses and are never relicensed by this repository's notices.

Read the [AGPL license text](LICENSE-AGPL-3.0.txt), [proprietary rights notice](LICENSE-PROPRIETARY.md), and [commercial licensing and remuneration policy](LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md).

**Important:** AGPL permits commercial use without paying a royalty if its terms are followed. The paid commercial alternative is for customers who need permissions beyond AGPL, especially closed-source distribution or integration. This model can create licensing revenue, but does not guarantee payment from every commercial user. No source file is automatically relicensed merely by adding these policy documents; each code file must be individually checked and marked.

## Parallel research note

- [Quantum/operator reformulations](research/QUANTUM_OPERATOR_BRIDGE_NOTE_2026-11-14.md) — exploratory only, not part of the established proof chain.

---

**Ta-Yoshua Lubuimi**  
Syracuse / Collatz research
