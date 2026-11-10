# Syracuse transition congruence: a stronger exact reduction

Status: elementary mathematical derivation, independently checked by modular arithmetic examples for 1 ≤ k,j ≤ 7; not yet Lean-kernel checked.

Let k,j ≥ 1. The transition condition is

  9n + 3 + 2^k ≡ 2^(k+j) (mod 2^(k+j+1)).                 (★)

## Stronger observation

Condition (★) already forces n to be odd and v₂(3n+1)=k. Thus the separate first-cylinder condition is redundant.

Proof of oddness: reducing (★) modulo 2 gives n+1 ≡ 0 (mod 2), since 2^k and 2^(k+j) are even and 9n+3 has the parity of n+1.

Proof of the valuation: reduce (★) modulo 2^(k+1). Since j ≥ 1, both 2^(k+j) and the modulus 2^(k+j+1) vanish modulo 2^(k+1), so

  9n + 3 ≡ -2^k (mod 2^(k+1)).

Equivalently, 3(3n+1) ≡ -2^k (mod 2^(k+1)). Multiplication by 3 is invertible modulo 2^(k+1), and its inverse is odd. Hence 3n+1 is divisible by 2^k but not by 2^(k+1), which proves v₂(3n+1)=k.

Conversely, if n is odd, v₂(3n+1)=k, and v₂(3T(n)+1)=j, the exact identity 2^k(3T(n)+1)=9n+3+2^k yields (★).

## Unique residue-class transition

Because 9 is invertible modulo 2^(k+j+1), (★) has exactly one residue class n modulo 2^(k+j+1). The preceding argument shows every representative of that class is odd and has starting valuation k; the congruence itself also enforces the next valuation j.

Therefore every ordered pair of positive valuation labels (k,j) is represented by exactly one residue class modulo 2^(k+j+1). This is a local transition-class theorem, not a claim that arbitrary infinite valuation sequences are globally realizable or that Syracuse trajectories descend.

## Finite checks

A direct modular enumeration for all 1 ≤ k,j ≤ 7 found one class for every pair, consistent with the proof above. Enumeration is only a sanity check; the argument is the modular proof.

## Formalization targets

1. Prove that 9 is a unit modulo every power of 2.
2. Prove the congruence (★) is equivalent to the two-step valuation condition.
3. Prove the congruence forces oddness and the starting valuation k.
4. Formalize uniqueness of the residue class.
5. Use these classes to search for a genuine global invariant; the transition graph alone does not supply one.