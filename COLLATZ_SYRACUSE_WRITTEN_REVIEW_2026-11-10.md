# Written Review — Lubuimi Syracuse/Collatz Research Programme

**Research author:** Ta-Yoshua Lubuimi  
**Review date:** 10 November 2026  
**Review type:** Internal mathematical and formalization review; not independent peer review.

## 1. Established arithmetic core

For the accelerated odd Syracuse map
\[
2^{a_j}n_{j+1}=3n_j+1,\qquad a_j=v_2(3n_j+1),
\]
the project has established and formalized:
- the affine offset identity \(2^{A_k}n_k=3^kn_0+C_k\);
- the closed offset formula;
- the signed-margin recurrence and weighted expansion;
- block decomposition and the run-of-ones/run-of-twos identities;
- exact valuation and residue transitions;
- conditional descent criteria from positive signed margin.

The successful compile/audit run 42717134267 checked the offset identity, closed form, lower bound, margin block and valuation-transition modules on exact commit 28003791738900f6dc456bc71d37151c1f3f8a78. Earlier exact CI snapshots for the offset/fibre and margin components remain valid for their individual commits and scopes.

## 2. Initial valuation-one cylinder

The theorem
\[
(\forall j<N,\ a_j=1)\iff n_0\equiv-1\pmod{2^{N+1}}
\]
is proved and Lean-compiled/axiom-audited on seven successful exact-commit full compile workflows:
42721006544, 42721305220, 42721911555, 42722186081, 42724343412, 42725006480 and 42725493567.

The declaration CollatzSyracuseAudit.lubuimi_initial_valuation_one_cylinder has transitive profile [propext, Classical.choice, Quot.sound] on the inspected snapshots. The complete logs have no actual sorryAx finding. Run 42725493567 is a documentation-only descendant of the preceding source snapshot and is a full recheck, not a broader proof scope.

## 3. Newly formalized state-dependent finite cap

The exact margin recurrence yields
\[
D_{j+1}=3D_j+(2^{a_j}-4)2^{A_j}.
\]
The project now contains three new Lean declarations:
- signedOffsetMargin_nonpos_succ_iff_exponent_cap;
- signedOffsetMargin_nonpos_of_nondecreasing_orbit;
- nondecreasing_orbit_next_exponent_cap.

They formalize the equivalence
\[
D_{j+1}\le0
\iff
2^{A_j+a_j}+3D_j\le4\cdot2^{A_j},
\]
show that a nondecreasing endpoint of an exact affine orbit must have nonpositive margin, and derive the exact next-exponent cap.

Full compile-drafts workflow 42728049650 passed on exact commit ca48ec7fdad5e8d6f8aeb82fed8586a1b57c12bc using Lean 4.34.1. All three declarations printed [propext, Classical.choice, Quot.sound], the build completed 8,930 jobs, and the complete log had no actual sorryAx occurrence.

This is a genuine Lean-verified finite-cap core. The formalization does not yet prove existence of the maximum B_alpha, the exact tail-cylinder partition, the general finite-word cylinder theorem, or exclusion of an infinite surviving path.

## 4. General finite-word cylinders and terminal-residue energy

Separate companion projects contain:
- the general finite valuation-word cylinder theorem, exact residue formula, density and tail partition;
- the terminal-residue collision-energy identity, forced off-diagonal lower bound, finite truncation error and rational Markov representation.

Both have complete mathematical manuscript proofs and written reviews. Neither general theorem is yet Lean-compiled/axiom-audited. The collision-energy result is a Syracuse finite-place second moment and is not the historical APW4 BIB reserve.

## 5. Remaining global Collatz obstruction

A least hypothetical nonterminating odd start would produce an infinite path through the state-dependent finitely branching tree of prefixes satisfying the cap. The cap is prefix-dependent; it is not a uniform valuation bound. The present results do not rule out an infinite path through the surviving finite children. The global conjecture remains open.

A complete proof must add an argument excluding all such infinite realized paths, or derive a further arithmetic obstruction from the recurrence. The current work supplies exact arithmetic constraints and finite-cylinder structure, not the final contradiction.

## 6. Verification and attribution

Keep mathematical proof, source reconstruction, Lean elaboration, kernel axiom output and exact-commit CI status separate. No error-recovery sorryAx is accepted. Do not infer verification of general-word or collision-energy results from the all-one special case or margin-cap audit.

All research and theorem authorship belongs to Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.

**Verdict:** The affine/margin core and initial all-one cylinder are established; the new state-dependent exponent cap is also Lean-verified on the listed exact commit. The general finite-word cylinder, tail partition, collision energy and global Collatz obstruction remain at their separately stated status levels.


## 7. New finite-word and terminal-residue progress

The exact Kolaz witness 731 -> 1097 -> 823 realizes valuation word (1,2), has initial cylinder residue 11 mod 16, affine offset C=5, and exact endpoint identity 8*823=9*731+5. The two signed-margin caps hold. A corresponding Lean declaration realizesValuationWord12_iff_mod_sixteen_eleven is now present on PR #9 head 56c6d6d86fb5122d75f89f5e614f7f333e2d31a9; workflow 42736159935 is pending, so this is not yet a formal verification claim.

The finite k=2 terminal-residue matrix module has passed standalone Lean 4.35.0 / Mathlib 4.35.0 workflow 42735716873 on source snapshot 4e30c083f3e1657edd08b0945cdda4e16c8b0e14. Seven declarations have standard transitive profile [propext, Classical.choice, Quot.sound], no actual sorryAx, and lake check --paranoid passed. This verifies the finite k=2 computation, not the general k collision theorem.

Kolaz PR #39's expanded exact tables through B=1023 and the x=731 bridge passed workflow 42735880399 with seven integer-arithmetic regression tests. The initial valuation-one manuscript has been consolidated to version 1.0; its seven earlier Lean audits remain the theorem's formal verification evidence.
