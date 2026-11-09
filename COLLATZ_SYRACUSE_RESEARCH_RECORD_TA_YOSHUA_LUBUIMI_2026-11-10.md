# Collatz–Syracuse Research Record
## Ta-Yoshua Lubuimi — consolidated research and formalization status

**Author and research lead:** Ta-Yoshua Lubuimi  
**Record date:** 10 November 2026  
**Repository:** s4ztz4bnf6-maker/Lubuimi

AI systems used during the work are research and formalization assistants only. They are not authors, co-authors, independent mathematical verifiers, or owners of the results.

## 1. Research objective and integrity rules

The objective is to prove that every positive integer reaches 1 under the Collatz iteration. The current formal work studies the accelerated odd map
\[
n_{j+1}=(3n_j+1)/2^{a_j},\qquad a_j=v_2(3n_j+1),
\]
with every \(n_j\) positive and odd.

Previously established lemmas and exact calculations are preserved. Mathematical derivations, Lean elaboration/kernel checking, transitive axiom audits, and GitHub CI status remain separate. A successful compile proves only the declarations actually compiled. No conditional block result is promoted to a universal orbit theorem without the missing orbit-realizability and coverage argument. No sorry, sorryAx, or hidden project axiom is accepted in a claimed final theorem.

## 2. Lubuimi's certified affine-offset framework

For exact odd-to-odd transitions
\[
2^{a_j}n_{j+1}=3n_j+1,
\]
define
\[
A_0=C_0=0,\quad A_{j+1}=A_j+a_j,\quad
C_{j+1}=3C_j+2^{A_j}.
\]
Then the existing formalized identity is
\[
\boxed{2^{A_k}n_k=3^kn_0+C_k.}
\]
Its closed form is
\[
C_k=\sum_{j=0}^{k-1}3^{k-1-j}2^{A_j}.
\]
Existing declarations include offset_identity_of_certified_steps, canonical_offset_identity_of_certified_steps, canonicalOffset_eq_weighted_sum, offsetClosedForm_succ, and offset_eq_closed_form. This is an exact identity for certified blocks, not itself a descent theorem.

## 3. Lubuimi's signed-offset-margin framework and block correction

Define
\[
D_k=2^{A_k}-C_k-3^k.
\]
Its exact recurrence is
\[
\boxed{D_{k+1}=3D_k+(2^{a_k}-4)2^{A_k}.}
\]
Thus exponent one contributes \(-2\cdot2^{A_k}\), exponent two contributes zero, and exponent at least three contributes a positive correction. The weighted expansion is
\[
D_N=3^ND_0+
\sum_{j=0}^{N-1}3^{N-1-j}2^{A_j}(2^{a_j}-4).
\]
For a block of \(r\) consecutive valuation-one steps beginning at \(m\),
\[
D_{m+r}=3^rD_m-
2\cdot2^{A_m}(3^r-2^r).
\]
For a block of valuation-two steps, \(D_{m+r}=3^rD_m\).

The new Lubuimi cylinder declarations are followed by #print axioms. The source already contains signedOffsetMargin_succ, signedOffsetMargin_block_decomposition, signedOffsetMargin_pos_iff_block_correction, signed_margin_after_run_of_ones, signed_margin_positive_after_run_of_ones_iff, signed_margin_after_run_of_twos, and signed_margin_weighted_sum_expansion.

A positive terminal margin is equivalent to strict descent for the certified block. The unresolved global obligation is to prove that every positive odd start admits a finite realized block with positive margin.

## 4. Lubuimi's Initial Valuation-One Cylinder Theorem

This exact statement is named in this research record in honour of its author as **Lubuimi's Initial Valuation-One Cylinder Theorem**.

For every positive odd accelerated Syracuse orbit and every \(N\ge0\),
\[
\boxed{
(\forall j<N,\ a_j=1)
\quad\Longleftrightarrow\quad
2^{N+1}\mid(n_0+1).
}
\]

**Residue condition implies the initial run.** Write \(n_0+1=2^{N+1}m\), \(m\ge1\), and set
\[
u_j=3^j2^{N+1-j}m-1,\qquad 0\le j\le N.
\]
Then \(u_0=n_0\). For \(j<N\),
\[
3u_j+1=2\bigl(3^{j+1}2^{N-j}m-1\bigr).
\]
The parenthesized quotient is odd because \(N-j\ge1\). Hence the exact valuation at that transition is one and the next iterate is \(u_{j+1}\). Induction gives the first \(N\) exponents equal to one.

