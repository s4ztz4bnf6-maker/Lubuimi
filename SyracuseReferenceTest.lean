import Mathlib
import SyracuseQuarterDescent

namespace CollatzSyracuseAudit

/-- Exponent of the prime 2 in the factorization of a natural number. -/
def v2 (m : ℕ) : ℕ :=
  m.factorization 2

/-- Syracuse step, defined by removing all powers of two from 3*n+1. -/
def syracuse (n : ℕ) : ℕ :=
  (3 * n + 1) / 2 ^ v2 (3 * n + 1)

/-- If n is odd, then 3*n+1 is even. -/
theorem three_mul_add_one_even
    (n : ℕ) (h : n % 2 = 1) :
    (3 * n + 1) % 2 = 0 := by
  omega

/-- Complementary residue calculation: the n = 3 (mod 4) branch leaves
exactly one factor of 2 at the first Syracuse numerator level. This is a
modular fact only; the exact valuation statement is a separate obligation. -/
theorem three_mul_add_one_mod_four_of_three
    (n : ℕ) (h : n % 4 = 3) :
    (3 * n + 1) % 4 = 2 := by
  omega

/-- Exact 2-adic valuation in the n = 3 (mod 4) branch:
the numerator is divisible by 2 but not by 4, so its 2-adic
valuation is exactly one. -/
theorem v2_three_mul_add_one_eq_one_of_mod_four_three
    (n : ℕ) (h : n % 4 = 3) :
    v2 (3 * n + 1) = 1 := by
  have hmod : (3 * n + 1) % 4 = 2 :=
    three_mul_add_one_mod_four_of_three n h
  have hm : 3 * n + 1 ≠ 0 := by omega
  have htwo : 2 ∣ 3 * n + 1 := by
    apply Nat.dvd_iff_mod_eq_zero.mpr
    omega
  have hfour : ¬ 4 ∣ 3 * n + 1 := by
    intro hf
    have hz : (3 * n + 1) % 4 = 0 :=
      Nat.dvd_iff_mod_eq_zero.mp hf
    omega
  have hpow : 2 ^ 1 ∣ 3 * n + 1 := by
    simpa using htwo
  have hlow : 1 ≤ v2 (3 * n + 1) :=
    (Nat.prime_two.pow_dvd_iff_le_factorization hm).mp hpow
  have hnot : ¬ 2 ≤ v2 (3 * n + 1) := by
    intro hv
    have hpow2 : 2 ^ 2 ∣ 3 * n + 1 :=
      (Nat.prime_two.pow_dvd_iff_le_factorization hm).mpr hv
    have hf : 4 ∣ 3 * n + 1 := by simpa using hpow2
    exact hfour hf
  omega

#print axioms CollatzSyracuseAudit.v2_three_mul_add_one_eq_one_of_mod_four_three

/-- In the n = 5 (mod 8) branch, the Syracuse numerator has at least
three factors of 2. This isolates a stronger local descent case. -/
theorem eight_dvd_three_mul_add_one_of_mod_eight_five
    (n : ℕ) (h : n % 8 = 5) :
    8 ∣ 3 * n + 1 := by
  apply Nat.dvd_iff_mod_eq_zero.mpr
  omega

/-- In the n = 3 (mod 8) branch, the numerator is 2 modulo 8. -/
theorem three_mul_add_one_mod_eight_of_mod_eight_three
    (n : ℕ) (h : n % 8 = 3) :
    (3 * n + 1) % 8 = 2 := by
  omega

/-- In the n = 7 (mod 8) branch, the numerator is 6 modulo 8. -/
theorem three_mul_add_one_mod_eight_of_mod_eight_seven
    (n : ℕ) (h : n % 8 = 7) :
    (3 * n + 1) % 8 = 6 := by
  omega

/-- Smoke test: the factorization-based reference definition elaborates. -/
example (n : ℕ) : syracuse n = (3 * n + 1) / 2 ^ v2 (3 * n + 1) := by
  rfl

/-- A divisor by 4 forces at least two factors of 2 in the factorization. -/
theorem two_le_v2_of_four_dvd
    (m : ℕ) (hm : m ≠ 0) (hfour : 4 ∣ m) :
    2 ≤ v2 m := by
  have hpow : 2 ^ 2 ∣ m := by
    simpa using hfour
  exact (Nat.prime_two.pow_dvd_iff_le_factorization hm).mp hpow

/-- Monotonicity of the power of 2 gives the denominator bound. -/
theorem pow_two_ge_four
    (a : ℕ) (ha : 2 ≤ a) :
    4 ≤ 2 ^ a := by
  calc
    4 = 2 ^ 2 := by norm_num
    _ ≤ 2 ^ a := Nat.pow_le_pow_right (by omega) ha

/-- Natural-number division decreases when its positive divisor increases. -/
theorem div_pow_le_div_four
    (N a : ℕ) (ha : 4 ≤ 2 ^ a) :
    N / 2 ^ a ≤ N / 4 := by
  apply (Nat.le_div_iff_mul_le (by norm_num : 0 < 4)).2
  calc
    (N / 2 ^ a) * 4 ≤ (N / 2 ^ a) * 2 ^ a :=
      Nat.mul_le_mul_left (N / 2 ^ a) ha
    _ ≤ N := Nat.div_mul_le_self N (2 ^ a)

#print axioms CollatzSyracuseAudit.two_le_v2_of_four_dvd
#print axioms CollatzSyracuseAudit.pow_two_ge_four
#print axioms CollatzSyracuseAudit.div_pow_le_div_four

/-- If the odd Syracuse input has at least two factors of 2 in 3*n+1,
then the accelerated Syracuse step is strictly smaller than n (for n > 1). -/
theorem syracuse_descent_of_four_dvd
    (n : ℕ) (hn : n % 2 = 1) (hn_two : 2 ≤ n)
    (hfour : 4 ∣ 3 * n + 1) :
    syracuse n < n := by
  have hm : 3 * n + 1 ≠ 0 := by omega
  have ha : 2 ≤ v2 (3 * n + 1) :=
    two_le_v2_of_four_dvd (3 * n + 1) hm hfour
  have hden : 4 ≤ 2 ^ v2 (3 * n + 1) :=
    pow_two_ge_four (v2 (3 * n + 1)) ha
  have hdiv :
      (3 * n + 1) / 2 ^ v2 (3 * n + 1) ≤ (3 * n + 1) / 4 :=
    div_pow_le_div_four (3 * n + 1) (v2 (3 * n + 1)) hden
  have hmodm : (3 * n + 1) % 4 = 0 :=
    Nat.dvd_iff_mod_eq_zero.mp hfour
  have hnmod : n % 4 = 1 := by omega
  have hquarter : (3 * n + 1) / 4 < n :=
    quarter_descent_of_mod_four_one n hnmod hn_two
  dsimp [syracuse]
  omega

#print axioms CollatzSyracuseAudit.syracuse_descent_of_four_dvd


/--
Residue-class corollary for the actual valuation-based Syracuse map:
every odd n > 1 with n = 1 (mod 4) strictly descends after removing
all powers of two from 3*n+1. Unlike the quarter-step identity alone,
this theorem connects the residue condition to the implemented map.
-/
theorem syracuse_descent_of_mod_four_one
    (n : ℕ) (hn : n % 2 = 1) (hn_two : 2 ≤ n)
    (hmod : n % 4 = 1) :
    syracuse n < n := by
  apply syracuse_descent_of_four_dvd n hn hn_two
  omega

#print axioms syracuse_descent_of_mod_four_one


end CollatzSyracuseAudit
