# Finite Syracuse valuation words as 2-adic cylinders
Date: 2026-10-25

## Why this note exists

The source already contains a Lean theorem for the exact signed-margin formula after a run of valuation-one steps (signed_margin_after_run_of_ones) and threshold corollaries. Therefore the separate note about that formula is documentation, not a new theorem. This note identifies the next structural bridge: finite valuation words and their residue cylinders.

## Word and affine recurrence

Fix a finite word of positive exponents a_0,...,a_{r-1}, set
A_j = sum_{i<j} a_i,
C_0 = 0, C_{j+1} = 3 C_j + 2^(A_j).
For an odd Syracuse orbit the exact affine identity is
2^(A_j) n_j = 3^j n_0 + C_j.
The condition that the exponent at step j is exactly a_j means
3 n_j + 1 = 0 mod 2^(a_j),
and 3 n_j + 1 is not 0 mod 2^(a_j+1).

Because 3 is invertible modulo every power of two, pulling these congruences back through the affine recurrence constrains the initial odd input by a residue class modulo the cumulative power of two. The expected finite-cylinder statement is: a realizable word of total weight A=A_r determines one residue class of odd inputs modulo 2^(A+1); conversely, every positive odd input in that class realizes the same finite word for the first r steps.

This statement must be proved with the exact valuation (the non-divisibility at the next power), not merely divisibility by 2^(a_j). It should be formalized as a finite induction, extending the cylinder one exponent at a time.

## Measure consequence, conditional on cylinder theorem

Among odd residue classes modulo 2^(A+1), there are 2^A classes. If a word determines exactly one such class, its conditional density among odd 2-adic inputs is
2^(-A).
Thus the exponent-word coding has a natural 2-adic cylinder measure. This gives a rigorous way to compare the combinatorial weight of a valuation word, its cumulative exponent A, and the signed-margin debit/credit associated with that word.

The measure formula is a finite-cylinder statement. It does not imply that a typical orbit descends, nor that all positive integer orbits descend. In particular, a measure-zero exceptional set can still contain positive integers, and compactness of Z_2 does not force convergence to the integer cycle.

## Concrete next formalization

Formalize the induction:
1. Define a finite valuation word and its cumulative exponent.
2. Define the initial residue cylinder by the recursive affine inverse.
3. Prove the cylinder is a single odd residue class modulo 2^(A+1), if and only if the word is realizable.
4. Prove its conditional Haar measure is 2^(-A).
5. Combine the cylinder weight with the exact block-margin identities, without replacing deterministic orbit claims by an average-density assertion.

## Audit boundary

This is a research specification, not yet a Lean-checked theorem. The uniqueness/existence of the residue cylinder and the exact valuation conditions are the formal proof obligations. No global Collatz result is claimed.
