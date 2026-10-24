import AffineTransitionDesign
import AffineTransitionValuation

namespace CollatzSyracuseAudit

/-- Exact two-step Syracuse output for inputs congruent to 3 modulo 64. -/
theorem mod64_three_two_step_exact (m : ℕ) :
    syracuse (syracuse (64 * m + 3)) = 18 * m + 1 := by
  have hinput : 64 * m + 3 = 4 * (16 * m) + 3 := by omega
  rw [hinput, first_step_formula_mod_four_three (16 * m)]
  exact second_step_formula_of_m_mod_sixteen_zero m

/--
Exact accelerated two-step formula on the residue class 35 modulo 64.
The first step is 96*m+53; the next numerator is 32*(9*m+5).
The valuation-scaling lemma removes the fixed factor 32 exactly, leaving
the Syracuse normalization of 9*m+5. This is a local identity only.
-/
theorem mod64_thirtyfive_two_step_exact (m : ℕ) :
    syracuse (syracuse (64 * m + 35)) =
      (9 * m + 5) / 2 ^ v2 (9 * m + 5) := by
  have hfirst : syracuse (64 * m + 35) = 96 * m + 53 := by
    have hinput : 64 * m + 35 = 4 * (16 * m + 8) + 3 := by omega
    rw [hinput, first_step_formula_mod_four_three]
    omega
  rw [hfirst]
  have hfactor : 3 * (96 * m + 53) + 1 = 32 * (9 * m + 5) := by omega
  have hnonzero : 9 * m + 5 ≠ 0 := by omega
  have hval : v2 (3 * (96 * m + 53) + 1) =
      5 + v2 (9 * m + 5) := by
    rw [hfactor]
    exact v2_mul_32 (9 * m + 5) hnonzero
  dsimp [syracuse]
  rw [hfactor, hval, pow_add]
  norm_num [Nat.mul_div_mul_left]

#print axioms CollatzSyracuseAudit.mod64_thirtyfive_two_step_exact

/--
Every input 64*m+35 strictly descends after two accelerated Syracuse steps.
The exact formula reduces the output to the odd part of 9*m+5, which is at
most 9*m+5 < 64*m+35. This closes this entire residue class locally.
-/
theorem mod64_thirtyfive_two_step_descent (m : ℕ) :
    syracuse (syracuse (64 * m + 35)) < 64 * m + 35 := by
  rw [mod64_thirtyfive_two_step_exact]
  have hquot :
      (9 * m + 5) / 2 ^ v2 (9 * m + 5) ≤ 9 * m + 5 :=
    Nat.div_le_self _ _
  omega

#print axioms CollatzSyracuseAudit.mod64_thirtyfive_two_step_descent

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
