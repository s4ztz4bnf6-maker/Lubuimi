# Syracuse continuation: the 2-adic continuity obstruction at the singular point

Date: 2026-10-26

## Result of this checkpoint

This note isolates a precise obstruction to the slogan “embed Collatz in Z_2 and smooth it into a flow.” The accelerated odd map
\[
T(n)=\frac{3n+1}{2^{v_2(3n+1)}}
\]
has a singular point for its natural 2-adic extension at \(x_*=-1/3\in\mathbb Z_2\). An explicit sequence of **positive odd integers** approaching this point has accelerated images that do not converge. Thus the positive-integer accelerated map cannot have a continuous extension to all of \(\mathbb Z_2\) agreeing with its values on positive odd integers. This is a topological obstruction to one naive route, not a refutation of Collatz.

## Exact positive-integer witness sequence

For each integer \(k\geq1\), choose \(c_k\in\{-1,1\}\) with \(c_k\equiv2^k\pmod3\), so \(c_k=1\) for even k and \(c_k=-1\) for odd k. Put
\[
x_k=\frac{2^k c_k-1}{3},\qquad n_k=x_k+2^{k+1}.
\]
The integer \(x_k\) is well-defined and odd. The integer \(n_k\) is also odd and is positive for every \(k\geq1\). Direct calculation gives
\[
3n_k+1=2^k(c_k+6).
\]
Since \(c_k+6\in\{5,7\}\) is odd,
\[
v_2(3n_k+1)=k,\qquad T(n_k)=c_k+6
=\begin{cases}7,&k\text{ even},\\5,&k\text{ odd}.\end{cases}
\]
Furthermore
\[
n_k-(-1/3)=2^k(c_k+6)/3,
\]
so \(|n_k+1/3|_2=2^{-k}\to0\). Hence \(n_k\to-1/3\) in \(\mathbb Z_2\), while \(T(n_k)\) alternates between 7 and 5. Since \(|7-5|_2=|2|_2=1/2\), the output sequence is not Cauchy and therefore does not converge. This contradicts continuity at \(-1/3\) of any extension agreeing with T on all positive odd integers.

## What this does and does not show

- It rules out a naive global-continuity argument for the accelerated map on the full 2-adic domain.
- It does not rule out a piecewise/cylinder dynamical system, a desingularized state space carrying extra valuation data, or a different compactification.
- Compactness alone never implies convergence of every orbit to a common sink. A valid route still needs a Lyapunov/recurrence theorem that transfers back to positive integers and handles the singular point and its orbit-preimages.
- The ordinary 2-adic extension of the unaccelerated map (even/odd Collatz map) has different continuity properties and is not interchangeable with the accelerated map. Statements must specify which map and domain are used.

## Research consequence: replace “smooth the map” with a singular-cylinder model

The next formal target should not be global continuity. Use a state space whose ordinary states are valuation cylinders
\[
C_k=\{x\in\mathbb Z_2:v_2(3x+1)=k\},
\]
together with an explicit singular state \(x_*=-1/3\) and a transition rule that records the valuation before dividing. The key questions are:

1. Can a cylinder transition relation be represented as a compact symbolic system with a well-defined boundary/singularity rule?
2. Which quantitative property of the cylinder itinerary would imply a positive-integer descent or exclude divergent trajectories?
3. Can that property be proved without assuming the open dangerous-window sparsity statement in the EOC literature?
4. Does the proposed state preserve enough information to reconstruct exact integer orbits, rather than merely typical 2-adic behavior?

A proposed theorem must state its domain, treatment of \(x_*\), topology, and integer-transfer lemma explicitly. A numerical scan or Haar-average statement is not a substitute for a pointwise orbit estimate.

## Reproducibility status

The witness above is an elementary exact derivation, not a Lean compilation report. It does not solve Collatz and does not independently reproduce the EOC repository's computational scan. The EOC source identifies the arithmetic hypothesis PowerOfTwoDangerousWindowSparsity as open and explicitly says its Collatz conjecture remains open: https://github.com/innerlightr-wq/eoc-lean-verification

## Formalization checklist

A Lean file for this checkpoint should separately prove:
- the congruence choice \(c_k\equiv2^k\pmod3\) for \(c_k\in\{-1,1\}\);
- integrality, positivity, and oddness of \(n_k\);
- \(3n_k+1=2^k(c_k+6)\) and the exact valuation;
- 2-adic convergence \(n_k\to-1/3\);
- nonconvergence of the outputs alternating between 7 and 5;
- the contradiction to continuity of any extension agreeing with T on positive odd inputs.

The continuity claim must be stated against a precisely defined 2-adic domain and metric; do not silently treat the natural-number domain as if it were open in \(\mathbb Z_2\).
