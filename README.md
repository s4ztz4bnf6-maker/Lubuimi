**Current licensing policy (2026-11-25):** All future authorized original research releases, code, algorithm implementations, artwork and documentation require a separate paid commercial agreement for commercial exploitation. See [LICENSE](LICENSE). Earlier valid grants and third-party rights remain intact.

# Lubuimi — Syracuse / Collatz research

**Research author:** Ta-Yoshua Lubuimi  
**Latest research checkpoint:** 17 November 2026  
**Repository:** \`s4ztz4bnf6-maker/Lubuimi\`

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
- Unique terminal congruence class, PR [#82](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/82), workflow [43412794362](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43412794362), named profile \`[propext, Classical.choice, Quot.sound]\`, explicit \`sorryAx\` gate passed.

The 14 November status report preserves the scope and limitations of those results: [consolidated project status](docs/FINAL_PROJECT_STATUS_2026-11-14.md).

## Reproducibility and formal verification

- A successful build alone is not a proof audit.
- Record exact source SHA, Lean/toolchain version, workflow and job.
- Preserve the named \`#print axioms\` output and explicit \`sorryAx\` rejection gate.
- Never transfer a CI result to a different source commit.
- Keep hand proofs, exact finite computation, manuscript claims, and Lean verification as separate evidence categories.

## Licensing and commercial model

For new releases, commercial exploitation of original project material controlled by Ta-Yoshua Lubuimi requires a separate written commercial licence with financial participation. The default proposed term is 10% of attributable gross receipts (excluding remitted VAT/sales tax, bona fide refunds, and separately itemised third-party pass-through costs); if revenue cannot reasonably be isolated, a documented allocation or 10% of attributable net profit applies. Quarterly reporting, payment, recordkeeping, and audit terms are set out in [the commercial revenue-share policy](LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md).

**Legacy licence warning:** earlier copies/releases carrying AGPL-3.0, MIT, CC BY 4.0, or another licence remain subject to the licence validly granted with those copies. This update does not retroactively revoke those grants. Legacy licence texts and SPDX headers must not be read as a new grant for future releases. Third-party material remains under its own licence.

The policy covers only rights actually owned or controlled by the author. It does not claim ownership over mathematical facts, ideas, methods, theorem statements as abstract propositions, independent discoveries, third-party materials, or purely autonomous AI output. Scholarly citation and attribution are requested for protected project material; citation does not itself establish co-authorship.

Read the [commercial revenue-share policy](LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md) and [AI assistance and authorship disclosure](AI-ASSISTANCE-AND-AUTHORSHIP.md).

## Separate research project — Ta-Yoshua Lubuimi: Adjacent Values

> **PROJECT BOUNDARY — THIS IS NOT PART OF THE SYRACUSE/COLLATZ RESEARCH ABOVE.**
>
> This subsection is an orientation notice only. The Adjacent-Values project has its own research dossier, mathematical claims, evidence ledger, version history, code, tests, and licensing decisions. No theorem, computation, Lean result, CI result, authorship statement, or licence from either project is automatically transferable to the other.

**Project name:** Ta-Yoshua-Lubuimi-Adjacent-Values  
**Research author:** Ta-Yoshua Lubuimi  
**Research status (17 November 2026):** Main universal existence question **OPEN — NOT PROVED**.

The separate project studies adjacent values of the ternary-weighted binary exponential sum
\[
T_n(e)=\sum_{j=0}^{n-1}3^{n-1-j}2^{e_j},
\]
for strictly increasing nonnegative integer exponent sequences. Its central question asks when admissible sequences \(e,f\) can satisfy \(T_n(f)-T_n(e)=1\). The current dossier records exact structural identities, a coupled 2-adic/3-adic state formulation, finite witnesses, and open proof obligations. These reformulations do **not** establish universal existence.

**Evidence boundary:** exact algebraic identities are distinguished from finite computed witnesses and from the still-open universal statement. The separate package currently includes independently checked witnesses for lengths \(n=1,\ldots,7\); reported examples beyond that range are not promoted here to verified results. No Lean compilation, CI run, or theorem-level formal audit is claimed for this separate project.

**Separate licensing decision for the Adjacent-Values project only:**
- Future authorized original manuscripts, exposition, documentation, code and tests: **proprietary, paid commercial licensing**. Earlier valid CC BY 4.0 and MIT grants remain effective.
- Third-party material remains under its respective licence.

These terms apply only to material specifically released as part of the Adjacent-Values project and do not amend, replace, or grant rights in this Syracuse/Collatz repository or its legacy releases. Conversely, this repository's licensing and commercial-use terms do not automatically govern the separate Adjacent-Values package. Mathematical facts and abstract ideas are not claimed as proprietary by this notice.

**Project archive:** a v0.5.0 source package has been assembled and locally verified, but has not yet been published as a GitHub release or dedicated repository. It is intentionally not imported into this Syracuse/Collatz repository.

For avoidance of doubt: this section records the existence and boundary of a parallel research project. It does not merge the two projects, certify the Adjacent-Values conjecture, or alter any existing file licence.

---

## Parallel research note

- [Quantum/operator reformulations](research/QUANTUM_OPERATOR_BRIDGE_NOTE_2026-11-14.md) — exploratory only, not part of the established proof chain.

---

**Ta-Yoshua Lubuimi**  
Syracuse / Collatz research
