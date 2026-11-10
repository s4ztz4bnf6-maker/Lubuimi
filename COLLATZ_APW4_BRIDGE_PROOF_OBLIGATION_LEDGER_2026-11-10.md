# Collatz–Syracuse and APW4 bridge: proof-obligation ledger

**Author and research lead:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Purpose:** preserve the parallel workstreams without conflating their theorem scopes.

## 1. Verified Collatz/Syracuse components

The research record contains exact affine-offset identities, signed-margin lemmas, the initial valuation-one cylinder theorem, and finite exact valuation-word/cylinder results. The initial valuation-one theorem has passed exact-head Lean compile and axiom audit on the documented commits. The finite dyadic uniform-fibre cardinality identity `dyadicUniformFibre_partition_card` passed workflow 42738528207 on source commit `a1becbc8e837f10abcd952a2e03832cb057fb2b8`, with standard transitive profile `[propext, Classical.choice, Quot.sound]` and no actual `sorryAx` in the completed log.

The finite terminal-residue collision-energy project is a separate finite-​k=2 result. Kolaz threshold-return tables through B=8191 and their regression/confluence tests are finite-computation reproducibility results. None is a global Collatz proof or a uniform all-start descent theorem.

## 2. Central unresolved universal obligation

The main mathematical target remains: for every positive odd starting value, construct a finite realized Syracuse block with a strictly positive signed margin (or an equivalent rigorously justified descent certificate), in a form that excludes every possible infinite non-descending trajectory.

A prefix-dependent finite cap and a finite set of children do not alone rule out an infinite path. A valid closure must supply an additional global argument—such as a proved well-founded ranking, a uniform descent mechanism, or a contradiction from an exact energy/capacity inequality. The argument must apply to every admissible starting value and every branch, not only a finite sample or a bounded threshold.

## 3. APW4-style energy bridge: conditional research programme

The proposed Syracuse terminal-residue energy has a finite diagonal/off-diagonal decomposition and exact finite collision identities. It is a useful model for testing energy bookkeeping. It is **not** yet the historical APW4 BIB reserve, and no historical APW4 event-index map or weighted Hall capacity theorem has been identified with it.

Before using this bridge in the universal Collatz proof, prove explicitly:
1. the source and target finite sets and the exact atom map;
2. injectivity/surjectivity or the precise multiplicity formula;
3. preservation of the original cylinder weights;
4. the diagonal contribution identity;
5. the off-diagonal demand/capacity inequality with no unweighted substitution;
6. a strict inequality strong enough to force a positive realized block margin for every starting value.

If any item fails, keep the finite energy result as an independent theorem and continue the other Collatz strands. Do not retrofit APW4 historical definitions to fit a Syracuse model.

## 4. Parallel work plan

- Continue exact affine-offset and signed-margin lemmas.
- Formalize the general finite valuation-word partition and full cap/tree/interval/residue-fibre bijection.
- Keep the initial valuation-one cylinder, the word (1,2) special case, the general word theorem, and the uniform-fibre cardinality identity as separate scope-labelled results.
- Continue Kolaz finite threshold-return enumeration as a computational side project, preserving its finite bounds and exact source tables.
- Investigate whether the terminal-residue Markov matrix yields a rigorous universal estimate; do not infer it from the k=2 calculation.
- Test the APW4-style bridge only through explicit index- and weight-preserving maps.
- For every candidate global argument, state the quantified start value, block length, valuation word, margin inequality and descent consequence.

## 5. CI and documentation rules

Every CI statement is bound to an immutable commit, Lean/Mathlib version, named declarations, and exact audit scope. A successful compile does not prove global descent. A failed or cancelled run does not erase earlier successful results. Error-recovery `sorryAx` is a failure, never a placeholder for acceptance.

The existing proprietary notices and commercial licensing terms remain unchanged. Third-party Lean/Mathlib licenses remain separate. Authorship remains Ta-Yoshua Lubuimi; AI systems are assistants only.

