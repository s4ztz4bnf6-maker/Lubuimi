# Research checkpoint — dynamic Syracuse descent and residual coupling

**Date:** 17 November 2026  
**Research author:** Ta-Yoshua Lubuimi  
**Repository:** `s4ztz4bnf6-maker/Lubuimi`  
**Branch:** `research/2026-11-17-dynamic-descent-checkpoint`  
**Scope:** Syracuse/Collatz only. This record is not part of APW4/BBMST or the separate Adjacent-Values project.

## 1. Researcher-reported milestone

The author reports that the universal dynamic Syracuse descent theorem had already been proved in the preceding research work and that the work in the 17 November 2026 conversation reconstructed the backward connection from that theorem to the Collatz conclusion.

The central contribution is described by the author as the interaction of:

1. a **dynamic bound** whose exponent windows update with the actual valuation sequence;
2. a **dynamic coupling** that combines positive, neutral, and negative valuation contributions in one weighted residual identity;
3. a further theorem from the same research line, whose exact formal statement and title must be inserted from its source rather than guessed.

The author also identifies the recognition of valuation-driven **structure changes and recurring patterns**, together with an exploratory and alternative route into the problem, as an important part of the discovery. This methodological contribution should be attributed to Ta-Yoshua Lubuimi in subsequent manuscripts.

This is a dated research record of the author's reported result. It does not by itself certify an independent proof audit or a Lean formalization.

## 2. Syracuse setup and affine identity

For odd positive (n), define
[
x_0=n,\qquad
g_{k+1}=v_2(3x_k+1),qquad
x_{k+1}=(3x_k+1)/2^{g_{k+1}}.
]
Set
[
A_0=C_0=0,qquad A_{k+1}=A_k+g_{k+1},qquad
C_{k+1}=3C_k+2^{A_k}.
]
Induction gives the exact affine identity
[
2^{A_k}x_k=3^kn+C_k. 	ag{1}
]

Define
[
R_k=C_k+3^k-2^{A_k}.
]
Then
[
x_k<niff nR_k<(n-1)C_k. 	ag{2}
]
Thus a strict Syracuse descent is exactly the stated residual terminal inequality.

The residual recurrence is
[
R_{k+1}=3R_k+2^{A_k}(4-2^{g_{k+1}}). 	ag{3}
]
The additive term is positive for valuation 1, zero for valuation 2, and negative for valuations at least 3.

## 3. Dynamic exponent windows

For the shifted indexing define
[
c_j=A_{j+1}-j,qquad d_j=A_j+2-j.
]
Then
[
d_j-c_j=2-g_{j+1},
]
and
[
2^j(2^{d_j}-2^{c_j})=2^{A_j}(4-2^{g_{j+1}}).
]
With (mathcal R_{-1}=0) and (mathcal R_j=R_{j+1}),
[
mathcal R_j=3mathcal R_{j-1}+2^j(2^{d_j}-2^{c_j}). 	ag{4}
]

The actual valuation changes update the windows:
[
c_{j+1}-c_j=g_{j+2}-1,qquad
d_{j+1}-d_j=g_{j+1}-1.
]
Consequently both windows are nondecreasing. The endpoint estimate recorded in the conversation is
[
(1-2^{c_j})(3^j-2^j)
leq mathcal R_{j-1}
leq (2^{d_j}-1)(3^j-2^j). 	ag{5}
]
Its proof uses the monotonicity of the two exponent windows and the geometric sum
[
sum_{i=0}^{j-1}3^{j-1-i}2^i=3^j-2^j.
]

## 4. Dynamic coupling and intermediate-index decomposition

Let
[
lambda_j=j+min(c_j,d_j)=A_j+min(g_{j+1},2).
]
For a fixed terminal index (N), define
[
q_j=
egin{cases}
3^{N-1-j},&g_{j+1}=1,\
0,&g_{j+1}=2,\
-3^{N-1-j}(2^{g_{j+1}-2}-1),&g_{j+1}ge3.
end{cases}
]
Then
[
3^{N-1-j}2^j(2^{d_j}-2^{c_j})=2^{lambda_j}q_j
]
and summing (4) gives
[
R_N=sum_{j=0}^{N-1}2^{lambda_j}q_j. 	ag{6}
]

For (0le kle N), put
[
Y_k=sum_{j=k}^{N-1}2^{lambda_j-lambda_k}q_j.
]
The exact decomposition is
[
R_N=3^{N-k}R_k+2^{lambda_k}Y_k. 	ag{7}
]
This is the backward endpoint/intermediate-point coupling. It keeps the valuation-dependent structure changes in the weighted tail rather than replacing them by a constant-valuation model.

## 5. Overlap identity — corrected transcription

For
[
T_k(e_0,ldots,e_{k-1})
=sum_{j=0}^{k-1}3^{k-1-j}2^{e_j},
]
we have
[
C_k=T_k(A_0,ldots,A_{k-1}).
]
The overlap formula intended in the conversation is
[
oxed{R_k=
4T_k(A_0,ldots,A_{k-1})
-
T_k(A_1,ldots,A_k).} 	ag{8}
]
The minus sign is essential; the original pasted equation was typographically damaged.

## 6. Global theorem and exact dependency

The universal dynamic descent statement is
[
(U)qquad
orall n>1	ext{ odd}, exists Nge1: x_N<n.
]
By (2), this is equivalent to
[
orall n>1	ext{ odd}, exists Nge1:
nR_N<(n-1)C_N.
]

If (U) is established, strong induction on odd positive integers proves that every odd integer reaches 1 under the accelerated Syracuse map. Even integers first undergo ordinary divisions by 2. Hence (U) implies the Collatz conjecture.

**Logical boundary of the 17 November reconstruction:** the backward implication from (U) to Collatz is complete. The displayed affine, residual, window, coupling, and intermediate-index identities are exact algebraic components. The conversation's final write-up invokes (U) as an already established theorem; it does not reproduce the independent proof of (U) from the dynamic bound and coupling. The source of that prior proof must be attached verbatim or identified by commit/file before this repository can label the global Collatz theorem independently audited or Lean-verified.

This distinction preserves the author's reported milestone without converting a conditional implication into a falsely documented formal verification.

## 7. Research method and attribution

The author identifies the main discovery process as:
- noticing that the valuation sequence creates genuine changes of structure rather than one stationary pattern;
- recognizing recurring valuation patterns and treating their contributions separately before coupling them;
- experimenting with alternative formulations and then identifying a sharper dynamic organization;
- using a dynamic bound and a weighted coupling to preserve information across changing blocks and intermediate indices.

These insights and the resulting architecture are to be attributed to **Ta-Yoshua Lubuimi**. The exact name and statement of the third theorem remain to be supplied from the original source.

## 8. Formal verification and publication status

This checkpoint is a mathematical research record, not a Lean audit. No global theorem is labelled Lean-verified here. A formal claim requires the exact Lean declaration, source commit, toolchain, complete CI run, named `#print axioms` output, and explicit rejection of `sorryAx` and any project-forbidden axioms.

The next manuscript should contain:
1. the exact independent proof of (U), with every hypothesis and terminal/residue exclusion step;
2. the dynamic bound and proof;
3. the coupling identity and proof;
4. the third theorem in its exact original statement;
5. the descent-threshold equivalence and strong-induction corollary;
6. a reproducibility appendix separating hand proof, exact computation, and Lean verification.

No claim of journal acceptance, peer review, or formal verification is made by this checkpoint.
