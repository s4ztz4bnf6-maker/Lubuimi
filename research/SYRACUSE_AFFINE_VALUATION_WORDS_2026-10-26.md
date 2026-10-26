# Syracuse valuation words: affine identity and exactness obligations (2026-10-26)

## New algebraic reduction

Fix a finite word of positive integers (a_0,\ldots,a_{N-1}). Write
\[
A_j=\sum_{i<j}a_i,\qquad A=A_N.
\]
For a trajectory satisfying (2^{a_j}n_{j+1}=3n_j+1) at each step, repeated substitution gives the exact integer identity
\[
2^A n_N
=3^N n_0+\sum_{j=0}^{N-1}3^{N-1-j}2^{A_j}.
\]
This is the affine iterate formula for a prescribed valuation word. It is an algebraic identity conditional on the step equations, not an existence theorem for every word.

### Why it helps

1. It removes nested quotients from the main recurrence.
2. It separates the coefficient of the initial value ((3^N)) from the word-dependent offset.
3. It gives a concrete congruence target for residue-class construction modulo (2^{A+1}).
4. It allows a clean split between two proof obligations:
   - **Divisibility:** the affine numerator is divisible by (2^A).
   - **Exactness:** for every (j), (2^{a_j}mid 3n_j+1) but (2^{a_j+1}\nmid 3n_j+1).

The second condition cannot be omitted: a word of lower bounds on valuations is not an exact valuation itinerary.

## Formalization plan

First formalize the purely algebraic recurrence over integers, where subtraction and multiplication are uncomplicated. Then separately prove nonnegativity and divisibility facts that permit translation to natural-number quotients. Avoid defining a global valuation-cylinder theorem until the exactness induction and uniqueness modulo the claimed power have both been proved.

A suitable first Lean target is the affine identity for a finite list of exponents, proved by induction on the list. Keep the recurrence relation as a hypothesis so the theorem cannot accidentally assert existence of a trajectory.

## Boundary of the claim

The identity alone proves neither that every valuation word is realizable nor that an infinite Syracuse orbit descends. Even a full classification of finite valuation cylinders would be a local arithmetic result, not the global Collatz conjecture.