**Current conclusion:** substantial exact finite arithmetic and Lean milestones are verified. The global Collatz conjecture remains open in this project record. The APW4 energy bridge is a research candidate, not an established Collatz theorem.


## 6. Exact finite Kolaz recheck and universal descent obligation — 10 November 2026

Exact source head `54f8b177d70f216fac81aa6cf6b28b8fec36596c` passed both [42739986917](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42739986917) and [42739979513](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42739979513). The reproducibility suite checks the nine finite thresholds 31 through 8191 (powers-of-two-minus-one), exact enumerated tables, CSV tables, the B=1023 1097-cylinder/margin certificate, direct return to one, escape-source characterization, and common suffixes across selected thresholds. The finite outputs include common-suffix lengths 45 and 29 for the recorded pairs (1023,2047) and (4095,8191). This verifies the specified finite data and regression tests only.

The universal Collatz gap is unchanged: show that the necessary state-dependent cap for nondecreasing endpoints cannot be satisfied indefinitely along any realizable infinite valuation word, or derive a uniform positive descent margin with a valid block-to-global descent implication. Neither finite branching nor a finite threshold table alone supplies this conclusion.

The dyadic uniform-fibre cardinality identity remains a separate Lean-verified finite counting lemma at exact commit `a1becbc8e837f10abcd952a2e03832cb057fb2b8` / workflow [42738528207](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42738528207). The full prefix-dependent cap/tree/interval/residue-atom bijection remains open.

The APW4-to-Collatz transport checklist in §§2–3 remains mandatory and unchanged. No bridge is admitted without exact source/target atoms, index multiplicities, original weight preservation, diagonal identity, weighted Hall/BIB capacity, and strict positive margin. No historical APW4 definitions are retrofitted to the Syracuse setting.


## 7. Terminal-residue congruence and the energy-transport test — 10 November 2026

### 7.1 New exact Lean bridge from the affine offset identity

The root Syracuse module now contains
`CollatzSyracuseAudit.terminal_residue_congruence_of_affine_identity`
at exact commit `db58a4054238e1a52ea935968dc96a7066de20d6`. The exact-head compile/axiom-audit workflow [42742247801](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42742247801) succeeded. The declaration has transitive axiom profile `[propext, Quot.sound]`, a subset of the standard profile, and the complete workflow log contains no `sorryAx`.

The theorem states only the multiplicative congruence
[
(2^Amod 3^k)(n_kmod 3^k)=C_kmod 3^k
]
under the exact affine identity (2^A n_k=3^k n_0+C_k). It does **not** yet prove that (2^A) is a unit in (mathbb Z/3^kmathbb Z), does not derive the explicit inverse formula (	au_k=C_k2^{-A}), and does not prove that the terminal residue is a unit. Those are the next separate formal obligations.

### 7.2 Exact finite-source energy model

The standalone terminal-residue project PR #38 gives the exact source/place construction:
- sources: (mathcal W_k=mathbb N_{>0}^k), with (w_alpha=2^{-A(alpha)});
- places: (U_k=(mathbb Z/3^kmathbb Z)^	imes);
- incidence: (alphamapsto	au_k(alpha)=C_k(alpha)2^{-A(alpha)}mod 3^k);
- place masses: (m_k(t)=sum_{	au_k(alpha)=t}w_alpha);
- energy: (E_k=sum_t m_k(t)^2=D_k+C_k^{m coll});
- diagonal: (D_k=3^{-k});
- off-diagonal: (C_k^{m coll}=sum_{alpha
eeta,,	au_k(alpha)=	au_k(eta)}w_alpha w_eta);
- finite-place Cauchy bound: (C_k^{m coll}ge 1/(2cdot3^k)).

The finite (k=2) matrix computation is separately Lean-verified in PR #38; it is not the general countable-source energy proof.

### 7.3 Why the proposed APW4-style transport is not yet a Collatz proof

