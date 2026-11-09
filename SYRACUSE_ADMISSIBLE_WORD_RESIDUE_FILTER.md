# Syracuse admissible-word residue filter

Date: 2026-10-23

## Exact modular constraint

For a certified block, the affine identity is
`2^A * n_N = 3^N * n_0 + C`.
Consequently `3^N * n_0 + C ≡ 0 (mod 2^A)`.

For A > 0, gcd(3^N, 2^A) = 1, so multiplication by 3^N is a bijection on residues modulo 2^A. Thus the terminal equation determines exactly one residue class for n_0 modulo 2^A. For A = 0, the modulus is 1 and there is one residue class trivially.

This is a necessary condition only. It does not certify intermediate states or exact 2-adic valuations.

## Prefix constraints

A word a_0,...,a_(N-1) is orbit-admissible only if there are positive odd states n_j such that for every j < N,
`2^(a_j) * n_(j+1) = 3*n_j + 1`,
and n_(j+1) is odd. Oddness of the quotient ensures the removed power is maximal: 2^(a_j+1) does not divide 3*n_j+1.

A finite search should impose these conditions at every prefix. It can disprove a proposed universal inequality by a concrete admissible counterexample, but cannot prove the infinite conjecture by bounded enumeration.

## Proof target

Formalize uniqueness of the terminal residue class, then intersect it with the prefix conditions. The actual global obstacle remains an upper bound on the canonical offset strong enough to imply a positive descent margin. The residue filter is a structural reduction, not a Collatz proof.
