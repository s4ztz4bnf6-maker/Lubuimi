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

This refines the already formalized one-way obstruction exponent_one_block_bounds_length_by_start_shift: the converse direction constructs the actual orbit prefix from the residue class. The Lean declaration `lubuimi_initial_valuation_one_cylinder` is verified on three complete exact-commit workflows: [42721006544](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721006544), [42721305220](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721305220), and the later current-source audit [42738528207](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42738528207) on source commit `a1becbc8e837f10abcd952a2e03832cb057fb2b8`. All report the transitive profile `[propext, Classical.choice, Quot.sound]`; the explicit `sorryAx` gates passed. The later run also checks `dyadicUniformFibre_partition_card`. Earlier failed proof-script attempts remain part of the audit chronology and are not represented as successful theorem verification. The exact statement and proof are recorded in `SyracuseInitialValuationOneCylinder_2026-11-09.md`; a matching German manuscript is in `Lubuimi_Anfangszylinder_Syracuse_DE_2026-11-10.md`. The general finite valuation-word cylinder partition theorem remains a separate Lean formalization target.

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

Run [42721006544](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721006544) is checking the refined Lubuimi initial-cylinder declaration at source commit 013192ce524a4572a9d96c8d4dcb2796830b1f62. Run [42721006544](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721006544) has now completed successfully on merge commit 44bb2ac (PR head 013192ce524a4572a9d96c8d4dcb2796830b1f62 merged into base fc1e8023f9dcc0c777e25d08df0b011b13cdcb26). The full Lean library build and every workflow step passed: IterationLemmas, ThresholdLemmas, SyracuseReferenceTest, SyracuseQuarterDescent, SyracuseOffsetIdentity, SyracuseOffsetClosedForm, SyracuseOffsetLowerBound, SyracuseMarginBlock and SyracuseValuationTransition. The exact declaration lubuimi_initial_valuation_one_cylinder printed the transitive profile [propext, Classical.choice, Quot.sound]. The workflow's explicit grep of the complete offset-audit log for sorryAx found none. Thus the initial-cylinder equivalence is now Lean-compiled and axiom-audited at that checked merge commit. This verifies the cylinder theorem, not the global Collatz conjecture.


## 14. Positive Lean verification of Lubuimi's initial cylinder theorem — 10 November 2026

The failed attempts `42719689591` and `42720406876` remain in the record as historical proof-script diagnostics. They are superseded for the initial-cylinder declaration by two later successful, commit-bound full workflows:

- [Run 42721006544](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721006544): merge commit `44bb2ac`, PR head `013192ce524a4572a9d96c8d4dcb2796830b1f62`.
- [Run 42721305220](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721305220): merge commit `3d79761`, PR head `ad7203f5571d03e5989b9ac935b2103300f02409`.

Both workflows completed the library build and every listed Syracuse module/audit step. In both logs, `CollatzSyracuseAudit.lubuimi_initial_valuation_one_cylinder` has transitive axiom profile `[propext, Classical.choice, Quot.sound]`. The workflow's explicit complete-log search for `sorryAx` found none. Therefore the initial valuation-one cylinder equivalence is now Lean-compiled and axiom-audited on two exact snapshots. The broader finite valuation-word cylinder partition theorem is mathematically derived but remains a separate Lean formalization target. Neither result is a proof of the global Collatz conjecture.

Run [42721911555](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721911555) is a further recheck of the later documentation/status head and was in progress at the time of this update; it does not replace or downgrade the two completed positive runs.


## 15. Latest exact-head recheck — 10 November 2026

The current branch head `a36894eefc52e5d28cd43110f5e289805509ad33` triggered run [42722186081](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42722186081). At the latest retrieval, checkout had completed and Lean toolchain/manifest setup was in progress. This is a further documentation/status recheck. It does not supersede the two completed positive exact-commit audits `42721006544` and `42721305220`, which already establish the initial cylinder declaration's successful compile and transitive axiom profile on their respective snapshots.


## 16. Lubuimi terminal-residue collision energy — 10 November 2026

The finite valuation-word partition yields a new exact finite-place incidence model. For every length-k exponent word \(\alpha\), with total exponent \(A\) and affine offset \(C_k\), define
\[
\tau_k(\alpha)=C_k2^{-A}\pmod{3^k}.
\]
The affine identity proves that every orbit realizing \(\alpha\) has terminal state \(n_k\equiv\tau_k(\alpha)\pmod{3^k}\). Since \(C_k\equiv2^{A-a_{k-1}}\pmod3\), the place is a unit modulo \(3^k\). The finite place set is \(U_k=(\mathbb Z/3^k\mathbb Z)^\times\), of size \(2\cdot3^{k-1}\).

Assign source weight \(w_\alpha=2^{-A}\) and aggregate place mass \(m_k(t)=\sum_{\tau_k(\alpha)=t}w_\alpha\). Since all length-k valuation-word cylinders partition odd starts, \(\sum_\alpha w_\alpha=1\) and \(\sum_t m_k(t)=1\). The second moment
\[
E_k=\sum_{t\in U_k}m_k(t)^2
\]
has the exact diagonal/off-diagonal expansion
\[
E_k=D_k+C_k^{\mathrm{coll}},\qquad D_k=\sum_\alpha w_\alpha^2=(\sum_{a\ge1}4^{-a})^k=3^{-k}.
\]
Cauchy–Schwarz on the finite place set gives \(E_k\ge1/(2\cdot3^{k-1})\), hence
\[
\boxed{C_k^{\mathrm{coll}}\ge1/(2\cdot3^k).}
\]
For \(k=1\), the two terminal places modulo 3 have masses \(2/3\) and \(1/3\), yielding \(E_1=5/9\), \(D_1=1/3\), and collision mass \(2/9\).

