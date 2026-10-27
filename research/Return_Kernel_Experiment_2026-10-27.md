# Research experiment: return-kernel / carry-cocycle bridge (2026-10-27)

## Purpose and status
This is a proposed research object, not a theorem about Collatz. It is designed to expose the missing implication in the density route and to admit explicit counterexamples at finite depth.

## Definition: truncated first-return kernel
Fix a finite target set F={1,...,B} and a depth L. For each x in F, enumerate all inverse branches of the ordinary Collatz map of length at most L which start at x, end in F, and whose intermediate states lie outside F. Retain multiplicity by inverse path, not merely by endpoint. Let K_{B,L}(x,y) be the number of retained inverse paths from y to x (orientation: columns are targets, rows are predecessors). This is a finite nonnegative integer matrix.

The inverse branches must be generated from the exact equations:
- even predecessor of y: 2y;
- odd predecessor of y, when integral: (y-1)/3, requiring y ≡ 1 (mod 3) and an odd quotient.
Each branch is then checked by direct forward iteration. This avoids accidentally treating a non-integral or parity-invalid inverse as a genuine predecessor.

## Testable conjectural bridge (NOT assumed true)
A possible route is to prove a uniform return estimate for bad trajectories: for every B, the upper density of starts whose orbit avoids 1 and makes infinitely many visits to F is zero. This alone would not cover trajectories with only finitely many visits to each fixed F; therefore a complete proof must additionally control the diagonal family F_B as B→∞. The project must not claim the bridge until both cases are handled.

## What the finite kernel can and cannot prove
For each B,L, K_{B,L} is computable exactly. Its spectral radius or column sums can reveal growth/decay patterns of finite inverse excursions. But finite-L estimates do not imply an infinite-time density theorem without a uniform tail estimate in L and a proof that the chosen truncation controls all admissible paths.

## Carry-cocycle interface
For an odd-step block, retain (A,N,C) with 2^A y=3^N x+C. Composition depends on the block convention; for the repository's normalized pair λ=2^A/3^N and q=C/3^N, the law is λ₁₂=λ₁λ₂, q₁₂=q₁+λ₁q₂. The threshold is a weighted mean when both λ_i>1, so concatenation by itself cannot improve the best component threshold.

## Required falsification protocol
1. Enumerate small B,L exactly and retain the full witness paths.
2. Compare the matrix-derived path counts with brute-force forward trajectories.
3. Search for finite analogues violating any proposed monotonicity or return estimate.
4. Only promote a pattern if an explicit uniform-in-L bound is proved; then formalize the finite definition and bound in Lean.
5. A global Collatz claim still requires either density-one convergence or an independent descent argument. This note proves neither.