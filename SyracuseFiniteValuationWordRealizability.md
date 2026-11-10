# Finite valuation words and the Syracuse threshold: a realizability audit

Date: 2026-10-26

## Result

For the accelerated odd Syracuse map
\[
T(n)=(3n+1)/2^{v_2(3n+1)},
\]
a finite prescribed word of positive valuations is not, by itself, an obstruction: every finite word \((a_0,\ldots,a_{N-1})\), with each \(a_i\ge1\), is represented by a nonempty residue class of positive odd starting values modulo \(2^{A_N+1}\), where \(A_N=\sum_{i<N}a_i\).

The induction is an exact congruence argument. If
\[
2^{A_i}n_i=3^i n_0+C_i,\qquad
C_i=\sum_{j<i}3^{i-1-j}2^{A_j},
\]
then the condition \(v_2(3n_i+1)=a_i\) is equivalent to
\[
3^{i+1}n_0+3C_i+2^{A_i}
\equiv 2^{A_i+a_i}
\pmod {2^{A_i+a_i+1}}.
\]
The coefficient \(3^{i+1}\) is invertible modulo every power of two, so this equation specifies one residue class modulo \(2^{A_{i+1}+1}\). Reducing it modulo the preceding modulus recovers the previously imposed prefix conditions. Thus each finite word extends the preceding cylinder by one compatible valuation condition. A sufficiently large positive representative is an actual positive odd starting value, and its first N accelerated valuations are the prescribed word.

## Consequence for the global proof strategy

This blocks a tempting but invalid shortcut: one cannot prove universal threshold crossing by claiming that some finite valuation pattern is arithmetically impossible. Finite words can be arbitrary. The remaining constraint is global and size-sensitive: a starting integer fixes one compatible infinite trajectory, whereas arbitrary finite cylinders do not establish that one fixed positive integer realizes an arbitrary infinite word.

For the current certificate define
\[
S_N=5A_N-9N=\sum_{i<N}(5a_i-9).
\]
A record endpoint with \(S_N\ge0\) yields the existing suffix-certificate route, but finite-word realizability alone cannot prove such an endpoint occurs along every positive orbit. The proof must exploit a genuinely global fact linking the changing integer state to its valuation history, or replace the certificate with a stronger descent potential. Any argument based only on a finite forbidden-word claim is insufficient.

## Formalization status and limitations

This is a mathematical reduction note, not Lean-kernel checked. The existing CI-checked affine and surplus identities remain the formalized layer. The congruence induction should next be formalized as a finite-prefix cylinder theorem, then used to distinguish (i) finite-word existence, (ii) infinite 2-adic paths, and (iii) positive-integer orbits. None of these observations proves the Syracuse/Collatz conjecture.
