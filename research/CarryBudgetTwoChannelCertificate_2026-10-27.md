# Carry budget as a two-channel certificate (2026-10-27)

Status: research note; paper proof only, not Lean-compiled and not a proof of Collatz.

## 1. Separate valuation budget from carry debt

For odd Syracuse iterates
\[
n_{j+1}=\frac{3n_j+1}{2^{k_j}},\qquad k_j=v_2(3n_j+1)\ge 1,
\]
write \(A_N=\sum_{j<N}k_j\) and
\[
C_N=\sum_{j<N}3^{N-1-j}2^{A_j},\quad A_j=\sum_{i<j}k_i.
\]
Then induction on \(N\) gives the exact identity
\[
2^{A_N}n_N=3^Nn_0+C_N.
\]
Thus the block is descending exactly when
\[
n_0(2^{A_N}-3^N)>C_N.
\]
This is a two-channel certificate: (i) the valuation budget must beat the multiplier, \(2^{A_N}>3^N\); and (ii) the positive carry debt \(C_N\) must fit inside the remaining margin. Channel (i) alone is insufficient.

## 2. A local cocycle that sums exactly

From \(n_{j+1}/n_j=(3+1/n_j)/2^{k_j}\), taking base-2 logarithms and summing yields
\[
\log_2\frac{n_N}{n_0}
=N\log_2 3-A_N+\sum_{j<N}\log_2\!\left(1+\frac1{3n_j}\right).
\]
Define the carry-corrected valuation debt
\[
\mathcal D_N=A_N-N\log_2 3-\sum_{j<N}\log_2\!\left(1+\frac1{3n_j}\right).
\]
Then \(\mathcal D_N=\log_2(n_0/n_N)\) exactly. Therefore descent is equivalent to \(\mathcal D_N>0\), and divergence would require a much stronger all-tail statement about cumulative increments—not merely infinitely many positive blocks.

Important limitation: this potential is an exact accounting identity, not a Lyapunov proof. It does not show that \(\mathcal D_N\) grows, nor that every orbit has negative average log-growth.

## 3. Entropy cannot replace the orbitwise bound

For a prescribed finite valuation word \((k_0,\ldots,k_{N-1})\), its exact cylinder has odd-residue density \(2^{-A_N}\) modulo the appropriate power of two. This describes finite residue frequencies, but does not establish independence of successive valuations along one orbit. In particular, the explicit all-ones family \(n_0=2^{N+1}m-1\) realizes \(k_0=\cdots=k_{N-1}=1\) and grows across that block:
\[
n_N=2\cdot 3^N m-1>2^{N+1}m-1=n_0.
\]
Hence no fixed block length gives descent for every odd start. Any entropy/Lyapunov strategy must prove a deterministic orbitwise restriction on long valuation words or their carry sums; pseudorandomness or average cylinder density is not enough.

## 4. A sharper research target

Seek a state-dependent bound of the form
\[
C_N\le \Phi(n_0,N,A_N)
\]
for every admissible orbit word, strong enough to imply
\[
\Phi(n_0,N,A_N)<n_0(2^{A_N}-3^N)
\]
on a rigorously characterized family of blocks. A useful result must state the admissibility hypotheses explicitly and survive the all-ones cylinders above. A bound only in terms of word length, or only the average valuation \(\mathbb E[k]=2\) under uniform odd residues, cannot by itself establish global descent.

## 5. Lean acceptance criteria

Formalize separately:
1. the exact block identity by induction;
2. the log-cocycle only if the chosen real-log API is justified, otherwise keep the algebraic identity as the kernel core;
3. the iff between descent and the strict carry inequality;
4. explicit all-ones counterexamples to universal fixed-block descent.

A passing build proves only these formal statements. It does not prove a global Collatz theorem unless the missing orbitwise bound is itself proved and all assumptions are audited.
