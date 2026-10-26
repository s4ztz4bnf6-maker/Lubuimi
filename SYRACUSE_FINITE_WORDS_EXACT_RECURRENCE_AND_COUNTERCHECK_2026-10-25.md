# Syracuse valuation words: exact recurrence and audit

## Correct recurrence

For an odd positive integer x and positive integer a, the exact valuation condition is

`v₂(3x+1)=a` iff `3x+1 = 2^a y` for an odd positive integer y.

Thus a prescribed word `(a₀,…,a_{k−1})` is realized by positive odd states precisely when there are positive odd integers `x₀,…,x_k` satisfying

`3 x_j + 1 = 2^(a_j) x_(j+1)`

for every `j < k`.

Eliminating intermediate states yields

`3^k x₀ + (3^(k−1) + 3^(k−2) 2^(a₀) + … + 2^(a₀+…+a_(k−2)))`

`= 2^(a₀+…+a_(k−1)) x_k`,

with the exact ordering of coefficients obtained by repeated substitution. This affine identity is a useful invariant, but it is not by itself a proof that every word has a solution or that the solution is unique modulo a proposed power of two.

## Formal target

Prove by induction on word length:

1. The recurrence identity for the affine numerator and denominator.
2. Exactness of every valuation from oddness of each next state.
3. A precise lifting lemma describing how an admissible residue class extends when one valuation is appended.
4. Existence/uniqueness conditions for the resulting cylinder.

The lifting lemma is the crucial unresolved step. Do not infer the modulus or density by summing the valuation exponents without proving the pullback map.

## Countercheck protocol

For small words (entries 1 through 4, length at most 4), enumerate odd starts modulo a sufficiently large power of two and compute exact valuations at every step. Compare observed residue classes and periods against the proposed theorem. This can refute a candidate formula quickly, but finite enumeration cannot prove the universal statement.

## Established special case

For the all-ones word of length k, the start condition is `x₀ ≡ -1 mod 2^(k+1)`, giving relative density `2^-k` among odd starts. Treat this as a separate theorem until the general lifting result is complete.
