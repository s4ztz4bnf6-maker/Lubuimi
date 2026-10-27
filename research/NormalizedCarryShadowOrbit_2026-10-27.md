# The normalized carry shadow orbit (2026-10-27)

Status: exact algebraic research lemma; not Lean-compiled. This is a structural identity, not a Collatz proof.

## Definition

Fix any finite sequence of positive integers \(k_0,\ldots,k_{N-1}\). Put
\[
A_j=\sum_{i<j}k_i,\qquad
C_0=0,\qquad C_{j+1}=3C_j+2^{A_j},
\]
and define the normalized carry state
\[
q_j=\frac{C_j}{2^{A_j}}.
\]
Then
\[
q_0=0,\qquad q_{j+1}=\frac{3q_j+1}{2^{k_j}}.
\]
Thus the carry term, after normalization, evolves by the *same affine block map* as an accelerated Syracuse step, driven by the same valuation word. Call \(q_j\) the **carry shadow orbit** of that word.

## Exact decomposition

For an odd Syracuse orbit with that valuation word,
\[
n_N=\frac{3^N}{2^{A_N}}n_0+q_N.
\]
Consequently
\[
n_N<n_0
\quad\Longleftrightarrow\quad
n_0\left(1-\frac{3^N}{2^{A_N}}\right)>q_N.
\]
This is the normalized form of the two-channel carry certificate. It isolates the source of the obstruction: the multiplier channel \(3^N/2^{A_N}\) and the nonnegative shadow \(q_N\) are coupled by the same valuation word.

## A precise caution

The shadow orbit is not independent of the original orbit: the word \(k_j=v_2(3n_j+1)\) is selected by the original integer state. Treating the \(k_j\) as independent random bits would break the deterministic problem. Also, if all \(k_j=1\), then
\[
q_N=(3/2)^N-1,
\]
and the multiplier is \((3/2)^N>1\), so the block grows. This agrees with the explicit all-ones cylinders and rules out any claim that a sufficiently long block must always descend.

## Research leverage

This representation suggests studying admissible valuation words through the pair
\[
\left(\frac{3^N}{2^{A_N}},q_N\right)
\]
rather than entropy alone. A meaningful theorem would need to constrain which pairs can arise along one integer orbit and prove that the multiplier eventually falls below 1 with enough margin to dominate \(q_N/n_0\). Merely bounding \(q_N\) for arbitrary words cannot prove Collatz, since the all-ones words are admissible for arbitrarily long finite horizons.

## Lean targets

1. Define \(C_j,A_j,q_j\) recursively, avoiding logarithms and real analysis.
2. Prove \(q_j=C_j/2^{A_j}\) and the recurrence \(q_{j+1}=(3q_j+1)/2^{k_j}\).
3. Prove the exact decomposition by induction.
4. Prove the strict descent equivalence under \(2^{A_N}>0\).
5. Formalize the all-ones word and its growth as a counterexample to universal fixed-block descent.

A kernel-checked version of these lemmas would validate the algebraic structure only. The open step remains an orbitwise theorem restricting the admissible pair.
