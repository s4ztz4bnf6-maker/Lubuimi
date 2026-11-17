# Syracuse / Collatz — consolidated project status

**Status date:** 14 November 2026  
**Research author:** Ta-Yoshua Lubuimi  
**Repository:** `s4ztz4bnf6-maker/Lubuimi`  
**Default branch:** `main`

## 1. Executive result

The repository contains a substantial collection of exact finite-prefix arithmetic, valuation-cylinder, affine-recursion, finite-fibre, quotient-state, and obstruction results. Several are independently recorded as Lean-verified on named source commits with the standard transitive axiom profile and explicit `sorryAx` rejection.

**The Collatz conjecture is not proved by this project.** The decisive global bridge from finite or probabilistic valuation information to a deterministic strict descent statement for every positive integer remains open. The terminal-congruence / arbitrary finite-word realization equivalence is also not yet closed as one complete theorem.

This report is a dated consolidation of the available repository and CI evidence. It does not close mathematical obligations merely to make the project appear finished.

## 2. Verified mathematical and formal results

### 2.1 Exact affine identities and backward reconstruction

The accelerated Syracuse recurrence has an exact finite-prefix affine representation. The repository records successful Lean checks for:

- `two_step_affine_identity`, `three_step_affine_identity`, `four_step_affine_identity`, and `finite_prefix_affine_identity`;
- `terminalExact_backward_step` and `terminalExact_backward_prefix`.

