# Finite valuation words and the limit of block-local Collatz arguments
Date: 2026-10-27

Status: exact arithmetic lemma with induction proof sketch; not a global Collatz result.

## Theorem (finite accelerated valuation words are realizable)

Fix any finite word of positive integers
\[
(a_0,\ldots,a_{N-1}),\qquad a_j\ge1,
\]
and let \(A_j=\sum_{i<j}a_i\). There is a residue class of positive odd integers \(n_0\) modulo \(2^{A_N+1}\) such that every positive representative of that class has exactly the prescribed first \(N\) odd-Syracuse valuations:
\[
v_2(3n_j+1)=a_j,\qquad
n_{j+1}=(3n_j+1)/2^{a_j}.
\]
Consequently infinitely many positive integer starts realize every prescribed finite valuation word.

## Induction proof sketch

For a one-letter word \((a_0)\), the condition
\[
v_2(3n_0+1)=a_0
\]
is equivalent to one residue class
\[
n_0\equiv -3^{-1}\pmod{2^{a_0+1}},
\]
where the inverse is taken modulo the power of 2.

Suppose the first \(N\) valuations have been fixed by one residue class modulo \(2^{A_N+1}\). Its lifts modulo \(2^{A_N+a_N+1}\) have the form
\[
n_0=r+t2^{A_N+1},\qquad t\pmod{2^{a_N}}.
\]
From the exact affine identity
\[
2^{A_N}n_N=3^Nn_0+R_N,
\]
changing \(t\) changes \(n_N\) by \(3^N\,2t\). Since \(3^N\) is odd, as \(t\) runs modulo \(2^{a_N}\), the resulting odd values of \(n_N\) run through the odd residue classes modulo \(2^{a_N+1}\). Exactly one such residue class satisfies \(v_2(3n_N+1)=a_N\). Thus exactly one lift class extends the word. This proves the induction.

The residue argument should be formalized carefully in Lean, including the modular inverse and exact valuation characterisation. The statement is elementary and its proof sketch is intended to expose the precise obligation, not to claim a compiled theorem.

## Consequence for entropy/Lyapunov proposals

No fixed finite valuation block can be declared universally descending for all positive starting integers merely because its bit patterns appear atypical or high-entropy: every finite positive valuation word occurs for infinitely many positive starts. Any useful deterministic Lyapunov argument must therefore use more than a fixed block word or an average frequency. It must control how the block state (including starting value and carry correction) evolves across arbitrarily many blocks, or establish a genuinely uniform inequality that survives all realizable words and their compatibility constraints.

This does not imply that one positive integer can realize an arbitrary infinite valuation sequence. The initial residue class changes as the word is lengthened, and a compatible infinite sequence is a separate question.

## Carry-cocycle state

For each realized word, retain the exact recurrence
\[
R_0=0,\qquad R_{j+1}=3R_j+2^{A_j},
\]
and
\[
2^{A_N}n_N=3^Nn_0+R_N.
\]
The integer descent certificate is
\[
n_N<n_0
\iff
(2^{A_N}-3^N)n_0-R_N>0.
\]
This is exact and division-free. It suggests a formal proof architecture: prove the valuation-word residue theorem first, then test candidate block potentials against all realizable words, and require any global theorem to control the state-dependent correction \(R_N\) rather than relying on entropy rhetoric alone.
