# Research note: exact valuation cylinders and residue-class uniqueness

Status: proof plan, not a claimed theorem or CI result.

## Algebraic core

For a fixed exponent word a_0,...,a_{k-1}, put A_j = sum_{i<j} a_i and define C_0=0, C_{j+1}=3 C_j + 2^{A_j}. Iterating 2^{a_j} n_{j+1}=3 n_j+1 gives the exact identity 2^{A_k} n_k = 3^k n_0 + C_k.

Consequently any realization must satisfy 3^k n_0 + C_k = 0 (mod 2^{A_k}). Since gcd(3^k,2^{A_k})=1, this congruence has exactly one residue class modulo 2^{A_k}; when A_k=0 the modulus is 1 and the statement is vacuous.

## The important refinement

Congruence is not equivalent to realization of the exponent word. At each stage j one must also prove 2^{a_j} | (3 n_j+1) and 2^{a_j+1} ∤ (3 n_j+1). The first conditions alone allow a valuation larger than a_j. A sound cylinder predicate should therefore carry the whole list of exact divisibility and nondivisibility conditions, or an inductive witness trajectory, and prove both directions between these representations.

## Proposed Lean decomposition

1. Prove a generic uniqueness lemma for solutions to a*x+c ≡ 0 [MOD 2^A] under Nat.Coprime a (2^A) (or use invertibility in ZMod (2^A) when A>0).
2. Prove the affine identity by induction on the word length, independently of any descent claim.
3. Define RealizesWord n word with explicit intermediate states and exact valuation conditions.
4. Prove RealizesWord n word -> affine congruence and RealizesWord n word -> unique residue class.
5. Only then prove the converse: a residue representative realizes the word iff all exact valuation side-conditions hold. Do not infer this converse from the affine congruence alone.

## Research boundary

Finite residue trees and 2-adic coding are standard tools for Collatz-type dynamics, but neither finite branching nor density estimates exclude a single infinite exceptional trajectory. The missing global theorem would need a genuinely new uniform descent argument or a verified invariant excluding every infinite non-descending path. The local residue-class lemma does not supply that argument.
