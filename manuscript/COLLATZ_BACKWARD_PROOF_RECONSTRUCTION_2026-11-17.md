# Collatz via universal dynamic descent — backward reconstruction

**Author:** Ta-Yoshua Lubuimi  
**Copyright:** © 2026 Ta-Yoshua Lubuimi  
**Date:** 17 November 2026  
**License:** CC BY 4.0

## Abstract

This note reconstructs the global Collatz termination target backward from strict descent of the accelerated odd Syracuse orbit. It records the affine orbit identity, exact residual threshold, residual recurrence, overlap representation, dynamic offsets, universal dynamic envelope, valuation-sensitive coupling, and intermediate-index decomposition. The author reports that the universal dynamic descent theorem has already been proved in prior work. The primary proof artifact remains to be recovered and matched exactly to the final interface; this note does not claim a new independent proof or Lean audit of that theorem.

## 1. Reduction to strict odd descent

For odd positive \(n\), define
\[
x_0=n,\quad g_{k+1}=v_2(3x_k+1),\quad
x_{k+1}=(3x_k+1)/2^{g_{k+1}}.
\]
Every \(x_k\) is positive and odd. It suffices to prove
\[
\forall n>1\text{ odd}\ \exists k\geq1:\ x_k<n.
\]
Strong induction on odd positive integers then proves termination at \(1\). Even starts reduce to odd starts after finitely many divisions by \(2\).

## 2. Affine and residual coordinates

Let
\[
A_0=C_0=0,\quad A_{k+1}=A_k+g_{k+1},\quad
C_{k+1}=3C_k+2^{A_k}.
\]
Induction gives
\[
2^{A_k}x_k=3^kn+C_k.
\]
Define
\[
R_k=C_k+3^k-2^{A_k}.
\]
Then
\[
x_k<n\iff nR_k<(n-1)C_k.
\]
The residual recurrence is
\[
R_{k+1}=3R_k+2^{A_k}(4-2^{g_{k+1}}).
\]

## 3. Overlap form

For
\[
T_k(e_0,\ldots,e_{k-1})
=\sum_{j=0}^{k-1}3^{k-1-j}2^{e_j},
\]
one has
\[
C_k=T_k(A_0,\ldots,A_{k-1})
\]
and
\[
R_k=4T_k(A_0,\ldots,A_{k-1})
-T_k(A_1,\ldots,A_k).
\]

## 4. Dynamic offsets and universal bound

Define
\[
c_j=A_{j+1}-j,\qquad d_j=A_j+2-j.
\]
Then
\[
2^j(2^{d_j}-2^{c_j})=2^{A_j}(4-2^{g_{j+1}}).
\]
With \(\mathcal R_{-1}=0\) and \(\mathcal R_j=R_{j+1}\),
\[
\mathcal R_j=3\mathcal R_{j-1}
+2^j(2^{d_j}-2^{c_j}).
\]
The prior-work dynamic envelope is
\[
(1-2^{c_j})(3^j-2^j)
\leq\mathcal R_{j-1}
\leq(2^{d_j}-1)(3^j-2^j).
\]
Its primary proof source is to be recovered with the final descent proof; the estimate is not silently promoted to an independently audited result by this note.

## 5. Valuation-sensitive coupling

For a horizon \(N\), let
\[
\lambda_j=j+\min(c_j,d_j)=A_j+\min(g_{j+1},2)
\]
and
\[
q_j=
\begin{cases}
3^{N-1-j},&g_{j+1}=1,\\
0,&g_{j+1}=2,\\
-3^{N-1-j}(2^{g_{j+1}-2}-1),&g_{j+1}\geq3.
\end{cases}
\]
Then
\[
3^{N-1-j}2^j(2^{d_j}-2^{c_j})
=2^{\lambda_j}q_j,
\]
and
\[
\mathcal R_{N-1}=\sum_{j=0}^{N-1}2^{\lambda_j}q_j.
\]
For
\[
Y_k=\sum_{j=k}^{N-1}2^{\lambda_j-\lambda_k}q_j,
\]
the exact intermediate split is
\[
\mathcal R_{N-1}
=3^{N-k}\mathcal R_{k-1}+2^{\lambda_k}Y_k.
\]
Combining the endpoint and intermediate dynamic bounds gives
\[
L_N-3^{N-k}U_k
\leq2^{\lambda_k}Y_k
\leq U_N-3^{N-k}L_k.
\]

## 6. Step 12: universal dynamic descent

The final interface is
\[
\boxed{
\forall n>1\text{ odd}\ \exists N\geq1:
\quad nR_N<(n-1)C_N.
}\tag{UD}
\]
By the exact residual threshold, this is equivalent to a strict smaller odd Syracuse iterate for every odd start.

Ta-Yoshua Lubuimi reports that the universal dynamic descent theorem proving this interface has already been established in earlier work. The remaining Step 12 repository task is to recover the original complete proof artifact and verify that its hypotheses, definitions, and quantifiers match (UD). This is not a declaration that the theorem is mathematically open. Nor does this manuscript claim that the unrecovered source has already been independently audited here.

## 7. Collatz implication

Once the prior universal descent theorem is matched to (UD), strict descent follows for every odd \(n>1\). Strong induction on odd positive integers proves that every odd start reaches \(1\). Every even start first reaches an odd integer by division by a power of \(2\). Thus (UD) implies the full Collatz termination statement.

## 8. Evidence and publication status

This is a research manuscript documenting the exact backward interface and its algebraic structure. It is not a Lean audit and reports no new CI run, axiom profile, or sorryAx check for (UD). The original proof artifact and exact source revision must be attached or cited before the manuscript can be presented as an independently verified proof of Collatz.

---

**Ta-Yoshua Lubuimi**  
Copyright © 2026 Ta-Yoshua Lubuimi.  
Licensed under CC BY 4.0.
