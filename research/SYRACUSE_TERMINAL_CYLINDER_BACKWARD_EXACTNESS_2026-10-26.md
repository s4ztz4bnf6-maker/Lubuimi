# Exact terminal-cylinder implies every prefix valuation: proof obligation

Date: 2026-10-26

## Setup

Fix a finite word of positive exponents \(a_0,\ldots,a_{N-1}\). Define
\(A_0=0\), \(A_{k+1}=A_k+a_k\), and the affine accumulators
\(C_0=n\), \(C_{k+1}=3C_k+2^{A_k}\).

Then
\[
C_N=3^N n+\sum_{j=0}^{N-1}3^{N-1-j}2^{A_j}.
\]

The exact terminal-cylinder condition is
\[
C_N\equiv 2^{A_N}\pmod {2^{A_N+1}}.
\]
It says exactly \(v_2(C_N)=A_N\), provided \(C_N\) is an integer and the congruence is literal.

## Backward-prefix lemma

**Claim.** If all \(a_k\ge 1\) and \(v_2(C_N)=A_N\), then for every \(k\le N\),
\(v_2(C_k)=A_k\).

**Proof.** Descend from \(k=N\). Suppose \(v_2(C_{k+1})=A_{k+1}\). The recurrence gives
\[
C_{k+1}=3C_k+2^{A_k}.
\]
Since \(A_{k+1}=A_k+a_k\ge A_k+1\), we have
\(C_{k+1}\equiv0\pmod {2^{A_k+1}}\). Hence
\(3C_k\equiv-2^{A_k}\pmod {2^{A_k+1}}\).
Because 3 is odd, it is invertible modulo \(2^{A_k+1}\), and multiplying by its inverse preserves the odd residue class of the coefficient of \(2^{A_k}\). Thus
\(C_k\equiv 2^{A_k}\pmod {2^{A_k+1}}\), which gives \(v_2(C_k)=A_k\). Repeating proves the claim. \(\square\)

## Unique terminal residue class

For fixed word, the terminal condition is a linear congruence in \(n\):
\[
3^N n \equiv 2^{A_N}-
\sum_{j=0}^{N-1}3^{N-1-j}2^{A_j}
\pmod {2^{A_N+1}}.
\]
Since \(3^N\) is coprime to \(2^{A_N+1}\), it has a unique inverse modulo that modulus. Therefore there is exactly one residue class \(n\pmod {2^{A_N+1}}\) satisfying the terminal congruence.

## Critical scope distinction

This proves a local exact-cylinder statement for the affine recurrence. To translate it into the accelerated Syracuse map on positive odd integers, separately formalize:
1. the affine accumulator agrees with the numerators obtained by iterating the map;
2. the intermediate quotients are integers;
3. positivity and oddness of the relevant orbit states;
4. the exponent \(a_k\) is the exact valuation, not merely a chosen exponent satisfying divisibility.

The argument does not prove that all integer orbits terminate or enter a known cycle.

## Suggested Lean decomposition

1. terminal congruence iff exact valuation for powers of two and literal congruence.
2. odd-multiple congruence / invertibility of 3 modulo \(2^m\).
3. backward prefix exactness by induction, using the recurrence.
4. terminal residue uniqueness via coprimality of \(3^N\) and \(2^m\).
5. Only then connect to the natural-number Syracuse definitions.

No kernel compilation is claimed for this research note; it is a mathematical proof specification to implement and check.
