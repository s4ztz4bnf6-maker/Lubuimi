# Collatz–Syracuse research workspace

**Author and research lead: Ta-Yoshua Lubuimi**

This repository records Ta-Yoshua Lubuimi's Collatz/Syracuse mathematical research and Lean formalization. AI tools are assistants only and are not authors or independent verifiers.

## Research record

The affine-offset and signed-margin framework and the initial valuation-one cylinder theorem are attributed to Ta-Yoshua Lubuimi. The APW4–Syracuse cylinder–energy bridge is tracked as a named research programme, not asserted as an established theorem.

- [Consolidated Collatz–Syracuse research record](COLLATZ_SYRACUSE_RESEARCH_RECORD_TA_YOSHUA_LUBUIMI_2026-11-10.md)
- [Lubuimi's Initial Valuation-One Cylinder Theorem — English](SyracuseInitialValuationOneCylinder_2026-11-09.md)
- [Lubuimis Satz über den anfänglichen Valuierungs-eins-Zylinder — Deutsch](Lubuimi_Anfangszylinder_Syracuse_DE_2026-11-10.md)
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


### Uniform-fibre cardinality formalization — local lemma verified; full bridge open

A Lean declaration `dyadicUniformFibre_partition_card` was added to `SyracuseOffsetIdentity.lean`. It states the exact count of child blocks plus the tail block at a common dyadic refinement depth. Exact source head `a1becbc8e837f10abcd952a2e03832cb057fb2b8` passed compile/audit in workflow [42738528207](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42738528207), with the standard transitive axiom profile and no actual `sorryAx` in the completed audit. This verifies that named local cardinality identity only. The full cap/tree/residue-fibre bridge, historical APW4/BIB incidence identification, and any global Collatz descent remain open.


### Cross-project verification update — 10 November 2026

The exact dyadic common-refinement cardinality identity `dyadicUniformFibre_partition_card` passed Lean 4.35.0 compile/audit on source commit `a1becbc8e837f10abcd952a2e03832cb057fb2b8`, workflow [42738528207](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42738528207). The complete finite-depth cap/tree/residue-fibre construction is still not fully formalized. This local result is suitable as a component of the longer proof architecture, but it does not establish the infinite-path exclusion or global Collatz conjecture.

The APW4 connection remains conditional on explicit mathematical maps that preserve the historical event indices, weights, and incidence/capacity structure. No such identification is asserted here. The Syracuse-derived finite fibre is used as a test model only until those obligations are proved.


### Initial-cylinder manuscript correction and German edition — 10 November 2026

The theorem note and consolidated research record now reflect the two completed exact-commit audits for `lubuimi_initial_valuation_one_cylinder`: [42721006544](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721006544) and [42721305220](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721305220). Both report `[propext, Classical.choice, Quot.sound]` and no `sorryAx` in the complete-log scan. A matching German manuscript has been added at [Lubuimi_Anfangszylinder_Syracuse_DE_2026-11-10.md](Lubuimi_Anfangszylinder_Syracuse_DE_2026-11-10.md). The exact theorem remains distinct from the global Collatz conjecture.


### Exact current-source audit for the initial cylinder — 10 November 2026

The current source commit `a1becbc8e837f10abcd952a2e03832cb057fb2b8` passed [workflow 42738528207](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42738528207). The log prints the standard transitive axiom profile for both `lubuimi_initial_valuation_one_cylinder` and `dyadicUniformFibre_partition_card`; the explicit `sorryAx` gate passed. This is a later exact-source recheck, not a claim of global Collatz descent.


### Kolaz threshold-return archive — exact finite CI

The separate [Kolaz / Collatz threshold-return archive PR #39](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/39) now records exact first-return tables for thresholds (B=31,63,127,255,511,1023,2047,4095,8191), regression tests against fresh integer enumeration, and named common-suffix/confluence checks. The exact finite-computation workflow [42738273620](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42738273620) passed on source head `c8ae9d010757b82342fa8085011c6d55bdcbbd94`. This is a reproducibility result for those finite tables and tests, not Lean kernel verification, a uniform threshold theorem, or a proof of global Collatz. The separate 1097 threshold/count lead remains **OFFEN – NICHT VERIFIZIERT**.


## Universal-proof and APW4 bridge obligation ledger — 10 November 2026

See [the Collatz–Syracuse and APW4 bridge proof-obligation ledger](COLLATZ_APW4_BRIDGE_PROOF_OBLIGATION_LEDGER_2026-11-10.md). It preserves the distinction between exact finite cylinder/energy/threshold results and the still-open universal positive-margin/descent obligation. The APW4-style bridge remains conditional on explicit atom, index, weight and weighted-capacity transport; no historical APW4/BIB identification is assumed.


## Addendum — Syracuse finite-depth uniform-fibre bridge and current proof boundary, 10 November 2026

The Collatz/Syracuse programme now records an exact finite-depth uniform-fibre construction in [the bridge note](https://github.com/s4ztz4bnf6-maker/Lubuimi/blob/main/SYRACUSE_FINITE_DEPTH_UNIFORM_FIBRE_BRIDGE_2026-11-10.md). The separate Lean checkpoint [run 42738528207](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42738528207), on commit `a1becbc8e837f10abcd952a2e03832cb057fb2b8` with Lean 4.34.1, passed for the named declaration `dyadicUniformFibre_partition_card` and its reported standard axiom profile. This verifies that finite cardinality identity on that exact source/toolchain snapshot; it does not verify the entire prefix-dependent cylinder partition or the APW4 transport bridge.

The bridge note specifies the finite interval partition, exact child/tail cardinalities and uniform masses, and the refinement to common-modulus residue atoms. It also records the exact remaining obligations: formalize disjointness/coverage and the residue-atom bijection; instantiate the generic finite-fibre data; and prove a genuine infinite-path exclusion argument. Finite branching and fixed-depth uniformization alone do not exclude an infinite path.

The exact affine offset identity, signed-margin recurrence, initial valuation-one cylinder equivalence, and conditional positive-margin descent results remain separate established components. The universal Collatz conclusion still requires a theorem that every positive odd start has a realized finite block with positive signed margin (or another rigorously sufficient global descent mechanism), together with the corresponding orbit argument. No such universal theorem is claimed here.

The APW4 bridge is only a candidate transfer architecture. It is not imported into the Collatz proof unless the historical event/slot maps, indices, weights, diagonal and off-diagonal mass transports, and weighted Hall/BIB capacity inequality are all explicitly proved and the resulting theorem closes the infinite-path obligation. The independent Kolaz threshold-return archive remains a separate research strand and its reproducibility CI is not a Collatz proof.


## Exact-head Kolaz recheck and universal-margin frontier — 10 November 2026

The separate Kolaz threshold-return project was rechecked on exact source head `54f8b177d70f216fac81aa6cf6b28b8fec36596c`. Both [workflow 42739986917](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42739986917) and [workflow 42739979513](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42739979513) passed. The exact finite test suite includes the 1097-cylinder/margin certificate at B=1023, direct return to one, exact escape-source characterization, exact threshold tables, CSV tables, and cross-threshold common-suffix checks. The enumerated thresholds are B=31, 63, 127, 255, 511, 1023, 2047, 4095, and 8191. The output includes common-suffix comparisons of lengths 45 (1023/2047 pair) and 29 (4095/8191 pair), with their recorded finite source excursions. These are reproducible finite-computation results, not a uniform theorem over all thresholds or starting values, and not a proof of global Collatz descent.

The Lean result `dyadicUniformFibre_partition_card` remains separately verified on exact source commit `a1becbc8e837f10abcd952a2e03832cb057fb2b8`, workflow [42738528207](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42738528207), with the standard transitive axiom profile and no actual `sorryAx`. Its scope is the finite child-block plus tail-block cardinality identity only.

The signed-margin development now records a necessary next-exponent cap for every nondecreasing odd-orbit endpoint. This does not yet prove that an infinite nondecreasing path is impossible: the remaining universal step is a uniform argument showing that the state-dependent cap/margin constraints cannot persist along any infinite realizable valuation word, or that a strictly positive descent margin must recur with a bound sufficient for global descent. Finite branching alone is not used as a termination argument.

The APW4 bridge ledger remains the acceptance gate for cross-project use: exact atom map, index multiplicity, original weight preservation, diagonal identity, weighted off-diagonal demand versus actual BIB capacities, and a strict positive realized block margin must all be proved. Otherwise the APW4 and Collatz results remain independent.

PR #9 remains a draft and is currently reported non-mergeable against its base; it is retained as a working integration branch, not merged. No existing theorem or historical definition is replaced.


## Terminal-residue congruence bridge — 10 November 2026

The exact affine offset identity now yields a separately Lean-compiled terminal-residue congruence in `SyracuseOffsetIdentity.lean`: `CollatzSyracuseAudit.terminal_residue_congruence_of_affine_identity`, exact source commit `db58a4054238e1a52ea935968dc96a7066de20d6`, workflow [42742247801](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42742247801). Its transitive axiom profile is `[propext, Quot.sound]`; no actual `sorryAx` appears in the complete log. It proves the multiplicative congruence modulo (3^k), not yet the inverse formula or terminal-unit property.

The terminal-residue collision energy remains a separate finite-place model. Its full-source off-diagonal lower bound is an average over valuation words and cannot alone exclude a single exceptional infinite word. A Collatz transport theorem still needs a non-tautological target capacity derived from the signed-margin dynamics and a proved weighted Hall inequality on the surviving non-descending events. The APW4/BIB reserve is not identified with this collision energy.


### Verified terminal-residue inverse formula — 10 November 2026

The exact affine identity now yields the Lean-verified formula (n_k=C_k(2^{A_k})^{-1}) in (mathbb Z/3^kmathbb Z) at root commit `b58e1ddc859caaf678c2239c5ed3e952b0ef4ae0), workflow [42743672688](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42743672688). The named profiles are [propext, Classical.choice, Quot.sound] for the power-of-two unit lemma and [propext, Quot.sound] for the inverse formula; the full no-sorryAx guard passed. The canonical offset's own unit property is a separate next theorem, currently under exact-head run [42744418555](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42744418555).
