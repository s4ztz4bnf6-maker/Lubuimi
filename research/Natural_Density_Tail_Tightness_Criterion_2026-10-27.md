# Natural-density bottleneck: a uniform tail-tightness criterion
Date: 2026-10-27
Status: exact elementary criterion; not a Collatz proof

## 1. The unresolved quantifier switch

Let T be the ordinary Collatz map on positive integers, and fix H >= 1. Define
E_H={n: for all j>=0, T^j(n)>H}, and
F_H={n: there exists t>=0 such that for all j>=0, T^(t+j)(n)>H}.
Thus E_H means the orbit is above the barrier from time zero, whereas F_H means it is eventually always above it. Determinism gives the exact identity
F_H = union_{t>=0} T^{-t}(E_H).
A power-saving estimate for E_H does not by itself imply density zero for F_H: the union is countable, and its entrance-time index t depends on n. This is the exact natural-density gap that must be closed; changing bases or proving fixed-time continuity does not remove it.

## 2. A precise sufficient condition: tightness of escape entrance times

For n in F_H, define its last-entry threshold time
tau_H(n)=min{t: for all j>=0, T^(t+j)(n)>H}.
The minimum exists by F_H. Define the tail proportion
R_H(L)=limsup_{X->infinity} (1/X) # {n<=X: n in F_H, tau_H(n)>L}.

**Tail-tightness criterion.** Suppose for every fixed t, the set F_{H,t}={n in F_H: tau_H(n)=t} has natural density zero, and suppose lim_{L->infinity} R_H(L)=0. Then F_H has natural density zero.

**Proof.** For each L,
#(F_H intersect [1,X]) <= sum_{t=0}^L #(F_{H,t} intersect [1,X])
+ # {n<=X: n in F_H, tau_H(n)>L}.
Divide by X, take limsup in X, and use the finitely many zero-density terms. This gives upper density of F_H at most R_H(L). Let L tend to infinity. The upper density is zero. QED.

This is an exact theorem, not an estimate of R_H. The missing work is now exposed as a uniform tail bound, not hidden inside an invalid countable-union argument.

## 3. Why this is the right audit target

A bound of the form #(E_H intersect [1,X]) <= C_H X^(1-eta) controls only starts whose orbit never enters [1,H]. It does not control how many starts spend an arbitrarily long transient before entering E_H. The needed result is a bound on R_H(L) that is uniform in the ambient cutoff X, followed by L -> infinity. A proof that first fixes L and then lets X grow, without controlling the remaining tail, does not suffice.

The dichotomy audit remains exact: a deterministic positive-integer orbit either repeats a value and becomes eventually periodic, or never repeats and tends to infinity in the strong sense (for every H, eventually all iterates exceed H). Therefore a full Collatz proof still requires both (i) excluding nontrivial cycles and (ii) excluding the escape-to-infinity alternative. A density result alone must be connected to every individual starting value by a separate theorem.

## 4. Base 6 and 2-adics: exact correction

For odd n, 3n+1 == 4 (mod 6), so it is even and congruent to 1 mod 3. This does not mean it is divisible by 4: n=3 gives 10. In base 6, division by 6 shifts digits; division by 2 generally propagates carries because 6^j/2 = 3*6^(j-1) for j>=1. The useful role of base 6 is therefore exact residue/block bookkeeping, not locality of the halving operation.

The 2-adic Collatz extension is continuous, but continuity alone supplies no contraction: the map can preserve close inputs without decreasing any metric globally. A Banach fixed-point argument would require a complete invariant domain and a uniform contraction estimate that is not known and cannot be inferred from continuity.

## 5. Exact block arithmetic interface

For the accelerated odd map x_(j+1)=(3x_j+1)/2^(a_j), with a_j=v_2(3x_j+1), put A_k=sum_{j<k}a_j. Repeated substitution gives the exact identity
2^(A_k) x_k = 3^k x_0 + C_k,
C_k = sum_{j=0}^{k-1} 3^(k-1-j) 2^(A_j), with A_0=0.
This is an identity, not a drift theorem. To rule out escape, one must derive a uniform constraint on the admissible valuation word (a_0,...,a_(k-1)) that forces some x_k below x_0, or derive a global potential whose decrease survives every admissible word. Average/entropy heuristics are not enough unless they give a deterministic bound for every orbit.

## 6. Next falsifiable milestone

The next valid theorem target is one of:
1. Prove a quantitative upper bound R_H(L) -> 0 for all H, with constants uniform in X; or
2. Find a rigorous obstruction showing the proposed class of uniform tail bounds cannot hold; or
3. Prove a deterministic valuation-word inequality that forces descent for every admissible word in a specified nontrivial class, and characterize the exact complement.

No such result is claimed in this note. No Lean build or CI run is claimed.
