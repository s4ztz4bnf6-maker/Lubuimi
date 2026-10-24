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

/-- Exact formula in the complementary n = 3 (mod 4) branch:
only one factor of two is removed by the accelerated map. -/
theorem syracuse_eq_half_of_mod_four_three
    (n : ℕ) (hmod : n % 4 = 3) :
    syracuse n = (3 * n + 1) / 2 := by
  dsimp [syracuse]
  rw [v2_three_mul_add_one_eq_one_of_mod_four_three n hmod]
  norm_num

/-- The n = 3 (mod 4) branch grows at its next accelerated step for n > 1.
This is an explicit obstruction to any proof claiming one-step descent
for every odd input. -/
theorem syracuse_grows_of_mod_four_three
    (n : ℕ) (hn : 2 ≤ n) (hmod : n % 4 = 3) :
    n < syracuse n := by
  rw [syracuse_eq_half_of_mod_four_three n hmod]
  omega

#print axioms syracuse_eq_half_of_mod_four_three
#print axioms syracuse_grows_of_mod_four_three

/-- For n = 3 (mod 16), the first Syracuse value is 5 (mod 8).
This identifies a two-step branch where the second numerator has at
least three factors of two. -/
theorem syracuse_mod_eight_five_of_mod_sixteen_three
    (n : ℕ) (hmod : n % 16 = 3) :
    syracuse n % 8 = 5 := by
  have hfour : n % 4 = 3 := by omega
  rw [syracuse_eq_half_of_mod_four_three n hfour]
  omega

#print axioms syracuse_mod_eight_five_of_mod_sixteen_three

/-- From n = 11 (mod 16), one accelerated step lands in
the residue class 1 (mod 4), which is a strict-descent class for odd
inputs greater than one. This records the transition separately from
the parity obligation needed to invoke the descent theorem. -/
theorem syracuse_mod_four_one_of_mod_sixteen_eleven
    (n : ℕ) (hmod : n % 16 = 11) :
    syracuse n % 4 = 1 := by
  have hfour : n % 4 = 3 := by omega
  rw [syracuse_eq_half_of_mod_four_three n hfour]
  omega

#print axioms syracuse_mod_four_one_of_mod_sixteen_eleven


/-- Complementary mod-16 branch: n = 7 (mod 16) maps to 3 (mod 8).
This identifies a branch that does not immediately enter the mod-4
descent class. -/
theorem syracuse_mod_eight_three_of_mod_sixteen_seven
    (n : ℕ) (hmod : n % 16 = 7) :
    syracuse n % 8 = 3 := by
  have hfour : n % 4 = 3 := by omega
  rw [syracuse_eq_half_of_mod_four_three n hfour]
  omega

#print axioms syracuse_mod_eight_three_of_mod_sixteen_seven

/-- Complementary mod-16 branch: n = 15 (mod 16) maps to 7 (mod 8).
Like the 7-class transition, this branch requires a further argument
and is not a descent result. -/
theorem syracuse_mod_eight_seven_of_mod_sixteen_fifteen
    (n : ℕ) (hmod : n % 16 = 15) :
    syracuse n % 8 = 7 := by
  have hfour : n % 4 = 3 := by omega
  rw [syracuse_eq_half_of_mod_four_three n hfour]
  omega

#print axioms syracuse_mod_eight_seven_of_mod_sixteen_fifteen

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

/-- Transition lemma: from n = 3 (mod 8), one accelerated step
lands in the descending residue class 1 (mod 4). This is a residue
transition, not a claim that the two-step value is already below n. -/
theorem syracuse_mod_four_one_of_mod_eight_three
    (n : ℕ) (hmod : n % 8 = 3) :
    syracuse n % 4 = 1 := by
  have hfour : n % 4 = 3 := by omega
  rw [syracuse_eq_half_of_mod_four_three n hfour]
  have hnum : (3 * n + 1) % 8 = 2 :=
    three_mul_add_one_mod_eight_of_mod_eight_three n hmod
  omega

#print axioms syracuse_mod_four_one_of_mod_eight_three

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

/-- Divisibility by 8 forces at least three factors of 2 in the
factorization. This is stronger than the mod-4 threshold used for descent. -/
theorem three_le_v2_of_eight_dvd
    (m : ℕ) (hm : m ≠ 0) (height : 8 ∣ m) :
    3 ≤ v2 m := by
  have hpow : 2 ^ 3 ∣ m := by
    simpa using height
  exact (Nat.prime_two.pow_dvd_iff_le_factorization hm).mp hpow

