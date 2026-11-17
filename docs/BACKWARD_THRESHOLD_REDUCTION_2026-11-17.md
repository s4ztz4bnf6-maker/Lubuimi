# Backward threshold reduction — exact overlap and reverse-state formulas

**Date:** 17 November 2026  
**Project:** Syracuse / Collatz only  
**Branch:** `research/reverse-descent-bridge-2026-11-17`

## 1. Exact overlap form of the descent margin

For a realized accelerated Syracuse valuation word (g_1,ldots,g_N), let
[
A_0=0,quad A_{j+1}=A_j+g_{j+1},quad
C_0=0,quad C_{j+1}=3C_j+2^{A_j}.
]
Define
[
T_N(u)=sum_{j=0}^{N-1}3^{N-1-j}2^{A_j},quad
T_N(v)=sum_{j=0}^{N-1}3^{N-1-j}2^{A_{j+1}},
]
where (u=(A_0,ldots,A_{N-1})) and (v=(A_1,ldots,A_N)). Then (T_N(u)=C_N), and the overlap identity gives
[
R_N=4T_N(u)-T_N(v).
]
Consequently the signed descent margin has the exact alternative form
[
oxed{
M_N(n):=(n-1)C_N-nR_N
=nT_N(v)-(3n+1)T_N(u).
}
	ag{1}
]
Therefore
[
oxed{
x_N<niff M_N(n)>0
iff nT_N(v)>(3n+1)T_N(u).
}
	ag{2}
]
This is the natural threshold form for the overlap-constrained backward recursion. It retains both overlapping words and the start value.

## 2. Exact backward stripping recurrence

The global margin satisfies
[
oxed{
M_{k+1}(n)=3M_k(n)+
2^{A_k}igl(n(2^{g_{k+1}}-3)-1igr).
}
	ag{3}
]
Solving (3) backward gives
[
oxed{
M_k(n)=
rac{M_{k+1}(n)-2^{A_k}(n(2^{g_{k+1}}-3)-1)}{3}.
}
	ag{4}
]
Thus every backward step imposes an exact divisibility-by-three condition on the numerator. The valuation cases in the additive term are
[
g=1: -n-1,qquad
g=2: n-1,qquad
gge3: n(2^g-3)-1>0.
]
These are exact local contributions, not by themselves a universal sign argument.

For a fixed terminal depth (N), iterating (3) forward from an intermediate index (k) gives the exact suffix expansion
[
oxed{
M_N(n)=3^{N-k}M_k(n)+
sum_{j=k}^{N-1}3^{N-1-j}2^{A_j}
igl(n(2^{g_{j+1}}-3)-1igr).
}
	ag{5}
]

## 3. Reverse reconstruction of the orbit

The actual orbit satisfies
[
3x_j+1=2^{g_{j+1}}x_{j+1},
qquad
x_j=rac{2^{g_{j+1}}x_{j+1}-1}{3}.
	ag{6}
]
For a terminal value (x_N), iterating (6) backward gives
[
oxed{
3^{N-k}x_k
=2^{A_N-A_k}x_N
-sum_{j=k}^{N-1}3^{N-1-j}2^{A_j-A_k}.
}
	ag{7}
]
For example, at depth two this reads
[
9x_k=2^{g_{k+1}+g_{k+2}}x_{k+2}
-3-2^{g_{k+1}},
]
as required by two applications of (6).

The exact reverse admissibility conditions include:
- integrality at every reverse step (the numerator in (6) is divisible by (3));
- positivity and oddness of every reconstructed (x_j);
- exactness of each valuation, equivalently the quotient (x_{j+1}) is odd;
- compatibility with the fixed starting value (x_0=n).

These are stronger constraints than merely requiring a strictly increasing exponent word.

## 4. What the backward argument must close

Assume for contradiction that no strict descent occurs through depth (N). Then
[
x_kge nquad(0le kle N),
]
and in particular
[
M_k(n)le0quad(0le kle N).
]
The backward recurrence (4), together with (7), must then show that no infinite sequence of reverse-admissible states can satisfy all these inequalities.

The overlap-constrained set recursion
[
mathcal C_1(a,b)={4cdot2^a-2^b},qquad
mathcal C_m(a,b)=3^{m-1}(4cdot2^a-2^b)
+igcup_{c>b}mathcal C_{m-1}(b,c)
]
only characterizes the possible residual values for increasing overlapping exponent words. It does not by itself impose all reverse divisibility, positivity, oddness, and fixed-start constraints, nor does it yield a scalar bound excluding every infinite non-descending path.

Accordingly, the exact missing theorem in the reconstructed source is a **reverse-admissible path exclusion lemma**: under (6) and the exact valuation constraints, the simultaneous conditions (x_kge n) for every (k) are impossible. If the author's prior backward proof establishes this lemma by a sharper state invariant or terminal pullback, that invariant and its induction must be inserted here verbatim. It must not be replaced by an average valuation assumption.

## 5. Status discipline

Equations (1)–(7) are exact algebraic identities. The universal reverse-admissible path exclusion is the decisive global step and is not derived merely by writing the set-valued recursion. This note is a reconstruction aid, not a claim of a completed Collatz proof or Lean verification.
