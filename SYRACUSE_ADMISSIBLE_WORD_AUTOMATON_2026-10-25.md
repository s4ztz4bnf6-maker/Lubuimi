# Next proof milestone: exact admissible-word automaton for Syracuse

Date: 2026-10-25

Status: proof strategy and algebraic specification. This is not a proof of universal Collatz convergence.

## Definitions

For an odd positive integer n, let a = v₂(3n+1) and define the accelerated odd Syracuse step
`T(n) = (3n+1)/2^a`.
For a finite orbit segment, write exponents `a₀,…,aₙ₋₁`, cumulative exponents
`A₀ = 0`, `Aⱼ₊₁ = Aⱼ + aⱼ`, and offsets `C₀ = 0`, `Cⱼ₊₁ = 3 Cⱼ + 2^Aⱼ`.

Then, by induction on j, every realizable segment satisfies the exact affine identity
`2^Aⱼ nⱼ = 3^j n₀ + Cⱼ`.

## New route: constrain valuation words before estimating growth

A list of positive exponents is not automatically a realizable Syracuse orbit. For the exponent at stage j to be *exactly* aⱼ, its current odd state must satisfy
`3 nⱼ + 1 ≡ 2^aⱼ (mod 2^(aⱼ+1))`.
Substituting the affine identity and multiplying by `2^Aⱼ` yields the necessary congruence on the starting value:
`3 (3^j n₀ + Cⱼ) + 2^Aⱼ ≡ 2^Aⱼ₊₁ (mod 2^(Aⱼ₊₁+1))`.

This condition is stronger than merely requiring `aⱼ ≥ 1`. Together with integrality and oddness at each intermediate state, it can be used to reject impossible exponent words before any global growth estimate is attempted.

### Finite residue automaton

For a fixed word length N and bounded exponent alphabet 1 ≤ aⱼ ≤ B:

1. Generate candidate words, but never assume all words are realizable.
2. Update `(Aⱼ,Cⱼ)` exactly by the recurrences above.
3. Maintain the set of starting residue classes modulo `2^(Aⱼ+1)` compatible with all exact-valuation constraints so far.
4. Reject a word as soon as its compatible residue set is empty.
5. For surviving words, verify the full transition sequence using exact integer arithmetic; store the resulting `(N,A_N,C_N)` and descent margin `M_N = 2^A_N n₀ - (3^N n₀ + C_N)`.

The finite search is a conjecture-discovery and counterexample-search tool. Its outputs do not prove that all infinite trajectories descend. The formal target should be a theorem that the residue update preserves exactly the set of starts realizing the specified prefix; a later global theorem would still need a uniform bound for every realizable word or another argument excluding non-descending trajectories.

## Connection to current research

ProofAtlas lists formalized logarithmic-time and density-one Collatz descent results while explicitly distinguishing them from full universal convergence: https://www.proofatlas.ai/. Such results may supply quantitative benchmarks or lemmas, but density-one statements do not imply that every positive integer reaches 1.

## Audit gates

- Prove the affine identity by induction in Lean.
- Prove the exact-valuation congruence equivalence, including the positivity and oddness assumptions.
- Compare the residue automaton against brute-force trajectories for small bounds; treat this only as testing.
- Keep finite verified bounds, density-one results, almost-boundedness, and the full Collatz conjecture as distinct claims.
- Run the exact theorem's transitive axiom audit and record the compiler/toolchain revision.