**Initial run implies the residue condition.** If \(a_j=1\) for \(j<N\), then \(A_N=N\) and \(C_N=3^N-2^N\). The affine identity yields
\[
2^N(n_N+1)=3^N(n_0+1).
\]
Since \(n_N\) is odd, the left side is divisible by \(2^{N+1}\). Since \(3^N\) is coprime to \(2^{N+1}\), it follows that \(2^{N+1}\mid n_0+1\).

**Exact run length.** The initial run has exactly \(r\) valuation-one steps iff
\[
2^{r+1}\mid n_0+1,\qquad 2^{r+2}\nmid n_0+1,
\]
equivalently
\[
\boxed{r=v_2(n_0+1)-1.}
\]
Every positive odd start therefore has a finite initial valuation-one run. Among odd residue classes, the density with at least \(N\) initial ones is \(2^{-N}\), and the density with exactly \(N\) is \(2^{-(N+1)}\).

This refines the already formalized one-way obstruction exponent_one_block_bounds_length_by_start_shift: the converse direction constructs the actual orbit prefix from the residue class. The Lean declarations lubuimi_initial_valuation_one_cylinder and valuation_exponent_eq_one_of_mod_four_three were first added in commit 137bc0a4cf0e2b2787aacbe2ed43df60c6e001a7. First CI attempt 42718893397 exposed proof-script obligations. The helper valuation_exponent_eq_one_of_mod_four_three then compiled in run 42719689591 with profile [propext, Quot.sound] and no sorryAx. The main cylinder theorem still failed in the finite affine induction at the final multiplication step and terminal parity step (SyracuseOffsetIdentity.lean:2422–2423); its error-recovery output showed sorryAx, so the theorem is not yet formally verified. Commit 7cbb49c694bf2812c730e2214a66989b4c9ae961 replaces the final nlinarith step with an explicit multiplication of the induction identity and supplies the terminal oddness hypothesis explicitly. Run 42720406876 failed in the finite affine induction because Lean generalized the finite-prefix hypotheses into the induction hypothesis; the proof used the induction hypothesis without supplying its two finite-prefix premises. The helper valuation_exponent_eq_one_of_mod_four_three still compiled with [propext, Quot.sound] and no sorryAx. Commit 013192ce524a4572a9d96c8d4dcb2796830b1f62 now explicitly supplies the restricted hone and hhalf hypotheses to the induction step. A fresh exact-commit CI run is pending; no success is claimed until its complete build and axiom audit pass.

## 5. Exact recovery threshold after the initial run

For the initial run of length \(r\), the run-of-ones identity with \(D_0=0\) gives
\[
D_r=-2(3^r-2^r).
\]
Let \(a_r\ge2\) be the next exact exponent. Then
\[
D_{r+1}=-6(3^r-2^r)+(2^{a_r}-4)2^r.
\]
Therefore
\[
\boxed{
D_{r+1}>0
\quad\Longleftrightarrow\quad
2^{a_r+r}>6\cdot3^r-2^{r+1}.
}
\]
This is an exact start-dependent recovery threshold, not a universal assertion that the threshold is met.

## 6. Existing exact residue and descent results

The source modules contain exact residue restrictions for exponents one through seven; exact_exponent_residue; finite-prefix characterizations including two consecutive ones iff \(n\equiv7\pmod8\), three iff \(n\equiv15\pmod{16}\), four iff \(n\equiv31\pmod{32}\), and five iff \(n\equiv63\pmod{64}\); the exact transition \(n\equiv11\pmod{16}\) with valuations one then two; local quarter-step and mod-8/mod-16 descent results; conditional descent theorems from positive margin or specified exponent blocks; and exact affine/margin composition laws.

The theorem two_exponent_one_steps_can_be_followed_by_exponent_two records the concrete path \(7\to11\to17\to13\), with exponents \(1,1,2\). Thus two valuation-one steps do not force the next valuation to be at least three.

## 7. Lean source inventory

- SyracuseOffsetIdentity.lean — certified affine identity, canonical offset, residue filters, exact exponent residue, signed margin, block decompositions, run-of-ones and run-of-twos identities.
- SyracuseOffsetClosedForm.lean — closed finite-sum offset.
- SyracuseOffsetLowerBound.lean — exact offset lower bound and sharpness calibration.
- SyracuseMarginBlock.lean — closed-form margin for prescribed valuation-one blocks.
- SyracuseValuationTransition.lean — exact finite valuation cylinders and transition certificates.
- IterationLemmas.lean, ThresholdLemmas.lean, SyracuseQuarterDescent.lean, SyracuseResidueExtension.lean — earlier local descent and threshold work.

