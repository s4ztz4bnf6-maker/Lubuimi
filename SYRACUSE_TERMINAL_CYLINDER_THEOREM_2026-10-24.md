# Exact valuation-word cylinder theorem — Syracuse/Collatz (2026-10-24)

## Status
This is a mathematical derivation and formalization target, not yet a Lean theorem or a global Collatz result. It sharpens the earlier admissibility roadmap by identifying the exact terminal congruence.

## Setup
Fix a finite exponent word \(a_0,\ldots,a_{N-1}\) with every \(a_i\ge 1\). Define
\[
A_0=0,\quad C_0=0,\qquad
A_{i+1}=A_i+a_i,\quad C_{i+1}=3C_i+2^{A_i}.
\]
Let \(F_i(n)=3^i n+C_i\). Then
\[
F_{i+1}(n)=3F_i(n)+2^{A_i}.
\]

For an odd positive start \(n\), the intended state at prefix \(i\) is
\[
n_i=F_i(n)/2^{A_i}.
\]

## Exact terminal cylinder
The whole exponent word is realized by the Syracuse map with these exact valuations if and only if
\[
F_N(n)=3^Nn+C_N\equiv 2^{A_N}\pmod{2^{A_N+1}}.
\]
Equivalently,
\[
3^Nn+C_N\equiv 2^{A_N}\pmod{2^{A_N+1}}.
\]

### Why the terminal condition propagates backwards
Suppose the condition holds at prefix \(i+1\). Since \(A_{i+1}=A_i+a_i\ge A_i+1\), reducing modulo \(2^{A_i+1}\) gives
\[
3F_i(n)+2^{A_i}\equiv 0\pmod{2^{A_i+1}},
\]
hence \(3F_i(n)\equiv 2^{A_i}\pmod{2^{A_i+1}}\). Because
\(3\cdot 2^{A_i}\equiv 2^{A_i}\pmod{2^{A_i+1}}\) and 3 is invertible modulo every power of 2, this is equivalent to
\[
F_i(n)\equiv 2^{A_i}\pmod{2^{A_i+1}}.
\]
Thus the terminal congruence implies every earlier prefix congruence. Conversely, the last exact valuation immediately implies the terminal congruence.

Each prefix congruence says that \(F_i(n)/2^{A_i}\) is an odd integer. The recurrence then gives
\[
3n_i+1=2^{a_i}n_{i+1},
\]
with \(n_{i+1}\) odd, so the valuation is exactly \(a_i\). Positivity follows inductively from positive states and \(3n_i+1>0\).

### Unique residue class
Since \(3^N\) is invertible modulo \(2^{A_N+1}\), the terminal congruence specifies exactly one residue class
\[
n\equiv r_{(a_0,\ldots,a_{N-1})}\pmod{2^{A_N+1}}.
\]
The class is odd (the recurrence gives \(C_N\) odd, and the congruence forces \(3^Nn+C_N\) even). Its positive members realize the same finite valuation word. This is a precise cylinder statement: the constraints are nested automatically, not merely conjecturally compatible.

## Why this matters
- It eliminates a search over independently imposed prefix congruences: one terminal congruence encodes all exact prefix valuations.
- It gives a direct way to enumerate realizable exponent words without treating arbitrary symbolic words as realizable.
- It gives an exact modulus for finite-word searches: \(2^{A_N+1}\), not just \(2^{A_N}\).
- It does **not** prove descent or termination. The offset/margin inequality remains a separate global obstacle; a realizable word can have long runs of exponent 1.

## Lean formalization order
1. Define \(F_i(n)\), \(A_i\), and \(C_i\) for a finite list of positive exponents.
2. Prove the recurrence \(F_{i+1}=3F_i+2^{A_i}\).
3. Prove terminal-congruence-to-prefix-congruence by backward induction, with explicit powers-of-two divisibility lemmas.
4. Prove the equivalence between the terminal congruence and the list of exact valuation equations.
5. Prove uniqueness of the residue class using invertibility of odd numbers modulo powers of 2.
6. Add bounded exhaustive checks only as falsification tests for proposed descent bounds, not as evidence of universal convergence.

## Audit boundary
No Lean compilation is claimed for this note. The statement must be formalized and kernel-checked before being described as a machine-verified theorem. It is a finite-word structural lemma, not a proof of the Collatz conjecture.
