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
  have hp : 0 < (2 : ℕ) ^ A := Nat.pow_pos (by decide)
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

/-- Exact offset criterion: once the affine prefix identity is fixed,
strict descent is equivalent to the accumulated offset staying below the
available scale margin. -/
theorem descent_iff_offset_below_scale_margin
    (A j n₀ C nⱼ : ℕ)
    (h_affine : 2 ^ A * nⱼ = 3 ^ j * n₀ + C) :
    nⱼ < n₀ ↔ 3 ^ j * n₀ + C < 2 ^ A * n₀ := by
  constructor
  · intro hdescent
    have hp : 0 < (2 : ℕ) ^ A := Nat.pow_pos (by decide)
    have hmul : 2 ^ A * nⱼ < 2 ^ A * n₀ :=
      Nat.mul_lt_mul_of_pos_left hdescent hp
    rw [← h_affine]
    exact hmul
  · intro hoffset
    have hp : 0 < (2 : ℕ) ^ A := Nat.pow_pos (by decide)
    have hmul : 2 ^ A * nⱼ < 2 ^ A * n₀ := by
      rw [h_affine]
      exact hoffset
    exact (Nat.mul_lt_mul_left hp).mp hmul

/-- A finite, executable checker for the exact offset-margin inequality.
This only checks the arithmetic certificate; it does not establish that
the supplied affine identity corresponds to a genuine Syracuse orbit. -/
def offsetMarginCheck (A j n₀ C : ℕ) : Bool :=
  decide (3 ^ j * n₀ + C < 2 ^ A * n₀)

/-- Soundness of the boolean offset-margin checker. -/
theorem offsetMarginCheck_sound
    (A j n₀ C : ℕ)
    (hcheck : offsetMarginCheck A j n₀ C = true) :
    3 ^ j * n₀ + C < 2 ^ A * n₀ := by
  exact of_decide_eq_true hcheck

/-- If an exact affine prefix identity is supplied and the finite checker
accepts its offset margin, strict descent follows. -/
theorem certified_strict_descent
    (A j n₀ C nⱼ : ℕ)
    (h_affine : 2 ^ A * nⱼ = 3 ^ j * n₀ + C)
    (hcheck : offsetMarginCheck A j n₀ C = true) :
    nⱼ < n₀ := by
  exact (descent_iff_offset_below_scale_margin A j n₀ C nⱼ h_affine).2
    (offsetMarginCheck_sound A j n₀ C hcheck)

#print axioms descent_iff_offset_below_scale_margin
#print axioms descent_requires_power_threshold
#print axioms no_descent_below_power_threshold
#print axioms offsetMarginCheck_sound
#print axioms certified_strict_descent

end SyracuseValuationBudgetFilter
