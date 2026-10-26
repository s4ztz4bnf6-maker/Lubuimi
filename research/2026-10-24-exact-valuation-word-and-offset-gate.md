# 2026-10-24: Exact valuation words and the offset obstruction

Status: research specification; no new Lean theorem claimed.

## Exact local characterization

Let n and m be odd positive integers and a >= 1. The accelerated Syracuse transition with valuation exactly a is

  2^a * m = 3*n + 1.

Since m is odd, this implies

  (3*n + 1) % 2^(a+1) = 2^a.

Conversely, if n is odd and the displayed residue equation holds, then 2^a divides 3*n+1 but 2^(a+1) does not. Hence v2(3*n+1)=a, and m=(3*n+1)/2^a is odd. This converse is the key strengthening over a one-way residue filter: it characterizes exactly the admissible valuation at a step.

Because gcd(3, 2^(a+1))=1, the congruence has exactly one solution class for n modulo 2^(a+1). A formal proof should establish existence and uniqueness using modular inverses, not a table of examples.

## Word-level compatibility

For a finite valuation word a_0,...,a_(k-1), put A_j=sum_{i<j} a_i and A=A_k. Iterating 2^(a_j) n_(j+1) = 3 n_j + 1 gives

  2^A n_k = 3^k n_0 + C,

where C=sum_{j<k} 3^(k-1-j) 2^(A_j).

The word is not automatically realizable merely because each one-step residue condition has a solution: the residue constraints must be compatible under composition, and the resulting intermediate values must remain positive odd integers. The next Lean interface should therefore distinguish a syntactic valuation word, a compatible residue cylinder modulo 2^A, and a realizable orbit segment.

## Exact descent gate

For positive n_0 and n_k, n_k < n_0 is equivalent to C < (2^A - 3^k)*n_0. Thus A large enough to make 2^A > 3^k is necessary but not sufficient: the offset C must also be controlled. This is the central obstruction; do not silently replace it by an average-exponent heuristic.

## Proposed formal milestones

- Prove the exact valuation iff lemma for arbitrary a.
- Prove uniqueness of the residue class modulo 2^(a+1).
- Prove the affine composition identity by induction on the word.
- Prove the strict-descent equivalence as a separate arithmetic lemma.
- Search for a uniform bound on C for compatible words; any proposed bound must be checked against all words up to a specified length and then proved independently.

No claim about global Collatz convergence follows from these finite identities.