# Falsification report: first-return kernel is structurally trivial

Date: 2026-10-27
Status: exact mathematical obstruction; no Collatz theorem proved.

## Result
The first-return matrix proposed in Return_Kernel_Experiment_2026-10-27.md is not a useful spectral object in its current form.

Let F be any finite set of positive integers. Define K(x,y) to count inverse paths from y to x whose internal vertices lie outside F, with x,y in F. Reversing such a path gives a forward path from x to y whose internal vertices lie outside F. Since the ordinary Collatz map is a function, each x has at most one forward trajectory and hence at most one first-return endpoint y. Therefore

  for every x in F,  Σ_{y∈F} K(x,y) ≤ 1.

This is independent of B and L. In particular K is substochastic by rows, and the proposed matrix cannot reveal branching through its row sums or a spectral radius greater than 1. The earlier finite enumeration (B=3,5,10,20 and L≤8) agrees with this structural fact; those computations are sanity checks, not the proof.

## Decision
Do not spend more effort optimizing this first-return kernel. This is a falsification of the proposed research instrument, not a counterexample to Collatz.

## Replacement target: transfer density through finite-time preimages
The actual gap is between (i) a positive-lower-density theorem for nonconvergent starts, conditional on a counterexample, and (ii) a power-saving estimate for starts whose orbit stays above a fixed barrier from time zero. A counterexample that only eventually stays above the barrier is a shifted iterate of such a start, and the shift time is not uniformly bounded across all starts.

A valid bridge must quantify the density cost of pulling a barrier-avoiding set backward through t Collatz steps, uniformly in both cutoff X and shift time t, or else control the tail over t. A fixed-t estimate is insufficient if its constant grows exponentially in t; a countable union over t is not automatically density zero.

Formal target to investigate:
  For each barrier H, bound the upper natural density of {n≤X : n is a nonconvergent start and T^j(n)>H for all sufficiently large j}.
This requires an explicit uniform shift/preimage estimate. It is not currently proved here.

## Audit rule
No claim of progress toward Collatz is to be made from finite spectral numerics unless a uniform-in-depth theorem survives the shift/preimage obstruction above. The positive-density and power-saving results remain conditional/partial inputs, not a solution.