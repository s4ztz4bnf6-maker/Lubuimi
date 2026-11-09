# Lubuimi's Initial Valuation-One Cylinder Theorem
## An exact 2-adic classification for accelerated Syracuse orbits

**Author:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Status:** Self-contained mathematical manuscript draft for scholarly circulation.

## Abstract

For the accelerated odd Syracuse map, write

\[2^{a_j}n_{j+1}=3n_j+1,\qquad a_j=v_2(3n_j+1),\]

where every \(n_j\) is positive and odd. We prove an exact equivalence: the first \(N\) valuation exponents are all equal to one if and only if \(n_0\equiv -1\pmod{2^{N+1}}\). Thus the length of the initial run of valuation-one steps is exactly \(v_2(n_0+1)-1\). We compute the natural densities of these cylinders, both among odd starting integers and among all integers, and connect the result to an exact signed-offset-margin recovery threshold. The theorem gives a complete description of one infinite nested family of valuation cylinders. It does not assert global descent and does not solve the Collatz conjecture.

## 1. The accelerated Syracuse system

Let \(n_0\) be a positive odd integer. Its accelerated odd Syracuse orbit is defined recursively by

\[a_j=v_2(3n_j+1),\qquad n_{j+1}=\frac{3n_j+1}{2^{a_j}}.\]

Then \(a_j\geq1\) and each \(n_j\) is a positive odd integer. Equivalently, \(2^{a_j}n_{j+1}=3n_j+1\). Define

\[A_0=C_0=0,\qquad A_{j+1}=A_j+a_j,\qquad C_{j+1}=3C_j+2^{A_j}.\]

Induction gives the exact affine identity

\[\boxed{2^{A_j}n_j=3^j n_0+C_j.}\tag{1}\]

## 2. The initial valuation-one cylinder

