# Certified admissible Syracuse words: specification

Branch: `collatz/offset-margin-roadmap-2026-10-23`

## Purpose

A finite exponent list is not, by itself, a Syracuse orbit. This specification separates (i) a proposed exponent word, (ii) a certified orbit realizing it, and (iii) arithmetic constraints that can be checked without assuming a global descent result.

## Certified transition

For odd positive states (n_j,n_{j+1}), exponent (a_j\geq1) is exact when
\[
2^{a_j}n_{j+1}=3n_j+1,\qquad n_{j+1}\text{ odd}.
\]
Oddness of the quotient makes the exponent maximal: (2^{a_j+1}\nmid 3n_j+1). The transition equation without quotient oddness is not enough to certify the 2-adic valuation.

## Prefix invariants

Set
\[
A_0=C_0=0,\quad A_{j+1}=A_j+a_j,\quad C_{j+1}=3C_j+2^{A_j}.
\]
Induction over certified transitions yields
\[
2^{A_j}n_j=3^j n_0+C_j
\]
and therefore
\[
2^{A_j}\mid 3^j n_0+C_j
\]
for every prefix (j).

The endpoint congruence alone is weaker than the conjunction of all prefix conditions. A candidate word must pass every prefix and every exact-valuation check.

## Residue filter

For fixed (A_N>0), (3^N) is invertible modulo (2^{A_N}), so
\[
3^N n_0+C_N\equiv0\pmod{2^{A_N}}
\]
selects one residue class for (n_0) modulo (2^{A_N}). For (A_N=0), the modulus is (1) and the congruence is vacuous.

This is a pruning constraint, not a proof of orbit realizability. The prefix conditions can further reject candidates in the endpoint residue class.

## Margin target

The exact descent criterion from the affine identity is
\[
n_N<n_0\quad\Longleftrightarrow\quad
3^Nn_0+C_N<2^{A_N}n_0.
\]
Thus the unsolved part is a uniform bound strong enough to force this strict inequality for every relevant trajectory or to find a genuine admissible counterexample.

The signed margin recurrence
\[
D_{j+1}=3D_j+(2^{a_j}-4)2^{A_j}
\]
shows why merely counting exponents (a_j\geq3) is insufficient: their positive corrections must quantitatively overcome the propagated negative contributions from exponent-one steps.

## Finite-search protocol

A reproducible search should:
1. enumerate odd starting values within an explicit bound;
2. compute each exact exponent from (v_2(3n+1)), not from an arbitrary word;
3. record all prefix values ((n_j,a_j,A_j,C_j,D_j));
4. check the affine identity and divisibility invariant at every step;
5. emit a machine-readable counterexample if any proposed universal finite-block inequality fails.

A bounded search can refute a proposed universal inequality by a valid counterexample. It cannot establish the infinite Collatz conjecture by absence of counterexamples.

## Completion criterion

A formal `AdmissibleSyracuseWord` should carry the states and exact transition proofs, rather than only an exponent list. Any theorem claiming descent must derive a margin inequality from those certificates; it must not assume that inequality as an input.
