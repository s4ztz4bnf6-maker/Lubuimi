# Cross-project proof obligation: variance threshold and Syracuse block descent

Date: 2026-10-26

This note records a mathematical deduction from existing source files. It is not a Lean build report and does not claim either global theorem.

## 1. BBMST: the exact obstruction is variance, not mass conservation

The branch `audit/lean4-erdos-selfridge`, file `BBMSTFiberMassCore.lean`, already contains:
- `finite_weighted_variance_identity`;
- `finite_weighted_variance_nonneg`;
- `finite_weighted_interior_mass_pos_iff_variance_bound`;
- `finite_weighted_interior_mass_pos_of_interior_point`.

For finite weights (w_i\ge0) with \(\sum_iw_i=1\), proportions \(a_i\in[0,1]\), mean \(\mu=\sum_iw_i a_i\), and variance \(V=\sum_iw_i(a_i-\mu)^2\), the exact identity is

\[
\sum_i w_i a_i(1-a_i)=\mu(1-\mu)-V.
\]

Thus strict positive interior mass is equivalent to \(V<\mu(1-\mu)\). Normalization and \(a_i\in[0,1]\) alone do not give this strict inequality. The two-point distribution supported on \(a=0\) and \(a=1\) has mean \(1/2\), but interior mass zero. This is a concrete obstruction to any proof that uses only the mean.

### Research consequence

The source-faithful BBMST route must establish one of the following from its geometry/probability structure:
1. a strict upper bound on the weighted variance;
2. a positive-weight interior fiber, directly;
3. an equivalent quantitative non-concentration statement.

This is the actual missing interface between the algebraic mass bookkeeping and a strict global bound. A generic finite-fiber identity cannot supply it. Any proposed theorem should state its exact variance or interior-fiber hypothesis and must not smuggle in the sieve conclusion.

## 2. Syracuse: the affine identity isolates the required descent inequality

The branch `collatz/valuation-cylinders-2026-10-26`, file `SyracuseAffineCore.lean`, already proves the conditional finite-prefix identity
\[
2^{A_N}n_N=3^Nn_0+C_N,
\]
where \(A_N=\sum_{j<N}a_j\) and \(C_0=0,\ C_{j+1}=3C_j+2^{A_j}\), assuming every step equation \(2^{a_j}n_{j+1}=3n_j+1\).

For a realized chain, strict descent \(n_N<n_0\) is equivalent to
\[
3^N n_0+C_N < 2^{A_N}n_0.
\]
Equivalently,
\[
(2^{A_N}-3^N)n_0>C_N.
\]
In particular, a necessary condition is \(A_N>N\), because if \(A_N\le N\), then \(2^{A_N}\le2^N<3^N\) for \(N\ge1\), making the left coefficient nonpositive. But \(A_N>N\) alone is not sufficient: the additive correction \(C_N\) must also be controlled.

### Research consequence

A proof based only on the average valuation or on the fact that some steps have valuation at least two is incomplete. A usable global descent lemma needs a realizable block of exponents and a quantitative lower bound on \(2^{A_N}-3^N\), strong enough to dominate \(C_N/n_0\), or a different well-founded potential that avoids this exact inequality. This document does not claim such a bound has been established.

## 3. Shared falsification-first protocol

For both projects, separate:
- identities that hold for arbitrary finite data;
- constraints that actual geometric or arithmetic objects satisfy;
- the quantitative inequality that closes the theorem;
- the theorem conclusion.

Test candidate inequalities against endpoint cases before formalization. For BBMST, test proportions in \(\{0,1\}\); for Syracuse, test short realized valuation words and small odd starting values. A finite test can falsify an overstrong lemma, but never proves a universal statement.

## Status

Existing source files were inspected on their respective branches. This note derives the precise missing quantitative obligations. No new Lean theorem was compiled in this step; no global BBMST or Collatz result is claimed.