This is the **Lubuimi Terminal-Residue Collision Energy**. It is a genuine exact diagonal/off-diagonal incidence identity in the Syracuse valuation-word model and a concrete APW4-style bridge candidate. It is not silently identified with the historical APW4 BIB reserve. That transfer still requires an index-preserving map to original APW4 event/place objects, preservation of historical weights, and a proved capacity/Hall inequality. The new collision-energy statement is mathematically derived but not yet Lean-compiled; the initial one-cylinder theorem remains separately Lean-verified by runs 42721006544 and 42721305220.


## 17. Finite Markov representation of Lubuimi terminal-residue energy — 10 November 2026

The terminal-residue mass distribution has a finite rational Markov representation. For fixed \(k\), set \(x_j=C_j2^{-A_j}\pmod{3^k}\). The recurrence is
\[
x_{j+1}=2^{-a_j}(3x_j+1)\pmod{3^k},\qquad x_0=0.
\]
The finite valuation-word cylinder theorem gives independent geometric exponent coordinates with \(\mathbb P(a_j=b)=2^{-b}\). Since 2 is primitive modulo \(3^k\), the transition matrix has explicit entries \(P_k(x,y)=2^{-r}/(1-2^{-\phi_k})\), where \(\phi_k=2\cdot3^{k-1}\) and \(r\) is the unique representative in \(1,\ldots,\phi_k\) solving \(2^ry\equiv3x+1\pmod{3^k}\). The terminal mass vector is \(m_k=\delta_0P_k^k\), and \(E_k=\|m_k\|_2^2\).

For \(k=2\), in unit-residue order \(1,2,4,5,7,8\pmod9\),
\[
m_2=\frac1{63}(8,16,11,4,2,22),\quad E_2=\frac5{21},\quad D_2=\frac19,\quad C_2^{\mathrm{coll}}=\frac8{63}.
\]
This is an exact finite matrix and moment model suitable for further APW4-style work. The finite-word partition, collision energy, Markov matrix and explicit k=2 vector are mathematically derived; they remain separate Lean formalization targets. The initial one-cylinder theorem remains the separately verified declaration from runs 42721006544 and 42721305220.


## 9. Status continuation — 10 November 2026 (append-only)

The mathematical and formalization status in earlier sections is preserved, but the earlier pending/failure wording for the initial valuation-one cylinder has been superseded by four later successful exact-commit CI snapshots:

- 42721006544 — successful full workflow;
- 42721305220 — successful full workflow;
- 42721911555 — successful full workflow;
- 42722186081 — successful full workflow.

For each run, the declaration `CollatzSyracuseAudit.lubuimi_initial_valuation_one_cylinder` printed transitive axiom profile `[propext, Classical.choice, Quot.sound]`; the complete-log `sorryAx` scan passed. These runs certify the initial all-one cylinder declaration on their exact checked snapshots only. The earlier failed proof-script attempts remain in the historical chronology and are superseded for this declaration by the later successful runs.

The stronger general finite valuation-word cylinder theorem is mathematically proved in the standalone companion manuscript `projects/LubuimiFiniteValuationWordCylinder/MANUSCRIPT.md`. For any finite positive word with total exponent A, the exact cylinder is one odd residue class modulo 2^(A+1), of relative odd-start density 2^(-A), with explicit residue formula from the affine offset. Its finite cutoff refinement has exact children and one exact tail cylinder. This general theorem and tail partition are not yet Lean-compiled or axiom-audited.

A more direct Lean formalization route is now recorded in `projects/LubuimiFiniteValuationWordCylinder/LEAN_FORMALIZATION_ROUTE_TERMINAL_CONGRUENCE.md`. It uses the terminal exact-residue condition X_k ≡ 2^A (mod 2^(A+1)), the finite suffix expansion X_k = 3^(k-j) X_j + 2^(A_j) R_j, oddness of R_j, backward propagation of exact prefix residues, and reconstruction of the quotient orbit. This is a proof route, not a new formal verification claim.

The APW4–Syracuse bridge remains a separate research programme. Its open mathematical obligation is still an explicit index-preserving transport between finite Syracuse prefix cylinders and the historical APW4/BIB objects, with diagonal, off-diagonal and BIB capacity accounting kept distinct. No global Collatz proof is claimed.

**Attribution:** all research and theorem authorship: Ta-Yoshua Lubuimi. AI tools are assistants only.


## 18. Current exact-head Collatz recheck — 10 November 2026

The latest research-record/documentation commit is `29b27dc529b9e81a33b5211e9e01a01e19edc256`. Run [42724343412](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42724343412) is active on that exact head. Checkout and Lean manifest setup completed; Mathlib cache restoration was in progress at the latest retrieval. This is a current recheck of the source tree and does not alter the already established positive cylinder theorem audits `42721006544` and `42721305220`.


## 19. Four successful exact-commit audits of the initial cylinder theorem

The initial-cylinder declaration has now passed four full, independent, commit-bound workflows:

