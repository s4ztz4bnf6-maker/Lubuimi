# Dynamic residual bounds and valuation-dependent coupling in the Syracuse map

**Working manuscript draft — 17 November 2026**  
**Author:** Ta-Yoshua Lubuimi  
**Status:** Research draft; not yet submission-ready.

## Abstract

We organize the accelerated Syracuse iteration through an exact affine representation and a residual variable whose sign encodes strict descent relative to the initial odd integer. The residual recurrence naturally separates valuation-one, valuation-two, and valuation-at-least-three transitions. Dynamic exponent windows track these changes without assuming a stationary valuation pattern. A weighted coupling combines the signed contributions, and an intermediate-index decomposition retains the information carried by blocks and their interfaces.

The author identifies the dynamic bound, dynamic coupling, and a further theorem from the same research programme as the principal theorem-level contributions. Recognition of valuation-driven structural changes and recurring patterns, together with an exploratory alternative approach, is part of the discovery narrative.

## 1. Accelerated Syracuse dynamics

For odd \(n>0\), let
\[
x_0=n,\qquad g_{k+1}=v_2(3x_k+1),\qquad
x_{k+1}=\frac{3x_k+1}{2^{g_{k+1}}}.
\]
Define
\[
A_0=C_0=0,\quad A_{k+1}=A_k+g_{k+1},\quad
C_{k+1}=3C_k+2^{A_k}.
\]
An induction gives
\[
2^{A_k}x_k=3^kn+C_k. \tag{1}
\]

## 2. Exact residual descent criterion

Set
\[
R_k=C_k+3^k-2^{A_k}.
\]
Then
\[
\begin{aligned}
x_k<n
&\iff 3^kn+C_k<n2^{A_k}\\
&\iff n(C_k+3^k-2^{A_k})<(n-1)C_k.
\end{aligned}
\]
Therefore
\[
\boxed{x_k<n\iff nR_k<(n-1)C_k.} \tag{2}
\]
The residual evolves according to
\[
\boxed{R_{k+1}=3R_k+2^{A_k}(4-2^{g_{k+1}}).} \tag{3}
\]

## 3. Dynamic exponent windows

Put
\[
c_j=A_{j+1}-j,\qquad d_j=A_j+2-j.
\]
Then
\[
d_j-c_j=2-g_{j+1},
\]
and
\[
2^j(2^{d_j}-2^{c_j})=2^{A_j}(4-2^{g_{j+1}}).
\]
With \(\mathcal R_{-1}=0\) and \(\mathcal R_j=R_{j+1}\),
\[
\mathcal R_j=3\mathcal R_{j-1}+2^j(2^{d_j}-2^{c_j}). \tag{4}
\]
The update laws are
\[
c_{j+1}-c_j=g_{j+2}-1,\qquad
d_{j+1}-d_j=g_{j+1}-1.
\]
Thus the exponent windows adapt to the realized valuation sequence. The three valuation regimes are not collapsed into a fixed-pattern model.

## 4. Dynamic endpoint bound

Using monotonicity of \(c_j,d_j\) and
\[
\sum_{i=0}^{j-1}3^{j-1-i}2^i=3^j-2^j,
\]
one obtains
\[
(1-2^{c_j})(3^j-2^j)
\leq\mathcal R_{j-1}
\leq(2^{d_j}-1)(3^j-2^j). \tag{5}
\]
The bound is dynamic: its endpoints depend on the actual exponent windows.

## 5. Weighted dynamic coupling

Define
\[
\lambda_j=j+\min(c_j,d_j)=A_j+\min(g_{j+1},2).
\]
For a fixed terminal depth \(N\), let
\[
q_j=
\begin{cases}
3^{N-1-j},&g_{j+1}=1,\\
0,&g_{j+1}=2,\\
-3^{N-1-j}(2^{g_{j+1}-2}-1),&g_{j+1}\ge3.
\end{cases}
\]
Then
\[
R_N=\sum_{j=0}^{N-1}2^{\lambda_j}q_j. \tag{6}
\]
For an intermediate index \(k\), put
\[
Y_k=\sum_{j=k}^{N-1}2^{\lambda_j-\lambda_k}q_j.
\]
The exact decomposition is
\[
R_N=3^{N-k}R_k+2^{\lambda_k}Y_k. \tag{7}
\]
This identity couples the signed contributions across valuation changes and preserves the intermediate block state.

## 6. Overlap representation

For
\[
T_k(e_0,\ldots,e_{k-1})
=\sum_{j=0}^{k-1}3^{k-1-j}2^{e_j},
\]
we have
\[
C_k=T_k(A_0,\ldots,A_{k-1})
\]
and the corrected overlap identity
\[
R_k=4T_k(A_0,\ldots,A_{k-1})-T_k(A_1,\ldots,A_k). \tag{8}
\]

## 7. Universal descent theorem and Collatz corollary

The global statement needed is
\[
(U)\qquad \forall n>1\text{ odd},\ \exists N\ge1:\ x_N<n.
\]
By (2), this is equivalent to the existence of \(N\) such that
\[
nR_N<(n-1)C_N.
\]
Assuming (U), strong induction on odd positive integers proves that every odd integer reaches \(1\) under the accelerated Syracuse map. Every even integer first reduces to an odd integer by division by \(2\). Hence (U) implies the Collatz conjecture.

**Proof-source requirement:** this working draft records the exact reduction and dynamic residual architecture. The independent proof of (U), which the author reports as completed in prior work, must be inserted from its original derivation before this manuscript can be represented as a self-contained proof of Collatz. The three principal theorems must be given their exact statements and hypotheses; the third theorem is not named here because its source wording has not yet been recovered.

## 8. Discovery and contribution statement

The author attributes the central breakthrough to identifying valuation-dependent structural changes and recurring patterns, then developing a dynamic bound and a weighted dynamic coupling that preserve the interaction of changing blocks. The approach was exploratory and deliberately alternative to a fixed-pattern or purely average-density treatment. This methodological insight and theorem architecture are attributed to Ta-Yoshua Lubuimi.

## 9. Verification and limitations

This manuscript is not a Lean verification report. A global formal claim requires a complete Lean declaration, exact source commit, toolchain, successful CI run, named axiom output, and explicit rejection of \`sorryAx\` and forbidden axioms. Numerical tests, finite-prefix identities, density statements, and the conditional implication from (U) must remain separately labelled.
