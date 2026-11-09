import AffineTransitionExactMod64
import AffineTransitionValuation
import Mathlib.Tactic

namespace CollatzSyracuseAudit

/-- The accelerated Syracuse step from 96*m+53 is bounded by 9*m+5.
The exact numerator is 32*(9*m+5); its 2-adic valuation therefore includes
the five displayed powers of two, as well as any powers in the residual factor. -/
theorem mod64_thirtyfive_second_step_bound (m : ℕ) :
    syracuse (96 * m + 53) ≤ 9 * m + 5 := by
  have hnum : 3 * (96 * m + 53) + 1 = 32 * (9 * m + 5) := by omega
  have ha : 9 * m + 5 ≠ 0 := by omega
  have hval : v2 (32 * (9 * m + 5)) = 5 + v2 (9 * m + 5) :=
    v2_mul_32 (9 * m + 5) ha
  have hpow : 2 ^ v2 (32 * (9 * m + 5)) =
      32 * 2 ^ v2 (9 * m + 5) := by
    rw [hval, pow_add]
    norm_num
  rw [syracuse, hnum, hpow]
  rw [Nat.mul_div_mul_left (9 * m + 5) (2 ^ v2 (9 * m + 5)) (by norm_num)]
  exact Nat.div_le_self _ _

/-- Inputs congruent to 35 modulo 64 descend in two accelerated steps.
This closes one additional residue class, but not all odd inputs. -/
theorem mod64_thirtyfive_two_step_descent (m : ℕ) :
    syracuse (syracuse (64 * m + 35)) < 64 * m + 35 := by
  rw [mod64_thirtyfive_first_step_exact]
  have hbound := mod64_thirtyfive_second_step_bound m
  omega

#print axioms mod64_thirtyfive_second_step_bound
#print axioms mod64_thirtyfive_two_step_descent

end CollatzSyracuseAudit
