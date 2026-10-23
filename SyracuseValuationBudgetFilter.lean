import Mathlib

namespace SyracuseValuationBudgetFilter

/-- For an exact affine Syracuse prefix, strict descent forces the
cumulative power of two to dominate the odd-growth factor. This is a
necessary condition, not a sufficient criterion for descent. -/
theorem descent_requires_power_threshold
    (A j n₀ C nⱼ : ℕ)
    (hn₀ : 0 < n₀)
    (h_affine : 2 ^ A * nⱼ = 3 ^ j * n₀ + C)
    (h_descent : nⱼ < n₀) :
    3 ^ j < 2 ^ A := by
  have hp : 0 < 2 ^ A := Nat.pow_pos (by omega : 0 < 2)
  have hmul : 2 ^ A * nⱼ < 2 ^ A * n₀ :=
    Nat.mul_lt_mul_of_pos_left h_descent hp
  have hbound : 3 ^ j * n₀ + C < 2 ^ A * n₀ := by
    rw [← h_affine]
    exact hmul
  have hweak : 3 ^ j * n₀ < 2 ^ A * n₀ := by omega
  exact (Nat.mul_lt_mul_right hn₀).mp hweak

/-- Contrapositive form: if the cumulative valuation budget does not
beat the odd-growth factor, no strict descent can occur at this prefix. -/
theorem no_descent_below_power_threshold
    (A j n₀ C nⱼ : ℕ)
    (hn₀ : 0 < n₀)
    (h_affine : 2 ^ A * nⱼ = 3 ^ j * n₀ + C)
    (h_budget : 2 ^ A ≤ 3 ^ j) :
    ¬ nⱼ < n₀ := by
  intro hdescent
  have h := descent_requires_power_threshold A j n₀ C nⱼ hn₀ h_affine hdescent
  omega

#print axioms descent_requires_power_threshold
#print axioms no_descent_below_power_threshold

end SyracuseValuationBudgetFilter
