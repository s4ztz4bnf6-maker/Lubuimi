# Ta-Yoshua Lubuimi Dynamic Residual Bound (TL-DRB): Syracuse / Collatz application

**Date:** 17 November 2026  
**Author:** Ta-Yoshua Lubuimi  
**Repository:** `s4ztz4bnf6-maker/Lubuimi`  
**Named method:** Ta-Yoshua Lubuimi Dynamic Residual Bound (**TL-DRB**); German name: Ta-Yoshua-Lubuimi-Dynamische-Residuen-Schranke.  
**Status:** Exact algebraic identity and state-dependent descent criterion proved algebraically; generic Lean formalization passes CI; actual valuation instantiation and global Collatz conclusion remain open.

## 1. Purpose and scope

This note records the Collatz application of the Ta-Yoshua Lubuimi Dynamic Residual Bound (TL-DRB), an eponymous name for the state-dependent residual method developed in the separate Dynamic Residual Bound research project and the affine valuation bookkeeping in the Syracuse/Collatz project. The bridge is used here as a mathematical identity only. The two research projects remain separately versioned and separately licensed; this file records the Collatz-side specialization and does not import the general project's repository or silently merge its theorem claims.

The useful point is that the Collatz affine correction and the valuation surplus can be encoded by one signed residual of the form (4T_k(u)-T_k(v)), where the two exponent words overlap.

## 2. Collatz affine data

Let (a_1,a_2,\ldots) be positive integer valuations along an accelerated Syracuse trajectory, and define partial sums
\[
A_0=0,\qquad A_{k+1}=A_k+a_{k+1}.
\]
Define the affine correction
\[
C_0=0,\qquad C_{k+1}=3C_k+2^{A_k}.
\]
Then
\[
C_k=\sum_{i=0}^{k-1}3^{k-1-i}2^{A_i},
\]
and the exact finite-prefix affine identity is
\[
2^{A_k}S^k(n_0)=3^k n_0+C_k.
\]
Set
\[
D_k=2^{A_k}-C_k-3^k.
\]
A direct calculation gives
\[
D_0=0,\qquad D_{k+1}=3D_k+2^{A_k}(2^{a_{k+1}}-4).
\]
For convenience write (R_k=-D_k). Thus
\[
R_0=0,\qquad R_{k+1}=3R_k+2^{A_k}(4-2^{a_{k+1}}).
\]

## 3. Dynamic-residual encoding

For a length-(k) exponent word (x=(x_0,\ldots,x_{k-1})), put
\[
T_k(x)=\sum_{j=0}^{k-1}3^{k-1-j}2^{x_j}.
\]
Use the two overlapping words
\[
u=(A_0,A_1,\ldots,A_{k-1}),\qquad
v=(A_1,A_2,\ldots,A_k).
\]
Both are strictly increasing because every valuation (a_i) is positive.

Then
\[
\begin{aligned}
4T_k(u)-T_k(v)
&=\sum_{i=0}^{k-1}3^{k-1-i}\bigl(4\cdot2^{A_i}-2^{A_{i+1}}\bigr)\\
&=-\sum_{i=0}^{k-1}3^{k-1-i}2^{A_i}(2^{a_{i+1}}-4)\\
&=-D_k=R_k.
\end{aligned}
\]
Therefore the exact bridge is
\[
\boxed{4T_k(A_0,\ldots,A_{k-1})-
T_k(A_1,\ldots,A_k)=-D_k=R_k.}
\]
This is not an analogy or numerical fit: it follows term by term from (A_{i+1}=A_i+a_{i+1}) and the closed form for (D_k).

## 4. Exact descent threshold

The affine identity gives
\[
S^k(n_0)<n_0
\iff (2^{A_k}-3^k)n_0>C_k.
\]
Since (D_k=2^{A_k}-C_k-3^k), we have
\[
2^{A_k}-3^k=C_k+D_k=C_k-R_k.
\]
Consequently
\[
\begin{aligned}
S^k(n_0)<n_0
&\iff n_0(C_k-R_k)>C_k\\
&\iff \boxed{n_0R_k<(n_0-1)C_k}.
\end{aligned}
\]
This is the exact state-dependent threshold. It is stronger and more precise than treating the sign of (D_k) or (R_k) alone as the descent test. In particular, (R_k>0) alone does not imply descent.

## 5. Collatz-specific coupled residual family

The general Dynamic Residual Bound uses the backward decomposition
\[
\mathcal R_m(a,b)=3^{m-1}(4\cdot2^a-2^b)+
\bigcup_{a'>a,\,b'>b}\mathcal R_{m-1}(a',b').
\]
For the overlapping Collatz words, the next pair is not free: it is ((b,c)). The corresponding constrained family is
\[
\mathcal C_1(a,b)=\{4\cdot2^a-2^b\},
\]
and for (m\ge2),
\[
\boxed{\mathcal C_m(a,b)=
3^{m-1}(4\cdot2^a-2^b)+
\bigcup_{c>b}\mathcal C_{m-1}(b,c).}
\]
Here (a<b<c<\cdots) are successive partial sums. This recursion is the exact set-valued backward decomposition for the overlap-constrained words. It is not yet a finite algorithm, a closed interval formula, or a uniform bound.

## 6. Regression example: start value 7