Relevant source branches include collatz/quarter-descent-lemma-2026-10-20, collatz/syracuse-quarter-bridge-2026-10-21, collatz/second-step-descent-mod-eight-zero-2026-10-21, collatz/mod16-exact-valuation-2026-10-25, collatz/valuation-cylinders-2026-10-26, collatz/offset-lower-bound-2026-10-23, collatz/offset-margin-roadmap-2026-10-23, collatz/stopping-time-bridge-2026-10-22, and the carry-cocycle, threshold-margin and valuation-cylinder research branches dated 27 October.

## 8. Verified CI record

GitHub Actions run [42717134267](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42717134267) completed successfully on 9 November 2026. Its checked-out merge commit was
28003791738900f6dc456bc71d37151c1f3f8a78, merging documentation head d899de78701c8acfcf297b781e4ca29c2b631009 into base fc1e8023f9dcc0c777e25d08df0b011b13cdcb26.

The job installed Lean 4.34.1 and Mathlib v4.34.1, built CollatzAudit (8,930 jobs), compiled IterationLemmas, ThresholdLemmas, SyracuseReferenceTest and SyracuseQuarterDescent, compiled/audited SyracuseOffsetIdentity, then compiled SyracuseOffsetClosedForm, SyracuseOffsetLowerBound, SyracuseMarginBlock and SyracuseValuationTransition.

The offset and valuation-transition audit steps explicitly searched their full logs for sorryAx and would fail if found; neither check found it. The named declarations reported the Lean standard profile [propext, Classical.choice, Quot.sound] or a subset. This run verifies the existing declarations in the checked merge snapshot. It does not compile the new Lubuimi cylinder equivalence, which remains a mathematical research note pending Lean formalization.

## 9. Lubuimi's APW4–Syracuse cylinder–energy bridge: research programme, not an imported theorem

The APW4 energy/transport architecture should be explored as a possible proof-design tool, but it cannot be imported into Collatz merely by analogy. Syracuse valuation words define finite residue cylinders and a prefix tree. A potential finite interface consists of cylinder nodes indexed by realized valuation prefixes, exact residue classes and measures, parent/child refinement, weighted incidence between prefixes and terminal states, and a collision/energy quantity separating diagonal mass from off-diagonal overlap.

An actual APW4-to-Collatz theorem requires a concrete finite map from Syracuse cylinder/transition data to APW4 source, event, and capacity objects, together with a proof that it preserves indices and weights and satisfies the transport/Hall hypotheses. No such map has yet been established. APW4 remains a separate completed mathematical result and a candidate structural method, not an unproved premise in the Collatz argument.

## 10. Next mathematical and formalization steps

1. Add the Lubuimi initial-cylinder equivalence to SyracuseOffsetIdentity.lean using the existing certified-transition conventions and oddness hypotheses.
2. Derive the exact-run-length statement and one-step margin-recovery threshold as Lean corollaries.
3. Prove a finite-state or weighted-block lemma controlling how realized exponents \(a_j\ge2\) compensate for valuation-one corrections.
4. Search existing residue and stopping-time branches before introducing new notation; preserve exact local descent results and their hypotheses.
5. Target a theorem that every positive odd start has a finite realized block with \(D_N>0\). This is the central unresolved point.
6. Only after that, combine odd-step descent with even-step reduction to obtain the full positive-integer Collatz statement.

No global Collatz proof is claimed in this record.

## 11. Attribution and licensing

**Copyright © 2026 Ta-Yoshua Lubuimi.** All research, mathematical statements, Lean formalization work and project documentation in this repository are attributed to Ta-Yoshua Lubuimi, except external results, which remain attributed to their original authors.

The repository now includes LICENSE-PROPRIETARY.md and LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md. Original Collatz/Syracuse code, manuscripts, research notes and documentation owned by Ta-Yoshua Lubuimi are all-rights-reserved; no general open-source or commercial license is granted. Lean, Mathlib and other third-party materials remain under their own licenses. The commercial policy reserves negotiated permission for commercial exploitation of copyrightable original materials, but does not claim copyright ownership over mathematical facts, abstract ideas or independently developed implementations.


## 12. Lubuimi's finite valuation-word cylinder partition

