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
    ring
  rw [hpow]
  nlinarith [h_affine]

#print axioms affine_numerator_identity

end SyracuseExactPrefix
