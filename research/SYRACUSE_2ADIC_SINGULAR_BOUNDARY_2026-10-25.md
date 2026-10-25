# Syracuse: the 2-adic embedding has a genuine singular boundary
Date: 2026-10-25

## A precise obstruction to a naive continuous-flow model
For odd integers, define the accelerated Syracuse map
T(n) = (3n+1)/2^{v_2(3n+1)}.

On each cylinder where v_2(3n+1)=a is fixed, division by 2^a is well-defined in the corresponding residue class and the local formula is affine. But the valuation is not globally locally constant on all of Z_2: for x close to the 2-adic root x_* = -1/3, v_2(3x+1) can be arbitrarily large. The accelerated quotient map therefore has a singular boundary at x_* and cannot be treated as one globally smooth or continuous map on the whole 2-adic domain without additional choices or a restricted domain.

## Consequence for the proposed continuous-transform strategy
The correct route is a cylinder-wise / induced-dynamics formulation:
1. Partition the odd 2-adic integers by exact valuation cylinders.
2. Prove local affine identities on each cylinder.
3. Treat the accumulating boundary at -1/3 explicitly.
4. Prove that any claimed global invariant or descent function is compatible across cylinder boundaries; local continuity alone is insufficient.
5. Keep the integer orbit problem separate from topological recurrence statements in Z_2.

Compactness of Z_2 alone does not imply that integer trajectories converge to a single sink. Compactness yields accumulation points for sequences, but not a universal orbit-convergence theorem for a discontinuous or partially defined accelerated map.

## Lean-level local partition
For an odd integer n:
- n = 3 or 7 mod 8 forces v_2(3n+1)=1;
- n = 1 mod 8 forces v_2(3n+1)=2;
- n = 5 mod 8 forces v_2(3n+1)>=3.

The existing `SyracuseWeightedCorrection.lean` formalization states this local partition for certified odd-to-odd transitions. This is useful input to a cylinder-wise analysis, but it supplies no global frequency balance between negative valuation-one corrections and positive valuation-at-least-three corrections.
