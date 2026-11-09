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

The Lubuimi initial-cylinder theorem has been added as a Lean declaration. Earlier attempts 42719689591 and 42720406876 exposed proof-script issues and showed sorryAx only in failed elaboration recovery; those attempts are retained in the chronology. The refined declaration then passed two complete workflows: run 42721006544 on merge commit 44bb2ac (PR head 013192ce524a4572a9d96c8d4dcb2796830b1f62) and run 42721305220 on merge commit 3d79761 (PR head ad7203f5571d03e5989b9ac935b2103300f02409). Both completed all build and audit steps, printed the transitive profile [propext, Classical.choice, Quot.sound], and passed the explicit complete-log sorryAx scan. Run 42721911555 is rechecking the latest documentation-only head. The general finite valuation-word partition theorem remains a separate formalization target. The global Collatz conjecture is not claimed as proved. The current central obligation is to prove a positive signed margin on some finite realized block for every positive odd starting value.

## Copyright and license

Copyright © 2026 Ta-Yoshua Lubuimi. All rights reserved for original Collatz/Syracuse materials owned by the author. The repository includes [LICENSE-PROPRIETARY.md](LICENSE-PROPRIETARY.md) and [commercial licensing and remuneration terms](LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md). Lean, Mathlib, and all third-party materials remain subject to their own licenses. No general open-source or commercial reuse license is granted for the author's original materials.


### Cylinder formalization update — 10 November 2026

The main-cylinder CI attempt [42720406876](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42720406876) failed at the induction step because the dependent induction hypothesis still required the restricted prefix hypotheses. The current branch now explicitly applies both restrictions in `ih'`; exact-commit run [42721305220](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721305220) is in progress. No new compile/audit success is claimed yet. The research record also now documents **Lubuimi's Finite Valuation-Word Cylinder Partition Theorem**: every finite positive exact valuation word is one unique odd residue class modulo `2^(A+1)`, with exact relative density `2^-A` among odd starts and child mass ratio `2^-b`. The full mathematical statement and proof are in `Lubuimi_Finite_Valuation_Word_Cylinder_Partition_2026-11-10.md`.


Latest exact-head recheck: run [42722186081](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42722186081) was triggered on current branch head `a36894eefc52e5d28cd43110f5e289805509ad33` and was in progress at the latest retrieval (checkout complete; Lean toolchain/manifest setup underway). The two completed positive audits 42721006544 and 42721305220 remain the verified evidence for the initial-cylinder declaration.


### Lubuimi terminal-residue collision energy — 10 November 2026

A new mathematical note, [Lubuimi's Terminal-Residue Collision Energy](Lubuimi_Terminal_Residue_Collision_Energy_2026-11-10.md), derives a finite-place incidence map from length-k valuation words to terminal unit residues modulo 3^k. With source weights 2^-A, its exact energy splits as E_k = 3^-k + C_k^coll, and C_k^coll ≥ 1/(2·3^k). This is an exact APW4-style diagonal/off-diagonal collision identity in the Syracuse model, not yet the historical APW4 BIB reserve and not a Collatz descent proof. Its Lean formalization remains open.
