# Adversarial review checklist: Syracuse valuation-word certificate

Date: 2026-10-26

## Claim under review
For a positive exponent word a=(a_1,...,a_L), K_j=sum_{i<=j}a_i and
F_a(n)=3^L n + sum_{j=1}^L 3^(L-j)2^(K_{j-1}),
the intended theorem for positive odd n is that the exact first-L valuation word equals a iff v_2(F_a(n))=K_L.

## Independent algebra checks
1. **Affine recurrence:** derive 2^(K_L) T^L(n)=F_a(n) by induction from 2^(a_i)T^i(n)=3T^(i-1)(n)+1. Do not assume the word is valid before deriving each quotient.
2. **Tail decomposition:** verify symbolically that
   F_a(n)=3^(L-1)(3n+1)+2^(a_1)G,
   where G=3^(L-2)+3^(L-3)2^(a_2)+...+2^(a_2+...+a_(L-1)), and that
   F_a(n)/2^(a_1)=F_(a_2,...,a_L)((3n+1)/2^(a_1))
   only after proving 2^(a_1)|(3n+1).
3. **Oddness:** G is odd because its first term 3^(L-2) is odd and every later term is even. This is essential to the valuation-separation argument.
4. **Valuation separation:** if v_2(F_a(n))=K_L>a_1 and v_2(2^(a_1)G)=a_1, then the other summand must have valuation exactly a_1; unequal 2-adic valuations cannot cancel. This proves v_2(3n+1)=a_1.
5. **Induction domain:** after division, T(n) is a positive odd integer. The tail induction therefore applies without changing the domain.
6. **Congruence equivalence:** v_2(z)=K iff z ≡ 2^K mod 2^(K+1), for positive K and integer z.
7. **Unique residue:** 3^L is a unit modulo 2^(K_L+1), so exactly one residue class solves the affine congruence. Since K_L>=1 and the constant term is odd, that class is odd.
8. **Conditional Haar normalization:** the class has Z_2 measure 2^-(K_L+1); the odd domain has measure 1/2; hence conditional probability 2^-K_L.

## Failure modes to test in Lean
- L=1 base case.
- L=2 with small exponents, to catch an off-by-one in the tail constant.
- All exponents positive; zero exponents are deliberately excluded because the accelerated Syracuse valuation of an odd input is at least 1.
- Distinguish an integer congruence from an equality after division.
- Ensure positivity of every iterate is proved, not silently assumed.
- Do not infer global orbit convergence, a stopping-time bound, or absence of nontrivial cycles from the finite-word theorem.

## Status
This checklist is an independent review plan for the paper proof. It is not a Lean theorem, no compilation is claimed, and no exhaustive regression was run in this commit.