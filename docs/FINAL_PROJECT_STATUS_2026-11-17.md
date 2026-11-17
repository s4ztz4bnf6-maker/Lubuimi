# Syracuse / Collatz — consolidated project status (17 November 2026)

**Status date:** 17 November 2026  
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


## 9. Ta-Yoshua Lubuimi Dynamic Residual Bound (TL-DRB) — Collatz application (17 November 2026)

The Collatz application of the **Ta-Yoshua Lubuimi Dynamic Residual Bound (TL-DRB)** is recorded in:

- [Research note: Dynamic residual bridge](../research/DYNAMIC_RESIDUAL_COLLATZ_BRIDGE_2026-11-17.md)
- [Manuscript: Dynamic residual identity](../manuscript/DYNAMIC_RESIDUAL_COLLATZ_BRIDGE_2026-11-17.md)

For partial valuation sums (A_0=0), (A_{k+1}=A_k+a_{k+1}), affine correction (C_0=0), (C_{k+1}=3C_k+2^{A_k}), and (D_k=2^{A_k}-C_k-3^k), put (R_k=-D_k). With (T_k(x)=\sum_{j<k}3^{k-1-j}2^{x_j}), the overlapping words (u=(A_0,\ldots,A_{k-1})), (v=(A_1,\ldots,A_k)) satisfy
[
4T_k(u)-T_k(v)=R_k.
]
The exact ordinary-size descent test becomes
[
S^k(n_0)<n_0\iff n_0R_k<(n_0-1)C_k.
]
The overlap-constrained backward residual recursion is also stated in the research note.

This is a proved exact algebraic bridge and a proved state-dependent descent threshold. It is a genuine advance in the finite-prefix descent analysis: it identifies the precise residual coordinate and the exact inequality that decides descent for a given start value and valuation prefix. It is not a global descent theorem. The all-ones valuation prefixes give arbitrarily long finite examples, so the residual recursion alone does not yield a uniform finite horizon. The new identities are not yet Lean-formalized and have no CI audit. The full terminal-word realization theorem, exclusion of all infinite non-descending paths, and global Collatz conjecture remain open.

The named TL-DRB application manuscript and research note are original repository materials covered by the existing proprietary rights notice and commercial licensing policy. Third-party code, Lean, Mathlib, dependencies, and upstream materials remain under their respective licenses. No blanket open-source license is introduced by this update.


## 10. TL-DRB Lean formalization — initial status (17 November 2026)

A separate Lean 4.35.0 / Mathlib package has been added at [formalization/TLDRB](../formalization/TLDRB/). It currently formalizes the overlap identity for the recursively defined weighted word sum and signed surplus, the one-step overlap-residual recurrence, and a generic descent-threshold equivalence under explicit affine and positive-denominator hypotheses.

**Scope limitation:** this first package does not yet instantiate the generic threshold lemma with the actual accelerated Syracuse trajectory, valuation partial sums, affine correction, and quotient. It therefore verifies neither the full Collatz application nor any global descent statement unless and until those links are formalized.

The dedicated workflow is [tldrbaudit.yml](../.github/workflows/tldrbaudit.yml). Exact-head run [43997407311](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43997407311) is in progress. The first workflow attempt failed at setup because no Lake manifest existed; the bootstrap was corrected to install Lean 4.35.0 and run lake update before lean-action. The successful completion of the legacy root audit on this commit only means that its detector skipped because no root-level Lean project exists; it is not a formalization pass. A final status will be recorded only after inspecting the corrected run, named theorem axiom output, and sorryAx gate.
