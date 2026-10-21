import SyracuseReferenceTest

namespace CollatzSyracuseAudit

/-- If a nonzero natural is divisible by 2 but not by 4, its 2-adic
factorization exponent is exactly one. -/
theorem v2_eq_one_of_even_not_four
    (a : ℕ) (ha : a ≠ 0) (h2 : 2 ∣ a) (h4 : ¬ 4 ∣ a) :
    v2 a = 1 := by
  have hpow1 : 2 ^ 1 ∣ a := by simpa using h2
  have hge : 1 ≤ v2 a :=
    (Nat.prime_two.pow_dvd_iff_le_factorization ha).mp hpow1
  have hnot : ¬ 2 ≤ v2 a := by
    intro hle
    have hpow2 : 2 ^ 2 ∣ a :=
      (Nat.prime_two.pow_dvd_iff_le_factorization ha).mpr hle
    exact h4 (by simpa using hpow2)
  omega

 /-- If a natural is divisible by four but not by eight, its 2-adic
factorization exponent is exactly two. -/
theorem v2_eq_two_of_four_not_eight
    (a : ℕ) (ha : a ≠ 0) (h4 : 4 ∣ a) (h8 : ¬ 8 ∣ a) :
    v2 a = 2 := by
  have hpow2 : 2 ^ 2 ∣ a := by simpa using h4
  have hge : 2 ≤ v2 a :=
    (Nat.prime_two.pow_dvd_iff_le_factorization ha).mp hpow2
  have hnot : ¬ 3 ≤ v2 a := by
    intro hle
    have hpow3 : 2 ^ 3 ∣ a :=
      (Nat.prime_two.pow_dvd_iff_le_factorization ha).mpr hle
    exact h8 (by simpa using hpow3)
  omega

 /-- If a natural is divisible by eight but not by sixteen, its
2-adic factorization exponent is exactly three. -/
theorem v2_eq_three_of_eight_not_sixteen
    (a : ℕ) (ha : a ≠ 0) (h8 : 8 ∣ a) (h16 : ¬ 16 ∣ a) :
    v2 a = 3 := by
  have hpow3 : 2 ^ 3 ∣ a := by simpa using h8
  have hge : 3 ≤ v2 a :=
    (Nat.prime_two.pow_dvd_iff_le_factorization ha).mp hpow3
  have hnot : ¬ 4 ≤ v2 a := by
    intro hle
    have hpow4 : 2 ^ 4 ∣ a :=
      (Nat.prime_two.pow_dvd_iff_le_factorization ha).mpr hle
    exact h16 (by simpa using hpow4)
  omega

 /-- If a natural is divisible by sixteen but not by thirty-two,
its 2-adic factorization exponent is exactly four. -/
theorem v2_eq_four_of_sixteen_not_thirty_two
    (a : ℕ) (ha : a ≠ 0) (h16 : 16 ∣ a) (h32 : ¬ 32 ∣ a) :
    v2 a = 4 := by
  have hpow4 : 2 ^ 4 ∣ a := by simpa using h16
  have hge : 4 ≤ v2 a :=
    (Nat.prime_two.pow_dvd_iff_le_factorization ha).mp hpow4
  have hnot : ¬ 5 ≤ v2 a := by
    intro hle
    have hpow5 : 2 ^ 5 ∣ a :=
      (Nat.prime_two.pow_dvd_iff_le_factorization ha).mpr hle
    exact h32 (by simpa using hpow5)
  omega

/-- The numerator in the second accelerated step has this exact form. -/
theorem third_step_numerator_formula (m : ℕ) :
    3 * (6 * m + 5) + 1 = 2 * (9 * m + 8) := by
  omega

/-- Odd m makes the second numerator factor 9*m+8 odd. -/
theorem odd_m_implies_odd_nine_m_add_eight
    (m : ℕ) (hm : m % 2 = 1) :
    (9 * m + 8) % 2 = 1 := by
  omega

/-- From the residue class 3 modulo 4, the first Syracuse step is exact. -/
theorem first_step_formula_mod_four_three (m : ℕ) :
    syracuse (4 * m + 3) = 6 * m + 5 := by
  have hnum : 3 * (4 * m + 3) + 1 = 2 * (6 * m + 5) := by omega
  have hodd : (6 * m + 5) % 2 = 1 := by omega
  have hnum2 : 2 ∣ 3 * (4 * m + 3) + 1 := by
    rw [hnum]
    exact ⟨6 * m + 5, rfl⟩
  have hnum4 : ¬ 4 ∣ 3 * (4 * m + 3) + 1 := by
    rw [hnum]
    omega
  have hval : v2 (3 * (4 * m + 3) + 1) = 1 :=
    v2_eq_one_of_even_not_four _ (by omega) hnum2 hnum4
  dsimp [syracuse]
  rw [hval, hnum]
  norm_num