**Theorem (Lubuimi's Initial Valuation-One Cylinder Theorem).** For every positive odd accelerated Syracuse orbit and every integer \(N\geq0\),

\[\boxed{(\forall j<N,\ a_j=1)\quad\Longleftrightarrow\quad 2^{N+1}\mid(n_0+1).}\tag{2}\]

Equivalently, the first \(N\) exponents are all one precisely when \(n_0\equiv-1\pmod{2^{N+1}}\).

### Proof

**Residue condition implies the initial run.** Suppose \(n_0+1=2^{N+1}m\) for an integer \(m\geq1\). For \(0\leq j\leq N\), put

\[u_j=3^j2^{N+1-j}m-1.\]

Then \(u_0=n_0\). If \(j<N\),

\[3u_j+1=2\left(3^{j+1}2^{N-j}m-1\right).\]

Since \(N-j\geq1\), the expression in parentheses is odd. Hence \(v_2(3u_j+1)=1\), and the next accelerated odd iterate is \(u_{j+1}\). Induction gives \(n_j=u_j\) and \(a_j=1\) for all \(j<N\).

**Initial run implies the residue condition.** Conversely, suppose \(a_j=1\) for every \(j<N\). Then \(A_N=N\), and the offset recurrence gives \(C_N=3^N-2^N\). Substituting this into (1) yields

\[2^N n_N=3^Nn_0+3^N-2^N,\]

or

\[2^N(n_N+1)=3^N(n_0+1).\]

As \(n_N\) is odd, \(2^{N+1}\) divides the left-hand side. Since \(\gcd(2^{N+1},3^N)=1\), Euclid's lemma implies \(2^{N+1}\mid(n_0+1)\). For \(N=0\), both sides hold because \(n_0\) is odd, so the theorem includes the empty initial block. \(\square\)

## 3. Exact run length

**Corollary.** Let \(r\) be the number of consecutive valuation-one steps at the beginning of the orbit, before the first exponent different from one. Then

\[\boxed{r=v_2(n_0+1)-1.}\]

Equivalently, the initial run has exactly length \(r\) if and only if

\[2^{r+1}\mid(n_0+1),\qquad 2^{r+2}\nmid(n_0+1).\]

**Proof.** Theorem (2) says that the first \(r\) exponents are one exactly when \(2^{r+1}\mid(n_0+1)\). The first \(r+1\) exponents are one exactly when \(2^{r+2}\mid(n_0+1)\). Taking the difference gives the exact-run characterization. Since \(n_0+1\) is a fixed positive integer, its 2-adic valuation is finite. \(\square\)

## 4. Natural densities

Among odd starting residue classes,

\[\operatorname{dens}_{\rm odd}(\text{at least }N\text{ initial ones})=2^{-N},\]

and

\[\operatorname{dens}_{\rm odd}(\text{exactly }r\text{ initial ones})=2^{-(r+1)}.\]

As subsets of all positive integers, the corresponding densities are \(2^{-(N+1)}\) and \(2^{-(r+2)}\), respectively.

**Proof.** The 'at least \(N\)' condition is the single residue class \(n_0\equiv-1\pmod{2^{N+1}}\). There are \(2^N\) odd residue classes modulo \(2^{N+1}\), so its relative density among odd classes is \(2^{-N}\). The 'exactly \(r\)' condition is the single residue class \(n_0\equiv2^{r+1}-1\pmod{2^{r+2}}\). There are \(2^{r+1}\) odd classes modulo \(2^{r+2}\), giving relative density \(2^{-(r+1)}\). Multiplying by the density \(1/2\) of odd integers gives the densities among all integers. \(\square\)

## 5. Signed-offset-margin consequence

For a certified prefix define

\[D_j=2^{A_j}-C_j-3^j.\]

The exact recurrence is

\[D_{j+1}=3D_j+(2^{a_j}-4)2^{A_j}.\tag{3}\]

If the first \(r\) exponents are one, then \(A_r=r\) and \(C_r=3^r-2^r\). Consequently,

\[\boxed{D_r=-2(3^r-2^r).}\tag{4}\]

For \(r\geq1\) this is strictly negative. If \(a_r\geq2\) is the next exact exponent, (3) gives

\[D_{r+1}=-6(3^r-2^r)+(2^{a_r}-4)2^r.\]

Therefore the margin becomes positive immediately after that next step if and only if

\[\boxed{2^{a_r+r}>6\cdot3^r-2^{r+1}.}\tag{5}\]

This is an exact, start-dependent recovery threshold. The cylinder theorem does not assert that the threshold is always satisfied.

## 6. Mathematical meaning and scope

The theorem identifies the entire initial all-one valuation cylinder as one explicit 2-adic residue class at every depth. It provides:

1. an exact congruence characterization of arbitrarily long initial valuation-one blocks;
2. an exact stopping-time formula for the length of that initial block;
3. exact cylinder densities, distinguishing odd starts from all integers; and
4. an exact interface with the signed-offset-margin recurrence.

The result is useful for the study of valuation words, finite-prefix realizability, residue-cylinder filtrations, and the distribution of initial Syracuse behavior. It supplies a concrete test case for any proposed global descent mechanism: long initial valuation-one blocks really occur, with the densities computed above, and they create a negative initial signed margin.

The theorem alone does **not** prove that every orbit eventually descends. The unresolved global task is to show that, after the initial run, every positive odd start has some finite **realized** valuation block whose positive corrections overcome all accumulated negative corrections, or to establish an alternative universal descent mechanism. A density statement by itself does not supply this orbit-by-orbit conclusion.

## 7. Relation to the APW4 transport architecture

The exact cylinders

\[\mathcal C_N=\{n\text{ odd}:n\equiv-1\pmod{2^{N+1}}\}\]

form a nested chain, with \(\mathcal C_{N+1}\subset\mathcal C_N\) and conditional odd-start measure ratio \(1/2\) at each refinement. This gives a finite-prefix filtration and an exact mass model that may be compared with the finite-fibre and incidence structures used in the author's APW4 work.

A genuine APW4–Syracuse transport theorem would still require an explicit index-preserving map from realized Syracuse cylinders and transitions to the APW4 source indices, events, BIB places, incidences, weights, and capacities, together with proofs of the corresponding mass and Hall conditions. No such map is asserted here. The **Lubuimi APW4–Syracuse Cylinder–Energy Bridge** is therefore a named research programme, not a premise or theorem used in this proof.

## 8. General finite valuation-word cylinder partition

The initial all-one theorem is a special case of the following stronger result, recorded with its full recursive proof in the companion note [Lubuimi's Finite Valuation-Word Cylinder Partition Theorem](Lubuimi_Finite_Valuation_Word_Cylinder_Partition_2026-11-10.md).

Let \(\alpha=(a_0,\ldots,a_{k-1})\) be any finite word with every \(a_i\geq1\), and put \(A=\sum_i a_i\). The set of positive odd starts whose first \(k\) exact Syracuse exponents equal \(\alpha\) is exactly one odd residue class modulo \(2^{A+1}\). Therefore its relative natural density among odd starts is \(2^{-A}\).

To see the recursive mechanism, write \(\alpha=(a_0,\beta)\), and let the tail word \(\beta\) have total exponent \(B\) and unique residue \(r_\beta\pmod{2^{B+1}}\). The full word is realized precisely when

\[3n_0+1\equiv 2^{a_0}r_\beta\pmod{2^{a_0+B+1}}.\]

Because \(3\) is invertible modulo powers of two, this gives one residue class modulo \(2^{A+1}\). Since \(r_\beta\) is odd, the congruence also forces the first valuation to be exactly \(a_0\). This proves existence and uniqueness by induction on word length.

The affine offset identity gives an explicit formula. If \(C_k\) is the offset associated with \(\alpha\), then

\[\boxed{r_\alpha\equiv(2^A-C_k)(3^k)^{-1}\pmod{2^{A+1}}.}\]

Extending a prefix of total exponent \(A\) by a next exponent \(b\geq1\) gives a child of relative mass \(2^{-b}\). The children partition the parent, and \(\sum_{b\geq1}2^{-b}=1\). Thus the finite valuation words form an exact measure-consistent prefix tree.

There is also a finite truncation at any cutoff \(B\ge1\): the exact children with next exponent \(b=1,\ldots,B\), together with the single tail event \(a_k\ge B+1\), partition the parent cylinder. Their relative masses are \(2^{-1},\ldots,2^{-B},2^{-B}\), and
\[\sum_{b=1}^{B}2^{-b}+2^{-B}=1.\]
The tail is itself one residue class modulo \(2^{A+B+1}\): along a parent class \(n_0=r+2^{A+1}t\), the affine identity gives \(n_k=n_k^*+2\cdot3^k t\), which runs bijectively through the odd classes modulo \(2^{B+1}\) as \(t\) runs modulo \(2^B\). This gives a finite weighted refinement with one explicit tail atom.

For the all-one word of length \(N\), \(A=N\) and \(C_N=3^N-2^N\), so the residue formula reduces to \(r_\alpha\equiv-1\pmod{2^{N+1}}\), recovering the main theorem.

This general partition theorem is a mathematical derivation and a Lean formalization target; no compile or axiom-audit success for it is claimed. It provides a stronger finite-cylinder foundation for the proposed Lubuimi APW4–Syracuse Cylinder–Energy Bridge, but the bridge still needs an explicit index-preserving incidence/capacity map.

## 9. Lubuimi's terminal-residue collision energy

The finite valuation-word partition also induces a finite-place incidence map. For a word \(\alpha=(a_0,\ldots,a_{k-1})\), let \(A=\sum_j a_j\) and let \(C_k(\alpha)\) be its affine offset. The affine identity implies that every orbit realizing \(\alpha\) has the same terminal residue

\[\boxed{\tau_k(\alpha)=C_k(\alpha)2^{-A}\pmod{3^k}.}\]

Since \(C_k\equiv2^{A-a_{k-1}}\pmod3\), this is a unit modulo \(3^k\). Thus the finite place set is \(U_k=(\mathbb Z/3^k\mathbb Z)^\times\), of size \(2\cdot3^{k-1}\).

Give each word its exact cylinder weight \(w_\alpha=2^{-A}\), and aggregate the weights at each terminal place:

\[m_k(t)=\sum_{\tau_k(\alpha)=t}w_\alpha,\qquad E_k=\sum_{t\in U_k}m_k(t)^2.\]

The exact diagonal/off-diagonal expansion is

\[\boxed{E_k=D_k+C_k^{\rm coll},\qquad D_k=\sum_\alpha w_\alpha^2=\left(\sum_{a\ge1}4^{-a}\right)^k=3^{-k}.}\]

By Cauchy–Schwarz, \(E_k\ge1/|U_k|=1/(2\cdot3^{k-1})\). Hence

\[\boxed{C_k^{\rm coll}\ge\frac{1}{2\cdot3^k}.}\]

For \(k=1\), the two terminal places modulo 3 have masses \(2/3\) and \(1/3\), so \(E_1=5/9\), \(D_1=1/3\), and \(C_1^{\rm coll}=2/9\).

This is an exact weighted collision identity on Syracuse valuation words and a concrete APW4-style diagonal/off-diagonal structure. It is not yet the historical APW4 BIB reserve: an index-preserving map to the original APW4 event/place objects, preservation of historical weights, and a proved capacity/Hall inequality are still required. The collision-energy theorem is a separate mathematical derivation and Lean formalization target, not yet claimed as Lean-compiled. It does not prove Collatz descent. The complete statement, finite truncation bounds, and proof details are in [Lubuimi's Terminal-Residue Collision Energy](Lubuimi_Terminal_Residue_Collision_Energy_2026-11-10.md).

## 10. Formal verification record

The mathematical proof in this manuscript is now also formally checked in Lean. The Collatz/Syracuse source repository contains the declaration `lubuimi_initial_valuation_one_cylinder` and helper lemma `valuation_exponent_eq_one_of_mod_four_three`.

Two independent exact-commit GitHub Actions runs completed successfully:

- Run `42721006544` checked merge commit `44bb2ac`, with PR head `013192ce524a4572a9d96c8d4dcb2796830b1f62`.
- Run `42721305220` checked merge commit `3d79761`, with PR head `ad7203f5571d03e5989b9ac935b2103300f02409`.

Both runs completed the full workflow: library build, iteration and threshold modules, Syracuse reference and quarter-descent modules, offset identity and strict-margin audit, closed-form offset, stronger offset lower bound, valuation-one margin block, and exact valuation-transition modules. In both logs, the declaration `CollatzSyracuseAudit.lubuimi_initial_valuation_one_cylinder` has transitive axiom profile `[propext, Classical.choice, Quot.sound]`. The workflow's explicit complete-log `sorryAx` scan passed. Thus the initial valuation-one cylinder equivalence is Lean-compiled and axiom-audited on both checked snapshots.

Runs `42721911555` and `42722186081` are additional successful exact-head rechecks: both full workflows completed, the theorem retained transitive profile `[propext, Classical.choice, Quot.sound]`, and both complete-log `sorryAx` scans passed. The initial cylinder theorem therefore has four successful exact-commit CI snapshots. The earlier failed attempts remain historical proof-script attempts and are superseded by these four positive checks. Earlier failed attempts `42719689591` and `42720406876` remain part of the chronology, but they do not invalidate the later successful runs.

The general finite valuation-word cylinder partition theorem in the companion note is a separate mathematical derivation and Lean formalization target; it is not yet claimed as compiled. No global Collatz proof is claimed.

## Authorship and rights

This research and the mathematical result presented here are attributed to **Ta-Yoshua Lubuimi**. AI systems may have assisted with drafting, formalization, or research workflow, but are not authors, co-authors, or independent mathematical verifiers.

Copyright © 2026 Ta-Yoshua Lubuimi. All rights reserved in the author's original manuscript expression and original code, subject to third-party rights and applicable law. Copyright does not create an exclusive right over mathematical facts, abstract ideas, or independently developed implementations. The project-specific rights notice and repository-wide licensing policy govern reuse of protected original materials. Lean, Mathlib, and other third-party components retain their own licenses.
