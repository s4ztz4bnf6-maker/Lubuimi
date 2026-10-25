# Finite Syracuse valuation words: unique 2-adic residue class

Date: 2026-10-25
Status: exact arithmetic consequence; proof sketch, not yet Lean-formalized.

## Statement

Fix a finite word of positive integers a_0,...,a_{N-1}. Define A_0=0, A_{j+1}=A_j+a_j, C_0=0, C_{j+1}=3C_j+2^{A_j}, and X_N(n)=3^N n+C_N. Then there is exactly one residue class n modulo 2^{A_N+1} satisfying

X_N(n) = 3^N n + C_N ≡ 2^{A_N} (mod 2^{A_N+1}).

That residue class is odd. Every positive integer in it realizes the prescribed accelerated Syracuse valuation word for its first N steps.

## Proof

Since 3 is coprime to 2, multiplication by 3^N is invertible modulo 2^{A_N+1}. Thus the linear congruence has exactly one solution class modulo 2^{A_N+1}.

Also C_N is odd: C_1=1, and the recurrence C_{j+1}=3C_j+2^{A_j} preserves oddness because A_j>=1 for j>=1, while the closed form C_N=3^{N-1}+sum_{j=1}^{N-1}3^{N-1-j}2^{A_j} has one odd term and all remaining terms even. Since 2^{A_N} is even for N>=1, the congruence forces n odd.

For any positive representative n of this residue class, X_N(n) is divisible by 2^{A_N} with odd quotient. Backward induction using X_{j+1}=3X_j+2^{A_j} shows that X_j/2^{A_j} is an odd positive integer at every j and that

3 n_j + 1 = 2^{a_j} n_{j+1}.

Consequently v_2(3n_j+1)=a_j at every step. The word is therefore realized exactly.

The empty word N=0 is trivial and should be handled separately in a formal statement.

## Consequence for the global Collatz strategy

This result cuts both ways. It gives a clean exact parametrization of finite valuation prefixes by residue classes. But it also proves that there is no nontrivial restriction on arbitrary finite positive valuation words: every such word occurs for infinitely many positive starting integers (the positive representatives of its residue class).

Therefore a proof of global descent cannot rely on a universal finite-word exclusion saying that some positive exponent patterns are impossible. It must instead use a quantitative relationship between the word length, the size of the starting integer, and the accumulated exponents/margin, or exploit a genuinely infinite-orbit consistency property not captured by any single finite prefix.

In particular, a bound that claims to rule out arbitrary finite strings of exponent 1 is false: every such finite string is realizable. Any proposed global margin argument must allow arbitrarily long finite low-exponent runs and prove that their cost is compensated later for each fixed starting integer.

## Formalization plan

1. Prove `Nat.Coprime`-based invertibility of 3 modulo `2^(A_N+1)` and existence/uniqueness of the residue class.
2. Formalize the affine recurrence for `X_j` and divisibility propagation backwards.
3. Prove the odd quotient lemma at each prefix.
4. Prove that the prescribed valuation sequence is realized.
5. Add explicit tests for N=0 and N=1.

No Lean compilation, axiom audit, or global Collatz theorem is claimed here.
