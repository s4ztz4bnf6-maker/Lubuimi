# Research note: carry-cocycle blocks, exact descent margins, and base-six audit
Date: 2026-10-27
Status: research specification only; not a Lean-compiled theorem and not a Collatz proof.

## 1. Exact block algebra

For an odd Syracuse orbit, write
\[
x_{i+1}=\frac{3x_i+1}{2^{a_i}},\qquad
A_j=\sum_{i<j}a_i,\quad A_0=0.
\]
Iterating the recurrence gives the exact identity
\[
2^{A_N}x_N=3^N x_0+C_N,\qquad
C_N=\sum_{j=0}^{N-1}3^{N-1-j}2^{A_j}.
\]
In particular, \(C_N>0\). Therefore
\[
x_N<x_0
\iff (2^{A_N}-3^N)x_0>C_N.
\]
This separates two necessary burdens: the valuation budget must give \(2^{A_N}>3^N\), and the multiplicative surplus must dominate the positive affine offset. A bound on average valuations alone does not supply the second inequality for every starting point and every admissible block.

## 2. Carry-cocycle composition law

Represent a prescribed block by a triple \(B=(N,A,C)\) satisfying
\[
2^A x_{\rm out}=3^N x_{\rm in}+C.
\]
If block \(B_1=(N,A,C)\) is followed by \(B_2=(M,B,D)\), then
\[
B_2\circ B_1=(N+M,A+B,3^M C+2^A D).
\]
This law is exact: it retains the additive carry/offset that disappears if one tracks only \((N,A)\). It is associative because it is induced by composition of affine maps. The proposed research object is the **carry-cocycle monoid** of realizable blocks, with the realizability constraints kept separate from the algebraic composition law.

A candidate margin is
\[
\mathcal D(B;x)= (2^A-3^N)x-C.
\]
It is positive exactly when the block strictly descends from positive \(x\). Under composition, the margin must be recomputed from the composed triple; it is not valid to assume that positive margins for separate blocks automatically imply a positive margin for their composition.

Equivalent logarithmic form:
\[
\log\frac{x_N}{x_0}
=N\log 3-A_N\log 2+
\log\left(1+\frac{C_N}{3^N x_0}\right).
\]
The last term is the carry correction. A proof needs a uniform bound or telescoping mechanism for this term, not merely a heuristic entropy decrease.

## 3. Base-six claim audit

For odd \(n\), \(3n+1\equiv4\pmod 6\), so the result is even. This is a correct residue identity, but it does not depend on a new global property of base six: \(3n+1\) is even for every odd integer in every base.

Division by two is not digitwise carry-free in base six. For example, \(10_6=6\) in decimal and \(10_6/2=3_6\); a general digit column under division by two interacts with the base-six place values. The odd-only Syracuse map also depends on the full valuation \(v_2(3n+1)\), not only on the final base-six digit. Thus base six is a useful residue visualization, not a demonstrated cure for carry propagation.

## 4. 2-adic precision audit

If two integers are congruent modulo \(2^m\), their parity branches agree while the iterated congruence retains at least one bit of precision. For the standard map \(T(n)=n/2\) for even \(n\), \((3n+1)/2\) for odd \(n\), a direct induction gives congruence modulo \(2^{m-k}\) after \(k\le m\) steps. It does **not** say the resulting integers are equal. Division by two can consume one bit of 2-adic precision per step. Continuity alone does not imply contraction or convergence of positive integers to 1.

## 5. Falsifiable next tasks

1. Formalize the affine identity and the block composition law independently of any global descent claim.
2. Enumerate short valuation words and compute \((N,A,C)\); reject any proposed potential that predicts descent when \((2^A-3^N)x\le C\).
3. Search for a composable certificate \(\Phi(B,x)\) whose update inequality is proved for every realizable transition, rather than assuming pseudo-randomness or entropy mixing.
4. State divergence and nontermination separately. A trajectory that does not reach 1 need not tend to infinity; it could in principle enter another cycle or remain unbounded without tending to infinity.

No global Collatz conclusion follows unless the universal certificate in item 3 is actually established.
