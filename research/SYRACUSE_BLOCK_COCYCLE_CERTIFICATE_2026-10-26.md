# Syracuse: exact block cocycle and descent certificates

Date: 2026-10-26

## Scope

This note isolates an exact finite-block identity for the accelerated odd Syracuse map. It improves the proof architecture but does not prove global Collatz termination.

For an odd positive integer x_i, write x_{i+1} = (3*x_i + 1) / 2^{a_i}, where a_i = v₂(3*x_i+1) ≥ 1 and x_{i+1} is odd. Define cumulative exponents A_0=0 and A_j=sum_{i<j} a_i.

By iterating the recurrence, for every block length r≥1,

2^{A_r} x_r = 3^r x_0 + C_r,

where C_r = sum_{j=0}^{r-1} 3^{r-1-j} 2^{A_j}.

This identity follows by induction on r; the indexing convention is important and should be fixed once in Lean. Every term of C_r is positive.

## Exact descent criterion

The endpoint strictly descends precisely when

x_r < x_0 iff (2^{A_r} - 3^r) * x_0 > C_r.

This equivalence is valid over integers/naturals after explicitly handling positivity of 2^{A_r} and using the exact block identity. It is not enough to know A_r is large on average; the correction term C_r must also be controlled.

Consequences:

- If 2^{A_r} ≤ 3^r, strict descent is impossible for positive x_0, since C_r>0.
- If 2^{A_r} > 3^r, descent still requires the stronger threshold (2^{A_r}-3^r)x_0 > C_r.
- A valuation word is only a candidate block until its congruence constraints are checked against the starting integer. Arbitrary words of exponents need not be realizable.

## Certificate format

A finite block certificate should contain:

1. a concrete odd start x₀ or a proved admissible residue class;
2. the valuation word a₀,…,aᵣ₋₁ and proofs that each valuation is exact;
3. cumulative exponents Aⱼ;
4. the exact correction sum Cᵣ;
5. a kernel-checked proof of (2^{Aᵣ}-3ʳ)x₀ > Cᵣ;
6. the resulting strict endpoint descent.

For symbolic families, replace concrete values with explicit residue and threshold hypotheses. The checker must verify both realizability and the inequality.

## Research direction: correction cocycle

Treat C_r as a positive cocycle attached to the valuation word, not as an error term to discard. Search for block concatenation laws and lower/upper bounds for C_r conditional on valuation constraints. A useful theorem would combine a realizable-word constraint with a bound on the pair (A_r,C_r) that forces descent, and then prove that every nontrivial orbit must encounter such a block.

The last universal-coverage statement is the principal open obligation. Finite enumeration or a mean-drift heuristic cannot replace it. In particular, do not assume a uniform upper bound on the length of runs with a_i=1; arbitrarily long finite runs occur.

## Formal audit

- Keep the original accelerated map and the ordinary Collatz map distinct.
- Prove the recurrence identity by induction before deriving inequalities.
- Prefer multiplication inequalities over division, and establish all positivity side conditions explicitly.
- Inspect transitive axioms and prohibit sorry, hidden axioms, or unproved descent hypotheses.
- A successful compile certifies the formal statement only; the statement must still match the intended global conjecture.