/-- The n = 5 (mod 8) branch forces valuation at least three, not merely
the two factors sufficient for strict descent. -/
theorem three_le_v2_of_mod_eight_five
    (n : ℕ) (hmod : n % 8 = 5) :
    3 ≤ v2 (3 * n + 1) := by
  have hm : 3 * n + 1 ≠ 0 := by omega
  exact three_le_v2_of_eight_dvd (3 * n + 1) hm
    (eight_dvd_three_mul_add_one_of_mod_eight_five n hmod)

#print axioms three_le_v2_of_eight_dvd
#print axioms three_le_v2_of_mod_eight_five

/-- Monotonicity of the power of 2 gives the denominator bound. -/
theorem pow_two_ge_four
    (a : ℕ) (ha : 2 ≤ a) :
    4 ≤ 2 ^ a := by
  calc
    4 = 2 ^ 2 := by norm_num
    _ ≤ 2 ^ a := Nat.pow_le_pow_right (by omega) ha

/-- A denominator at least eight yields the corresponding quotient bound. -/
theorem div_pow_le_div_eight
    (N a : ℕ) (ha : 8 ≤ 2 ^ a) :
    N / 2 ^ a ≤ N / 8 := by
  apply (Nat.le_div_iff_mul_le (by norm_num : 0 < 8)).2
  calc
    (N / 2 ^ a) * 8 ≤ (N / 2 ^ a) * 2 ^ a :=
      Nat.mul_le_mul_left (N / 2 ^ a) ha
    _ ≤ N := Nat.div_mul_le_self N (2 ^ a)

/-- Quantitative form of the n = 5 (mod 8) result: the accelerated
Syracuse value is at most one eighth of its numerator 3*n+1. -/
theorem syracuse_le_eighth_numerator_of_mod_eight_five
    (n : ℕ) (hmod : n % 8 = 5) :
    syracuse n ≤ (3 * n + 1) / 8 := by
  have hm : 3 * n + 1 ≠ 0 := by omega
  have hv : 3 ≤ v2 (3 * n + 1) :=
    three_le_v2_of_mod_eight_five n hmod
  have hden : 8 ≤ 2 ^ v2 (3 * n + 1) := by
    calc
      8 = 2 ^ 3 := by norm_num
      _ ≤ 2 ^ v2 (3 * n + 1) :=
        Nat.pow_le_pow_right (by omega) hv
  exact div_pow_le_div_eight (3 * n + 1) (v2 (3 * n + 1)) hden

#print axioms div_pow_le_div_eight
#print axioms syracuse_le_eighth_numerator_of_mod_eight_five

/-- Pointwise strict descent on the residue class n = 5 (mod 8).
The valuation bound gives T(n) ≤ (3*n+1)/8, which is strictly below n
for every positive n. This is a one-step result for this residue class,
not a universal descent theorem. -/
theorem syracuse_lt_self_of_mod_eight_five
    (n : ℕ) (hn : 1 ≤ n) (hmod : n % 8 = 5) :
    syracuse n < n := by
  have hbound := syracuse_le_eighth_numerator_of_mod_eight_five n hmod
  omega

#print axioms syracuse_lt_self_of_mod_eight_five

/-- Two-step strict descent on the n = 3 (mod 16) branch.
The first step lands at 5 (mod 8), forcing at least three factors of
two at the next numerator. The hypothesis n ≥ 6 makes the resulting
bound (9*n+5)/16 strictly smaller than n. -/
theorem syracuse_two_step_descent_of_mod_sixteen_three
    (n : ℕ) (hn : 6 ≤ n) (hmod : n % 16 = 3) :
    syracuse (syracuse n) < n := by
  have hfour : n % 4 = 3 := by omega
  have hfirst : syracuse n = (3 * n + 1) / 2 :=
    syracuse_eq_half_of_mod_four_three n hfour
  have hmid : syracuse n % 8 = 5 :=
    syracuse_mod_eight_five_of_mod_sixteen_three n hmod
  have hsecond :=
    syracuse_le_eighth_numerator_of_mod_eight_five (syracuse n) hmid
  rw [hfirst] at hsecond ⊢
  omega

#print axioms syracuse_two_step_descent_of_mod_sixteen_three

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


/-- Exact local dichotomy for the accelerated map on odd inputs above one.
The residue classes modulo four are exhaustive: the 1-class strictly
 descends, while the 3-class strictly grows. This rules out any attempted
