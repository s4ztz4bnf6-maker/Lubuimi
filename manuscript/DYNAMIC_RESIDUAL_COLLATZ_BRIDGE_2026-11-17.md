# Manuscript — The Ta-Yoshua Lubuimi Dynamic Residual Bound (TL-DRB) for the Syracuse affine descent problem

**Author:** Ta-Yoshua Lubuimi  
**Date:** 17 November 2026  
**Named method:** Ta-Yoshua Lubuimi Dynamic Residual Bound (**TL-DRB**)  
**Version:** 0.1.1  
**Status:** Research manuscript; algebraic results derived here are not yet Lean-formalized.

## Abstract

We present the Collatz specialization of the Ta-Yoshua Lubuimi Dynamic Residual Bound (TL-DRB), giving an exact representation of the signed valuation surplus in the accelerated Syracuse affine formula as a difference of two weighted exponential sums with overlapping exponent words. If (A_0=0) and (A_{k+1}=A_k+a_{k+1}), and if (C_0=0), (C_{k+1}=3C_k+2^{A_k}), then the residual
\[
R_k=3^k+C_k-2^{A_k}
\]
satisfies
\[
R_k=4T_k(A_0,\ldots,A_{k-1})-T_k(A_1,\ldots,A_k).
\]
This yields an exact start-value-dependent descent criterion
\[
S^k(n_0)<n_0\iff n_0R_k<(n_0-1)C_k.
\]
We formulate the associated overlap-constrained residual recursion and record both a finite descent example and an obstruction to naive uniform-horizon arguments. These results refine the arithmetic bookkeeping but do not prove global termination.

## 1. Affine representation

Let (a_1,ldots,a_k) be positive integer valuations and put
\[
A_0=0,\qquad A_j=\sum_{i=1}^{j}a_i.
\]
For the accelerated Syracuse map (S(n)=(3n+1)/2^{v_2(3n+1)}), along a prescribed valuation prefix the exact affine identity is
\[
2^{A_k}S^k(n_0)=3^k n_0+C_k,
\]
where
\[
C_0=0,\qquad C_{k+1}=3C_k+2^{A_k}.
\]
Iterating the recurrence gives
\[
C_k=\sum_{i=0}^{k-1}3^{k-1-i}2^{A_i}.
\]

Define
\[
D_k=2^{A_k}-C_k-3^k,\qquad R_k=-D_k.
\]
Then (D_0=R_0=0), and
\[
D_{k+1}=3D_k+2^{A_k}(2^{a_{k+1}}-4),
\]
equivalently
\[
R_{k+1}=3R_k+2^{A_k}(4-2^{a_{k+1}}).
\]

## 2. The overlapping-word identity

For a length-(k) word (x=(x_0,ldots,x_{k-1})), define
\[
T_k(x)=\sum_{j=0}^{k-1}3^{k-1-j}2^{x_j}.
\]
Let
\[
u=(A_0,ldots,A_{k-1}),\qquad v=(A_1,ldots,A_k).
\]
Then
\[
\begin{aligned}
4T_k(u)-T_k(v)
&=\sum_{i=0}^{k-1}3^{k-1-i}(4\cdot2^{A_i}-2^{A_{i+1}})\\
&=-\sum_{i=0}^{k-1}3^{k-1-i}2^{A_i}(2^{a_{i+1}}-4)\\
&=-D_k=R_k.
\end{aligned}
\]
The final equality follows by expanding the recurrence for (D_k). Hence:

**Theorem 2.1 (TL-DRB overlapping-word residual identity).**
For every finite positive valuation word,
\[
\boxed{4T_k(A_0,\ldots,A_{k-1})-
T_k(A_1,\ldots,A_k)=R_k=-D_k.}
\]

*Proof.* The displayed termwise calculation proves the identity. (square)

## 3. Exact descent criterion

From the affine representation,
\[
S^k(n_0)<n_0
\iff 3^kn_0+C_k<2^{A_k}n_0
\iff (2^{A_k}-3^k)n_0>C_k.
\]
Since (2^{A_k}-3^k=C_k-R_k), this is equivalent to
\[
n_0(C_k-R_k)>C_k,
\]
and therefore to:

**Theorem 3.1 (TL-DRB state-dependent descent criterion).**
\[
\boxed{S^k(n_0)<n_0\iff n_0R_k<(n_0-1)C_k.}
\]

This criterion depends on the start value and the affine correction. The sign of (R_k) alone is not the descent criterion.

## 4. Overlap-constrained backward recursion

For strictly increasing exponent words, the general residual expression
\[
4T_m(u)-T_m(v)
\]
admits a backward first-term decomposition. When the two words overlap as consecutive partial sums, their next pair is constrained to be ((b,c)), rather than an arbitrary independent pair. Define
\[
\mathcal C_1(a,b)=\{4\cdot2^a-2^b\}
\]
and
\[
\mathcal C_m(a,b)=3^{m-1}(4\cdot2^a-2^b)+
\bigcup_{c>b}\mathcal C_{m-1}(b,c).
\]
This is an exact set-valued recursion for the overlap-constrained family. It should not be confused with a finite search procedure or a proven scalar envelope.

## 5. Finite regression: (n_0=7)

The accelerated orbit segment is
\[
7\mapsto11\mapsto17\mapsto13\mapsto5,
\]
with valuation word ((1,1,2,3)). The partial sums are (A_1,ldots,A_4=1,2,4,7), and the affine corrections are (C_1,ldots,C_4=1,5,19,73). The residual sequence is (R_1,ldots,R_4=2,10,30,26).

At (k=4),
\[
7R_4=182<438=6C_4,
\]
so Theorem 3.1 gives (S^4(7)=5<7). The earlier three prefixes do not yet satisfy the strict inequality.

## 6. Arbitrarily long finite all-ones prefixes

For (a_i=1) through length (k), one has (A_j=j),
\[
C_k=3^k-2^k,\qquad R_k=2\cdot3^k-2^{k+1}.
\]
Each such finite prefix is realized by (n_0=2^{k+1}-1). Therefore no argument that simply assumes a uniform finite prefix horizon can dispose of this family. This does not produce one fixed integer with an infinite all-ones valuation sequence; the starting integer varies with (k).

## 7. Limitations and open problems

The results do not provide:
1. a uniform bound for (R_k) relative to (C_k) and (n_0);
2. a uniform finite descent horizon;
3. a proof excluding all infinite non-descending valuation paths;
4. the complete equivalence between terminal congruence classes and actual valuation-word cylinders;
5. a Lean proof or exact-head CI verification of the new identities.

The global Collatz conjecture remains open. The identities here are intended as a precise new coordinate system for the descent margin, not as a claim that the global obstruction has been solved.

## 8. Verification, attribution, and licensing

The mathematical statements in Sections 1–3 now have a corresponding generic Lean formalization in `formalization/TLDRB/TLDRB.lean`: `affine_trajectory_identity`, `dynamicResidual_eq_affineCorrection`, `overlap_identity`, `overlapResidual_succ`, and the abstract `descent_threshold` interface. These declarations passed Lean 4.35.0 / Mathlib v4.35.0 CI run [44026016138](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/44026016138), with `lake build TLDRB` successful (9048 jobs), named axiom output, and the explicit `sorryAx` rejection gate passed. Profiles: `affine_trajectory_identity` `[propext]`; `dynamicResidual_eq_affineCorrection`, `overlap_identity`, `overlapResidual_succ` `[propext, Quot.sound]`; `descent_threshold` `[propext, Classical.choice, Quot.sound]`.

**Formalization boundary:** the Lean affine theorem assumes an abstract sequence satisfying the exact division-witness equation `x (k+1) * 2^(g (k+1)) = 3*x k+1`. The package has not yet instantiated `g` with the actual 2-adic valuation of `3*x+1`, nor connected the abstract positive-denominator descent interface to a complete actual Syracuse orbit theorem. The manuscript's global claims remain limited to finite-prefix identities and the state-dependent criterion. No global descent or Collatz termination theorem is formalized.

The eponym identifies the research method and its author; it does not assert copyright ownership over mathematical facts, abstract ideas, or methods as such. This original manuscript is covered by the repository's [proprietary rights notice](../LICENSE-PROPRIETARY.md) and [commercial licensing policy](../LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md), subject to their stated exclusions and limitations. Mathematical facts, abstract ideas, and theorem statements are not claimed as exclusively owned merely by this notice.