/-- If m is odd, the second accelerated step is exactly 9*m+8. -/
theorem second_step_formula_of_odd_m
    (m : ℕ) (hm : m % 2 = 1) :
    syracuse (6 * m + 5) = 9 * m + 8 := by
  have hnum : 3 * (6 * m + 5) + 1 = 2 * (9 * m + 8) :=
    third_step_numerator_formula m
  have hodd : (9 * m + 8) % 2 = 1 :=
    odd_m_implies_odd_nine_m_add_eight m hm
  have hnum2 : 2 ∣ 3 * (6 * m + 5) + 1 := by
    rw [hnum]
    exact ⟨9 * m + 8, rfl⟩
  have hnum4 : ¬ 4 ∣ 3 * (6 * m + 5) + 1 := by
    rw [hnum]
    omega
  have hval : v2 (3 * (6 * m + 5) + 1) = 1 :=
    v2_eq_one_of_even_not_four _ (by omega) hnum2 hnum4
  dsimp [syracuse]
  rw [hval, hnum]
  norm_num

/-- In the odd-m case, two accelerated steps from 4*m+3 remain above
the starting value whenever m is positive. -/
theorem second_step_still_above_start_of_odd_m
    (m : ℕ) (hm : m % 2 = 1) :
    4 * m + 3 < syracuse (syracuse (4 * m + 3)) := by
  rw [first_step_formula_mod_four_three, second_step_formula_of_odd_m m hm]
  omega


/-- Every even m has a witness k with m = 2*k. -/
theorem even_m_has_double_witness
    (m : ℕ) (hm : m % 2 = 0) :
    ∃ k : ℕ, m = 2 * k := by
  exact ⟨m / 2, by omega⟩

/-- Substituting m = 2*k exposes the next numerator factor. -/
theorem even_m_nine_m_add_eight_formula (k : ℕ) :
    9 * (2 * k) + 8 = 2 * (9 * k + 4) := by
  omega

/-- If k is odd, the factor 9*k+4 is odd. -/
theorem odd_k_implies_odd_nine_k_add_four
    (k : ℕ) (hk : k % 2 = 1) :
    (9 * k + 4) % 2 = 1 := by
  omega

/-- If k is even, the factor 9*k+4 is even, so the valuation split
continues at the next level. -/
theorem even_k_implies_even_nine_k_add_four
    (k : ℕ) (hk : k % 2 = 0) :
    2 ∣ 9 * k + 4 := by
  omega

/-- The second-step numerator in the even-m branch has at least two
factors of two before the final odd part is extracted. -/
theorem even_m_second_numerator_divisible_by_four
    (m : ℕ) (hm : m % 2 = 0) :
    4 ∣ 3 * (6 * m + 5) + 1 := by
  have h : 3 * (6 * m + 5) + 1 = 2 * (9 * m + 8) :=
    third_step_numerator_formula m
  rw [h]
  have htwo : 2 ∣ 9 * m + 8 := by omega
  obtain ⟨q, hq⟩ := htwo
  refine ⟨q, ?_⟩
  omega

 /-- In the class m = 4*j+2, the second-step numerator is four
times the odd number 18*j+13, so its 2-adic valuation is exactly two. -/
theorem second_numerator_v2_of_m_mod_four_two (j : ℕ) :
    v2 (3 * (6 * (4 * j + 2) + 5) + 1) = 2 := by
  have hnum :
      3 * (6 * (4 * j + 2) + 5) + 1 = 4 * (18 * j + 13) := by omega
  have hodd : (18 * j + 13) % 2 = 1 := by omega
  have h4 : 4 ∣ 3 * (6 * (4 * j + 2) + 5) + 1 := by
    rw [hnum]
    exact ⟨18 * j + 13, rfl⟩
  have h8 : ¬ 8 ∣ 3 * (6 * (4 * j + 2) + 5) + 1 := by
    rw [hnum]
    intro hdiv
    obtain ⟨q, hq⟩ := hdiv
    omega
  exact v2_eq_two_of_four_not_eight _ (by omega) h4 h8

/-- Exact accelerated output in the class m = 4*j+2. -/
theorem second_step_formula_of_m_mod_four_two (j : ℕ) :
    syracuse (6 * (4 * j + 2) + 5) = 18 * j + 13 := by
  have hnum :
      3 * (6 * (4 * j + 2) + 5) + 1 = 4 * (18 * j + 13) := by omega
  have hval : v2 (3 * (6 * (4 * j + 2) + 5) + 1) = 2 :=
    second_numerator_v2_of_m_mod_four_two j
  dsimp [syracuse]
  rw [hval, hnum]
  norm_num

/-- In the class m = 4*j, the second-step numerator has at least
three factors of two; further factors depend on j. -/
theorem second_numerator_divisible_by_eight_of_m_mod_four_zero
    (j : ℕ) :
    8 ∣ 3 * (6 * (4 * j) + 5) + 1 := by
  have hnum :
      3 * (6 * (4 * j) + 5) + 1 = 8 * (9 * j + 2) := by omega
  rw [hnum]
  exact ⟨9 * j + 2, rfl⟩

 /-- In the class m = 8*k+4, the second-step numerator is eight
