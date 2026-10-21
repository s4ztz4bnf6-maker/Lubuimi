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
