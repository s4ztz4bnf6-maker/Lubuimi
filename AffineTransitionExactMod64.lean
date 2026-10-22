import AffineTransitionDesign

namespace CollatzSyracuseAudit

/-- Exact two-step Syracuse output for inputs congruent to 3 modulo 64. -/
theorem mod64_three_two_step_exact (m : ℕ) :
    syracuse (syracuse (64 * m + 3)) = 18 * m + 1 := by
  have hinput : 64 * m + 3 = 4 * (16 * m) + 3 := by omega
  rw [hinput, first_step_formula_mod_four_three (16 * m)]
  exact second_step_formula_of_m_mod_sixteen_zero m

/-- The second-step numerator for inputs congruent to 35 modulo 64
is 32 times the residual factor 9*m+5. -/
theorem mod64_thirtyfive_second_numerator_factor32 (m : ℕ) :
    3 * (96 * m + 53) + 1 = 32 * (9 * m + 5) := by
  omega

/-- The first Syracuse step from 64*m+35 is exact. -/
theorem mod64_thirtyfive_first_step_exact (m : ℕ) :
    syracuse (64 * m + 35) = 96 * m + 53 := by
  have hinput : 64 * m + 35 = 4 * (16 * m + 8) + 3 := by omega
  rw [hinput, first_step_formula_mod_four_three]
  omega

#print axioms CollatzSyracuseAudit.mod64_three_two_step_exact
#print axioms CollatzSyracuseAudit.mod64_thirtyfive_second_numerator_factor32
#print axioms CollatzSyracuseAudit.mod64_thirtyfive_first_step_exact

end CollatzSyracuseAudit
