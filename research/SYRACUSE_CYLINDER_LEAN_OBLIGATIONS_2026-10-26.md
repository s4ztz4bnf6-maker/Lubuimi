# Syracuse valuation cylinders: Lean proof obligations (2026-10-26)

Status: proof plan only. This file is not a Lean compilation result and makes no claim about the global Collatz conjecture.

## Target statement

Let a : Fin N -> Nat with 0 < a i, and let A = sum_i a_i. For the accelerated odd Syracuse map T(n) = (3*n+1) / 2^(v2(3*n+1)), the finite valuation word a should determine exactly one residue class of odd starting values modulo 2^(A+1), such that every positive odd integer in that class realizes the word for its first N accelerated steps.

A formal statement should distinguish natural-number exact valuation, modular congruences where division is not performed in ZMod, the partial orbit being defined at every stage, and the terminal oddness constraint.

## Backward construction

Put B_j = sum_{i=j}^{N-1} a_i, with B_N = 0. Define residues backwards, r_N = 1 mod 2, and for j < N choose r_j modulo 2^(B_j+1) by

  3 * r_j + 1 = 2^(a_j) * r_(j+1)   (mod 2^(B_j+1)).

Since gcd(3, 2^(B_j+1)) = 1, multiplication by 3 is invertible in this finite residue ring. The right side is well-defined from r_(j+1), because B_j = a_j + B_(j+1). The congruence forces r_j odd and exact valuation a_j: the expression is divisible by 2^a_j but not 2^(a_j+1), since the quotient residue is odd.

The terminal residue r_N is the unique odd residue modulo 2. Backward induction therefore constructs one residue r_0 modulo 2^(A+1). The proof must establish both existence and uniqueness; do not replace uniqueness with a finite search.

## Lean decomposition

1. Establish that 3 is a unit modulo every power of 2.
2. Prove a modular inverse lemma: solve 3*x + 1 = 2^a*y modulo 2^(a+b+1) uniquely for x modulo that modulus, given y modulo 2^(b+1).
3. Prove the exact-valuation lemma with explicit positivity/nonzero assumptions.
4. Use backward induction over a reversed finite index or a recursive suffix sum; carry the index, suffix exponent sum, and residue in a structure to avoid hidden index arithmetic.
5. Prove forward-orbit compatibility: the quotient (3*n_j+1)/2^(a_j) is congruent to r_(j+1) at the next required modulus. Use natural-number divisibility and congruences, not division in ZMod.
6. Prove uniqueness: any start value realizing the word has the same terminal odd residue and hence agrees at every backward step.
7. Regression tests: N=0 (odd starts modulo 2, empty word); N=1 with exponent 1 and 2; and two-step words (1,1), (1,2), (2,1). These are tests, not substitutes for the induction theorem.

## Critical limitation

This cylinder theorem only characterizes finite valuation itineraries. It does not imply a descent estimate, exclude nontrivial cycles, or prove every positive odd start reaches 1. A global proof still needs a theorem forcing a suitable block to decrease, or a rigorously characterized counterexample.

## Audit protocol

- Pin Lean and Mathlib versions.
- Compile the lemma file separately from conjecture-level code.
- Run #print axioms on the exact public theorem and its transitive dependencies.
- Reject sorry, sorryAx, added axioms, unproved assumptions, or a theorem whose statement weakens the intended claim.
- Record the exact commit and CI run; no CI status is asserted by this note.