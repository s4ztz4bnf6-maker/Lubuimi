# Collatz–Syracuse research workspace

**Author and research lead: Ta-Yoshua Lubuimi**

This repository records Ta-Yoshua Lubuimi's Collatz/Syracuse mathematical research and Lean formalization. AI tools are assistants only and are not authors or independent verifiers.

## Research record

The affine-offset and signed-margin framework and the initial valuation-one cylinder theorem are attributed to Ta-Yoshua Lubuimi. The APW4–Syracuse cylinder–energy bridge is tracked as a named research programme, not asserted as an established theorem.

- [Consolidated Collatz–Syracuse research record](COLLATZ_SYRACUSE_RESEARCH_RECORD_TA_YOSHUA_LUBUIMI_2026-11-10.md)
- [Lubuimi's Initial Valuation-One Cylinder Theorem](SyracuseInitialValuationOneCylinder_2026-11-09.md)
- [Lubuimi's Finite Valuation-Word Cylinder Partition Theorem](Lubuimi_Finite_Valuation_Word_Cylinder_Partition_2026-11-10.md)
- [Syracuse affine offset, signed margin, and Lubuimi cylinder theorem source](SyracuseOffsetIdentity.lean)
- [Closed-form offset](SyracuseOffsetClosedForm.lean)
- [Offset lower bound](SyracuseOffsetLowerBound.lean)
- [Valuation-one margin block](SyracuseMarginBlock.lean)
- [Exact valuation transitions](SyracuseValuationTransition.lean)

## Verification

[GitHub Actions run 42717134267](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42717134267) passed on the Lean 4.34.1 / Mathlib v4.34.1 snapshot at merge commit 28003791738900f6dc456bc71d37151c1f3f8a78. It compiled the CollatzAudit library and the listed Syracuse offset, margin, and valuation modules; the offset and valuation-transition audit steps rejected sorryAx if present and completed successfully.

The Lubuimi initial-cylinder theorem has been added as a Lean declaration. Its helper lemma compiled in run 42719689591 with standard axiom profile, but the main theorem failed at the finite affine induction and terminal parity proof steps. Commit 7cbb49c694bf2812c730e2214a66989b4c9ae961 contains the next proof refinement; its CI is pending. Run 42721006544 passed all workflow steps, including the full SyracuseOffsetIdentity source/audit, closed-form offset, stronger lower bound, valuation-one margin block and valuation-transition modules. The new lubuimi_initial_valuation_one_cylinder declaration has transitive profile [propext, Classical.choice, Quot.sound]; the explicit complete-log sorryAx check passed. The global Collatz conjecture is not claimed as proved. The current central obligation is to prove a positive signed margin on some finite realized block for every positive odd starting value.

## Copyright and license

Copyright © 2026 Ta-Yoshua Lubuimi. All rights reserved for original Collatz/Syracuse materials owned by the author. The repository includes [LICENSE-PROPRIETARY.md](LICENSE-PROPRIETARY.md) and [commercial licensing and remuneration terms](LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md). Lean, Mathlib, and all third-party materials remain subject to their own licenses. No general open-source or commercial reuse license is granted for the author's original materials.


### Cylinder formalization update — 10 November 2026

The main-cylinder CI attempt [42720406876](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42720406876) failed at the induction step because the dependent induction hypothesis still required the restricted prefix hypotheses. The current branch now explicitly applies both restrictions in `ih'`; exact-commit run [42721305220](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721305220) is in progress. No new compile/audit success is claimed yet. The research record also now documents **Lubuimi's Finite Valuation-Word Cylinder Partition Theorem**: every finite positive exact valuation word is one unique odd residue class modulo `2^(A+1)`, with exact relative density `2^-A` among odd starts and child mass ratio `2^-b`. The full mathematical statement and proof are in `Lubuimi_Finite_Valuation_Word_Cylinder_Partition_2026-11-10.md`.