For a minimal counterexample reduction, a hypothetical non-descending trajectory would give an infinite valuation word whose every prefix remains above its starting value. Restricting the source family to finite prefixes satisfying the necessary signed-margin inequalities gives a possible *survival-energy* research object:
[
m_k^{m surv}(t)=
sum_{substack{alphainmathcal W_k\
alpha {m satisfies all prefix margin constraints}\
	au_k(alpha)=t}}w_alpha,
qquad
E_k^{m surv}=sum_{tin U_k}m_k^{m surv}(t)^2.
]
This is only a proposed restricted measure until its prefix predicate and weights are formally tied to the exact signed-margin recurrence.

The full-source collision lower bound is an average over all valuation words. It does not exclude one exceptional infinite word: the mass of a single length-(k) cylinder is (2^{-A(alpha)}), which tends to zero as the prefix length grows. Thus an average Cauchy bound, even when exact, cannot by itself exclude a single positive-integer orbit.

A genuine Collatz off-diagonal transport would need a separately defined target place/capacity system, with a proved weighted Hall inequality for the surviving non-descending collision events and a capacity budget derived from the signed-margin or descent structure. Assigning each collision to its terminal residue and taking the capacity to be the resulting mass square merely restates (E_k^{m surv}); it gives no independent upper bound and no contradiction.

**Decision:** the finite terminal-residue energy is retained as an exact, separate incidence model. The APW4-style transport analogy is useful as a design constraint, but no BIB-like Collatz capacity or global energy theorem is introduced until a non-tautological target capacity and the required Hall bound are constructed.



### 7.4 Exact k=2 terminal-residue energy: verified scope and orbitwise limitation

The standalone PR #38 Lean module `LubuimiTerminalResidueEnergyK2.lean` passed exact-head workflow [42743051889](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42743051889) at source head `6c73f82a5e2eeef44fda294f71986474d2f50988`. The completed job compiles the finite rational transition rows modulo 9, verifies their row sums, computes the two-step distribution `(8,16,11,4,2,22)/63`, and proves `twoStepEnergy = 5/21` by exact rational arithmetic. The file prints the axiom profiles for all named declarations. This is an exact finite-state computation for k=2, not a proof of the general countable-source energy identities or any orbitwise Collatz conclusion.

The logical limitation is now made explicit in the research record: the full valuation-word energy and its Cauchy lower bound average over all finite words. A single exceptional infinite trajectory can have cylinder mass tending to zero. Therefore that average lower bound does not exclude one exceptional infinite word. A Collatz proof would require a separate orbitwise implication, such as a uniform finite block with positive signed margin for every non-descending candidate, or a non-tautological survival-event capacity bound derived from the exact margin dynamics. No such uniform implication is presently established.

The APW4 analogy remains a design heuristic only. The terminal-residue places and collision energy are independently defined Syracuse objects; no equality with the historical APW4 BIB reserve or weighted Hall capacity is asserted.



### 7.5 Current formalization boundary: finite k=2 PASS, orbitwise cap tree OPEN

The PR #38 finite `k=2` collision-energy computation has a completed exact-head audit [42743051889](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42743051889): 9,048 build jobs completed; all printed named declarations have the standard axiom profile; the only textual occurrences of `sorryAx` in the workflow log are the shell guard that rejects it, not declaration output. The exact value is `twoStepEnergy = 5/21` for the six unit residues modulo 9.

For the global Syracuse question, the concrete next target remains the well-foundedness of the finite branching tree of valuation prefixes satisfying every exact signed-margin cap. The cap is necessary for a nondecreasing endpoint but not sufficient for survival. A proof that typical prefixes have small measure, or that each fixed finite depth has low total mass, does not rule out one infinite branch. The required theorem must exclude every infinite realizable cap-compatible branch (or give a valid orbitwise finite positive-margin block), with all quantifiers uniform in the starting odd integer. No APW4 BIB capacity is imported into this problem.


### 7.4 Explicit inverse terminal-residue formula — verified

At exact root commit `b58e1ddc859caaf678c2239c5ed3e952b0ef4ae0`, workflow [42743672688](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42743672688) passed. It verifies:
- `twoPow_isUnit_mod_threePow` with profile `[propext, Classical.choice, Quot.sound]`;
- `terminal_residue_eq_offset_mul_inv_of_affine_identity` with profile `[propext, Quot.sound]`.

