# Base-6 audit and exact carry-margin state (2026-10-27)

Status: new research specification; algebraic identities are elementary, but this note is not Lean-compiled and proves no global Collatz result.

## 1. Base 6: what is true and what is not

For every odd integer \(n\), its base-6 final digit is \(1,3,\) or \(5\). Hence
\[
3n+1\equiv 4\pmod 6,
\]
so \(3n+1\) has final base-6 digit \(4\) and is even. This is an exact local observation.

It does **not** remove the global carry problem. Multiplication by 3 in base 6 is not a digitwise operation: carries still propagate between positions. Nor is division by 2 always a purely last-digit operation; in long division, a remainder from a more significant digit affects the next digit. The fact that the odd step is followed by at least one halving is already encoded in the usual integer parity and does not establish descent.

## 2. Why a raw-bit linear matrix is not automatically available

The binary representation of \(3n+1\) is not a fixed linear transformation of the bit vector over the reals: carries depend on the current digits and on the incoming carry. A quadratic expression \(v^T Mv\) can still be a candidate potential, but a proof must encode the carry state or prove inequalities uniformly over every admissible carry pattern. Moreover, bit-vector length changes with \(n\), so a single fixed-dimensional positive-definite matrix is not yet a well-defined global certificate.

## 3. Exact block state

For a finite odd-to-odd Syracuse word \(k_0,\ldots,k_{N-1}\ge 1\), let
\[
A_j=\sum_{i<j}k_i,\qquad R_0=0,\qquad R_{j+1}=3R_j+2^{A_j}.
\]
Then the exact integer identity is
\[
2^{A_N}n_N=3^N n_0+R_N.
\]
Define the **descent margin**
\[
\Delta_N(n_0; k)= (2^{A_N}-3^N)n_0-R_N.
\]
Whenever the word is the actual valuation word of the orbit,
\[
n_N<n_0\quad\Longleftrightarrow\quad \Delta_N(n_0;k)>0.
\]
This avoids floating-point logarithms and turns the block-descent question into an exact integer sign question. It also keeps the two obstructions visible: the valuation surplus \(2^{A_N}-3^N\) and the additive carry \(R_N\).

## 4. A falsifiable certificate search, not an entropy argument

A proposed block certificate should be a tuple \((N,A_N,R_N,\Delta_N)\) plus a proof that the valuation word is realizable from the starting residue. The search should enumerate compatible residue cylinders, not arbitrary words alone; arbitrary words can be locally algebraically meaningful but need not all be realized by the same integer start.

The required theorem is not “long blocks usually descend.” It is a deterministic coverage statement: every positive odd start either has a certified finite block with positive margin or enters a separately handled exceptional class. A density-one statement or an entropy heuristic does not close this universal quantifier.

## 5. Lean milestones

1. Formalize the recurrence for \(A_j,R_j\) and prove the block identity by induction.
2. Prove the margin equivalence using exact integer inequalities and positivity of \(2^{A_N}\).
3. Encode valuation-cylinder compatibility modulo \(2^{A_N+1}\) (or the exact modulus required by the chosen convention).
4. For any finite certificate table, prove that its cylinders cover the intended residue classes and check all margins with exact arithmetic.
5. Keep the global theorem blocked until the coverage is proved for every odd integer or a genuine descent/induction argument handles the uncovered classes.

Acceptance status: research note only; no claim of Lean compilation, CI success, axiom audit, or Collatz resolution.
