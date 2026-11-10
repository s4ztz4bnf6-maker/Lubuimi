# Lubuimi's Initial Valuation-One Cylinder Theorem for accelerated Syracuse

**Author:** Ta-Yoshua Lubuimi  
**Naming:** This exact cylinder classification is named in this project in honour of its author.

**Original derivation date:** 9 November 2026  
**Status:** Mathematical derivation and Lean formalization. The declaration `lubuimi_initial_valuation_one_cylinder` passed two complete exact-commit CI workflows: run [42721006544](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721006544) on merge commit `44bb2ac` (PR head `013192ce524a4572a9d96c8d4dcb2796830b1f62`) and run [42721305220](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721305220) on merge commit `3d79761` (PR head `ad7203f5571d03e5989b9ac935b2103300f02409`). Both printed the transitive profile `[propext, Classical.choice, Quot.sound]`; the workflow's explicit complete-log `sorryAx` scans found none. The later documentation-only recheck is not needed to establish the theorem's two successful exact-source audits. The broader finite valuation-word cylinder partition theorem remains a separate Lean formalization target.

## Setup

Let \(n_0,n_1,\ldots\) be a positive odd accelerated Syracuse orbit, with exact exponents \(a_j\geq 1\):
\[
2^{a_j}n_{j+1}=3n_j+1,
\qquad n_j\text{ odd}.
\]
Use the accumulated exponent and offset recurrences
\[
A_0=C_0=0,\qquad A_{j+1}=A_j+a_j,\qquad
C_{j+1}=3C_j+2^{A_j}.
\]
The certified-step identity already formalized in `SyracuseOffsetIdentity.lean` is
\[
2^{A_N}n_N=3^Nn_0+C_N.
\]

## The exact initial cylinder

For every integer \(N\geq0\),
\[
\boxed{\quad (\forall j<N,\ a_j=1)
\quad\Longleftrightarrow\quad
2^{N+1}\mid(n_0+1).\quad}
\]

### Proof: residue condition implies the first N exponents are one

Write \(n_0+1=2^{N+1}m\), with \(m\geq1\). For \(0\leq j\leq N\), set
\[
u_j=3^j2^{N+1-j}m-1.
\]
Then \(u_0=n_0\). If \(j<N\), then
\[
3u_j+1
=2\bigl(3^{j+1}2^{N-j}m-1\bigr).
\]
Since \(N-j\geq1\), the expression in parentheses is odd. Thus the exact 2-adic exponent at this step is one, and the next odd iterate is \(u_{j+1}\). Induction gives \(a_j=1\) for all \(j<N\).

### Proof: the first N exponents are one imply the residue condition

If \(a_j=1\) for \(j<N\), then \(A_N=N\) and the offset recurrence gives
\[
C_N=3^N-2^N.
\]
Substitute in the affine identity:
\[
2^Nn_N=3^Nn_0+3^N-2^N,
\]
hence
\[
2^N(n_N+1)=3^N(n_0+1).
\]
Because \(n_N\) is odd, the left side is divisible by \(2^{N+1}\). Since \(3^N\) is coprime to \(2^{N+1}\), Euclid's lemma gives
\[
2^{N+1}\mid(n_0+1).
\]
This also covers \(N=0\), where the conclusion is simply the parity of \(n_0\).

## Exact length of the initial run

Let \(r\geq0\). The initial run has **exactly** \(r\) exponent-one steps iff
\[
\boxed{\quad
2^{r+1}\mid(n_0+1)
\quad\text{and}\quad
2^{r+2}\nmid(n_0+1).
\quad}
\]
Equivalently, \(v_2(n_0+1)=r+1\).

Indeed, write \(n_0+1=2^{r+1}m\). The cylinder theorem gives the first \(r\) exponents equal to one, and
\[
n_r+1=2\cdot3^r m.
\]
The next exponent is at least two exactly when \(n_r\equiv1\pmod4\), which is equivalent to \(m\) being odd, i.e. to \(2^{r+2}\nmid(n_0+1)\).

Consequently every positive odd start has a finite initial exponent-one run, of length
\[
r=v_2(n_0+1)-1.
\]
Among odd starting residue classes, the density of starts with at least \(N\) initial ones is \(2^{-N}\), and the density with exactly \(N\) initial ones is \(2^{-(N+1)}\).

## Consequence for the signed offset margin

The existing run-of-ones identity, applied at the initial index with \(A_0=0\) and initial margin zero, gives
\[
D_r=-2(3^r-2^r).
\]
Thus a nonempty initial run of ones creates a strictly negative margin; the exact cylinder theorem does not turn this into a descent claim.

At the first step after the run, let its exponent be \(a_r\geq2\). The one-step margin recurrence yields
\[
D_{r+1}
=3D_r+(2^{a_r}-4)2^r
=-6(3^r-2^r)+(2^{a_r}-4)2^r.
\]
Therefore the margin becomes positive immediately after that step exactly when
\[
\boxed{\quad
2^{a_r+r}>6\cdot3^r-2^{r+1}.
\quad}
\]
This is an exact, start-dependent recovery threshold. It identifies the next quantitative obligation after the initial valuation-one cylinder; it is not a universal claim that the threshold is met.

## Lean formalization and audit record

The theorem is formalized in `SyracuseOffsetIdentity.lean` as `lubuimi_initial_valuation_one_cylinder`, using the certified-step recurrence and the existing accelerated-odd orbit convention. It passed the two complete exact-commit CI workflows listed above. Both workflows printed the transitive profile `[propext, Classical.choice, Quot.sound]`, and both complete-log scans found no `sorryAx`. This evidence is declaration- and commit-scoped: it verifies the named cylinder theorem and its dependency closure, not the general finite valuation-word theorem or global Collatz descent.


## Generalizations and next incidence layer

The exact all-one cylinder is the special case of [Lubuimi's Finite Valuation-Word Cylinder Partition Theorem](Lubuimi_Finite_Valuation_Word_Cylinder_Partition_2026-11-10.md), which assigns every finite positive exact valuation word a unique odd residue class modulo \(2^{A+1}\) and relative odd-start density \(2^{-A}\).

A further consequence is [Lubuimi's Terminal-Residue Collision Energy](Lubuimi_Terminal_Residue_Collision_Energy_2026-11-10.md): every length-k word maps to a terminal unit residue modulo \(3^k\); the resulting second moment has diagonal mass \(3^{-k}\) and off-diagonal collision mass at least \(1/(2\cdot3^k)\). It also has an explicit finite rational Markov representation. These generalizations are mathematical derivations; their Lean formalizations remain separate from the already verified initial-cylinder declaration.