1. Run `42721006544` — merge `44bb2ac`, PR head `013192ce524a4572a9d96c8d4dcb2796830b1f62`.
2. Run `42721305220` — merge `3d79761`, PR head `ad7203f5571d03e5989b9ac935973a837cea8a2`.
3. Run `42721911555` — merge `7b84a1b`, PR head `21829b4dd3b82a73edb19cf0d09ed011f55ef384`.
4. Run `42722186081` — merge `5d4a19c`, PR head `a36894eefc52e5d28cd43110f5e289805509ad33`.

All four full compile workflows completed successfully. Each printed the transitive axiom profile `[propext, Classical.choice, Quot.sound]` for `CollatzSyracuseAudit.lubuimi_initial_valuation_one_cylinder`; the explicit complete-log `sorryAx` audit steps passed. The subsequent current-head recheck `42724343412` is in progress on head `29b27dc529b9e81a33b5211e9e01a01e19edc256`. The general finite valuation-word partition, finite tail partition, terminal-residue collision energy and Markov matrix remain separate Lean formalization targets.


## 10. Exact-head draft compile audit — 10 November 2026

A new draft compile-audit workflow, 42725006480, was triggered for the current Syracuse programme PR #9 head b1a8599c686c37893a33453b759dee42047c7727. At the latest inspection its compile-drafts job was still in progress. No compile success or failure is claimed until the job completes and its log is inspected.

The four successful initial valuation-one cylinder audits remain separately recorded: 42721006544, 42721305220, 42721911555 and 42722186081. The current draft compile audit is not substituted for those exact declaration audits and does not change their scope.

The general finite valuation-word theorem now has a canonical standalone manuscript at projects/LubuimiFiniteValuationWordCylinder/MANUSCRIPT.md. It includes worked residue examples, the exact tail-cylinder partition, applications to finite-prefix coding, and explicit limitations. The terminal-congruence Lean design has been rewritten with consistent mathematical notation. These documentation improvements do not claim a general-word Lean verification.

The global Collatz objective remains unchanged: prove a finite realized block with sufficient positive signed-margin correction for every positive odd start, or establish another universal descent mechanism. A density-zero or measure-theoretic exceptional-set statement alone is not enough to settle an individual integer orbit.

**Attribution:** all research and theorem authorship: Ta-Yoshua Lubuimi. AI tools are assistants only.


## 11. Tail-cylinder margin certificate — new local descent theorem

For a finite realized prefix word \(\alpha\) of length \(k\), let \(A=A_k\), \(C=C_k\), and \(D(\alpha)=2^A-C-3^k\). If the next exact exponent is \(b\), the existing signed-margin recurrence gives
\[
D(\alpha b)=3D(\alpha)+(2^b-4)2^A.
\]
For any finite cutoff \(B\ge1\), every start in the exact tail cylinder \(a_k\ge B+1\) therefore satisfies
\[
D(\alpha b)\ge 3D(\alpha)+(2^{B+1}-4)2^A.
\]
Choose \(B\) so that the right-hand side is strictly positive. Such a finite \(B\) exists for every fixed prefix because powers of two are unbounded. Then every start in that one exact tail residue cylinder has positive margin after the next step and hence a strict decrease of the accelerated odd iterate below its initial value.

This yields a finite pruning decomposition at every prefix: the exact children \(b=1,\ldots,B\) are the finite unresolved branches; the single tail cylinder \(a_k\ge B+1\), of relative parent mass \(2^{-B}\), is already certified to descend. The cutoff is prefix-dependent. This does not establish a uniform bound over all prefixes, does not eliminate an infinite path through the finite unresolved children, and does not prove global Collatz.

For the initial all-one prefix of length \(r\), \(A=r\) and \(D=-2(3^r-2^r)\). The general tail inequality reduces exactly to
\[
2^{B+1+r}>6\cdot3^r-2^{r+1},
\]
recovering the previously established initial-run recovery threshold as a special case.

The complete proof and its limitations are appended to the canonical standalone manuscript at projects/LubuimiFiniteValuationWordCylinder/MANUSCRIPT.md. This is a mathematical manuscript result; it is not yet a Lean-compiled declaration.


## 12. Completed Syracuse draft compile audit — run 42725006480

Workflow 42725006480 completed successfully on exact source commit b1a8599c686c37893a33453b759dee42047c7727. Its compile-drafts job successfully completed:
- Lean library build;
- IterationLemmas and ThresholdLemmas;
- SyracuseReferenceTest and SyracuseQuarterDescent;
- offset identity and strict-margin consequence;
- exact closed-form offset theorem;
- stronger offset lower bound;
- exact valuation-one block margin;
- exact valuation-one to valuation-two transition.

The log contains 274 named axiom-profile outputs. The observed profiles are exactly among [propext], [propext, Quot.sound], and [propext, Classical.choice, Quot.sound]. No actual sorryAx occurrence appears in the completed job log; the only text matches are the workflow's grep command and its forbidden-token diagnostic strings. The workflow is a successful compile/audit snapshot for its exact source commit and listed declarations. It does not formalize the general finite-word theorem or the new tail-cylinder margin certificate, and it does not prove global Collatz.

The research-record-only commit after the checked source snapshot changes no Lean source. It appends the finite tail-cylinder margin theorem and the exact audit chronology.


## 13. Finite-branching obstruction for a least hypothetical counterexample

