import Mathlib

namespace SyracuseExactPrefix

/-- The start-value numerator equals the current transition numerator
multiplied by the accumulated power of two, whenever the affine identity
holds at the current state. -/
theorem affine_numerator_identity
    (A j n₀ C nⱼ : ℕ)
    (h_affine : 2 ^ A * nⱼ = 3 ^ j * n₀ + C) :
    3 ^ (j + 1) * n₀ + 3 * C + 2 ^ A =
      2 ^ A * (3 * nⱼ + 1) := by
  have hpow : 3 ^ (j + 1) = 3 ^ j * 3 := by
    rw [pow_succ]
  rw [hpow]
  nlinarith [h_affine]

/-- Any strict descent forces the exact affine numerator to lie below the
same accumulated power of two times the starting value. This is a necessary
arithmetic certificate; it does not assume a probabilistic model. -/
theorem descent_forces_offset_inequality
    (A j n₀ C nⱼ : ℕ)
    (h_affine : 2 ^ A * nⱼ = 3 ^ j * n₀ + C)
    (h_descent : nⱼ < n₀) :
    3 ^ j * n₀ + C < 2 ^ A * n₀ := by
  have hp : 0 < 2 ^ A := Nat.pow_pos (by omega)
  have hmul := Nat.mul_lt_mul_of_pos_left h_descent hp
  rw [h_affine] at hmul
  exact hmul

#print axioms affine_numerator_identity
#print axioms descent_forces_offset_inequality

end SyracuseExactPrefix
