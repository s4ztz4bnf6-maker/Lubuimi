# Exact valuation-word cylinder: the modulus needs one extra bit (2026-10-25)

## Finding
A finite exponent word does not, in general, identify its exact valuation cylinder modulo 2^A_N alone. Exactness of the last valuation requires one extra binary digit. The natural terminal modulus is 2^(A_N+1), where A_N = sum_{j<N} a_j.

For the accelerated odd Syracuse map, an exponent a_j = v_2(3n_j+1) is exact iff
3 n_j + 1 ≡ 2^a_j (mod 2^(a_j+1)).
After substituting the affine prefix identity
2^A_j n_j = 3^j n_0 + C_j,
the exact condition is a congruence on n_0 modulo 2^(A_{j+1}+1), not merely modulo 2^(A_{j+1}). The prefix conditions must still be intersected and shown compatible; the modulus statement alone does not prove every exponent word is realizable.

## Minimal diagnostic
For the one-letter word [1], exact valuation one means
3 n_0 + 1 ≡ 2 (mod 4),
so n_0 ≡ 3 (mod 4). Modulo 2^A_1 = 2, all odd starts lie in the same residue class, but that class includes n_0 ≡ 1 (mod 4), where v_2(3n_0+1) >= 2. Thus modulus 2^A_1 loses exactness; modulus 2^(A_1+1) = 4 preserves it.

For the word [1,1], the exact cylinder is n_0 ≡ 7 (mod 8): it contains 7, whose first two accelerated steps are 7 -> 11 -> 17, both with valuation one. This is a useful regression test against a proposed general cylinder theorem.

## Consequence for the research program
A sound word certificate must carry:
1. cumulative exponent A_j and offset C_j;
2. the exact valuation congruence modulo 2^(A_{j+1}+1) at every prefix;
3. compatibility of all prefix cylinders;
4. oddness/positivity of the actual iterates, separately from modular admissibility.

A terminal congruence alone cannot replace the prefix checks. The correct theorem should either prove that nested prefix conditions yield a unique residue class modulo 2^(A_N+1) for every admissible word, or explicitly characterize when their intersection is empty. This is a finite-word statement, not global Collatz termination.

## Formalization target
First prove the one-step exact-valuation congruence and the prefix lifting lemma. Then define a certificate for a word and prove certificate validity implies the affine identity and every exact valuation. Test words [1], [1,1], and impossible words before making any universal realizability claim.