The dated record for the backward identities points to workflow [43076503425](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43076503425). The quotient-sequence formalization in PR [#81](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/81) passed on exact source head `2f7f3e3aabf4b05b8097228f7fe6ae433ae85b3e), workflow [43121953918](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43121953918), Lean job `130864363776`. The named quotient-state declarations were printed with the standard profile; the explicit `sorryAx` gate passed.

These are finite algebraic and quotient-state results, not a global orbit-descent theorem.

### 2.2 Finite child/tail partition

The child/tail partition result is recorded at source commit `cc63565dd55859a0e6ae8514173967e7d52334d9`, workflow [43026427449](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43026427449). The one-step child-block uniform-mass result is recorded on the corrected PR #78 head `3af286a1da893fc51b40343412056e0be2b8faa1`, workflow [43042316671](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43042316671). The latter proves a one-step finite counting identity only; it does not establish independence or an iterated product law.

### 2.3 Terminal congruence: unique residue class

PR [#82](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/82) now has exact source head `c5698519a86caf860eb6c2ede0f4d65d82de8541). Workflow [43412794362](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43412794362), Lean job `131843106387`, completed successfully. The actual log prints:

```
SyracuseAudit.terminalCongruence_unique_residue_class
  [propext, Classical.choice, Quot.sound]
```

The explicit `sorryAx` rejection gate passed. This verifies uniqueness of the terminal congruence class in the stated finite `ZMod` problem. It does **not** verify that the class has an odd positive representative realizing the prescribed valuation word, nor the complete cylinder equivalence.

### 2.4 Finite lift-count and density arithmetic

For a fixed positive word with total exponent (A), the project records the finite congruence calculation: one odd residue class modulo (2^{A+1}), exactly (2^{K-A-1}) lifts modulo (2^K) when (K\ge A+1), and normalized finite density (2^{-A}=\prod_i2^{-a_i}) among odd residues.

This arithmetic count is distinct from a Lean-verified theorem identifying that residue class with the complete actual-orbit valuation cylinder. The density is not promoted to the latter until the full word-realization equivalence is proved.

## 3. Research results and structural insights

1. **Affine bookkeeping is not descent.** The exact identity determines the accumulated affine offset, but the sign of the valuation surplus alone does not control the additive correction term.
2. **Finite-prefix realizability is not infinite-orbit control.** Congruence cylinders and finite Haar/counting masses describe finite prefixes. They do not rule out an exceptional integer orbit.
3. **One-step uniformity is not independence.** The verified child-block mass identity must not be iterated without a separate compatibility/independence theorem.
4. **Finite branching is not a finite tree.** The state-dependent cap on the next valuation gives finite branching at each fixed prefix on a non-descending path. No uniform depth bound or exclusion of an infinite branch follows from that fact alone.
5. **Minimal-counterexample reductions need a completed terminal bridge.** The cap-tree and least-start route still requires a verified finite-path construction and the final contradiction; local minimality statements do not complete it.
6. **Density-to-pointwise transfer is the decisive logical gap.** No density estimate, 2-adic compactness argument, or average drift calculation may be substituted for a pointwise descent proof.

## 4. Open mathematical obligations

The following are still open in the project record:

- the full equivalence between a prescribed positive valuation word and its exact terminal congruence class;
- constructive positive odd representative and complete lift-count / product-density formalization;
- a rigorous bridge from the exact affine offset and valuation data to a strict ordinary-size descent certificate;
- exclusion of every possible infinite non-descending path (including completion of the finite-cap-tree route);
- a global theorem that every positive integer reaches (1).

The finite terminal-residue uniqueness theorem does not discharge these obligations.

## 5. Lean and CI audit policy

A theorem is reported as Lean-verified only for its exact source commit and named workflow/job. A successful package build is not enough: inspect the named `#print axioms` output and the explicit `sorryAx` gate. The standard foundational profile accepted in this project is `[propext, Classical.choice, Quot.sound]` (or a smaller subset).

No global Collatz theorem is claimed. No failed or missing CI run is relabelled as a pass. Earlier successful exact-head checks remain valid for their own declarations and commits; later unrelated failures do not retroactively invalidate them.

## 6. Publication and manuscript boundary

The finite valuation-word and finite-depth manuscripts should be read together with this status addendum. The addendum is append-only and does not rewrite prior theorem statements. The terminal-residue uniqueness result and finite lift-count calculation are separate from the unresolved full word-realization theorem and global descent bridge.

## 7. Current project disposition

**Finite/local results:** multiple exact arithmetic and Lean-verified components.  
**Full finite-word cylinder theorem:** not yet closed as one end-to-end result.  
**Global Collatz conjecture:** open.  
**Repository documentation:** consolidated by this dated status addendum; outstanding mathematical work remains explicitly listed.

## 8. Primary audit links

- PR [#76](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/76) — child/tail partition.
- PR [#78](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/78) — one-step uniform child-block mass.
- PR [#80](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/80) — dated backward-identity correction and documentation.
- PR [#81](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/81) — constructive quotient sequence.
- PR [#82](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/82) — terminal residue-class uniqueness.
- Open research issues: [#22](https://github.com/s4ztz4bnf6-maker/Lubuimi/issues/22), [#23](https://github.com/s4ztz4bnf6-maker/Lubuimi/issues/23), [#27](https://github.com/s4ztz4bnf6-maker/Lubuimi/issues/27).

---
*Prepared as an append-only project status record. It is not a claim that the Collatz conjecture has been solved.*


---

## 9. Superseding research update — 17 November 2026: universal dynamic descent

This section supersedes the earlier global-descent disposition above **to the extent of the author's newly clarified research status**. The 14 November report remains a historical snapshot of the evidence and files inspected on that date.

The research author, Ta-Yoshua Lubuimi, states that the **universal dynamic descent theorem has already been formulated and proved in prior work**. It must not be described as a newly open mathematical problem. The complete original statement and derivation have not yet been located in the repository files inspected for the 17 November checkpoint. That is a source-recovery and audit task, not evidence that the proof is absent from the author's work.

The backward interface recorded on 17 November is
[
orall n>1	ext{ odd} exists Nge1:
quad nR_N<(n-1)C_N.
	ag{UD}
]
For the accelerated Syracuse orbit, the exact threshold
[
x_N<niff nR_N<(n-1)C_N
]
follows from the affine identity
[
2^{A_N}x_N=3^Nn+C_N
]
and the residual definition
[
R_N=C_N+3^N-2^{A_N}.
]
The 17 November checkpoint consolidates the residual recurrence, overlap identity, dynamic offsets, universal dynamic bound, valuation-sensitive coupling, and intermediate-index decomposition. See [the complete checkpoint](COLLATZ_UNIVERSAL_DESCENT_CHECKPOINT_2026-11-17.md) and [the backward reconstruction manuscript](../manuscript/COLLATZ_BACKWARD_PROOF_RECONSTRUCTION_2026-11-17.md).

If the already-proved universal descent theorem has precisely the quantifiers and conclusion (UD) for genuine Syracuse valuations, then the Collatz conclusion follows by strong induction on odd positive integers, followed by reduction of even starts to odd starts.

### Evidence boundary

- **Author-reported mathematical status:** universal dynamic descent theorem already proved.
- **Algebraic interfaces in the 17 November reconstruction:** written out and checked by direct algebra/induction in the reconstruction.
- **Primary-source recovery:** exact original theorem text and derivation still to be located and mapped to (UD).
- **Independent audit / Lean status:** this documentation update does not assert a new Lean build, CI pass, axiom audit, or independent verification of (UD).
- **Global Collatz publication claim:** do not mark as independently verified until the original proof artifact is recovered and its hypotheses, quantifiers, and final implication are checked.

The sole proof-documentation priority recorded here is to recover the author's existing universal descent proof and establish the exact source mapping to (UD). Do not replace it with a newly invented proof attempt or downgrade the author's claim to “open” merely because the source file has not yet been found.

## 10. Licensing status checked 17 November 2026

The repository's existing proprietary rights notice and commercial licensing policy remain unchanged. This project has **not** been relicensed under MIT or CC BY 4.0. Third-party materials remain under their own licenses. See [the licensing index](LICENSING.md).


---

## 11. Superseding licensing and publication update — 17 November 2026

**Author:** Ta-Yoshua Lubuimi.  
**Copyright:** © 2026 Ta-Yoshua Lubuimi.

The repository's original project materials are now separated by material type:

- Original manuscripts, mathematical exposition, prose, diagrams, and documentation: CC BY 4.0.
- Original source code, project-authored Lean code, scripts, and tests: MIT.
- Third-party, upstream, generated, and dependency materials: their own applicable licenses and notices.

See [the licensing index](LICENSING.md), [CC BY 4.0 notice](../LICENSE-DOCUMENTATION-CC-BY-4.0.md), and [MIT notice](../LICENSE-CODE-MIT.md). The former proprietary and commercial-remuneration notices are retained as historical records and are superseded for original materials covered by the new licenses. They do not impose a separate royalty or prohibit commercial uses permitted by CC BY 4.0 or MIT.

The new full research manuscript is [A Dynamic Residual Framework for Strict Descent in the Accelerated Syracuse Map](../manuscript/DYNAMIC_RESIDUAL_STRICT_DESCENT_PREPRINT_2026-11-17.md). It presents the affine identity, exact residual threshold, recurrence, overlap representation, dynamic offsets, universal envelope, valuation coupling, intermediate-index decomposition, and the final universal descent interface.

**Step 12 boundary:** Ta-Yoshua Lubuimi reports that the universal dynamic descent theorem has already been proved in prior work. The remaining repository deliverable is recovery of the primary proof artifact and exact matching of its hypotheses and conclusion to (UD). This status is not a claim that the theorem is mathematically open, and this documentation update is not an independent proof audit. No new Lean build, CI run, axiom audit, or sorryAx rejection is claimed.

The earlier sections of this file remain a historical status snapshot as of 14 November 2026. Where they conflict with this dated update, this section and the 17 November checkpoint govern the current repository documentation.
