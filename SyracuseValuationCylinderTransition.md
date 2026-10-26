# Syracuse valuation-cylinder transition: exact arithmetic criterion

Status: mathematical derivation; not yet Lean-kernel checked.

Let n be positive and odd, and suppose v₂(3n+1)=k, with k ≥ 1. Define the accelerated next state m=(3n+1)/2^k, which is odd.

For any j ≥ 1, the next state lies in valuation cylinder j exactly when v₂(3m+1)=j, equivalently 3m+1 ≡ 2^j (mod 2^(j+1)).

Substituting m=(3n+1)/2^k and multiplying the congruence by 2^k gives the equivalent criterion

  9n + 3 + 2^k ≡ 2^(k+j) (mod 2^(k+j+1)).

Proof: because 2^k divides 3n+1, the identity 2^k(3m+1)=3(3n+1)+2^k=9n+3+2^k is exact. Multiplication by 2^k sends congruence modulo 2^(j+1) to congruence modulo 2^(k+j+1) without loss, since both sides are multiplied by the same power of two.

## Consequence

For a prescribed adjacent valuation pair (k,j), the transition is an explicit congruence condition on the original odd input n. Since 9 is invertible modulo 2^(k+j+1), the second congruence alone specifies one residue class modulo 2^(k+j+1). It must still be intersected with the first-cylinder condition 3n+1 ≡ 2^k (mod 2^(k+1)); the two conditions together characterize the allowed transition inputs.

This gives a finite modular graph for any bounded set of valuation labels. It is an exact representation of local transitions, not a proof that all abstract paths are realizable, that every orbit descends, or that the Collatz conjecture is true.

## Lean targets

1. Prove a division/congruence equivalence from 2^k ∣ 3*n+1.
2. Formalize the displayed exact identity.
3. Prove the forward and reverse transition criterion.
4. Build finite residue-class transition tables for bounded labels and compare them with orbit enumeration.
5. Search for a global inequality invariant that survives all realizable transitions; finite tables alone cannot certify an unbounded theorem.