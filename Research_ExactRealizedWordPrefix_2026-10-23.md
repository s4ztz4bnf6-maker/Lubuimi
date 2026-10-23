# Research continuation: exact prefix realization, not just a residue test

Date: 2026-10-23

## A sharper arithmetic encoding

Fix a proposed exponent word a_0,...,a_{k-1}. Define
A_0 = 0, A_{j+1}=A_j+a_j and
C_0 = 0, C_{j+1}=3 C_j+2^{A_j}.
For a genuinely realized orbit, the affine identity is
2^{A_j} n_j = 3^j n_0 + C_j.

The exact valuation condition at stage j is not merely
3^j n_0 + C_j = 0 (mod 2^{A_j}).
Instead, set
M_j(n_0) = 3(3^j n_0 + C_j) + 2^{A_j}
         = 3^{j+1} n_0 + 3 C_j + 2^{A_j}.
Since M_j(n_0) = 2^{A_j}(3 n_j+1) whenever the prefix is integral, exact valuation a_j is equivalent to
- 2^{A_j+a_j} divides M_j(n_0), and
- 2^{A_j+a_j+1} does not divide M_j(n_0).

This makes the upper valuation cutoff an explicit arithmetic predicate on the original start value. The coefficient 3^{j+1} is odd, so it is invertible modulo every power of two; the divisibility clause therefore determines a unique residue class modulo 2^{A_j+a_j}. The nondivisibility clause then rejects the forbidden lift(s) at the next power. These clauses must be conjoined across every j, not inferred from the final affine congruence alone.

## Formal target

Introduce a word-prefix predicate carrying:
1. integrality of every reconstructed n_j;
2. the affine identity at each j;
3. divisibility of M_j by 2^{A_j+a_j};
4. nondivisibility of M_j by 2^{A_j+a_j+1}.

Prove both directions:
- an actual Syracuse orbit with valuation word a satisfies the predicate;
- a start value satisfying the predicate yields the same orbit and exact valuation word, by induction on j.

Only after this equivalence is established should the residue-cylinder enumeration be called exact. A congruence-only enumeration is a necessary-condition sieve and can contain phantom words.

## A useful but limited consequence

For each fixed finite word, the valid starts form a finite union (in fact, under the full nested exact constraints, a tightly constrained 2-adic cylinder or an empty set) of residue classes modulo a power of two. This enables a sound finite certificate checker. It does not imply that every positive start has a descending prefix: that still requires a global first-passage/uniformity theorem.

## Research boundary

Parity vectors and 2-adic conjugacy are classical tools for organizing Collatz trajectories; Tao's almost-all theorem is distributional and does not establish a universal stopping-time bound. The new value here is a precise, checkable interface between word enumeration and true dynamics, not a claimed solution of the Collatz conjecture.
