# Syracuse continuation: the 2-adic continuity obstruction at the singular point

Date: 2026-10-26

## Result of this checkpoint

This note isolates a precise obstruction to the slogan “embed Collatz in Z_2 and smooth it into a flow.” The accelerated odd map
\[
T(n)=\frac{3n+1}{2^{v_2(3n+1)}}
\]
is locally described by valuation cylinders, but its natural extension to odd 2-adic inputs is not continuous at \(x_*=-1/3\in\mathbb Z_2\). This is an exact topological obstruction, not a refutation of Collatz and not a proof that every alternative compactification fails.

## Exact witness sequence

For each integer \(k\geq 1\), choose \(c_k\in\{-1,1\}\) with \(c_k\equiv 2^k\pmod 3\), and define
\[
x_k=\frac{2^k c_k-1}{3}\in\mathbb Z.
\]
Since \(2^k c_k\equiv1\pmod3\), the numerator is divisible by 3. Since \(2^k c_k-1\) is odd and 3 is odd, \(x_k\) is odd. Moreover
\[
3x_k+1=2^k c_k,
\qquad v_2(3x_k+1)=k,
\qquad T(x_k)=c_k.
\]
Also
\[
x_k-(-1/3)=2^k c_k/3,
\]
so \(x_k\to -1/3\) in the 2-adic metric because \(|x_k+1/3|_2=2^{-k}\to0\).

The congruence condition forces \(c_k=1\) for even k and \(c_k=-1\) for odd k. Thus \(T(x_k)\) alternates between \(1\) and \(-1\). These do not converge in \(\mathbb Z_2\), since \(|1-(-1)|_2=|2|_2=1/2\) is fixed and nonzero. Therefore no continuous extension agreeing with this accelerated formula on all odd integers can be continuous at \(-1/3\).

## What this does and does not show

- It rules out a naive global-continuity argument for the accelerated map on the full odd 2-adic domain.
- It does not rule out a piecewise/cylinder dynamical system, a desingularized state space carrying extra valuation data, or a different compactification.
- Compactness alone never implies convergence of every orbit to a common sink. A valid route still needs a Lyapunov/recurrence theorem that transfers back to positive integers and handles the singular point and its orbit-preimages.
- The ordinary 2-adic extension of the unaccelerated map (even/odd Collatz map) has its own continuity properties and is not interchangeable with the accelerated map. Statements must specify which map and domain are used.

## Research consequence: replace “smooth the map” with a singular-cylinder model

The next formal target should not be global continuity. Use a state space whose ordinary states are valuation cylinders
\[
C_k=\{x\in\mathbb Z_2: v_2(3x+1)=k\},
\]
together with an explicit singular state \(x_*=-1/3\) and a transition rule that records the valuation before dividing. The key questions are:

1. Can a cylinder transition relation be represented as a compact symbolic system with a well-defined boundary/singularity rule?
2. Which quantitative property of the cylinder itinerary would imply a positive-integer descent or exclude divergent trajectories?
3. Can that property be proved without assuming the open dangerous-window sparsity statement in the EOC literature?
4. Does the proposed state preserve enough information to reconstruct exact integer orbits, rather than merely typical 2-adic behavior?

A proposed theorem must state its domain, treatment of \(x_*\), topology, and integer-transfer lemma explicitly. A numerical scan or Haar-average statement is not a substitute for a pointwise orbit estimate.

## Reproducibility status

The witness above is an elementary exact derivation. This note is not a Lean compilation report, does not claim a new solution of Collatz, and does not independently reproduce the EOC repository's computational scan. The EOC source identifies the arithmetic hypothesis PowerOfTwoDangerousWindowSparsity as open and explicitly says its Collatz conjecture remains open: https://github.com/innerlightr-wq/eoc-lean-verification

## Formalization checklist

A Lean file for this checkpoint should separately prove:
- the congruence choice \(c_k\equiv2^k\pmod3\) for \(c_k\in\{-1,1\}\);
- integrality and oddness of \(x_k\);
- \(3x_k+1=2^kc_k\) and the exact valuation;
- 2-adic convergence \(x_k\to-1/3\);
- nonconvergence of the alternating output subsequences;
- the contradiction to continuity of any extension agreeing with \(T\) on these inputs.

The last item should be stated against a precisely defined 2-adic domain and metric; do not silently treat the natural-number domain as if it were open in \(\mathbb Z_2\).
