# Syracuse research increment: exact inverse branches and the transfer gate
Date: 2026-10-26

## Status and objective

This note adds an exact arithmetic layer to the valuation-cylinder audit. It is a theorem about inverse branches of the odd-to-odd Syracuse map, not a proof of universal convergence. The accompanying 2-adic regularity audit remains the source for the local continuity calculation and the singular point.

## 1. Exact inverse-branch lemma

Let y be a positive odd integer and let a >= 1. Define a candidate predecessor by

    x = (2^a y - 1) / 3.

Then x is a positive odd integer and has exact accelerated valuation a if and only if

    2^a y == 1 (mod 3).

Since 2 == -1 (mod 3), this condition is equivalent to

    y == (-1)^a (mod 3).

Proof:
- If the congruence holds, x is an integer. Its numerator is odd, and division by the odd number 3 leaves an odd integer.
- Positivity follows from 2^a y - 1 > 0.
- Direct substitution gives 3x + 1 = 2^a y. Because y is odd, v_2(3x+1) = a, so the accelerated map sends x to y.
- Conversely, any predecessor with exact valuation a satisfies 3x+1 = 2^a y and therefore the stated congruence.

Thus a target y congruent to 1 mod 3 has exactly the even exponents a >= 2 as admissible inverse labels, while y congruent to 2 mod 3 has exactly the odd exponents a >= 1. This is an infinite family of exact inverse branches, not evidence that a forward orbit converges.

## 2. Why this is a useful change of coordinates

A forward valuation word must satisfy both:
1. the cleared-denominator affine identity for the whole word; and
2. every intermediate integrality/valuation constraint.

The inverse formulation makes the local arithmetic obstruction explicit at each node. Starting from a target y_L and choosing exponents backwards, every step is tested by a single residue condition modulo 3 and then produces the unique candidate predecessor. It avoids treating arbitrary exponent words as if they were realizable orbits.

## 3. Exact finite-word identity

For prescribed positive exponents a_1,...,a_L, write K_j = a_1+...+a_j and K_0=0. If all prescribed steps are valid, then

    2^(K_L) n_L = 3^L n_0 + sum_{j=1}^L 3^(L-j) 2^(K_(j-1)).

This identity is necessary for a valid word. By itself it does not establish that all intermediate states are integers, odd, positive, or have the prescribed exact valuations.

## 4. Proof obligations for a global transfer theorem

Any future use of a 2-adic or symbolic-dynamical argument must separately discharge:

- **Domain:** define the map and every iterate on the exact domain used; the point -1/3 is singular for the accelerated formula.
- **Realizability:** show symbolic words correspond to positive-integer trajectories, not merely formal affine compositions.
- **Recurrence transfer:** show a claimed compactness/measure statement yields a statement for each positive integer start, not only for almost all starts or a density-one subset.
- **Escape control:** exclude unbounded nonrepeating trajectories; a no-cycle theorem alone is insufficient.
- **Formal statement fidelity:** encode the standard Collatz/Syracuse map and target theorem, then audit assumptions and axioms.

## 5. Falsifiable next experiment

Build a finite inverse-tree enumerator whose node state is the exact odd integer y and whose edge label a is accepted only when y == (-1)^a mod 3. For each depth, compare:
- paths produced by the inverse tree;
- paths accepted by direct forward iteration;
- the affine word identity after clearing denominators.

A mismatch is a counterexample to the implementation or bookkeeping, not to the Collatz conjecture. Agreement over finite depth is regression evidence only. This experiment should be formalized in Lean after the integer lemma is stated independently of the global conjecture.

## Verification boundary

No Lean compilation, full-repository build, kernel replay, or universal Collatz result is claimed by this note. The inverse-branch proof above is elementary and can be checked line by line from the displayed equations.
