# Necessary valuation-density condition for a divergent accelerated Syracuse orbit

Date: 2026-10-27

Status: proved on paper; not yet formalized in Lean. This is a necessary
condition for divergence, not a proof that divergence is impossible.

## Definitions

Let an accelerated Syracuse orbit be defined by odd positive integers
\[
n_{j+1}=\frac{3n_j+1}{2^{a_j}},\qquad
a_j=v_2(3n_j+1)\ge 1.
\]
Write
\[
A_N=\sum_{j=0}^{N-1}a_j,\qquad
C_N=\sum_{j=0}^{N-1}\log_2\!\left(1+\frac1{3n_j}\right).
\]

Taking logarithms of each exact transition and summing gives
\[
\log_2 n_N=\log_2 n_0+N\log_2 3-A_N+C_N. \tag{1}
\]
No probabilistic assumption is used.

## Theorem (necessary density of valuation-one steps)

If \(n_j\to\infty\), then
\[
\limsup_{N\to\infty}\frac{A_N}{N}\le\log_2 3
\]
and consequently
\[
\liminf_{N\to\infty}
\frac{\#\{j<N:a_j=1\}}{N}\ge 2-\log_2 3\approx0.4150.
\]

### Proof

Since \(n_j\to\infty\), the summands
\[
c_j=\log_2\!\left(1+\frac1{3n_j}\right)
\]
tend to zero. By Cesàro convergence, \(C_N/N\to0\).

From (1), using \(\log_2 n_N\ge0\), we have
\[
A_N\le\log_2 n_0+N\log_2 3+C_N.
\]
Divide by \(N\), take the limit superior, and use \(C_N/N\to0\). This
proves the bound on the average valuation.

Let \(P_N=\#\{j<N:a_j=1\}\). Each valuation is a positive integer, so
\(a_j\ge1\), and whenever \(a_j\ne1\), we have \(a_j\ge2\). Therefore
\[
A_N\ge P_N+2(N-P_N)=2N-P_N.
\]
Hence \(P_N/N\ge2-A_N/N\). Taking limit inferiors yields
\[
\liminf_{N\to\infty}P_N/N
\ge 2-\limsup_{N\to\infty}A_N/N
\ge2-\log_2 3.
\]
QED.

## Interpretation and limits

- The result is conditional on a genuinely divergent accelerated orbit.
- It says such an orbit must have valuation-one steps with lower asymptotic
  density at least \(2-\log_2 3\).
- It does **not** contradict known residue constraints: valuation one is
  equivalent to \(n_j\equiv3\pmod4\), and the argument does not prove that
  this residue class cannot occur with the required frequency.
- It does not prove that the orbit exists. Finite valuation words can be
  realized by residue classes; the missing global issue is whether an infinite
  compatible word can arise from one positive integer and maintain divergence.
- The next useful formalization is to separate the elementary finite counting
  lemma \(A_N\ge2N-P_N\) from the analytic limit argument. A formal proof
  should state all logarithmic convergence hypotheses explicitly and must not
  claim global Collatz termination.

## Research use

This is a constraint to feed into a residue-transition/cocycle analysis. A
successful next theorem would have to show that the required lower density of
\(a_j=1\) is incompatible with the weighted block correction or with a
source-faithful modular transition invariant. Mere heuristic randomness or a
finite residue scan does not establish that incompatibility.
