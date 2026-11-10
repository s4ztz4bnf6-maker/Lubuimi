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

The main-cylinder CI attempts [42719689591](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42719689591) and [42720406876](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42720406876) failed at proof-script obligations; their error-recovery `sorryAx` output is preserved as failed-attempt history. The current branch applies the restricted induction hypotheses explicitly. The refined declaration then passed two complete exact-commit workflows, [42721006544](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721006544) and [42721305220](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721305220), with transitive profile `[propext, Classical.choice, Quot.sound]` and no `sorryAx` in the complete-log scan. The research record also now documents **Lubuimi's Finite Valuation-Word Cylinder Partition Theorem**: every finite positive exact valuation word is one unique odd residue class modulo `2^(A+1)`, with exact relative density `2^-A` among odd starts and child mass ratio `2^-b`. The full mathematical statement and proof are in `Lubuimi_Finite_Valuation_Word_Cylinder_Partition_2026-11-10.md`.


Latest exact-head recheck: run [42724343412](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42724343412) was triggered on current branch head `29b27dc529b9e81a33b5211e9e01a01e19edc256`. Checkout and Lean manifest setup succeeded; Mathlib cache restoration was in progress at the latest retrieval. Earlier rechecks 42721911555 and 42722186081 are preserved in the chronology. The completed positive audits 42721006544 and 42721305220 remain the verified evidence for the initial-cylinder declaration.


### Lubuimi terminal-residue collision energy — 10 November 2026

A new mathematical note, [Lubuimi's Terminal-Residue Collision Energy](Lubuimi_Terminal_Residue_Collision_Energy_2026-11-10.md), derives a finite-place incidence map from length-k valuation words to terminal unit residues modulo 3^k. With source weights 2^-A, its exact energy splits as E_k = 3^-k + C_k^coll, and C_k^coll ≥ 1/(2·3^k). This is an exact APW4-style diagonal/off-diagonal collision identity in the Syracuse model, not yet the historical APW4 BIB reserve and not a Collatz descent proof. Its Lean formalization remains open.


### Finite Markov representation of terminal-residue collision energy

The new [Lubuimi Terminal-Residue Collision Energy](Lubuimi_Terminal_Residue_Collision_Energy_2026-11-10.md) note now derives an explicit finite rational Markov matrix `P_k` for the terminal-residue distribution: `m_k = δ₀ P_k^k`. At `k=2`, the exact vector on units mod 9 is `(8,16,11,4,2,22)/63`, giving energy `5/21`, diagonal `1/9`, and collision mass `8/63`. This is a mathematically derived finite-matrix/second-moment interface; its Lean formalization and the historical APW4/BIB capacity transfer remain open.


Repository citation metadata is provided in [`CITATION.cff`](CITATION.cff). Original Syracuse/Collatz research, mathematical statements, manuscripts and original Lean formalization are attributed to **Ta-Yoshua Lubuimi**; AI tools are acknowledged only as assistance, not as authors or independent mathematical verifiers.


### 10 November 2026 — exact mixed-word bridge and finite k=2 Lean result

The finite Kolaz path 731 -> 1097 -> 823 realizes valuation word (1,2), with cylinder residue 11 mod 16 and affine offset identity 8*823=9*731+5. The corresponding Lean declaration realizesValuationWord12_iff_mod_sixteen_eleven is in SyracuseOffsetIdentity.lean on PR #9 head 56c6d6d86fb5122d75f89f5e614f7f333e2d31a9; exact-head run 42736159935 is pending.

The standalone terminal-residue k=2 module passed Lean 4.35.0 workflow 42735716873 with seven standard-profile declarations, no actual sorryAx, and lake check --paranoid. It proves the finite distribution (8,16,11,4,2,22)/63 and energy 5/21. Kolaz PR #39's B=511/B=1023 archive and x=731 regression bridge passed run 42735880399. These finite results do not prove global Collatz descent.


### Exact mixed-word Lean result — 10 November 2026

The specific valuation word (1,2) is now formally verified by declaration realizesValuationWord12_iff_mod_sixteen_eleven in workflow 42736159935 on exact source commit 56c6d6d86fb5122d75f89f5e614f7f333e2d31a9. It is equivalent to n ≡ 11 mod 16, has standard transitive axiom profile [propext, Classical.choice, Quot.sound], and the completed log contains no actual sorryAx. This is a verified special case only; arbitrary finite words and the tail partition remain open Lean targets.


### Finite-depth APW4-style uniform-fibre bridge

See [SYRACUSE_FINITE_DEPTH_UNIFORM_FIBRE_BRIDGE_2026-11-10.md](SYRACUSE_FINITE_DEPTH_UNIFORM_FIBRE_BRIDGE_2026-11-10.md). The exact cap and dyadic child/tail partition yield a common uniform finite fibre at every fixed depth, with prefix-dependent distinguished proportion 1-2^-B_α. This is a mathematical bridge candidate, not yet Lean-formalized and not the historical APW4/BIB incidence map.