The stronger generalization of the initial all-ones cylinder is documented in [Lubuimi's Finite Valuation-Word Cylinder Partition Theorem](Lubuimi_Finite_Valuation_Word_Cylinder_Partition_2026-11-10.md). For every finite positive exponent word \(\alpha\) with total exponent \(A\), its exact starting-value cylinder is one unique odd residue class modulo \(2^{A+1}\), with relative density \(2^{-A}\) among odd residues. Its children have exact relative masses \(2^{-b}\) for next exponent \(b\ge1\), and these sum to one. The explicit residue is \((2^A-C_k)(3^k)^{-1}\bmod 2^{A+1}\), using the certified affine offset.

This is a mathematically derived theorem and a Lean formalization target, not yet a compiled declaration. It supplies a concrete finite-prefix tree for the named Lubuimi APW4–Syracuse cylinder–energy bridge programme. The bridge still requires an explicit index-preserving incidence/capacity map and an integer-level obstruction; a measure-zero exceptional set alone does not prove Collatz.


## 13. Lubuimi finite valuation-word partition and exact CI correction — 10 November 2026

### 13.1 Stronger cylinder theorem

The initial all-ones cylinder is now accompanied by **Lubuimi's Finite Valuation-Word Cylinder Partition Theorem** in `Lubuimi_Finite_Valuation_Word_Cylinder_Partition_2026-11-10.md`. For every finite positive exact exponent word \(\alpha=(a_0,\ldots,a_{k-1})\), with total exponent \(A=\sum_i a_i\), the set of positive odd starts realizing exactly that word is one unique odd residue class modulo \(2^{A+1}\). Its relative natural density among odd starts is exactly \(2^{-A}\).

The affine-offset formula for its residue is
\[
r_\alpha\equiv(2^A-C_k)(3^k)^{-1}\pmod{2^{A+1}}.
\]
Every finite positive valuation word is therefore realizable. Extending a prefix by next exponent \(b\ge1\) gives a child cylinder of relative mass \(2^{-b}\), and the children partition the parent with \(\sum_{b\ge1}2^{-b}=1\). The initial valuation-one cylinder is the all-ones special case. This is a mathematical derivation recorded separately from Lean verification.

### 13.2 Exact status of the main-cylinder Lean attempts

- Run `42719689591` compiled the helper `valuation_exponent_eq_one_of_mod_four_three` with `[propext, Quot.sound]`; the main cylinder declaration failed and error recovery showed `sorryAx`.
- Run `42720406876` completed with failure. The remaining goal at `SyracuseOffsetIdentity.lean:2421:43` showed that the induction hypothesis `ih` was still a function requiring the restricted `hone` and `hhalf` hypotheses; it had not yet been applied. The helper again reported `[propext, Quot.sound]`, but the main declaration's error-recovery output contained `sorryAx` and is not certified by this run.
- The current Collatz branch now contains an explicit term `ih'` applying both restricted prefix hypotheses before rewriting the induction step. The current branch head is `ad7203f5571d03e5989b9ac935b2103300f02409`. Exact-commit GitHub Actions run [42721305220](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721305220) is in progress. At the latest check it had completed checkout and Lean setup and was restoring the Mathlib cache. No compile or axiom-audit success is claimed yet.

The finite valuation-word partition theorem is also a Lean formalization target and is not yet claimed as compiled. Earlier successful run `42717134267` remains valid for its own checked commit and modules.

### 13.3 APW4 bridge consequence

The full finite-word cylinder partition supplies a more substantial exact prefix tree than the single all-ones chain: every node has a unique residue class, exact mass \(2^{-A}\), and child mass ratios \(2^{-b}\). This is a legitimate mathematical input for developing the proposed **Lubuimi APW4–Syracuse Cylinder–Energy Bridge**. The bridge still requires an explicit index-preserving incidence map, proof of weight preservation and a verified BIB/Hall capacity condition. No such transport theorem is claimed at this stage, and no APW4 result is weakened or used as an unproved premise in Collatz.


## 13. Current exact-commit Lean run — 10 November 2026

Run [42721006544](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721006544) is checking the refined Lubuimi initial-cylinder declaration at source commit 013192ce524a4572a9d96c8d4dcb2796830b1f62. The Lean library build, IterationLemmas.lean, ThresholdLemmas.lean, SyracuseReferenceTest.lean, SyracuseQuarterDescent.lean, the complete SyracuseOffsetIdentity.lean source/audit step, SyracuseOffsetClosedForm.lean, SyracuseOffsetLowerBound.lean and SyracuseMarginBlock.lean have all completed successfully. In particular, the source step containing lubuimi_initial_valuation_one_cylinder is green. The final SyracuseValuationTransition.lean step is still running. The complete job log and final axiom output are not yet available, so the final transitive axiom profile and no-sorryAx status for the new theorem will be recorded only after the job completes.
