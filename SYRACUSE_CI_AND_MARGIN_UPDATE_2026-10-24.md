# Syracuse/Collatz audit update — 2026-10-24

## CI-confirmed code change

Branch: `collatz/offset-margin-roadmap-2026-10-23`

Commit: `fec82bdc7b9964cc184d16cfe6f1792bddc63234`

GitHub Actions runs `40116899702` and `40116894566` completed successfully. Job `compile-drafts` passed. The change corrected the equality orientation in the divisibility witness proof and added the quantitative theorem:

`exponent_one_block_length_power_bound`

For a sequence satisfying the exponent-one recurrence
[
2n_{j+1}=3n_j+1
]
for every step in a block of length (N), if the terminal value (n_N) is odd, then
[
2^{N+1}mid n_0+1,qquad 2^{N+1}le n_0+1.
]

The proof chain is exact:
1. Iterate the identity (2(n_{j+1}+1)=3(n_j+1)) to get (2^N(n_N+1)=3^N(n_0+1)).
2. Oddness of (n_N) implies (2mid n_N+1), giving (2^{N+1}mid 3^N(n_0+1)).
3. Coprimality of (2^{N+1}) and (3^N) cancels the odd factor.
4. A positive multiple of (2^{N+1}) is at least (2^{N+1}).

This is a genuine quantitative obstruction to a long uninterrupted valuation-one block. It does **not** bound arbitrary trajectories, because real Syracuse trajectories can interleave exponents 1, 2, and larger values.

## The exact remaining global inequality

The general certified-step identity is
[
2^{A_N}n_N=3^N n_0+C_N,quad
C_0=0,quad C_{j+1}=3C_j+2^{A_j},quad A_{j+1}=A_j+a_j.
]

Strict descent is equivalent to
[
C_N<(2^{A_N}-3^N)n_0.
]
This is not a consequence of the affine identity alone. Existing margin recurrences show that exponents 1 contribute a negative correction, exponents 2 contribute a neutral correction, and exponents at least 3 contribute a positive correction. A word-level estimate is only useful for Collatz if it is compatible with the residue constraints imposed by actual transitions; arbitrary exponent words are not valid orbit certificates.

## Current literature boundary

- Idris Ali Shaik, “Positive Density of Collatz Convergence at Every Rate above (3/\log(4/3))” (SSRN, September 2026), reports positive-density convergence in logarithmic time and formalizes the primitive-decay theorem and qualitative density conclusions in Lean. The paper states that optimized complete density bounds remain paper proofs. This is positive-density convergence, not convergence of every positive integer: https://ssrn.com/abstract=7497758 .
- ProofAtlas records a formalized positive-density/logarithmic-time result and explicitly says the full Collatz conjecture remains open: https://www.proofatlas.ai/formalizations/positive-density-log-time-collatz/ .
- These results suggest comparing actual valuation words against the exact offset margin, but they do not imply the universal strict-margin inequality needed here.

## Next actionable experiments

1. Enumerate actual odd Syracuse trajectories over a bounded range and record ((N,A_N,C_N,D_N)), where (D_N=2^{A_N}-C_N-3^N). Use this only to falsify candidate inequalities and discover patterns, never as a universal proof.
2. Separate blocks by their valuation-word statistics: count exponents 1, 2, and at least 3, but retain residue-realizability constraints.
3. Search for a block inequality that bounds the weighted negative contributions from exponent-one steps by later positive corrections, using the exact recurrence
[
D_{j+1}=3D_j+(2^{a_j}-4)2^{A_j}.
]
4. Formalize any proposed inequality as a theorem from genuine transition hypotheses, and run `#print axioms` on the exported result.

No global Collatz proof or counterexample is claimed.