Consequently, whenever the exact affine identity (2^A n_k=3^k n_0+C) holds, Lean proves
[
n_k = C(2^A)^{-1}quad	ext{in }mathbb Z/3^kmathbb Z.
]
The complete workflow's no-`sorryAx` guard passed. This establishes the inverse formula for arbitrary (C) under the affine identity, but not yet the canonical-offset unit property.

The next declarations are on root head `7a1c174e1c5e70e1b601760db57692009dc1f552`: `twoPow_mod_three_ne_zero`, `canonicalOffset_not_dvd_three`, `canonicalOffset_isUnit_mod_three_pow`, `canonicalTerminalResidue_isUnit), and the exact canonical terminal-state formula. Their exact-head run [42744418555](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42744418555) is in progress. No canonical unit-group claim is made until it passes with named axiom profiles and a full no-`sorryAx` scan.


### 7.5 Canonical terminal-residue unit proof — current repair

The first attempt at `canonicalTerminalResidue_isUnit` failed at the implicit inverse-unit typeclass inference for the inverse of the casted natural (2^{A_k}); the failed declaration therefore had a temporary `sorryAx` in the compiler's error-recovery output and is not accepted as verified. The current head `daa2fd1cf945b15abc7e8fc11b2f67104f8c0fa8` names the casted power's unit proof and its inverse-unit proof explicitly before applying `IsUnit.mul`. Exact-head run [42745303364](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42745303364) is in progress. Do not claim the canonical offset or terminal residue is a unit until this run passes and the named declaration profile is checked.


### 7.6 Explicit inverse-unit construction — current candidate

The exact-head run [42745303364](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42745303364) failed again at the generic `IsUnit.inv` inference, despite naming the casted power's unit proof. The current head `628a0a4d67428251fbf32f627aea3843d7a090e3` avoids that inference entirely: it destructures the existing `IsUnit) witness into a unit (u), constructs (u^{-1}) in the unit group, and proves its coercion is the inverse of the casted power. Exact-head CI is pending. The canonical terminal-residue unit theorem remains unverified until the new run passes.


## 1.6 — Explicit finite exponent cap: exact-head compile PASS

The clean follow-up PR #42 is based on the current PR #9 head and does not build on the failed PR #40 candidate. Exact source head d3b2a55c1987b4a4f2cdbaef2a97486679d68f26 completed workflow 42747001077 successfully. The workflow built CollatzAudit and compiled SyracuseOffsetIdentity.lean. The new declarations

- CollatzSyracuseAudit.next_exponent_lt_integer_bound
- CollatzSyracuseAudit.nondecreasing_orbit_next_exponent_finite_bound

printed exactly [propext, Classical.choice, Quot.sound]. The offset module's own sorryAx scan passed; the whole repository log contains unrelated audit commands for other modules, so no repository-wide no-sorryAx claim is made. This workflow did not run lake check --paranoid; no paranoid PASS is claimed.

The new bound is b < 4*2^A - 3D, derived from the already-established exponential cap. It is state-dependent, not uniform across all prefixes, and does not exclude an infinite path. The earlier PR #40 failure is preserved as a failed candidate and does not alter the prior PR #9 theorem record.

## 1.7 — Finite cap-tree path certificate candidate

PR #48 adds a finite prefix state (A,C,D), exact append transition, finite child set, and finite cap tree at every depth. Its principal target is that every prefix of a nondecreasing exact affine Syracuse path lies in the finite cap tree. It also attaches the exact terminal-residue unit map to the path certificate. Exact head 82cb74118eff69afd667c0fd827b266d115284ca; workflow 42748141012 is queued. This is a proof candidate until the exact build and axiom logs complete.

The theorem is deliberately a finite-depth path embedding, not a proof that the tree has no infinite path. The full general valuation-word cylinder bijection and the k=2 terminal-residue energy remain distinct modules; no energy upper bound or global Collatz conclusion is inferred.
