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

/-- Inputs congruent to 3 modulo 64 strictly descend after two accelerated
Syracuse steps. The exact output is 18*m+1, which is below 64*m+3;
this closes a second explicit residue class without claiming global descent. -/
theorem mod64_three_two_step_descent (m : ℕ) :
    syracuse (syracuse (64 * m + 3)) < 64 * m + 3 := by
  rw [mod64_three_two_step_exact]
  omega

#print axioms mod64_three_two_step_descent

/-- Residue-class interface: any natural number congruent to 3 modulo 64
strictly descends after two accelerated Syracuse steps. -/
theorem mod64_three_two_step_descent_of_residue (n : ℕ)
    (hn : n % 64 = 3) :
    syracuse (syracuse n) < n := by
  have hdecomp : n = 64 * (n / 64) + 3 := by omega
  rw [hdecomp]
  exact mod64_three_two_step_descent (n / 64)

#print axioms mod64_three_two_step_descent_of_residue

#print axioms CollatzSyracuseAudit.mod64_thirtyfive_second_numerator_factor32
#print axioms CollatzSyracuseAudit.mod64_thirtyfive_first_step_exact


/-- Every input congruent to 3 modulo 32 strictly descends after two
accelerated Syracuse steps. This combines the exact affine block bound
with the residue-class decomposition; it strictly generalizes the two
modulo-64 cases proved above. -/
theorem mod32_three_two_step_descent (k : ℕ) :
    syracuse (syracuse (32 * k + 3)) < 32 * k + 3 := by
  have hb := two_step_affine_bound_mod32_three k
  have hq : (syracuse (syracuse (32 * k + 3)) : ℚ) ≤
      (9 * k + 1 : ℚ) := by
    calc
      (syracuse (syracuse (32 * k + 3)) : ℚ) ≤
          (9 / 32 : ℚ) * (32 * k + 3) + 5 / 32 := hb
      _ = (9 * k + 1 : ℚ) := by push_cast; ring
  have hn : syracuse (syracuse (32 * k + 3)) ≤ 9 * k + 1 :=
    Nat.cast_le.mp (by exact_mod_cast hq)
  omega

/-- Residue-class form of the modulo-32 descent result. -/
theorem mod32_three_two_step_descent_of_residue (n : ℕ)
    (hn : n % 32 = 3) :
    syracuse (syracuse n) < n := by
  have hdecomp : n = 32 * (n / 32) + 3 := by omega
  rw [hdecomp]
  exact mod32_three_two_step_descent (n / 32)

end CollatzSyracuseAudit