proof of universal one-step descent and makes the remaining multi-step
obligation explicit. -/
theorem syracuse_odd_branch_dichotomy
    (n : ℕ) (hn : n % 2 = 1) (hn_two : 2 ≤ n) :
    syracuse n < n ∨ n < syracuse n := by
  have hres : n % 4 = 1 ∨ n % 4 = 3 := by omega
  rcases hres with hone | hthree
  · exact Or.inl (syracuse_descent_of_mod_four_one n hn hn_two hone)
  · exact Or.inr (syracuse_grows_of_mod_four_three n hn_two hthree)

#print axioms syracuse_odd_branch_dichotomy


/-- The n = 5 (mod 8) residue class gives a strict accelerated
Syracuse descent, because its numerator is divisible by 8 (hence by 4).
This links the finer mod-8 split to the actual valuation-based map. -/
theorem syracuse_descent_of_mod_eight_five
    (n : ℕ) (hn : n % 2 = 1) (hn_two : 2 ≤ n)
    (hmod : n % 8 = 5) :
    syracuse n < n := by
  apply syracuse_descent_of_four_dvd n hn hn_two
  apply Nat.dvd_trans (by norm_num : 4 ∣ 8)
  exact (Nat.dvd_iff_mod_eq_zero.mpr (by omega : (3 * n + 1) % 8 = 0))


/-- In the n = 11 (mod 16) branch, the first accelerated step lands in
1 (mod 4), so the *following* step strictly decreases relative to the
intermediate value. This does not assert that the two-step value is
already below the original n. -/
theorem syracuse_second_step_descent_of_mod_sixteen_eleven
    (n : ℕ) (hn_two : 2 ≤ n) (hmod : n % 16 = 11) :
    syracuse (syracuse n) < syracuse n := by
  have htransition : syracuse n % 4 = 1 :=
    syracuse_mod_four_one_of_mod_sixteen_eleven n hmod
  have hmid_two : 2 ≤ syracuse n := by
    have hfirst : syracuse n = (3 * n + 1) / 2 := by
      rw [syracuse_eq_half_of_mod_four_three n (by omega)]
    rw [hfirst]
    omega
  exact syracuse_descent_of_mod_four_one (syracuse n)
    (by omega) hmid_two htransition

#print axioms CollatzSyracuseAudit.syracuse_second_step_descent_of_mod_sixteen_eleven

/-- A three-stage residue chain for the n = 7 (mod 16) branch:
after two accelerated steps, the value is in 1 (mod 4), a known descent
class. This is a residue classification only; it does not compare the
third iterate with the original input. -/
theorem syracuse_two_step_mod_four_one_of_mod_sixteen_seven
    (n : ℕ) (hmod : n % 16 = 7) :
    syracuse (syracuse n) % 4 = 1 := by
  have hfirst : syracuse n % 8 = 3 :=
    syracuse_mod_eight_three_of_mod_sixteen_seven n hmod
  exact syracuse_mod_four_one_of_mod_eight_three (syracuse n) hfirst

#print axioms CollatzSyracuseAudit.syracuse_two_step_mod_four_one_of_mod_sixteen_seven

/-- In the n = 7 (mod 16) branch, the third accelerated step descends
strictly from the second iterate. This is a local descent only, not a
claim that the third iterate is below the original n. -/
theorem syracuse_third_step_descent_of_mod_sixteen_seven
    (n : ℕ) (hmod : n % 16 = 7) :
    syracuse (syracuse (syracuse n)) < syracuse (syracuse n) := by
  have htransition :
      syracuse (syracuse n) % 4 = 1 :=
    syracuse_two_step_mod_four_one_of_mod_sixteen_seven n hmod
  have hmid_two : 2 ≤ syracuse (syracuse n) := by
    have hfirst : syracuse n = (3 * n + 1) / 2 := by
      rw [syracuse_eq_half_of_mod_four_three n (by omega)]
    have hsecond :
        syracuse (syracuse n) = (3 * syracuse n + 1) / 2 := by
      rw [syracuse_eq_half_of_mod_four_three (syracuse n) (by
        have := syracuse_mod_eight_three_of_mod_sixteen_seven n hmod
        omega)]
    rw [hsecond, hfirst]
    omega
  exact syracuse_descent_of_mod_four_one (syracuse (syracuse n))
    (by omega) hmid_two htransition

#print axioms CollatzSyracuseAudit.syracuse_third_step_descent_of_mod_sixteen_seven

#print axioms CollatzSyracuseAudit.syracuse_mod_eight_three_of_mod_sixteen_seven
#print axioms CollatzSyracuseAudit.syracuse_mod_eight_seven_of_mod_sixteen_fifteen


end CollatzSyracuseAudit
