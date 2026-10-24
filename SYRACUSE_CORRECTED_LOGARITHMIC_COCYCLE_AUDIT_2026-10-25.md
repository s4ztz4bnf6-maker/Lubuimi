# Syracuse logarithmic cocycle: exact descent certificate (2026-10-25)

## Status

This is an exact mathematical reduction and a formalization plan, not a proof of the Collatz conjecture. No claim is made that the logarithmic inequality below holds for every trajectory.

## 1. Exact cocycle identity

Let x_0,...,x_N be positive odd integers linked by accelerated Syracuse steps
x_{j+1}=(3x_j+1)/2^{a_j}, where a_j=v_2(3x_j+1) >= 1.
Then
log_2 x_{j+1}-log_2 x_j = log_2 3-a_j+log_2(1+1/(3x_j)).
Summing telescopically gives the exact identity
log_2(x_0/x_N) = sum_{j<N}(a_j-log_2 3) - sum_{j<N}log_2(1+1/(3x_j)).
Define the corrected valuation surplus D_N as the right-hand side. Then D_N=log_2(x_0/x_N), so x_N<x_0 iff D_N>0. This equivalence is exact, not asymptotic.

## 2. Why this is useful

The raw drift sum(a_j-log_2 3) alone is not an exact descent certificate: the +1 in 3x_j+1 contributes a positive correction term. The corrected cocycle exposes precisely what a universal argument must bound. It also avoids the false shortcut “compactness of Z_2 implies convergence”: compactness yields convergent subsequences, not universal convergence of forward orbits.

The shortcut map C(n)=n/2 for even n, (3n+1)/2 for odd n, is a different dynamical system from the accelerated map S(n)=(3n+1)/2^{v_2(3n+1)}. Finite parity cylinders are residue-class facts. They do not by themselves eliminate exceptional integer trajectories.

## 3. Lean formalization ladder

Use positive-integer states and explicit hypotheses that every step satisfies 2^{a_j}x_{j+1}=3x_j+1. Suggested declarations, to be proved in separate small lemmas:

1. syracuse_step_log_identity: a single-step identity over real logarithms, with positivity hypotheses.
2. syracuse_log_cocycle: finite telescoping sum over Fin N.
3. corrected_surplus_eq_log_ratio: D_N = log(x_0/x_N)/log 2, using one consistent real-log convention.
4. corrected_surplus_pos_iff_strict_descent: positivity of the corrected surplus iff x_N < x_0.

Lean's exact real-log API and denominator conventions must be checked against the pinned Mathlib version before implementation. Do not replace a difficult identity by an axiom, and do not use log at zero. The sequence must remain strictly positive.

## 4. What would be needed for a global proof

The missing statement is not the cocycle identity. It is a universal arithmetic estimate proving enough positive corrected surplus for every positive odd start, or an alternate argument ruling out every non-descending trajectory. A probabilistic or natural-density-one estimate permits an exceptional density-zero set and cannot fill this gap.

A candidate research program is to seek a finite-prefix certificate that is uniform in the starting value and whose residue-class transitions control the correction term. Any proposed certificate must be checked against all admissible residue classes and then formalized; finite computation alone is not a proof for all prefixes.

## 5. Audit record

- Mathematical status: exact identity conditional on the displayed recurrence.
- Global Collatz status: unresolved by this note.
- Lean status: design specification only; not yet a compiled theorem.
- Kernel/axiom status: no Lean theorem claimed here, hence no kernel claim.
- Relation to density results: compatible with them but strictly stronger than a density-one result if upgraded to a universal bound.