The finite-word manuscript now proves an exact necessary condition for a next step not to descend. At a realized prefix with cumulative exponent A and signed margin D, a next exact valuation b must satisfy
\[
2^{A+b}+3D\le4\cdot2^A.
\]
For each fixed prefix state (A,D), this leaves only finitely many possible non-descending next exponents. If a counterexample exists, choose the least positive odd counterexample by well-ordering. Its orbit cannot fall below its initial value, so it must determine an infinite path through this state-dependent finitely branching valuation-prefix tree. This is a new structural reduction; it does not rule out an infinite realized path. The proof is in Section 13 of `projects/LubuimiFiniteValuationWordCylinder/MANUSCRIPT.md`; the general finite-word theorem, finite tail partition and this corollary remain not yet Lean-compiled.


## 14. Exact finite branching cap for least-counterexample paths

The local tail-margin theorem has the equivalent necessary cap form. For a prefix \(\alpha\) with total exponent \(A\) and signed margin \(D\), extension by exponent \(b\) satisfies
\[
D(\alpha b)=3D+(2^b-4)2^A.
\]
If the next odd iterate has not descended below the initial odd start, then \(D(\alpha b)\le0\) is necessary, since positive margin forces strict descent. Rearranging,
\[
\boxed{2^{A+b}+3D\le4\cdot2^A.}
\]
For each fixed prefix this admits only finitely many positive integers \(b\). Let \(B_\alpha\) be the largest admissible b, or zero if there is none. A least hypothetical nonterminating start must choose at each prefix one of the finitely many children \(b\le B_\alpha\); all larger exponents lie in the exact tail cylinder and force strict descent.

Thus a least counterexample would generate an infinite path in a state-dependent finitely branching valuation tree. The cylinder weight of child \(b\) is exactly \(2^{-b}\), and the aggregate mass of all possible non-descending children is at most \(1-2^{-B_\alpha}\), with complementary tail mass \(2^{-B_\alpha}\) certified to descend.

This is a finite-branching reduction, not a contradiction. The cap depends on the prefix through \(A,D\); no uniform bound on \(B_\alpha\) is known here, and an infinite path through the allowed finite children has not been excluded. The proof and limitations are in the canonical finite-word manuscript and its written review.


## 15. Lean-verified finite non-descent exponent cap — run 42728049650

The state-dependent finite cap has now gained a Lean-verified algebraic/orbit core. Three declarations were added to SyracuseOffsetIdentity.lean:

1. signedOffsetMargin_nonpos_succ_iff_exponent_cap:
\[
D_{j+1}\le0
\iff
2^{A_j+a_j}+3D_j\le4\cdot2^{A_j}.
\]
2. signedOffsetMargin_nonpos_of_nondecreasing_orbit: for an exact affine block endpoint \(n_j\) with \(n_0>1\), if \(n_j\ge n_0\), then \(D_j\le0\), because positive signed margin forces strict descent.
3. nondecreasing_orbit_next_exponent_cap: combining the two statements, any next valuation on an exact affine orbit whose next odd endpoint has not fallen below its initial odd start must satisfy the exact finite cap.

The full compile-drafts workflow 42728049650 completed successfully on exact source commit ca48ec7fdad5e8d6f8aeb82fed8586a1b57c12bc using Lean 4.34.1. All three declarations printed transitive axiom profile [propext, Classical.choice, Quot.sound]. The complete job log contained no actual sorryAx occurrence. The build completed 8,930 jobs successfully.

**Scope boundary:** This formally verifies the margin equivalence, nonpositive-margin implication for a nondecreasing affine endpoint, and the next-exponent inequality. It does not yet formalize the existence of the maximum cap B_alpha, the finite tail-cylinder partition, the full arbitrary-word cylinder theorem, or exclusion of an infinite surviving path. No global Collatz proof is claimed.

The new cap result is a genuine Lean-verified strengthening of the Syracuse proof infrastructure, not a numerical observation. It is recorded separately from the seven initial all-one cylinder audits and the earlier offset/margin CI snapshots.


## 16. Cross-project finite-word witness and formalization status — 10 November 2026

### Exact mixed valuation word (1,2)

The finite Kolaz archive contains the exact orbit segment
[
731\xrightarrow{a_0=1}1097\xrightarrow{a_1=2}823.
]
Its valuation word is (1,2), total exponent A=3, affine offset C=5, and
[
8\cdot823=9\cdot731+5.
]
The corresponding initial residue cylinder is 11 mod 16. The signed margins are D_0=0, D_1=-2, D_2=-6, and both local next-exponent cap inequalities hold. This is a finite exact bridge between the threshold-return archive, the valuation-cylinder formula, and the signed-margin recurrence.

A Lean declaration, realizesValuationWord12_iff_mod_sixteen_eleven, has now been added to SyracuseOffsetIdentity.lean on exact PR #9 head 56c6d6d86fb5122d75f89f5e614f7f333e2d31a9. It formalizes the two-step witness definition and proves equivalence with n mod 16 = 11. Exact-head workflow 42736159935 is still in progress at this record update. No Lean success is claimed until the completed build prints the declaration's transitive axioms and the full log has no actual sorryAx.

### Terminal-residue k=2 module formally checked

