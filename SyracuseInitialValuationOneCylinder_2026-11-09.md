# Initial Valuation-One Cylinder Classification for the Accelerated Syracuse Map

**Author:** Ta-Yoshua Lubuimi  
**Naming:** Descriptive mathematical label only. The statement is a classical finite parity-vector cylinder classification; no eponymous theorem name or priority claim is made. The independent derivation and this formalization are attributed to Ta-Yoshua Lubuimi.

**Original derivation date:** 9 November 2026  
**Status:** Independent mathematical derivation and Lean formalization by Ta-Yoshua Lubuimi of a classical finite parity-vector cylinder classification. The historical Lean identifier `lubuimi_initial_valuation_one_cylinder` passed two complete exact-commit CI workflows: run [42721006544](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721006544) on merge commit `44bb2ac` (PR head `013192ce524a4572a9d96c8d4dcb2796830b1f62`) and run [42721305220](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721305220) on merge commit `3d79761` (PR head `ad7203f5571d03e5989b9ac935b2103300f02409`). Both printed `[propext, Classical.choice, Quot.sound]`; complete-log `sorryAx` scans found none. PR #56 introduces the neutral identifier `initial_valuation_one_cylinder_iff_dyadic_divisibility`; its exact-head verification is pending and the historical audits are not transferred to the renamed declaration. The broader finite valuation-word cylinder classification remains a separate Lean formalization target.

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

The theorem was historically formalized in `SyracuseOffsetIdentity.lean` under the internal identifier `lubuimi_initial_valuation_one_cylinder`, using the certified-step recurrence and the accelerated-odd orbit convention. The two cited workflows verify that historical declaration and its dependency closure only. PR #56 replaces the internal identifier with `initial_valuation_one_cylinder_iff_dyadic_divisibility`; that renamed declaration requires its own exact-head compilation, named axiom audit, and no-`sorryAx` check. Neither identifier nor its audits prove the general finite valuation-word theorem or global Collatz descent.


## Generalizations and next incidence layer

The exact all-one cylinder is the special case of [finite exact valuation-word cylinder classification](Lubuimi_Finite_Valuation_Word_Cylinder_Partition_2026-11-10.md), which assigns every finite positive exact valuation word a unique odd residue class modulo \(2^{A+1}\) and relative odd-start density \(2^{-A}\).

A further consequence is [terminal-residue collision energy](Lubuimi_Terminal_Residue_Collision_Energy_2026-11-10.md): every length-k word maps to a terminal unit residue modulo \(3^k\); the resulting second moment has diagonal mass \(3^{-k}\) and off-diagonal collision mass at least \(1/(2\cdot3^k)\). It also has an explicit finite rational Markov representation. These generalizations are mathematical derivations; their Lean formalizations remain separate from the already verified initial-cylinder declaration.


A third, later exact-source audit is also successful: workflow [42738528207](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42738528207) compiled the current source commit `a1becbc8e837f10abcd952a2e03832cb057fb2b8` and printed the same standard transitive profile for both `lubuimi_initial_valuation_one_cylinder` and `dyadicUniformFibre_partition_card`. Its explicit `sorryAx` gate passed. This later run strengthens the exact-source record; it does not enlarge either theorem's mathematical scope.

## Literature and naming correction — version 1.1

This manuscript records an independent proof and Lean formalization by Ta-Yoshua Lubuimi of the initial valuation-one cylinder classification. The finite congruence statement is a classical consequence of parity-vector coding: see Terras (1976), Everett (1977), and Lagarias (1985), Theorem B. No eponymous theorem name or priority claim is made. Tao (2022), Proposition 1.9, is not cited as the exact unique-residue-class theorem; it concerns approximate distribution of finite Syracuse valuation vectors under an equidistribution hypothesis. The mathematical statement and proof above are unchanged by this naming/literature correction.


## Positive margin implies strict descent

For any certified prefix of length (j), the affine identity gives
[
2^{A_j}n_j=3^j n_0+C_j.
]
If (D_j=2^{A_j}-C_j-3^j>0), then (C_j<2^{A_j}-3^j). Since (n_0ge1),
[
3^j n_0+C_j < 3^j n_0+(2^{A_j}-3^j)n_0=2^{A_j}n_0.
]
Combining this with the affine identity and (2^{A_j}>0) yields (n_j<n_0). Thus positive signed margin is a sufficient strict-descent certificate for that realized prefix. This implication does not assert that every start has a prefix with positive margin.

## Selected literature

- R. Terras, “A stopping time problem on the positive integers,” *Acta Arithmetica* 30 (1976), no. 3, 241–252. [DOI](https://doi.org/10.4064/aa-30-3-241-252).
- C. J. Everett, “Iteration of the number-theoretic function (f(2n)=n, f(2n+1)=3n+2),” *Advances in Mathematics* 25 (1977), no. 1, 42–45. [DOI](https://doi.org/10.1016/0001-8708(77)90087-1).
- J. C. Lagarias, “The (3x+1) problem and its generalizations,” *The American Mathematical Monthly* 92 (1985), no. 1, 3–23, especially Theorem B. [DOI](https://doi.org/10.1080/00029890.1985.11971528).
- T. Tao, “Almost all orbits of the Collatz map attain almost bounded values,” *Forum of Mathematics, Pi* 10 (2022), e12. [DOI](https://doi.org/10.1017/fmp.2022.8). Proposition 1.9 is cited only for its conditional approximate-distribution statement for finite Syracuse valuation vectors, not as the exact parity-vector bijection.
