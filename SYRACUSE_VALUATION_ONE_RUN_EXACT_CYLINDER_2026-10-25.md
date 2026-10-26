# Syracuse valuation-one runs: exact 2-adic cylinder and obstruction (2026-10-25)

## Status
This is a mathematical derivation and Lean proof target, not a global Collatz result. It has not yet been added to a compiled Lean module.

## Definitions
For odd positive integers define the accelerated Syracuse step T(n)=(3n+1)/2^{v2(3n+1)}, and a(n)=v2(3n+1). The valuation is finite because 3n+1 is a positive integer.

## Exact run lemma
For odd n and integer k >= 1, the first k valuations are all one if and only if n is congruent to -1 modulo 2^(k+1). Equivalently, the length of the initial run of valuation-one steps is L(n)=v2(n+1)-1.

### Proof sketch with indexing
If n = -1 + 2^(k+1)q, then 3n+1 = -2 + 3*2^(k+1)q = 2(-1 + 3*2^k q), so v2(3n+1)=1 for k >= 1. After one accelerated step, T(n)=-1+3*2^k q, congruent to -1 modulo 2^k. Repeating lowers the modulus exponent by one at each valuation-one step. Conversely, reversing the same congruence implications shows that k consecutive valuation-one steps force n congruent to -1 modulo 2^(k+1). The run terminates after v2(n+1)-1 steps because the next stage is no longer -1 modulo the next required power of two.

Examples: n=3 has v2(n+1)=2 and starts with one valuation-one step; n=7 has v2(n+1)=3 and starts with two; n=1 has v2(n+1)=1 and starts with zero.

## Why this matters
This is an exact local classification, not a descent theorem. Long runs of valuation one correspond to rare residue cylinders, but their existence does not imply that all integer orbits enter a globally descending regime. The accelerated map is not continuous at the 2-adic point -1/3, where 3x+1=0; compactness of Z_2 alone therefore cannot force all trajectories to converge to one sink. Haar-almost-everywhere statements do not settle the positive-integer problem, since the positive integers form a countable Haar-null subset of Z_2.

## Lean target
Formalize in small stages: (1) prove the single-step congruence equivalence between valuation one and n = 3 mod 4; (2) prove the inductive residue transition for a valuation-one step; (3) prove the k-step iff statement with explicit positivity/oddness hypotheses; (4) derive the initial-run formula from the definition of v2; (5) run #print axioms on each theorem and compile the module in CI.

Do not encode the global conjecture as an assumption or use a generic descent axiom.