# Finite-Depth Uniform-Fibre Bridge from Syracuse Valuation Cylinders

**Author:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Status:** Mathematical proposition derived from the finite-word cylinder partition and the Lean-verified local margin cap. This note is not yet Lean-formalized and does not identify the construction with the historical APW4 event system.

## Abstract

The exact valuation-cylinder partition and the state-dependent signed-margin cap together produce a finite, prefix-dependent partition of all next-step possibilities into finitely many non-descent-compatible children and one descending tail cylinder. At every fixed depth, the surviving prefix tree is finite. Taking the maximum local cap over that finite level allows every local dyadic partition to be refined to a common number (2^{B_k^*}) of equal-mass atoms. Consequently, each prefix at that depth admits a uniform finite fibre whose distinguished subset has exact proportion (1-2^{-B_\alpha}) and whose complement has proportion (2^{-B_\alpha}). This is a concrete APW4-style finite uniform-fibre model. It is not yet the historical APW4 incidence map, and it does not exclude an infinite surviving path.

## 1. Prefix data and the local cap

Let (alpha=(a_0,\ldots,a_{k-1})) be a realized exact Syracuse valuation word, with
[
A_\alpha=\sum_{i<k}a_i,qquad
C_0=0,quad C_{i+1}=3C_i+2^{A_i},
]
and signed margin
[
D_\alpha=2^{A_\alpha}-C_k-3^k.
]
For a proposed next exponent (b\geq1), the margin recurrence gives
[
D_{\alpha b}=3D_\alpha+(2^b-4)2^{A_\alpha}.
]
The exact non-descent cap is
[
D_{\alpha b}\leq0
\quad\Longleftrightarrow\quad
2^{A_\alpha+b}+3D_\alpha\leq4\cdot2^{A_\alpha}.
\tag{1}
]
For a positive odd initial value (n_0>1), a positive next margin forces the next odd endpoint below (n_0). Thus any next step that does not yet descend below (n_0) must satisfy (1).

Define
[
B_\alpha=\max\{b\geq1:
2^{A_\alpha+b}+3D_\alpha\leq4\cdot2^{A_\alpha}\},
\]
with (B_\alpha=0) if the set is empty. Since the left side is strictly increasing in (b), the admissible exponents are exactly (1,\ldots,B_\alpha). The cap is finite because the right side of (1) is fixed while (2^{A_\alpha+b}\to\infty).

The local cap core is Lean-verified in Syracuse PR #9, run 42728049650, exact source commit ca48ec7fdad5e8d6f8aeb82fed8586a1b57c12bc. The arbitrary-word cylinder and tail partition are mathematically proved in the companion manuscript but remain separate Lean formalization targets.

## 2. Exact local child/tail partition

Let \(\mathcal C_\alpha\) be the parent cylinder for \(\alpha\). The finite-word cylinder theorem gives, for each exact next exponent (b\geq1), a unique child cylinder \(\mathcal C_{\alpha b}\) with conditional mass
[
\frac{\mu(\mathcal C_{\alpha b})}{\mu(\mathcal C_\alpha)}=2^{-b}.
]
For every cutoff (B\geq0), the children (b=1,\ldots,B), together with the tail event (a_k\geq B+1), partition the parent cylinder. The tail is one exact residue cylinder and has conditional mass (2^{-B}). Thus
[
\sum_{b=1}^{B}2^{-b}+2^{-B}=1,
\tag{2}
]
where the sum is empty and the tail mass is one when (B=0).

Taking (B=B_\alpha), all exact children with (b\leq B_\alpha) are precisely the next steps not excluded by the local cap. Every point of the tail (a_k\geq B_\alpha+1) violates (1), has positive next margin, and therefore descends below (n_0).

## 3. Uniformization at a fixed depth

Let (S_0=\{\emptyset\}). Recursively, let
[
S_{k+1}=\{\alpha b:\alpha\in S_k, 1\leq b\leq B_\alpha\}.
]
Each node has finitely many children, so induction on (k) proves that every level (S_k) is finite. Define
[
B_k^*=\max(\{B_\alpha:\alpha\in S_k\}\cup\{0\}),
\qquad M_k=2^{B_k^*}.
]
Then (B_\alpha\leq B_k^*) for every \(\alpha\in S_k\).

Fix a prefix \(\alpha\in S_k\), and write (B=B_\alpha), (B^*=B_k^*), and (M=2^{B^*}). On the common coordinate set
[
X_k=\{0,1,\ldots,M-1\},
]
define the child block for (1\leq b\leq B) by the half-open integer interval
[
I_{\alpha,b}
=
[,M-2^{B^*-b+1}, M-2^{B^*-b},),
\tag{3}
]
and define the tail block by
[
T_\alpha=[,M-2^{B^*-B}, M,).
\tag{4}
]
The blocks in (3) are pairwise disjoint consecutive intervals. Their union is ([0,M-2^{B^*-B})), so together with (4) they partition (X_k). Their cardinalities are
[
|I_{\alpha,b}|=2^{B^*-b},
\qquad
|T_\alpha|=2^{B^*-B}.
\tag{5}
]
This includes (B=0): there are no child blocks and the tail block is all of (X_k).