times the odd number 18*k+11, so its valuation is exactly three. -/
theorem second_numerator_v2_of_m_mod_eight_four (k : ℕ) :
    v2 (3 * (6 * (8 * k + 4) + 5) + 1) = 3 := by
  have hnum :
      3 * (6 * (8 * k + 4) + 5) + 1 = 8 * (18 * k + 11) := by omega
  have hodd : (18 * k + 11) % 2 = 1 := by omega
  have h8 : 8 ∣ 3 * (6 * (8 * k + 4) + 5) + 1 := by
    rw [hnum]
    exact ⟨18 * k + 11, rfl⟩
  have h16 : ¬ 16 ∣ 3 * (6 * (8 * k + 4) + 5) + 1 := by
    rw [hnum]
    intro hdiv
    obtain ⟨q, hq⟩ := hdiv
    omega
  exact v2_eq_three_of_eight_not_sixteen _ (by omega) h8 h16

/-- Exact accelerated output in the class m = 8*k+4. -/
theorem second_step_formula_of_m_mod_eight_four (k : ℕ) :
    syracuse (6 * (8 * k + 4) + 5) = 18 * k + 11 := by
  have hnum :
      3 * (6 * (8 * k + 4) + 5) + 1 = 8 * (18 * k + 11) := by omega
  have hval : v2 (3 * (6 * (8 * k + 4) + 5) + 1) = 3 :=
    second_numerator_v2_of_m_mod_eight_four k
  dsimp [syracuse]
  rw [hval, hnum]
  norm_num

/-- In the class m = 8*k, the second-step numerator is divisible by
sixteen; its exact valuation may be larger. -/
theorem second_numerator_divisible_by_sixteen_of_m_mod_eight_zero
    (k : ℕ) :
    16 ∣ 3 * (6 * (8 * k) + 5) + 1 := by
  have hnum :
      3 * (6 * (8 * k) + 5) + 1 = 16 * (9 * k + 2) := by omega
  rw [hnum]
  exact ⟨9 * k + 2, rfl⟩

 /-- If k is odd, then 9*k+2 is odd. -/
theorem odd_k_implies_odd_nine_k_add_two
    (k : ℕ) (hk : k % 2 = 1) :
    (9 * k + 2) % 2 = 1 := by
  omega

/-- In the class m = 16*j+8, the second-step numerator is sixteen
times an odd number, so its 2-adic valuation is exactly four. -/
theorem second_numerator_v2_of_m_mod_sixteen_eight (j : ℕ) :
    v2 (3 * (6 * (16 * j + 8) + 5) + 1) = 4 := by
  have hnum :
      3 * (6 * (16 * j + 8) + 5) + 1 = 16 * (18 * j + 9) := by omega
  have hodd : (18 * j + 9) % 2 = 1 := by omega
  have h16 : 16 ∣ 3 * (6 * (16 * j + 8) + 5) + 1 := by
    rw [hnum]
    exact ⟨18 * j + 9, rfl⟩
  have h32 : ¬ 32 ∣ 3 * (6 * (16 * j + 8) + 5) + 1 := by
    rw [hnum]
    intro hdiv
    obtain ⟨q, hq⟩ := hdiv
    omega
  exact v2_eq_four_of_sixteen_not_thirty_two _ (by omega) h16 h32

/-- Exact accelerated output in the class m = 16*j+8. -/
theorem second_step_formula_of_m_mod_sixteen_eight (j : ℕ) :
    syracuse (6 * (16 * j + 8) + 5) = 18 * j + 9 := by
  have hnum :
      3 * (6 * (16 * j + 8) + 5) + 1 = 16 * (18 * j + 9) := by omega
  have hval : v2 (3 * (6 * (16 * j + 8) + 5) + 1) = 4 :=
    second_numerator_v2_of_m_mod_sixteen_eight j
  dsimp [syracuse]
  rw [hval, hnum]
  norm_num

/-- In the class m = 16*j, the second-step numerator is divisible by
thirty-two; its exact valuation may be larger. -/
theorem second_numerator_divisible_by_thirty_two_of_m_mod_sixteen_zero
    (j : ℕ) :
    32 ∣ 3 * (6 * (16 * j) + 5) + 1 := by
  have hnum :
      3 * (6 * (16 * j) + 5) + 1 = 32 * (9 * j + 1) := by omega
  rw [hnum]
  exact ⟨9 * j + 1, rfl⟩

/-- For even m the factor 9*m+8 is even, so the next valuation is at least
two; this records the branch condition without asserting a descent. -/
theorem even_m_second_step_reduction
    (m : ℕ) (hm : m % 2 = 0) :
    2 ∣ 9 * m + 8 := by
  omega

#print axioms CollatzSyracuseAudit.v2_eq_one_of_even_not_four
#print axioms CollatzSyracuseAudit.first_step_formula_mod_four_three
#print axioms CollatzSyracuseAudit.second_step_formula_of_odd_m
#print axioms CollatzSyracuseAudit.second_step_still_above_start_of_odd_m

end CollatzSyracuseAudit