The accelerated Syracuse trajectory is
\[
7\to11\to17\to13\to5,
\]
with valuation word ((1,1,2,3)). The partial sums and affine corrections are:
\[
(A_1,A_2,A_3,A_4)=(1,2,4,7),
\qquad(C_1,C_2,C_3,C_4)=(1,5,19,73).
\]
The residual values are
\[
(R_1,R_2,R_3,R_4)=(2,10,30,26).
\]
The exact descent comparison is:

| (k) | (n_0R_k) | ((n_0-1)C_k) | strict descent? |
|---:|---:|---:|:---|
| 1 | 14 | 6 | no |
| 2 | 70 | 30 | no |
| 3 | 210 | 114 | no |
| 4 | 182 | 438 | yes |

At (k=4), the criterion gives (S^4(7)=5<7). This is a finite regression example, not evidence of a universal theorem.

## 7. Obstruction to a naive uniform-horizon argument

For an all-ones valuation prefix, (A_k=k), and
\[
C_k=3^k-2^k,\qquad R_k=2\cdot3^k-2^{k+1}>0.
\]
Every finite all-ones prefix of length (k) is realized by the starting value (n_0=2^{k+1}-1). Thus arbitrarily long finite prefixes of this type exist. There is no single fixed positive integer realizing the infinite all-ones path, but the finite-prefix family is enough to show why this branch cannot be dismissed by a naive uniform finite-horizon argument.

The residual recursion alone therefore does not force a uniform sign change or a uniform descent time. It must be combined with the start-value-dependent threshold and a theorem controlling which valuation words are realizable by a given start value.

## 8. Mathematical contribution: what has been proved

The advance is concrete and exact: the signed affine surplus in the accelerated Syracuse iteration is represented by a weighted difference of two overlapping exponential words, and the ordinary-size descent question is reduced to the exact inequality involving both the residual and affine correction. This supplies a state-dependent descent certificate for each finite valuation prefix. It improves the bookkeeping and the precision of the descent test; it is not yet a theorem that forces the inequality for every starting integer.

## 9. What this does and does not establish

**Established algebraically in this note**
- The exact identity (4T_k(u)-T_k(v)=-D_k=R_k).
- The exact descent equivalence (S^k(n_0)<n_0\iff n_0R_k<(n_0-1)C_k).
- The overlap-constrained backward residual recursion.
- The numerical regression for (n_0=7) and the all-ones finite-prefix obstruction.

**Not established**
- A global bound on the residual family that closes the descent threshold.
- A uniform finite horizon for all starting integers.
- Exclusion of all infinite non-descending valuation paths.
- The full terminal-congruence / valuation-word-realization equivalence.
- An end-to-end Lean instantiation of the actual 2-adic valuation and concrete Syracuse orbit; see Section 11 for the formalized generic identities and their exact CI scope.
- The global Collatz conjecture.

The generic finite-prefix identities have now been formalized and audited; see Section 11. No Lean verification is claimed for the complete actual-orbit instantiation or any global descent theorem.

## 10. Licensing and provenance

This file documents the Ta-Yoshua Lubuimi Dynamic Residual Bound (TL-DRB) Collatz application and is original research documentation authored by Ta-Yoshua Lubuimi and is covered by the repository's [proprietary rights notice](../LICENSE-PROPRIETARY.md) and [commercial licensing policy](../LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md), subject to the limitations and exclusions stated there. The underlying mathematical identities and ideas are not claimed as exclusive property merely by this notice. Third-party code, libraries, and publications remain under their own terms.

---
*Research status: exact algebraic bridge recorded; global theorem open.*


## 11. Initial Lean formalization and verification boundary (17 November 2026)

The repository now contains an isolated Lean 4.35.0 / Mathlib package in [formalization/TLDRB](../formalization/TLDRB/). The package now contains these declarations:

- `affine_trajectory_identity`: the finite-prefix affine identity for any sequence satisfying the exact division-witness recurrence;
- `dynamicResidual_eq_affineCorrection`: the dynamic residual is exactly the affine correction plus the explicit power-of-three / power-of-two offset;
- `overlap_identity` and `overlapResidual_succ`: the abstract overlapping-word identity and its one-step update;
- `descent_threshold`: the generic equivalence between quotient descent and the residual inequality, assuming a positive denominator and the stated affine equations.

These declarations formalize the finite algebraic interfaces. The abstract trajectory theorem has not yet been instantiated with the concrete accelerated Syracuse function and its actual 2-adic valuation. The generic descent threshold has not yet been connected to an end-to-end actual-orbit theorem.

The dedicated CI workflow is `../.github/workflows/tldrbaudit.yml`. Exact-head run [44026016138](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/44026016138) completed successfully. PR #90 head is `1a7c7a7df4c5ba014c3a6a932d2bdcb2d8d6c42d`; GitHub tested merge ref `1c9e501699557cccfeb8c97f96fc3f2ca5bb1593`. The build `lake build TLDRB` completed successfully (9048 jobs), named axiom profiles were printed, and the explicit `sorryAx` rejection gate passed. Profiles: `affine_trajectory_identity` `[propext]`; `dynamicResidual_eq_affineCorrection`, `overlap_identity`, `overlapResidual_succ` `[propext, Quot.sound]`; `descent_threshold` `[propext, Classical.choice, Quot.sound]`. See the [full audit report](../docs/TLDRB_LEAN_CI_AUDIT_2026-11-17.md).

A previous attempt failed on a cast-normalization goal; the proof was corrected by inserting `push_cast` before `ring`. The successful run above is for the corrected head. The legacy workflow's root-project detector skipped its Lean jobs on the repository root; that green status is not counted as evidence for this package.