Standalone PR #38 exact-head workflow 42735716873 passed on source commit 4e30c083f3e1657edd08b0945cdda4e16c8b0e14 with Lean 4.35.0 and Mathlib v4.35.0. Seven declarations for the transition row sums, two-step numerator, two-step mass and exact energy compiled with profile [propext, Classical.choice, Quot.sound]. The completed log contains no actual sorryAx and lake check --paranoid passed. The exact two-step distribution is (8,16,11,4,2,22)/63 and E_2=5/21. This closes the finite k=2 formalization target only; the general k theorem and infinite-word collision identity remain open Lean targets.

### Kolaz threshold-return archive extended

PR #39 exact-head workflow 42735880399 passed on source head 012c8717e9d80025e7aa6cbb99f0b7ed5affd176. The full B=511 and B=1023 CSV tables, all earlier thresholds, two additional cross-threshold common suffixes, and the x=731 valuation/cylinder/margin certificate passed seven exact integer-arithmetic regression tests. This is finite reproducibility evidence, not a uniform return theorem or a global Collatz result.

### Initial valuation-one manuscript v1.0

The standalone manuscript for Lubuimi's Initial Valuation-One Cylinder Theorem is now consolidated as version 1.0 at PR #35 head 6dd47a9b18b373c274b0bc4d4001d9fad4e8ba24. It includes the complete two-way proof, explicit orbit formula, exact run length, natural densities, signed-margin consequence, worked example, literature context, references, limitations, and seven exact-commit Lean audit records. The Lean source was not changed by this editorial revision; the seven previously completed exact-commit audits remain the formal evidence for the theorem declaration.


## 17. Exact mixed valuation word (1,2) — Lean verification passed

The declaration `CollatzSyracuseAudit.realizesValuationWord12_iff_mod_sixteen_eleven` compiled successfully in workflow 42736159935 on exact Lean source commit `56c6d6d86fb5122d75f89f5e614f7f333e2d31a9`. It proves that the two-step exact valuation word (1,2), represented by odd quotient witnesses
[
2n_1=3n+1,\qquad4n_2=3n_1+1,
]
is realized exactly when
[
n\equiv11\pmod{16}.
]
The declaration printed transitive profile [propext, Classical.choice, Quot.sound]. The completed job log contains no actual sorryAx occurrence, and the compile-drafts build completed successfully (8,932 jobs).

This is the first formally audited mixed-word instance in the current general finite-word programme. It matches the exact Kolaz witness 731 -> 1097 -> 823 and the general residue formula with total exponent A=3 and offset C=5. The verification is specific to word (1,2); it does not yet formalize arbitrary finite words or the finite tail partition.

The PR #9 branch subsequently received documentation-only commits. The exact Lean source snapshot audited above remains 56c6d6d86fb5122d75f89f5e614f7f333e2d31a9; no claim is made that workflow 42736159935 checked the later documentation-only descendant head.


## 18. Finite-depth uniform-fibre construction — APW4 bridge candidate

The new note SYRACUSE_FINITE_DEPTH_UNIFORM_FIBRE_BRIDGE_2026-11-10.md proves a finite-depth uniformization result. For each realized prefix α, the state-dependent cap B_α leaves only the finite candidate child exponents 1,...,B_α; the exact finite-word cylinder theorem gives their masses 2^-b and a single tail mass 2^-B_α. The tail is forced to descend below n₀; children b≤B_α are merely not excluded by the necessary cap and need not all survive.

At any fixed depth k, the set S_k of cap-compatible prefixes is finite. Let B*_k=max B_α on S_k and M_k=2^(B*_k). Every local partition can be refined to the same uniform coordinate set of size M_k: child b receives 2^(B*_k-b) equal micro-atoms and the tail receives 2^(B*_k-B_α). Hence the candidate-survivor subset has exact uniform proportion 1-2^-B_α and its tail complement has proportion 2^-B_α. The micro-atoms correspond to genuine refined residue cylinders.

This is an explicit finite-depth APW4-style uniform-fibre model. It is not yet Lean-formalized and is not the historical APW4 hyperplane-covered set. The original APW4 event-index map, BIB-place identification, original-weight transport, diagonal/off-diagonal inequalities and Hall/capacity proof remain separate obligations. Finite-depth uniformization does not rule out an infinite path through the surviving tree.


## 19. Lean formalization of uniform-fibre cardinality — pending

The finite-depth uniform-fibre note now has its first dedicated Lean counting lemma in SyracuseOffsetIdentity.lean:

`dyadicUniformFibre_partition_card`.

For integers (B\leq B^*\), it states exactly
[
\sum_{b=1}^{B}2^{B^*-b}+2^{B^*-B}=2^{B^*}.
]
This is the cardinality conservation law for the child blocks and the refined tail block in the common uniform fibre. The declaration was added on exact source head a1becbc8e837f10abcd952a2e03832cb057fb2b8. Full compile/axiom workflow 42738528207 is in progress. No Lean verification claim is made until it completes, prints the standard transitive profile, and the complete log contains no actual sorryAx.

This lemma formalizes the finite counting layer only. It does not yet formalize the state-dependent cap maximum, finite prefix levels, interval disjointness, residue-atom bijection, APW4 historical event map, or BIB/Hall capacity argument.


## 20. Dyadic uniform-fibre cardinality lemma — Lean verified

The declaration CollatzSyracuseAudit.dyadicUniformFibre_partition_card passed compile-drafts workflow 42738528207 on exact source commit a1becbc8e837f10abcd952a2e03832cb057fb2b8. It proves, for B≤Bstar,
[
\sum_{b=1}^{B}2^{B^*-b}+2^{B^*-B}=2^{B^*}.
]
The printed transitive profile is [propext, Classical.choice, Quot.sound]. The complete log contains no actual sorryAx occurrence and reports “Build completed successfully (8932 jobs).”

