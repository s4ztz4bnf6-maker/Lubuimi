# Syracuse: what the 2-adic lift does and does not buy us

Date: 2026-10-26

## Result boundary

The accelerated odd Syracuse map is
\[
T(n)=\frac{3n+1}{2^{v_2(3n+1)}}\qquad(n\text{ odd}).
\]
Its finite-step behavior is controlled by exact valuation cylinders. The affine identity in `SyracuseAffineCore.lean` is conditional algebra; the cylinder-density identity is a separate combinatorial/measure statement. Neither implies that every integer orbit reaches 1.

## The useful continuity statement

For the ordinary Collatz map, parity decisions through a fixed finite time are determined by a residue class modulo a sufficiently large power of 2. Consequently, finite orbit prefixes are locally constant on 2-adic residue cylinders. The inverse-limit space \(\mathbb Z_2\) is compact, so compatible finite prefixes can be studied as a continuous symbolic dynamical system.

For the accelerated odd map, one must be more careful: the valuation \(v_2(3n+1)\) is unbounded and is not a single globally constant finite-time observable on all of \(\mathbb Z_2\). It is locally constant on each exact valuation stratum, but the strata accumulate at the 2-adic point \(-1/3\), where \(3x+1=0\). Thus a global continuous self-map should not be asserted without specifying its domain and treatment of that exceptional point.

## Why compactness is not a convergence proof

Compactness gives convergent subsequences, invariant-measure tools, and recurrence statements under suitable hypotheses. It does not imply that every orbit converges to one fixed point. In particular, a 2-adic limit need not be an ordinary real/integer limit, and density-one descent leaves open a density-zero exceptional set.

This distinction is the guardrail for the proposed “continuous transformation” pillar: use 2-adic cylinders to prove finite-prefix and distribution results, but require a separate arithmetic argument to turn those results into universal descent.

## Exact cylinder mass checksum

For a positive exponent word of length \(N\) with total exponent \(A\), its cylinder has natural density \(2^{-(A+1)}\), conditional on the exact-cylinder theorem. There are \(\binom{A-1}{N-1}\) positive words of length \(N\) with total \(A\). Hence
\[
\sum_{A=N}^{\infty}\binom{A-1}{N-1}2^{-(A+1)}
=\frac12\left(\frac{1/2}{1-1/2}\right)^N=\frac12.
\]
This is an exact generating-function identity, not merely a numerical observation. It says the cylinders for a fixed number of odd-to-odd steps account for density \(1/2\) among all integers (the odd starting inputs). It is a strong encoding checksum, not a descent theorem.

The companion exact-rational script `research/SYRACUSE_CYLINDER_MASS_CHECK_2026-10-26.py` checks 292 finite grouped-count identities and positive rational residual tails. The infinite identity above rests on the generating-function derivation, not on extrapolating the finite script.

## Next formalization gates

1. State the exact valuation-cylinder proposition with the modulus and residue class explicit.
2. Prove uniqueness of the residue class using invertibility of \(3^N\) modulo \(2^{A+1}\).
3. Prove prefix exactness from the terminal congruence, with the positivity/oddness hypotheses stated.
4. Formalize the generating-function identity separately from the dynamics.
5. Keep a clear dependency boundary: none of these lemmas proves global Collatz convergence.
6. For a high-assurance release, pin Lean/Mathlib and independently check the proof term with a separately implemented checker where feasible; a green build alone is not the whole trust argument.
