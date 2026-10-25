# 2-adic obstruction to a globally continuous accelerated Syracuse map

Date: 2026-10-25

## Claim

Let the accelerated Syracuse map on positive odd integers be
\[
T(n)=\frac{3n+1}{2^{v_2(3n+1)}}.
\]
There is no continuous extension of this map from the odd positive integers (with the subspace topology inherited from \(\mathbb Z_2\)) to a map \(F:\mathbb Z_2\to\mathbb Z_2\) agreeing with \(T\) on every positive odd integer.

This is a local obstruction to the proposed *global continuous-flow* strategy. It does not rule out useful 2-adic methods, a stratified/partial map, inverse-limit coding, or a different state space.

## Proof

For every integer \(m\geq 1\), define
\[
u_m=\frac{2^{2m}-1}{3},\qquad
w_m=\frac{5\cdot 2^{2m+1}-1}{3}.
\]
Both are positive odd integers: the numerators are divisible by 3, and each numerator is congruent to 3 modulo 6.

They satisfy
\[
3u_m+1=2^{2m},\qquad
3w_m+1=5\cdot 2^{2m+1}.
\]
The displayed odd factors are exact, so
\[
T(u_m)=1,\qquad T(w_m)=5.
\]

In the 2-adic metric, \(2^k\to0\). Hence
\[
3u_m+1\to0,\qquad 3w_m+1\to0
\]
in \(\mathbb Z_2\). Since 3 is a unit in \(\mathbb Z_2\), both sequences converge to the same point \(-1/3\):
\[
u_m\to-1/3,\qquad w_m\to-1/3.
\]

If a continuous extension \(F\) existed, continuity would force both image sequences to converge to \(F(-1/3)\). But the first image sequence is constantly 1 and the second is constantly 5. Since \(1\ne5\) in \(\mathbb Z_2\), this is impossible. Therefore no such global continuous extension exists. \(\square\)

## Research consequence

The accelerated map is naturally stratified by exact valuation: on each residue stratum where \(v_2(3x+1)=k\) is fixed, division by \(2^k\) is locally well-defined. The obstruction occurs at the exceptional point \(-1/3\), where the valuation is unbounded in every 2-adic neighborhood.

A mathematically defensible continuation of the p-adic idea should therefore do one of the following:

1. Work on valuation strata and state explicitly how strata are glued.
2. Use a symbolic/inverse-limit state that records the valuation word instead of demanding a single continuous accelerated map on all of \(\mathbb Z_2\).
3. Prove a theorem that the exceptional neighborhood cannot carry a relevant integer orbit, rather than assuming continuity removes the difficulty.

None of these steps by itself proves Collatz termination. The key missing global statement remains a uniform orbit estimate that converts local valuation information into a strict descent margin.
