# Lean formalization route: terminal exact-residue criterion

**Project:** Lubuimi's Finite Valuation-Word Cylinder Partition Theorem  
**Author:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Status:** Mathematical derivation and formalization design; not yet Lean-compiled.

This note develops the terminal-congruence route already present in the Syracuse finite-word research record. It is a direct alternative to recursively nesting quotient and valuation expressions. It does not replace the manuscript theorem and does not claim a Lean result.

## 1. Finite-word data

Fix a finite word a : Fin k → ℕ with 0 < a j. Define
[
A_0=0,quad A_{j+1}=A_j+a_j,qquad
C_0=0,quad C_{j+1}=3C_j+2^{A_j},
]
and
[
X_j=3^j n_0+C_j.
]
Then X_{j+1}=3X_j+2^{A_j}. The affine offset identity is X_j=2^{A_j}n_j whenever the specified finite Syracuse word is realized.

## 2. Terminal exact-residue criterion

Let A=A_k. The central finite-word condition is
[
oxed{X_kequiv 2^Apmod {2^{A+1}}.}
]
It says exactly that 2^A divides X_k and the quotient X_k/2^A is odd.

For each j<k, expand the recurrence:
[
X_k=3^{k-j}X_j+2^{A_j}R_j,
]
where
[
R_j=sum_{t=j}^{k-1}3^{k-1-t}2^{A_t-A_j}.
]
The first summand of R_j is odd. Every later summand is even because A_t>A_j. Thus R_j is odd.

Since A_k>A_j, the terminal congruence implies X_k≡0 mod 2^{A_j+1}. The expansion and odd invertibility of 3^{k-j} first imply 2^{A_j} divides X_j. Write X_j=2^{A_j}y_j. Reducing the expansion modulo 2^{A_j+1} then gives
[
3^{k-j}y_j+R_jequiv0pmod2.
]
Both coefficients are odd, so y_j is odd. Consequently
[
oxed{X_jequiv2^{A_j}pmod {2^{A_j+1}}quad(0le jle k).}
]
The terminal exact-residue condition therefore forces exact divisibility at every prefix, not just at the endpoint.

Conversely, if every prescribed transition is realized with an odd quotient, then X_k=2^{A_k}n_k with n_k odd, giving the terminal congruence. Hence the terminal condition and the complete finite exact word are equivalent once the quotient sequence is reconstructed from the affine recurrence.

## 3. Unique initial residue

The terminal condition is
[
3^k n_0+C_kequiv2^Apmod {2^{A+1}}.
]
Because 3^k is invertible modulo 2^{A+1}, it determines one residue:
[
oxed{r_alphaequiv(2^A-C_k)(3^k)^{-1}pmod {2^{A+1}}.}
]
For k>0, C_k is odd, so r_alpha is odd. For the empty word, the condition is simply n_0≡1 mod 2. Thus the unique residue is always an odd start class.

This proves the one-cylinder statement and its relative odd-start density 2^{-A}.

## 4. Lean lemma sequence

Implement and audit the following as separate declarations, with no recovery axioms:

1. prefixExponent_succ: prefix-sum recurrence and monotonicity A_j≤A_t for j≤t.
2. offsetNumerator_succ: X_{j+1}=3X_j+2^{A_j}.
3. suffixExpansion: the exact finite expansion X_k=3^{k-j}X_j+2^{A_j}R_j.
4. suffixCorrection_odd: R_j is odd for j<k, using positivity of all later exponents.
5. terminalExact_residue_prefixExact: terminal exact residue implies exact residue at every prefix.
6. prefixExact_reconstructOddOrbit: define n_j=X_j/2^{A_j}, prove positivity, oddness, and 2^{a_j}n_{j+1}=3n_j+1.
7. terminalExact_iff_wordRealized: combine the forward and reverse directions.
8. initialResidue_unique: solve the terminal congruence using the inverse of 3^k modulo 2^{A+1}.
9. finiteCylinder_density: count the single odd residue class among the 2^A odd classes modulo 2^{A+1}.

The proof should use Nat.ModEq, ZMod (2^(A+1)), or explicit divisibility lemmas consistently. Avoid switching representations mid-proof unless the conversion lemma is itself named and audited. For natural-number division, establish divisibility before using Nat.div_mul_cancel; do not let omega infer quotient identities from an unproved divisibility fact.

## 5. Finite tail partition

For a fixed parent word of total exponent A, write its starts as
[
n_0=r+2^{A+1}t.
]
The reconstructed terminal state varies as
[
n_k=n_k^*+2cdot3^k t.
]
The tail event a_k≥B+1 is exactly
[
3n_k+1equiv0pmod {2^{B+1}}.
]
Since the coefficient of t in this congruence is 2·3^{k+1}, dividing the congruence by 2 leaves an odd coefficient modulo 2^B. There is therefore exactly one t mod 2^B solving it. The tail is one residue class modulo 2^{A+B+1}.

The exact children b=1,...,B have relative masses 2^{-b}; the tail has relative mass 2^{-B}. Thus
[
sum_{b=1}^{B}2^{-b}+2^{-B}=1.
]
This tail partition should be formalized only after the parent-cylinder reconstruction and exact next-exponent lemma are in place.

## 6. Audit boundary and dependency discipline

- The general finite-word theorem remains mathematically proved in the companion manuscript but is not yet Lean-compiled.
- The initial all-one special case is separately Lean-audited in four successful exact-commit workflows: 42721006544, 42721305220, 42721911555 and 42722186081.
- The terminal criterion is a formalization route, not a fifth verified result.
- Required final evidence: exact commit SHA, full successful build, positive declaration coverage, lake check --paranoid, named #print axioms for the theorem and density corollary, and complete-log absence of sorryAx and project-specific axioms.
- No global Collatz descent follows from finite cylinder density alone.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.
