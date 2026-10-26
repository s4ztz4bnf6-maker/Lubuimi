# Syracuse valuation-prefix cylinder lemma — proof obligation record

Date: 2026-10-26
Status: mathematical derivation; NOT Lean-compiled.

## Definitions

For positive odd integers define the accelerated Syracuse map T(n)=(3n+1)/2^(v₂(3n+1)). For a finite prescribed word a₀,…,a_(N−1) of positive integers put A_j=Σ_(i<j) a_i, A₀=0. The word is the exact valuation prefix of n₀ when v₂(3n_j+1)=a_j for every j<N.

## Lemma (exact cylinder)

For every finite word of positive integers, the set of positive odd starts having that exact prefix is one residue class modulo 2^(A_N+1), intersected with the positive odd integers. Consequently its relative natural density among odd positive integers is 2^(−A_N).

### Proof

Induct on prefix length. For a prefix of length j, clearing the divisions gives

2^(A_j) n_j = 3^j n₀ + C_j, where C_j = Σ_(i<j) 3^(j−1−i) 2^(A_i).

Fix a start residue modulo 2^(A_j+1) giving the prescribed prefix. Its lifts modulo 2^(A_j+a_j+1) can be written n₀+t·2^(A_j+1), with t ranging over a complete residue system modulo 2^(a_j). The corresponding j-th iterates change by t·2·3^j. Since 3^j is odd, these values run through all odd residue classes modulo 2^(a_j+1) as t varies. The exact condition 3n_j+1 ≡ 2^(a_j) (mod 2^(a_j+1)) selects exactly one such odd residue class, because multiplication by 3 is invertible modulo 2^(a_j+1). Thus exactly one lift extends the prefix by the prescribed valuation. The base case is the same congruence with j=0. The modulus exponent increases by a_j at each step, yielding modulus 2^(A_N+1). There are 2^(A_N) odd residue classes modulo this modulus and exactly one cylinder class, so the relative density is 2^(−A_N).

## Important scope boundary

This is a finite-prefix counting lemma only. It does not imply every positive start eventually descends. Compactness of Z₂ can produce a limit of compatible prefixes, but that limit may be non-integral; the accelerated map also has an exceptional point −1/3 where 3x+1=0 in Z₂. Neither compactness nor density-one descent alone closes the universal Collatz conjecture.

## Next formalization tasks

1. Define exact valuation cylinders with explicit nonzero and positivity hypotheses.
2. Prove the induction over words and lift uniqueness in Lean, using ZMod modulo powers of two or integer congruences; avoid division in ℚ and default-valued partial definitions.
3. Independently check the density count on odd residue classes.
4. Only then connect the prefix lemma to the existing block identity 2^(A_N)n_N=3^Nn₀+C_N and search for a genuinely uniform descent mechanism.

No Lean build, axiom scan, or CI run is claimed by this note.