This is a formal verification of the finite cardinality conservation law underlying the common dyadic refinement. It does not yet verify the state-dependent cap maximum, finite prefix tree, interval disjointness as a finset partition, the residue-atom bijection, or the historical APW4 event/BIB transport. The exact run is scoped to the new counting declaration and the declarations actually printed by the workflow.


## 21. Final initial-cylinder manuscript source snapshot

The manuscript v1.0 in PR #35 has a final documentation commit ddf366d7654a275958157daab9d3d489ad3e6fd0. Its LaTeX source was regenerated with raw-string preservation and re-read; TeX commands remain intact and a control-character scan found no non-whitespace control characters. No Lean source was changed by this editorial correction. The seven exact-commit theorem audits remain valid within their original declaration scope.



## 22. Exact finite terminal-residue energy k=2 — Lean verified

The standalone PR #38 module `LubuimiTerminalResidueEnergyK2.lean` passed exact-head workflow [42743051889](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42743051889) on source head `6c73f82a5e2eeef44fda294f71986474d2f50988`. The finite rational transition rows modulo 9 are checked exactly; the two-step distribution is `(8,16,11,4,2,22)/63`, and the collision energy is `5/21`. This verifies the named finite k=2 computation only.

It does not verify the general countable-word energy expansion, the general Markov formula, or a universal Collatz theorem. In particular, an average lower bound for the full source distribution cannot rule out a single exceptional infinite valuation word. A survival-restricted energy would be useful only if its prefix admissibility is defined from the exact signed-margin recurrence and an independent, non-tautological upper capacity bound is proved. The APW4/BIB transport remains a heuristic analogy until those Collatz-specific objects and bounds exist.


## 12. New finite path lemma programme — 10 November 2026

### Explicit next-valuation bound (PR #42)

Exact-head workflow 42747001077 passed on source head d3b2a55c1987b4a4f2cdbaef2a97486679d68f26. The declarations next_exponent_lt_integer_bound and nondecreasing_orbit_next_exponent_finite_bound have the standard transitive profile [propext, Classical.choice, Quot.sound]. The SyracuseOffsetIdentity.lean no-sorryAx scan passed. The proof derives the integer bound b < 4*2^A - 3D from the existing exponential margin cap. It is pointwise/state-dependent and does not exclude an infinite trajectory.

### Finite cap-tree path certificate (PR #48)

A new Lean candidate defines a prefix state (A,C,D), the exact valuation-word append recurrence, finite cap-compatible children, and a finite tree at every depth. It aims to prove that every prefix of a nondecreasing exact affine path belongs to this tree, and that its terminal value is a unit modulo 3^j under the explicit affine map. Exact source head 82cb74118eff69afd667c0fd827b266d115284ca; workflow 42748141012 queued. This is not yet a verified result.

### Separation from cylinder and energy strands

The general finite valuation-word cylinder theorem remains mathematically proved and documented, but not yet Lean-audited. The dyadic common-fibre cardinality identity is separately Lean-checked. The k=2 terminal-residue energy is separately Lean-checked. PR #48 connects the margin cap to finite valuation-word prefixes and the terminal-residue unit map; it does not use the energy value as a global upper bound. A future bridge to a survival-restricted energy requires an explicit finite map from cap-tree words to terminal-residue places, multiplicity/weight preservation, and an independently proved capacity bound. No average energy estimate is used to exclude one exceptional infinite path.


## 13. Finite cap-tree audit correction — 10 November 2026

The earlier cap-tree build exposed a duplicate explicit ext theorem and a type mismatch in the coordinate-state induction. The duplicate declaration was removed, preserving the existing structure extensionality theorem. Current exact head: 2b299f1826d2960ca42fd5dce5aaae3d3666a2bb; workflow 42749969443 is in progress. The new paranoid job is pinned to the repository's Lean/Mathlib 4.34.1 pair. No kernel PASS or global Collatz conclusion is claimed at this point.


## 14. Verified finite cap-tree path certificate — 10 November 2026

The exact code head 2b299f1826d2960ca42fd5dce5aaae3d3666a2bb passed the complete compile-drafts job in workflow 42749969443. The five new declarations in SyracuseOffsetIdentity.lean compiled; their profiles are [propext, Quot.sound] for finiteCapPrefixState_eq_actual and [propext, Classical.choice, Quot.sound] for the child-bound, path-embedding, terminal-residue-unit, and combined certificate theorems. The exact source-file sorryAx scan passed.

The additional 4.34.1 job did not run a paranoid check because that Lake version rejects --paranoid. The workflow was changed to the supported lake check; run 42750825692 is queued. The prior 4.35.0 attempt failed inside Mathlib Cache/Requests.lean, not in the new project declarations.

Mathematical scope: every prefix of a hypothetical nondecreasing exact affine Syracuse path belongs to a finite state-dependent cap tree, and the endpoint is a unit modulo 3^j. This does not rule out an infinite branch and does not prove global Collatz.


## Terminology correction — lower-bounded orbit, not stepwise monotone orbit

The previous entries used the phrase "nondecreasing orbit" for the hypothesis hnd : ∀ j, n₀ ≤ n j. That phrase is misleading: the hypothesis says that no iterate falls below the initial value; it does not say n j ≤ n (j+1). The source docstrings now state this explicitly.

