# Syracuse valuation-word audit: affine identity and realizability

Date: 2026-10-26

## Purpose

Separate three logically different claims:

1. **Affine composition:** prescribed step equations imply a closed identity.
2. **Word realizability:** a proposed exponent word is induced by an actual odd Syracuse orbit.
3. **Global convergence:** every positive odd starting value eventually reaches 1.

The current Lean file proves instances of (1) for two, three, and four steps. It does not prove (2) for arbitrary words or (3).

## General target identity

Let a_0,...,a_(N-1) be natural numbers, let A_j = sum_{i<j} a_i, and suppose states n_0,...,n_N satisfy
2^(a_j) n_(j+1) = 3 n_j + 1 for every j<N.

Then composition gives
2^(A_N) n_N = 3^N n_0 + sum_{j=0}^{N-1} 3^(N-1-j) 2^(A_j).

The right side is determined by n_0 and the exponent word. The identity is an algebraic consequence of the step equations, not a convergence theorem.

## Cylinder test: necessary conditions before a Lean orbit theorem

For a fixed finite word, recursively define the rational affine states by
n_(j+1) = (3 n_j + 1)/2^(a_j).
A word is realizable from an integer n_0 only if every prefix division is exact and every resulting state is a positive odd integer. At each step one must check
2^(a_j) divides (3 n_j + 1), and 2^(a_j+1) does not divide (3 n_j + 1),
where the second condition expresses that a_j is exactly v2(3 n_j + 1). Positivity and oddness of each successor are separate obligations.

The final divisibility condition from the closed identity alone is not sufficient: it can hide failures at intermediate prefixes. The formal development should expose a prefix-by-prefix invariant, not merely one terminal congruence.

## Proposed formal milestones

1. Prove the finite-list affine identity by induction over the number of prescribed steps.
2. Define a ValuationWord predicate carrying exact valuation equations, positivity, and oddness at every prefix.
3. Prove equivalence between that predicate and the recursively computed orbit for a finite word.
4. For bounded word lengths, search for impossible words and minimize counterexamples to any proposed congruence criterion.
5. Only then attempt global bounds on the weighted sum. No finite search or average multiplier establishes convergence for all starts.

## Soundness checklist

- Do not replace exact valuation by divisibility alone.
- Do not infer orbit realizability from the terminal affine identity alone.
- Keep accelerated Syracuse iteration distinct from the ordinary Collatz map.
- A Lean CI success verifies the encoded statement, not that the statement is the desired global conjecture.
