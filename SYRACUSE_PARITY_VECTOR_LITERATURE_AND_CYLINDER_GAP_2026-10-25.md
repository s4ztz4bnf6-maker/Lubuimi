# Syracuse next research direction: parity vectors, cylinders, and the global gap

Date: 2026-10-25

## Literature checkpoint

The classical finite parity-vector / coefficient-stopping-time literature is the right comparison class for the current affine-cylinder work. A recent preprint, Tong Niu, “Parity vectors and paradoxical sequences in the accelerated Collatz map” (arXiv:2605.13886, posted 11 May 2026), explicitly builds on Terras (1976), Lagarias (1985), Tao (2019), and Rozier–Terracol (2025). It reports a sharp finite form of Terras's parity-vector density, exact counting of fixed-length paradoxical sequences, and a density-zero result for bounded-length paradoxical sequences. It explicitly does not claim the Collatz conjecture or the coefficient-stopping-time conjecture. Treat this as a preprint until peer-review status is independently confirmed.

Primary reference: https://arxiv.org/abs/2605.13886

## Consequence for this repository

Our proposed exact valuation word is a compressed odd-to-odd description: each symbol a_j records the full valuation v2(3 n_j + 1), rather than one parity bit per ordinary Collatz step. The affine recurrence gives a direct pullback of the exact valuation condition to a congruence on n_0:
3^(j+1) n_0 + C_(j+1) = 2^(A_(j+1)) modulo 2^(A_(j+1)+1).

This provides a formal interface between the existing affine identity and finite 2-adic cylinders. The next proof should compare the count of these exact-valuation cylinders against the ordinary parity-vector count. Any equivalence must be proved by an explicit coding map; the two alphabets and stopping-time conventions are not interchangeable by notation alone.

## Three precise candidate lemmas

1. Exact valuation pullback:
   If 2^(A_j) n_j = 3^j n_0 + C_j and 2^(a_j) n_(j+1) = 3 n_j + 1, then
   3^(j+1) n_0 + C_(j+1) is congruent to 2^(A_(j+1)) modulo 2^(A_(j+1)+1), provided the transition's exact valuation is separately represented by nondivisibility at the next power.
2. Unique residue class:
   Since 3^(j+1) is odd, the pulled-back linear congruence has a unique solution class modulo 2^(A_(j+1)+1).
3. Finite-word counting:
   Establish a bijection between admissible exact valuation words of total exponent A and the corresponding odd residue classes modulo 2^(A+1), with the density normalized among odd inputs.

The first two are elementary finite arithmetic and plausible Lean/mathlib targets. The third needs careful indexing, admissibility, and exact-valuation/nondivisibility conditions.

## The obstruction is unchanged

Finite cylinder densities and density-zero exceptional families do not imply that every positive integer eventually reaches 1. A set of Haar measure zero in Z_2 can contain positive integers. Likewise, a result for bounded-length paradoxical sequences cannot rule out an unbounded sequence of exceptional prefixes along a single orbit.

A global proof still needs a deterministic orbit-wise argument controlling the cumulative negative margin contributions from valuation-one steps. The current margin recurrence is
M_(j+1) = 3 M_j + 2^(A_j)(2^(a_j)-4);
the a_j=1 contribution is negative, a_j=2 is neutral, and a_j>=3 is positive. Cylinder counting alone does not close this signed budget.

## Status

Literature-guided research note only. No new Lean theorem or global Collatz result is claimed.


## New exact reduction: valuation words as nested 2-adic cylinders (2026-10-25)

Fix a proposed finite valuation word a_0,...,a_{k-1}, set A_0=0,
A_{j+1}=A_j+a_j and C_0=0, C_{j+1}=3 C_j+2^{A_j}. Iterating the affine
recurrence gives
2^{A_j} n_j = 3^j n_0 + C_j.

For an exact word, each intermediate n_j must be odd. Therefore the
necessary congruence at each j is
3^j n_0 + C_j ≡ 2^{A_j} (mod 2^{A_j+1}).
Conversely, if these congruences hold for j=0,...,k, the affine recurrence
defines integral n_j and the oddness of n_{j+1} forces
v_2(3 n_j+1)=a_j at every transition. Thus the word's cylinder is the
intersection of a nested family of congruence conditions; it is empty if
the conditions are incompatible and otherwise is one odd residue class
modulo 2^{A_k+1}. Among odd residue classes modulo 2^{A_k+1}, its relative
density is exactly 2^{-A_k}.

This is an exact finite arithmetic reduction, not a global descent argument.
A Lean formalization should prove (i) the affine identity by induction,
(ii) equivalence between exact valuations and the odd-numerator congruences,
and (iii) uniqueness/nesting of the cylinder residue. It must not infer
that density-zero exceptional paths contain no positive integers.


## Topological audit: why compactness does not yield a global sink (2026-10-25)

Let x_*=-1/3 in Z_2. On odd x≠x_*, the accelerated map
T(x)=(3x+1)/2^{v_2(3x+1)} is defined by valuation strata. Each fixed-valuation
stratum is a clopen residue-class difference, and T is continuous on that
stratum. But there is no continuous extension to x_*.

Indeed, for every odd 2-adic u and every k≥1, x_k=x_*+2^k u tends to x_*,
while 3x_k+1=3·2^k u, so v_2(3x_k+1)=k and T(x_k)=3u. Choosing two distinct
odd u,v gives two constant output subsequences 3u and 3v, hence no unique
limit at x_*. This is a concrete obstruction to the naive plan of treating
the accelerated map as a globally continuous self-map of compact Z_2.

Research consequence: use a stratified / inducing formulation, with valuation
cylinders as clopen branches and an explicit treatment of the singular point,
rather than assuming a global continuous flow. Even a valid extension or
compact dynamical model would not by itself imply that every positive integer
converges to 1; the embedding and the desired orbit property must be proved.
This is a mathematical observation, not a Lean-checked theorem in the current
branch.