Equip (X_k) with uniform probability (1/M) per point. Equations (5) give
[
\frac{|I_{\alpha,b}|}{M}=2^{-b},
\qquad
\frac{|T_\alpha|}{M}=2^{-B}.
\tag{6}
]
Thus the uniform finite fibre reproduces exactly the conditional child and tail masses of the Syracuse cylinder partition.

Let
[
K_\alpha=\bigcup_{b=1}^{B_\alpha}I_{\alpha,b}
]
be the distinguished set of non-descent-compatible children. Then
[
|K_\alpha|=M_k-2^{B_k^*-B_\alpha},
\]
and its uniform proportion is
[
\boxed{
\frac{|K_\alpha|}{M_k}=1-2^{-B_\alpha}.
}
\tag{7}
]
Its complement has proportion (2^{-B_\alpha}), exactly the descending tail mass.

## 4. Interpretation as a finite-fibre datum

For each level (k), all surviving prefixes share the same finite coordinate set (X_k) of size (M_k). The covered/distinguished subset (K_\alpha\subseteq X_k) depends on the prefix, but the ambient fibre cardinality does not. With point weight (1/M_k), total mass one, and proportion (1-2^{-B_\alpha}), this is a valid uniform finite-fibre datum of the type used in the APW4 finite-fibre architecture.

The refinement has a residue-class interpretation, not merely a formal counting interpretation. Each exact child cylinder (\mathcal C_{\alpha b}) is a single residue class at modulus (2^{A_\alpha+b+1}). Refining it to the common modulus (2^{A_\alpha+B_k^*+1}) produces exactly (2^{B_k^*-b}) equal subcylinders. The tail cylinder at cutoff (B_\alpha), refined to the same modulus, produces (2^{B_k^*-B_\alpha}) equal subcylinders. These are the micro-atoms indexed by the intervals (3) and (4). A canonical increasing-residue ordering gives a prefix-dependent bijection from (X_k) to the refined residue atoms.

## 5. What this bridge proves — and what it does not

The construction establishes a concrete finite-depth bridge:
- exact Syracuse child/tail cylinders;
- a finite surviving prefix level;
- a common finite coordinate set at that level;
- an explicit prefix-dependent subset;
- exact uniform point weights and exact subset proportions;
- a canonical residue-atom refinement.

It therefore supplies an explicit candidate finite-fibre model that can be formalized against the generic APW4 finite-fibre data structures. It also gives a natural place to test the APW4 covered/uncovered update algebra on Syracuse-derived fibres.

It does **not** establish:
1. that the distinguished set (K_\alpha) is the same object as the historical APW4 hyperplane-covered set;
2. a map from these residue micro-atoms to the historical APW4 event indices, BIB places, or incidence matrix;
3. preservation of the historical APW4 weights;
4. the APW4 diagonal/off-diagonal majorizations or the BIB/Hall capacity inequality;
5. exclusion of an infinite path through the finite surviving prefix tree; or
6. the global Collatz conjecture.

Those require additional explicit maps and inequalities. In particular, finite branching at every node and finite uniformization at every fixed depth do not by themselves preclude an infinite path.

## 6. Formalization plan

The Lean development should be isolated from the historical APW4 proof until each bridge lemma is proved:
1. define the local cap (B_\alpha) as a finite maximum (with zero for the empty admissible set);
2. formalize monotonicity of the cap inequality in (b);
3. formalize the finite level (S_k) and the maximum (B_k^*);
4. define the intervals (I_{\alpha,b}) and tail interval (T_\alpha) in `Fin (2 ^ B_k^*)`;
5. prove disjointness, coverage, and the cardinality formulas (5);
6. prove the uniform proportions (6)–(7);
7. identify the interval atoms with the refined exact residue cylinders;
8. instantiate the generic finite-fibre structure and audit the named declarations.

The initial all-one cylinder theorem, the signed-margin cap core, and the finite (k=2) terminal-residue module have their own successful Lean audits. None of those audits is evidence that this new finite-depth uniformization note has already been compiled.

**Attribution:** Ta-Yoshua Lubuimi. AI systems are assistants only, not authors or independent mathematical verifiers.


## 7. Necessary-condition and descent justification

The cap inequality is a necessary condition for a next step to remain at or above the initial odd value; it is not sufficient. A child exponent b≤B_α is only retained because the cap has not ruled it out. Such a child may still descend for other arithmetic reasons. Accordingly, the distinguished subset in the uniform fibre is the set of **cap-compatible** children, not a classification of all genuinely non-descending children.

