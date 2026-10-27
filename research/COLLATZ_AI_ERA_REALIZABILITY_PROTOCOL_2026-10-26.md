# Collatz research protocol informed by AI-era proof audits
Date: 2026-10-26

## Research inputs and boundaries

ProofAtlas advertises Lean-checked density-one/logarithmic-time Collatz descent and positive-density predecessor results. Its own result pages explicitly say the full Collatz conjecture remains open. These are useful neighboring results, not a proof of universal convergence.

Thomas Hales's October 2026 discussion on Terence Tao's blog stresses two separate requirements: kernel checking and statement fidelity, and recommends independent checker implementations / trusted-base awareness after the 2026 Lean soundness bugs.

OpenAI's October 2026 math repository warns that not all manuscripts have Lean formalizations; its history records withdrawals and repairs. This motivates a version-pinned claim ledger rather than treating AI-generated proof volume as evidence.

## New candidate structure: realizable exponent language

For an exponent word a=(a_0,...,a_(N-1)), define A=sum a_i and
C(a)=sum_{j=0}^{N-1} 3^(N-1-j) 2^(p_j), p_j=sum_{i<j}a_i.
The exact block identity is 2^A m=3^N n+C(a).

The word is realizable from an odd n only if
3^N n+C(a) = 0 mod 2^A,
and, when the endpoint m is odd,
3^N n+C(a) = 2^A mod 2^(A+1).
Since 3^N is invertible modulo powers of two, each fixed word imposes a unique start residue modulo 2^A (and a unique compatible residue modulo 2^(A+1) when endpoint oddness is included).

This suggests a three-layer model:
1. Word layer: exponent sequences and prefix sums.
2. Residue layer: 2-adic congruence states pruning unrealizable words.
3. Descent layer: exact affine block map and candidate potential.

The research question is whether residue-state transitions admit a finite or finitely summarized invariant that bounds C more sharply than the unconstrained estimate. Do not assume this finite-state compression exists; prove it or replace it with an infinite-state 2-adic invariant.

## Candidate theorem to target first

For each length N, characterize the pairs (a,n mod 2^(A+1)) satisfying the necessary endpoint congruence. Then prove which such pairs actually correspond to an odd Syracuse block. Separate necessary congruence from sufficiency: congruence alone may not guarantee every intermediate state is odd with the stated exact valuations.

Formal acceptance:
- Lean theorem statement must quantify over the exact RealizesOddBlock relation.
- Prove the modular consequences from exact_odd_block_identity.
- Prove exact valuation / oddness at every intermediate state.
- Run #print axioms on each new root theorem.
- Keep the full Collatz conjecture status open unless a universal convergence theorem is actually derived.

## Falsification tests
- Enumerate all short exponent words and all admissible residue classes for small A.
- Compare predicted residues against actual odd Syracuse trajectories.
- Preserve counterexamples to naive claims, including blocks with average exponent above log2(3) that nevertheless increase.
- Mutation-test each recurrence and congruence checker; no computation is evidence for the universal theorem by itself.

## Explicit limitation
The 2-adic extension of a map on integers does not automatically yield a continuous flow with a global attracting sink. Continuity/compactness alone cannot prove all integer orbits converge: the required dynamical invariant and its relation to the embedded integer orbit must be demonstrated.
