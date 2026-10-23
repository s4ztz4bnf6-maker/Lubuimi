# Research note: exact valuation cylinders and the global gap

Date: 2026-10-23

## Goal

Replace the symbolic exponent tree by finite arithmetic cylinders that record both the affine recurrence and the exact 2-adic valuation at every step. This note is a research design, not a proof of the Collatz conjecture.

## Affine encoding

For a finite exponent word a_0,...,a_{k-1}, put
A_j = sum_{i<j} a_i and
C_k = sum_{j<k} 3^(k-1-j) 2^(A_j).
Any realized trajectory must satisfy
2^(A_k) n_k = 3^k n_0 + C_k.
Therefore the word imposes the congruence
3^k n_0 + C_k = 0 (mod 2^(A_k)).
Since 3^k is invertible modulo 2^(A_k), this congruence determines at most one residue class for n_0 modulo 2^(A_k). This is the first compression: a word is not a free symbolic branch; it is an arithmetic cylinder.

Caution: this congruence is necessary, not sufficient. Exactness at each step also requires
2^(a_i) | (3 n_i + 1) and 2^(a_i+1) ∤ (3 n_i + 1).
The second condition excludes lower-valuation impostors. The integer states must also remain positive odd states for the accelerated Syracuse map.

## New certificate architecture

A finite cylinder certificate should carry:

1. the exponent word and cumulative exponent A_k;
2. the affine identity and the residue class modulo 2^(A_k);
3. exact-valuation constraints at each intermediate state;
4. positivity/oddness invariants for every state;
5. either a descent margin or an explicit finite obstruction.

This allows a checker to reject a symbolic word before any asymptotic reasoning if its residue constraints are inconsistent.

## Research connection and limit

Parity-vector methods for the ordinary Collatz map exploit the 2-adic structure of the map: finite parity data correspond to congruence classes modulo powers of two. Tao's almost-all theorem instead uses logarithmic density, approximate transport and 3-adic/Fourier structure to show almost all orbits reach small values. These are complementary: congruence cylinders give exact local arithmetic; density estimates control large populations. Neither by itself excludes a single exceptional infinite orbit.

## A possible alternative to raw tree contraction

Track a weighted cylinder potential rather than the number of live branches. A candidate potential must account for:
- cylinder modulus 2^(A_k);
- the offset threshold C_k/(2^(A_k)-3^k) when the denominator is positive;
- whether exact-valuation constraints leave a nonempty cylinder;
- whether descendants partition the parent cylinder without overlap or omission.

A proof would need a proved recurrence for this potential and a strict global contradiction for every infinite branch. Counting branches or showing their density tends to zero is insufficient for a pointwise Collatz theorem.

## Immediate Lean targets

- Define a certificate tying an exponent word to its affine residue congruence.
- Prove exact valuation is equivalent to divisibility by 2^a but not 2^(a+1) (already available as a generic lemma in the current draft).
- Prove that extension by one exponent refines the parent cylinder, and prove the refinement is exhaustive for actual odd states.
- Keep all statements local until a genuinely well-founded global invariant is found.

No global termination theorem is claimed here.
