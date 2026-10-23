# Syracuse finite valuation words: exact-realizability research plan

Status: research/design note. This is not a proof of the Collatz conjecture.

## Dynamical convention

For odd n, the accelerated Syracuse map is T(n) = (3n+1)/2^{v₂(3n+1)}. For a finite trajectory n₀,...,nₖ with exponents aⱼ, the transition equation is
\[
2^{a_j}n_{j+1}=3n_j+1.
\]
Writing Sⱼ = a₀+...+a_{j-1}, iteration gives
\[
2^{S_k}n_k=3^k n_0+C_k,
\]
where C₀=0 and C_{j+1}=3Cⱼ+2^{Sⱼ}. The affine identity is exact, but strict descent also requires
\[
3^k n_0+C_k < 2^{S_k}n_0.
\]
The multiplier inequality alone is not sufficient.

## Exact valuation predicate

For m ≠ 0, v₂(m)=a is equivalent to
\[
2^a\mid m \quad\text{and}\quad 2^{a+1}\nmid m.
\]
The new generic Lean lemma in SyracuseOffsetObstruction.lean packages this criterion instead of repeating separate proofs for a=1,2,3,4. This is a reusable local proof step for an induction over a prescribed finite word.

## Next target: admissible-word classes

For a fixed word a₀,...,aₖ₋₁, define admissibility by recursively imposing the exact valuation predicate on each transition numerator. Then prove:

1. every start in an admissible class realizes the prescribed word for k steps;
2. every start realizing that word satisfies the corresponding congruence constraints;
3. characterize the solution set modulo a power of two, with the modulus derived from the induction rather than assumed;
4. attach the affine residual Cₖ and decide which starts pass the strict-descent margin.

Do not assert without proof that every word is realizable or that it corresponds to exactly one residue class modulo 2^{Sₖ}. The non-divisibility conditions can split or eliminate candidate classes, so the induction must retain them.

## Literature comparison and limitation

Bernstein and Lagarias study a 2-adic conjugacy between the classical 3x+1 map and the 2-adic shift. The induced maps modulo powers of two offer a natural model for finite symbolic information. But 2-adic dynamics includes points outside the positive integers, and congruence-level information alone does not establish that every positive integer reaches 1.

A second route is a finite-state block descent system: certify blocks by exact source residues and a rational affine upper bound, compose certificates, and prove that the uncovered source residues are either handled by another block or satisfy a separate decreasing potential. A finite residue graph by itself does not exclude arbitrarily large positive trajectories; a global argument needs a proved ranking/termination measure or a complete descent theorem.

## Verification boundary

The current CI workflow was observed in progress at the time this plan was written. The generic valuation criterion must still pass Lean compilation before being treated as verified. No global termination or Collatz theorem is claimed.
