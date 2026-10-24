# Exact 2-adic valuation distribution: proof plan

## Scope
This note records the next theorem target for the Syracuse audit. It is not itself a proof of the global Collatz conjecture.

## Target theorem
For integers K and j with 1 <= j < K, count residue classes n modulo 2^K for which v2(3*n+1)=j. The expected count is 2^(K-j-1), with n restricted to odd classes (which is automatic when j >= 1).

## Proof decomposition suitable for Lean
1. Prove that multiplication by 3 is injective modulo 2^j. A direct route is: if 2^j divides 3*(a-b), then since gcd(3,2^j)=1, 2^j divides a-b.
2. Consequently the congruence 3*n+1 = 0 mod 2^j has exactly one solution class modulo 2^j.
3. The solution class modulo 2^j has two lifts modulo 2^(j+1); exactly one lift also solves 3*n+1 = 0 mod 2^(j+1). The other lift therefore has valuation exactly j.
4. That one exact-valuation class modulo 2^(j+1) has exactly 2^(K-j-1) lifts modulo 2^K.
5. Translate divisibility by 2^j and non-divisibility by 2^(j+1) using the existing v2_eq_iff_dvd_pow_not_next lemma.
6. Keep the endpoint j = K separate: valuation at least K is a congruence class modulo 2^K, not an exact valuation class.

## Existing local statements (newest addition awaits CI)
The theorem v2_three_mul_add_one_eq_one_iff_mod_four_three states the j=1 split.
The theorem v2_three_mul_add_one_eq_two_iff_mod_eight_one states the j=2 split.
The current workflow runs must finish before the newest addition is marked kernel-verified.

## Literature and methodological boundary
Terras, “A stopping time problem on the positive integers,” Acta Arithmetica 30 (1976), 241–252, DOI 10.4064/aa-30-3-241-252, is a classical stopping-time reference. Congruence-class counts are finite/local information. They do not imply every individual Syracuse orbit reaches a smaller value or terminates.
