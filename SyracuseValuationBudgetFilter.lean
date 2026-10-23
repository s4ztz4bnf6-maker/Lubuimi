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
  exact (Nat.mul_lt_mul_right n₀).mpr hweak

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


/-- Exact offset criterion: once the affine prefix identity is fixed,
strict descent is equivalent to the accumulated offset staying below the
available scale margin. This is stronger than the valuation-only necessary
condition above and is suitable as a prefix-pruning certificate. -/
theorem descent_iff_offset_below_scale_margin
    (A j n₀ C nⱼ : ℕ)
    (h_affine : 2 ^ A * nⱼ = 3 ^ j * n₀ + C) :
    nⱼ < n₀ ↔ 3 ^ j * n₀ + C < 2 ^ A * n₀ := by
  constructor
  · intro hdescent
    have hp : 0 < 2 ^ A := Nat.pow_pos (by omega : 0 < 2)
    have hmul : 2 ^ A * nⱼ < 2 ^ A * n₀ :=
      Nat.mul_lt_mul_of_pos_left hdescent hp
    rw [← h_affine]
    exact hmul
  · intro hoffset
    have hmul : 2 ^ A * nⱼ < 2 ^ A * n₀ := by
      rw [h_affine]
      exact hoffset
    exact (Nat.mul_lt_mul_left (2 ^ A)).mp hmul

#print axioms descent_iff_offset_below_scale_margin

#print axioms descent_requires_power_threshold
#print axioms no_descent_below_power_threshold

end SyracuseValuationBudgetFilter
