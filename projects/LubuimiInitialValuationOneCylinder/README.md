# Initial Valuation-One Cylinders in the Accelerated Syracuse Map

**Author of the research note and formalization:** Ta-Yoshua Lubuimi  
**Project date:** 10 November 2026  
**Status:** Corrected scholarly framing, version 1.1. The mathematical statements and proofs are retained; eponymous theorem labels and unsupported novelty claims are removed.

## Mathematical content

For a positive odd accelerated Syracuse orbit \(2^{a_j}n_{j+1}=3n_j+1\), the first \(N\) exact valuation exponents are all one if and only if
\[
n_0\equiv-1\pmod{2^{N+1}}.
\]
The exact initial run length is \(v_2(n_0+1)-1\). The note also gives the explicit orbit formula, exact cylinder densities, and a signed-offset margin identity.

**Historical status:** This is a classical finite congruence consequence of parity-vector coding for the \(3x+1\) map. The explicit permutation statement for parity vectors appears as Theorem B in Lagarias (1985); the relevant historical framework goes back to Terras (1976) and Everett (1977). The note is an independent exposition and proof, together with the author's Lean formalization. It is not presented as a new theorem or as a priority claim.

The companion finite exact valuation-word cylinder statement is likewise a direct translation of the classical parity-vector congruence coding. It is not presented as a new theorem. Tao (2022), Proposition 1.9, concerns approximate distribution of finite Syracuse valuation vectors under a residue equidistribution hypothesis; it is relevant context, but it is not the source of the exact one-residue-class assertion.

## Contents

- Lubuimi_Initial_Valuation_One_Cylinder_2026-11-10.md — corrected English research note, version 1.1.
- Lubuimi_Anfangszyklus_Eins_Zylindersatz_2026-11-10_DE.md — corrected German parallel note, version 1.1-DE.
- Lubuimi_Finite_Valuation_Word_Cylinder_Partition_2026-11-10.md — companion derivation, now explicitly framed as a classical parity-vector consequence and independent exposition.
- Lubuimi_Terminal_Residue_Collision_Energy_2026-11-10.md — separate terminal-residue collision-energy derivation; its novelty and formal verification are not asserted by the cylinder results.
- WRITTEN_REVIEW.md — corrected internal review and scope statement.
- LEAN_FORMALIZATION_STATUS.md — exact source and CI record, kept separate from mathematical novelty.
- LITERATURE_AND_ATTRIBUTION_CORRECTION_2026-11-10.md — authoritative correction register.

## Verification scope

The main initial valuation-one equivalence has a Lean declaration in SyracuseOffsetIdentity.lean, line 2397 at source commit b1a8599c686c37893a33453b759dee42047c7727. The documented successful workflows and axiom output apply only to that declaration and their exact source snapshots. The arbitrary finite-word statement, the finite tail partition, the terminal-residue collision-energy identity, and the Markov representation remain separate formalization targets unless separately audited.

The note is not a proof of global Collatz descent. No journal acceptance or independent peer review is claimed.

## Attribution

The research exposition and Lean formalization are by **Ta-Yoshua Lubuimi**. AI systems, where used, are assistance tools only and are not authors, co-authors, or independent mathematical verifiers.


## Current Lean declaration and exact-head audit — 10 November 2026

The neutral declaration `initial_valuation_one_cylinder_iff_dyadic_divisibility` is located at `SyracuseOffsetIdentity.lean:2603`, exact source commit `5f6e46de8bed7061f8336089857143c54e997af5`. Workflow [42809750956](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42809750956) passed Lean 4.34.1, `compile-drafts`, and Lean 4.35.0 paranoid. Its named transitive profile is `[propext, Classical.choice, Quot.sound]`; the no-`sorryAx` guard passed. The seven earlier successful workflows apply to the historical identifier and remain recorded as such; they are not transferred to the neutral declaration. The arbitrary finite-word theorem and tail partition remain separate formalization targets.
