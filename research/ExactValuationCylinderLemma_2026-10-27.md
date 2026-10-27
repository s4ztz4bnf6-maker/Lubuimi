# Exact finite-word cylinder lemma: induction blueprint

Date: 2026-10-27
Status: mathematical lemma blueprint and finite sanity checks; not yet Lean-compiled.

## Theorem to formalize

Let w=(k_0,...,k_{N-1}) be any finite word of positive integers and let A=sum k_i. Among odd integers, the set whose first N accelerated Syracuse valuations equal w is exactly one residue class modulo 2^(A+1). Consequently its density within odd residue classes is 2^-A.

This is a deterministic cylinder statement, not an independence assumption.

## Induction

Empty word: all odd starts, one class modulo 2.

Inductive step: suppose the suffix w'=(k_1,...,k_{N-1}) has one odd residue class m modulo 2^(B+1), where B=sum_{i=1}^{N-1} k_i. To prepend r=k_0, the next odd iterate must satisfy
T(n) = (3n+1)/2^r ≡ m (mod 2^(B+1)).
Equivalently,
3n+1 ≡ 2^r m (mod 2^(r+B+1)).
Since 3 is invertible modulo every power of two, this congruence has exactly one residue class modulo 2^(r+B+1). Because m is odd, the right-hand side is congruent to 2^r modulo 2^(r+1), so this class satisfies v₂(3n+1)=r exactly and n is odd. Its quotient T(n) lies in the suffix class. Conversely, any start with valuation word (r,w') must satisfy this congruence, so no other residue class works.

Thus the cylinder has exactly one odd residue class modulo 2^(A+1), and among the 2^A odd residue classes modulo that modulus its density is 2^-A.

## Formalization split

1. Prove unique residue class for one valuation using modular arithmetic and invertibility of 3.
2. Prove the suffix-preimage step above.
3. Induct over the valuation word.
4. Only afterward formalize counting/density. Do not infer universal orbit descent from cylinder density.

## Scope warning

This lemma quantifies over finite valuation words, but does not show that sums of valuations along each actual infinite orbit grow fast enough to force descent. The open Collatz bridge remains orbitwise, not measure-theoretic.
