# Universal dynamic transition lemma: Lubuimi bound and 2-adic/3-adic coupling in the accelerated Syracuse recurrence

**Author:** Ta-Yoshua Lubuimi  
**Date:** 17 November 2026  
**Project:** Syracuse / Collatz application of the Dynamic Residual Bound  
**Evidence status:** exact algebraic lemma proved under the hypotheses below; no global Collatz theorem or Lean verification is claimed by this note.

## 1. Setup

Let (N\ge1), let (a_1,\ldots,a_N\in\mathbb N) with (a_i\ge1), and define
\[
A_0=0,\qquad A_{j+1}=A_j+a_{j+1}.
\]
For (0\le j<N), set
\[
c_j=A_{j+1}-j,\qquad d_j=A_j+2-j.
\]
Then (c_j,d_j\ge0), and
\[
c_{j+1}-c_j=a_{j+2}-1\ge0,\qquad
d_{j+1}-d_j=a_{j+1}-1\ge0
\]
whenever the indices exist. Thus both are nonnegative nondecreasing offset sequences.

Put
\[
\Delta_j=2^{d_j}-2^{c_j},\qquad
R_{-1}=0,\qquad R_j=3R_{j-1}+2^j\Delta_j.
\]

## 2. Lemma A — exact Syracuse embedding of the dynamic residual

Define the affine correction sequence
\[
C_0=0,\qquad C_{j+1}=3C_j+2^{A_j}.
\]
Then, for every (0\le j<N),
\[
\boxed{R_j=C_{j+1}+3^{j+1}-2^{A_{j+1}}.}
\]
Equivalently, if (D_k=2^{A_k}-C_k-3^k), then (R_j=-D_{j+1}).

### Proof

The offset difference is
\[
d_j-c_j=2-a_{j+1}.
\]
Therefore
\[
2^j\Delta_j
=2^j(2^{A_j+2-j}-2^{A_{j+1}-j})
=4\cdot2^{A_j}-2^{A_{j+1}}.
\]
Hence the residual recurrence becomes
\[
R_j=3R_{j-1}+4\cdot2^{A_j}-2^{A_{j+1}}.
\]
For (j=0), (R_0=4-2^{A_1}=C_1+3-2^{A_1}). If the displayed identity holds at (j-1), then
\[
\begin{aligned}
R_j
&=3(C_j+3^j-2^{A_j})+4\cdot2^{A_j}-2^{A_{j+1}}\\
&=3C_j+3^{j+1}+2^{A_j}-2^{A_{j+1}}\\
&=C_{j+1}+3^{j+1}-2^{A_{j+1}},
\end{aligned}
\]
using (C_{j+1}=3C_j+2^{A_j}). Induction proves the identity. \(\square\)

This is an exact identification of the Syracuse valuation-word residual with the general dynamic residual recurrence. The offsets are not fixed parameters: they update with the actual valuation word.

## 3. Lemma B — general dynamic prefix/tail coupling

For any nonnegative nondecreasing integer offsets (c_j,d_j), define
\[
m_j=\min(c_j,d_j),\quad \lambda_j=j+m_j,
\]
\[
q_j=\operatorname{sgn}(d_j-c_j)\,
3^{N-1-j}(2^{|d_j-c_j|}-1),
\]
with (q_j=0) when (c_j=d_j). Then
\[
3^{N-1-j}2^j(2^{d_j}-2^{c_j})=2^{\lambda_j}q_j.
\]
Moreover, (\lambda_{j+1}-\lambda_j\ge1).

Let
\[
M=\sum_{j=0}^{N-1}3^{N-1-j}2^j(2^{d_j}-2^{c_j})
=R_{N-1}.
\]
For (0\le k<N), define
\[
Y_k=
\frac{M-\sum_{j<k}2^{\lambda_j}q_j}{2^{\lambda_k}}
=\sum_{j\ge k}2^{\lambda_j-\lambda_k}q_j.
\]
Then (Y_k\in\mathbb Z), and
\[
\boxed{Y_k=q_k+2^{\lambda_{k+1}-\lambda_k}Y_{k+1}}
\]
for (k<N-1). The exact coupled-state invariant is
\[
\boxed{2^{\lambda_k}Y_k+3^{N-k}R_{k-1}=M.}
\]

### Proof

The termwise decomposition follows by factoring out (2^{\min(c_j,d_j)+j}). Monotonicity gives
\[
\lambda_{j+1}-\lambda_j
=1+\min(c_{j+1},d_{j+1})-\min(c_j,d_j)\ge1.
\]
Thus every term in the tail after index (k) is divisible by (2^{\lambda_k}), proving integrality and the tail recurrence.

Finally,
\[
\sum_{j<k}3^{N-1-j}2^j\Delta_j
=3^{N-k}R_{k-1},
\]
by expanding the residual recurrence. Splitting the total sum (M) into its first (k) terms and its tail gives the invariant. \(\square\)

## 4. The universal dynamic transition — precise meaning

Lemmas A and B together prove the following transition statement:

**At every finite Syracuse valuation-word extension**, the new valuation (a_{j+1}\ge1) updates (A), hence the offsets (c,d), hence the residual (R), and hence the normalized tail/prefix coordinates. The updated offsets remain in the hypothesis class of the Lubuimi bound; the exact residual recurrence remains the Syracuse residual; and the prefix/tail coupling invariant is preserved.

In particular, the Lubuimi bound applies at every stage with the *current* offsets:
\[
(1-2^{c_{j+1}})(3^j-2^j)
\le R_{j-1}\le
(2^{d_{j+1}}-1)(3^j-2^j),
\]
for (j\ge1). This is a genuinely dynamic statement: no constant offset, periodic valuation pattern, or fixed jump size is assumed.

For the Syracuse specialization,
\[
\lambda_j=j+\min(c_j,d_j)
=A_j+\min(a_{j+1},2),
\]
so the 2-adic scale itself is updated by the actual valuation word. Its increments are at least one.

## 5. Relation to the affine descent threshold

For the accelerated Syracuse orbit
\[
x_{k+1}=\frac{3x_k+1}{2^{a_{k+1}}},
\]
the exact affine identity is
\[
2^{A_k}x_k=3^kx_0+C_k.
\]
With (R_k=C_k+3^k-2^{A_k}), the strict-descent criterion is
\[
\boxed{x_k<x_0\iff x_0R_k<(x_0-1)C_k.}
\]
This is an exact equivalence. Lemmas A and B identify the dynamic residual and its coupled states with the Syracuse valuation word at every finite depth.

## 6. Exact theorem boundary

The transition lemmas above are proved algebraically for every finite admissible valuation word. They establish dynamic compatibility of the universal bound, the Syracuse residual, and the 2-adic/3-adic prefix-tail coupling.

They do **not**, by themselves, prove that the start-dependent inequality
\[
x_0R_k<(x_0-1)C_k
\]
must hold for some (k) for every (x_0>1). That final universal assertion is equivalent to the Collatz conjecture for the accelerated map. No proof of that assertion, no global Collatz theorem, and no Lean/CI verification is claimed here. The lemmas must not be misquoted as a completed Collatz proof.

## 7. Provenance and licensing

This file is an original mathematical manuscript note by Ta-Yoshua Lubuimi. In the independent Adjacent Values / Dynamic Residual Bound dossier, manuscript text and proofs are designated CC BY 4.0 and original code/tests MIT; third-party material retains its own license. The copy in the Syracuse/Collatz repository is subject to that repository's existing proprietary rights notice unless a separate written relicensing decision is made. Mathematical facts and theorem statements are not claimed as exclusive property merely by this notice.