The new precise declarations are:
- initial_lower_bounded_orbit_prefix_mem_finiteCapTree
- initial_lower_bounded_orbit_prefix_cap_tree_and_terminal_unit

The old theorem names containing nondecreasing are retained only as compatibility aliases, with docstrings recording the actual lower-bound condition. The exact source head is 3cc651a5257dfae87061f7c12cd806814354b28e; workflow 42751535385 is queued.

This lower-bound condition is exactly the type needed in a minimal-counterexample reduction: if a counterexample orbit ever fell below its initial odd value, the smaller odd iterate would itself be a smaller counterexample. The current theorem embeds all prefixes of such a hypothetical lower-bounded orbit in a finite state-dependent cap tree and attaches the terminal-residue unit condition. It still does not prove that the tree has no infinite branch; that remains the central global Collatz obstruction.


## 1.10 — Explicit minimal-counterexample reduction to the cap tree

New source head: ffae3ea4ca6fdd54d607d99c846b51fa75519790. New declarations:

- orbit_lower_bound_of_minimal_counterexample: from the explicit premise that every suffix beginning at a value below n₀ eventually reaches 1, and the candidate orbit never reaches 1, it proves n₀ ≤ n_j for every j.
- minimal_counterexample_prefix_mem_finiteCapTree: feeds that lower-bound conclusion into the exact affine finite cap-tree embedding.
- minimal_counterexample_prefix_cap_tree_and_terminal_unit: at every positive depth, packages finite-tree membership with the terminal-residue unit condition.

The suffix-return premise is explicit and must still be derived from the actual deterministic Syracuse dynamics and the chosen minimal-counterexample definition. The theorem does not show that the finite tree has no infinite branch. Exact-head workflow 42751669336 is queued; the new declarations are candidates until compile, named axiom audit, no-sorryAx scan, and the supported Lake check finish.

Terminology is now corrected: the old nondecreasing theorem names are compatibility aliases, while the actual hypothesis is that no iterate falls below the initial value. This is the standard lower-bound property relevant to a minimal-counterexample argument, not stepwise monotonicity.


## Exact-head continuation — 10 November 2026, 05:20 CET

### Finite cap-tree path theorem — PR #48

- Exact source head: `e1fb06eaa07190d8abfb3fc7368f3dc0663a5a66`.
- Exact-head workflow: [42754461228](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42754461228).
- At this snapshot, three jobs were running: `kernel-check-lean-435-paranoid`, `kernel-check-lean-434`, and `compile-drafts). No result is claimed yet.
- The semantically precise path statement is `initial_lower_bounded_orbit_prefix_mem_finiteCapTree): an exact affine Syracuse orbit whose every iterate satisfies (n_0\le n_j) has every finite prefix in the explicitly defined finite cap tree.
- The new minimal-counterexample bridge derives that lower-bound property from the explicit suffix-return premise and the assumption that the candidate orbit never reaches 1. The suffix-return premise still needs derivation from the actual deterministic Syracuse dynamics and the chosen minimal-counterexample definition.
- The result is a necessary finite-depth path certificate. It does not prove that the cap tree has no infinite branch and does not prove global Collatz.

### Existing Collatz results retained

The Initial Valuation-One Cylinder Theorem, the finite valuation-word cylinder theorem, the mixed-word ((1,2)) cylinder, the exact offset/margin results, the dyadic uniform-fibre cardinality identity and the existing declaration-scoped kernel evidence remain distinct established results at their respective stated scopes. In particular, no later cap-tree integration attempt reopens or downgrades the mathematical finite-word cylinder theorem.

### Kolaz finite-return archive

PR #39's exact finite-table reproducibility workflow [42739986917](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42739986917) passed on its exact source head `54f8b177d70f216fac81aa6cf6b28b8fec36596c`. This is a finite integer-computation archive and confluence test, not Lean kernel verification, a uniform bound, or a global Collatz proof. The earlier 1097 lead remains explicitly unverified.


## Lean 4.35.0 exact-source verification result — 10 November 2026

The Lean 4.35.0 paranoid kernel job has now **passed** on the code head `e1fb06eaa07190d8abfb3fc7368f3dc0663a5a66`:

- Workflow: [42754461228](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42754461228)
- Job: `kernel-check-lean-435-paranoid` (job 129625495913)
- Full Collatz library build: success.
- Exact finite-path and terminal-residue module compile plus forbidden-`sorryAx` check: success. The only two `sorryAx` strings in the job log are the shell guard itself; there is no actual `sorryAx` declaration in the Lean output.
- `lake check --paranoid`: success; log states that the paranoid kernel accepts the solution.
- The four new finite-cap/minimal-counterexample path declarations print exactly `[propext, Classical.choice, Quot.sound]`:
  - `initial_lower_bounded_orbit_prefix_mem_finiteCapTree`
  - `initial_lower_bounded_orbit_prefix_cap_tree_and_terminal_unit`
  - `minimal_counterexample_prefix_mem_finiteCapTree`
  - `minimal_counterexample_prefix_cap_tree_and_terminal_unit`

This verifies the stated finite-depth path embedding and terminal-residue unit certificate on that exact source commit. It does not prove that the finite cap tree has no infinite branch or that every Syracuse orbit reaches 1.

