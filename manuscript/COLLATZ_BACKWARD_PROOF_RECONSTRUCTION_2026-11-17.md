# Collatz via universal dynamic descent — backward reconstruction

**Author:** Ta-Yoshua Lubuimi  
**Date:** 17 November 2026  
**Research status:** backward theorem interface and exact identities consolidated; primary proof source for the universal descent theorem is to be recovered from the author's existing work.

## Abstract

This note records a backward reconstruction of the Collatz termination target through the accelerated Syracuse map. It organizes the affine orbit identity, residual threshold, overlap representation, dynamic offsets, universal residual bound, and valuation-sensitive coupling. The research author states that the universal dynamic descent theorem has already been proved in prior work. Its exact source text has not yet been located in the repository snapshot inspected for this note; accordingly, this document records its required interface without fabricating or replacing its proof.

## 1. The target and the induction reduction

For odd positive (n>1), let
[
x_0=n,qquad x_{k+1}=(3x_k+1)/2^{g_{k+1}},
quad g_{k+1}=v_2(3x_k+1).
]
It suffices to prove
[
orall n>1	ext{ odd} exists kge1: x_k<n.
]
Strong induction on odd positive integers then proves that every odd start reaches (1). Even starts reduce to odd starts by removing powers of two.

## 2. Affine and residual coordinates

Let
[
A_0=C_0=0,quad A_{k+1}=A_k+g_{k+1},
quad C_{k+1}=3C_k+2^{A_k}.
]
Induction gives
[
2^{A_k}x_k=3^kn+C_k.
]
Set
[
R_k=C_k+3^k-2^{A_k}.
]
Then
[
x_k<niff nR_k<(n-1)C_k.
]
The residual recurrence is
[
R_{k+1}=3R_k+2^{A_k}(4-2^{g_{k+1}}).
]
Thus valuation (1), valuation (2), and valuations at least (3) contribute respectively positively, neutrally, and negatively.

## 3. Overlap form

For
[
T_k(e_0,ldots,e_{k-1})
=sum_{j<k}3^{k-1-j}2^{e_j},
]
one has
[
C_k=T_k(A_0,ldots,A_{k-1}),
]
and
[
R_k=4T_k(A_0,ldots,A_{k-1})
-T_k(A_1,ldots,A_k).
]
This expresses the residual as the overlap difference of two adjacent exponent windows.

## 4. Dynamic offsets and universal bound

Define
[
c_j=A_{j+1}-j,qquad d_j=A_j+2-j.
]
Then
[
2^j(2^{d_j}-2^{c_j})=2^{A_j}(4-2^{g_{j+1}}).
]
Writing (mathcal R_{-1}=0), (mathcal R_j=R_{j+1}), gives
[
mathcal R_j=3mathcal R_{j-1}
+2^j(2^{d_j}-2^{c_j}).
]
The universal dynamic estimate in this indexing is
[
(1-2^{c_j})(3^j-2^j)
leqmathcal R_{j-1}
leq(2^{d_j}-1)(3^j-2^j).
]
Its role is to control the residual under actual, changing valuation offsets rather than a fixed valuation pattern.

## 5. Valuation-sensitive universal coupling

For a horizon (N), define
[
lambda_j=j+min(c_j,d_j)
=A_j+min(g_{j+1},2)
]
and
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
3^{N-1-j}2^j(2^{d_j}-2^{c_j})
=2^{lambda_j}q_j,
]
and consequently
[
mathcal R_{N-1}=sum_{j<N}2^{lambda_j}q_j.
]
For every intermediate index (k), put
[
Y_k=sum_{j=k}^{N-1}2^{lambda_j-lambda_k}q_j.
]
Then
[
mathcal R_{N-1}
=3^{N-k}mathcal R_{k-1}+2^{lambda_k}Y_k.
]
Combining the endpoint and intermediate dynamic bounds yields
[
L_N-3^{N-k}U_k
leq2^{lambda_k}Y_k
leq U_N-3^{N-k}L_k,
]
where (L_j,U_j) are the lower and upper bounds from the universal estimate. The coupling includes all valuation regimes in one identity and preserves the intermediate-horizon comparison.

## 6. The universal dynamic descent theorem

The final interface is
[
oxed{
orall n>1	ext{ odd} exists Nge1:
nR_N<(n-1)C_N.
}
	ag{UD}
]
By the exact descent threshold, this is equivalent to the existence of a strict smaller odd Syracuse iterate for every odd start.

**Research attribution.** Ta-Yoshua Lubuimi states that the universal dynamic descent theorem yielding this conclusion has already been proved in earlier work. The present note does not claim that the theorem is newly proved here. The original complete statement and derivation have not yet been located in the repository materials inspected for this checkpoint. Their recovery and exact source mapping are the sole proof-documentation task recorded here; this is not a declaration that the theorem remains mathematically open.

## 7. Collatz conclusion, conditional only on the recovered theorem's exact interface

Once the existing universal descent theorem is confirmed to have precisely the quantifiers and conclusion (UD) for genuine Syracuse valuations, the conclusion follows:
1. every odd (n>1) has a smaller positive odd iterate;
2. strong induction proves that every odd start reaches (1);
3. every even start reaches an odd start after finitely many divisions by (2);
4. therefore every positive integer reaches (1).

The affine, residual, overlap, dynamic-bound, and coupling identities above provide the exact algebraic interfaces in this backward reconstruction. No additional theorem is inserted in place of the author's existing descent proof.

## 8. Verification and publication boundary

This manuscript note is not a Lean audit. It does not assert a new CI run, an axiom profile for (UD), or an independent verification of the recovered proof. Such claims must be added only after the original proof artifact and exact source revision have been found and checked.

The existing repository licensing notices remain applicable. This manuscript does not change them or relicense third-party materials.