For completeness, the implication from positive margin to descent follows directly from the affine identity. Write A'=A_{k+1}, C'=C_{k+1}, and n'=n_{k+1}. If
\[
D_{k+1}=2^{A'}-C'-3^{k+1}>0,
\]
then \(2^{A'}>C'+3^{k+1}\). Since \(n_0\geq1\) and \(C'\geq0\),
\[
2^{A'}n_0
> C'+3^{k+1}n_0
=3^{k+1}n_0+C'
=2^{A'}n'.
\]
As \(2^{A'}>0\), this implies \(n'<n_0\). Thus every step that remains at least \(n_0\) must have nonpositive next margin and satisfy the exponent-cap inequality.


## 8. Lean counting lemma — pending exact-head audit

A corresponding arithmetic lemma has been added to SyracuseOffsetIdentity.lean as dyadicUniformFibre_partition_card. It states the exact finite cardinality identity
[
\sum_{b=1}^{B}2^{B^*-b}+2^{B^*-B}=2^{B^*}
\]
for (B\leq B^*\). Exact source head a1becbc8e837f10abcd952a2e03832cb057fb2b8 is under compile/axiom workflow 42738528207. The result is pending; no Lean verification is claimed. A pass would certify only this counting identity, not the full dependent uniform-fibre construction or APW4 historical transport.


## 9. Lean result for the cardinality conservation law

The finite count lemma dyadicUniformFibre_partition_card has now passed compile-drafts workflow 42738528207 on exact source commit a1becbc8e837f10abcd952a2e03832cb057fb2b8. Its transitive profile is [propext, Classical.choice, Quot.sound]; the complete log contains no actual sorryAx occurrence and reports successful completion of the 8,932-job build.

This verifies the algebraic cardinality identity only. The dependent cap maximum, finite surviving tree, interval partition and residue-cylinder bijection are not yet Lean-formalized. The APW4 historical hyperplane/BIB map remains open.


## 7. Exact finite cap-tree path certificate — 10 November 2026

PR #42 now has an exact-head compile PASS. On source head d3b2a55c1987b4a4f2cdbaef2a97486679d68f26, run 42747001077 completed successfully. The explicit integer bound for every next valuation on a nondecreasing exact affine endpoint is kernel-checked with standard axiom profile [propext, Classical.choice, Quot.sound]; the Syracuse offset file's no-sorryAx scan passed. No lake check --paranoid run is included in this workflow.

PR #48 formalizes the next finite-depth step: a prefix state carrying accumulated exponent, canonical offset, and signed margin; a finite child set cut off by the state-dependent bound; and the finite cap tree at each depth. The target theorem embeds every prefix of a nondecreasing exact affine path into that tree. A companion map sends its exact endpoint to a unit modulo 3^j. Exact head 82cb74118eff69afd667c0fd827b266d115284ca, run 42748141012 queued at the latest check.

This does not yet formalize the interval partition for every child valuation, the full residue-cylinder bijection for arbitrary words, or an upper energy capacity that rules out an infinite path. The verified k=2 terminal-residue energy remains a separate finite module; its collision mass is not silently treated as a survival obstruction.


## 8. Finite cap-tree proof repair — 10 November 2026

The finite cap-tree candidate now uses the structure's existing extensionality theorem; a duplicate extensionality declaration from the previous attempt was removed. The exact head 2b299f1826d2960ca42fd5dce5aaae3d3666a2bb is under CI run 42749969443. The paranoid job now uses the repository-pinned Lean/Mathlib 4.34.1 pair, rather than changing only the toolchain for a separate 4.35.0 experiment. Both jobs remain pending at this entry.

The candidate still asserts only finite-depth embedding of any hypothetical nondecreasing exact affine path into the state-dependent finite cap tree, plus the terminal-residue unit property. It does not show that the tree has no infinite branch.


## 9. Finite cap-tree theorem — exact Lean compile PASS

On code head 2b299f1826d2960ca42fd5dce5aaae3d3666a2bb, workflow 42749969443 completed the full compile-drafts job successfully. The five new cap-tree/path declarations compiled and printed standard profiles: finiteCapPrefixState_eq_actual has [propext, Quot.sound]; the child-bound, path-embedding, terminal-unit, and combined path-certificate theorems have [propext, Classical.choice, Quot.sound]. The source-file sorryAx scan passed.

The separate 4.34.1 job failed only because that Lake version does not recognize the --paranoid option. The workflow now invokes the supported lake check; exact-head run 42750825692 is queued. The earlier 4.35.0 dependency attempt failed inside Mathlib Cache/Requests.lean before checking project code.

This is a finite-depth path embedding result, not a proof that no infinite branch exists.


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