The PR branch subsequently advanced to documentation-only head `307b1c174199ed3ad8038c41bc12ff536419d2cb). A separate exact-head workflow [42755030352](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42755030352) is queued for that later branch head; the successful source result above remains scoped to `e1fb06e...`.


## Dual-toolchain and compile-drafts reconciliation — 10 November 2026

On source head `e1fb06eaa07190d8abfb3fc7368f3dc0663a5a66`, workflow [42754461228](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42754461228) produced a split result:

- `kernel-check-lean-435-paranoid`: **PASS**. The library build, exact finite-path/terminal-residue compile and no-`sorryAx` guard succeeded; `lake check --paranoid) completed with “Lean paranoid kernel accepts the solution.” The four named finite-cap/minimal-counterexample path declarations have profile `[propext, Classical.choice, Quot.sound]`.
- `compile-drafts`: **PASS**. All listed steps completed, including `IterationLemmas.lean`, `ThresholdLemmas.lean`, `SyracuseReferenceTest.lean`, `SyracuseQuarterDescent.lean`, offset identity, closed-form offset, stronger offset lower bound, exact valuation-one block margin, valuation-one-to-two transition, terminal-residue k=2 energy, and L945 odd-covering moment audit.
- `kernel-check-lean-434`: **FAIL** only at the final command `lake check`, with exact error `unknown command 'check'`. The Lean 4.34.1 build had completed, but this Lake version does not expose that command. This is a workflow/toolchain command-availability failure, not a failed mathematical theorem or a kernel counterexample. The Lean 4.35.0 paranoid PASS remains valid on its exact source commit.

The PR branch later advanced through documentation-only commits to `022f019d9673e5fa5e7e7642324b7f373d689599). The new exact-head run for that later documentation head was queued; the source-code PASS above remains scoped to `e1fb06e...`.


## Published valuation-word cylinder and standalone finite-energy audits — 10 November 2026

### PR #36 — published finite valuation-word cylinder theorem

The standalone manuscript project is published in PR #36 (head `ed2348b427dd89f5c3ca0787037247b16d1cf916`). Its theorem states that every finite exact accelerated-Syracuse valuation word with cumulative exponent (A) is realized by one unique odd residue class modulo (2^{A+1}), with relative natural density (2^{-A}) among odd starts. The manuscript records the recursive existence/uniqueness proof, explicit residue formula from the affine offset cocycle, exact parent/child mass identity, and finite truncation into exact children plus one explicit tail cylinder. This theorem is an established mathematical result and is not reopened by the later Lean integration work.

The Lean route is separately tracked. The exact mixed word ((1,2)) has its own declaration and prior exact-head compile evidence; the arbitrary-word manuscript theorem is not to be conflated with a full Lean formalization of every word or the finite-depth APW4 historical bridge.

### PR #38 — terminal-residue k=2 energy

Standalone PR #38 head `a4775db22e2ff774aa6992441da8e70673298e41` passed exact workflow [42744750457](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42744750457): library build, seven named axiom audits, forbidden-`sorryAx` guard and paranoid kernel check all succeeded. The seven declarations for the initial row, row-one, row-two, transition row, two-step numerator, two-step mass and exact energy (5/21) print `[propext, Classical.choice, Quot.sound]). This is the exact finite k=2 terminal-residue energy result, not a global Collatz proof.

### PR #39 — Kolaz finite archive

PR #39 exact finite-table/confluence workflow [42739986917](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42739986917) passed. Its evidence is exact finite integer computation and archive reproducibility, not Lean kernel verification or a uniform infinite bound.


## Exact-head CI continuation — 10 November 2026

The finite cap-tree embedding branch now has updated head `5699182344be6a7950c6265551112a7a6d50e58d`; exact workflow [42755702331](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42755702331) was queued at the latest snapshot. The immediately preceding head `e1fb06eaa07190d8abfb3fc7368f3dc0663a5a66` passed its Lean 4.35.0 paranoid kernel job and draft compile job. The Lean 4.34.1 job failed because the installed Lake does not support the `check` command (`unknown command 'check'`); this is a toolchain-command mismatch, not a reported failure of the theorem statements.

This branch's mathematical target is the finite cap-tree embedding for a minimal counterexample orbit bounded below by its initial value, together with the terminal-residue unit condition. This is a finite structural lemma; it does not by itself prove a uniform cap bound or global Collatz.

The previously verified initial-cylinder, valuation-bound, offset identity and strict-margin results remain independent results with their existing exact-head verification records. The mixed valuation word (1,2) iff residue 11 mod 16, and the dyadic uniform-fibre cardinality identity, also retain their own exact Lean evidence. Kolaz PR #39 workflow [42739986917](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42739986917) passed finite-table reproducibility checks; those are finite computation, not Lean kernel verification or a global theorem.


## Lean 4.34.1 workflow correction — 10 November 2026

The previous exact-head 4.34.1 job reached its final command and failed only because Lake 4.34.1 does not recognize the command lake check (unknown command 'check'). The library build and exact source-file compile had already succeeded. The workflow now replaces that unsupported command with a second explicit lake build CollatzAudit confirmation. This 4.34.1 job is a compile/build check only; the separate Lean 4.35.0 lake check --paranoid job remains the paranoid kernel-verification path.

Workflow source commit: e95d21771a38c1748169672d326f54162aae4dcd. Exact-head CI is pending; no result is claimed for this workflow revision.
