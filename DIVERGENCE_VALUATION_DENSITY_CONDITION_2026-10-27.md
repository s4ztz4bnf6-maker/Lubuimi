# Necessary valuation-balance condition for a divergent accelerated Syracuse orbit

Date: 2026-10-27

Status: the analytic implication is proved on paper; the finite combinatorial
inequality is now stated in `SyracuseValuationDensity.lean`. The logarithmic
limit argument is not yet formalized. This is a necessary condition for
divergence, not a proof that divergence is impossible.

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
Let \(P_1(N)=\#\{j<N:a_j=1\}\) and
\(P_{\ge3}(N)=\#\{j<N:a_j\ge3\}\).

Taking logarithms of each exact transition and summing gives
\[
\log_2 n_N=\log_2 n_0+N\log_2 3-A_N+C_N. \tag{1}
\]
No probabilistic assumption is used.

## Theorem (necessary valuation balance)

If \(n_j\to\infty\), then
\[
\limsup_{N\to\infty}\frac{A_N}{N}\le\log_2 3
\]
and, more strongly,
\[
\boxed{
\liminf_{N\to\infty}
\frac{P_1(N)-P_{\ge3}(N)}{N}
\ge 2-\log_2 3\approx0.4150.
}
\]
In particular, \(\liminf P_1(N)/N\ge2-\log_2 3\).

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
Divide by \(N\), take the limit superior, and use \(C_N/N\to0\). Thus
\(\limsup A_N/N\le\log_2 3\).

Every positive integer valuation satisfies the pointwise inequality
\[
2+\mathbf 1_{\{a_j\ge3\}}
\le a_j+\mathbf 1_{\{a_j=1\}}.
\]
Summing over \(j<N\) gives the exact finite balance law
\[
2N+P_{\ge3}(N)\le A_N+P_1(N),
\]
or
\[
P_1(N)-P_{\ge3}(N)\ge2N-A_N.
\]
Divide by \(N\) and take the limit inferior to obtain the boxed inequality.
QED.

## Interpretation and limits

- The result is conditional on a genuinely divergent accelerated orbit.
- It forces the lower asymptotic density of valuation-one steps to exceed
  the density of valuation-at-least-three steps by at least about 41.5
  percentage points.
- Valuation one is equivalent to \(n_j\equiv3\pmod4\). This argument does
  not prove that the required modular frequency is impossible.
- Finite valuation words can be realized by residue classes. The unresolved
  global issue is whether one positive integer can realize an infinite
  compatible sequence with this balance and still diverge.
- The finite inequality is separated in
  [`SyracuseValuationDensity.lean`](https://github.com/s4ztz4bnf6-maker/Lubuimi/blob/research/syracuse-threshold-margin-2026-10-27/SyracuseValuationDensity.lean).
  The formal logarithmic limit argument and its hypotheses remain future work.

## Research use

This is a valuation-balance constraint to couple with the weighted correction
cocycle. A successful next theorem would have to show that the required
unweighted imbalance is incompatible with the exponentially weighted block
correction or with a source-faithful modular transition invariant. Heuristic
randomness or a finite residue scan does not establish that incompatibility.
