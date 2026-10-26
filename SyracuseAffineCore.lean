import Mathlib

namespace SyracuseAudit

/--
Composing two prescribed Syracuse odd steps eliminates the intermediate
state. This is an algebraic identity conditional on both step equations;
it does not assert that a given valuation word is realizable.
-/
theorem two_step_affine_identity
    (x y z a b : ℕ)
    (h₁ : 2 ^ a * y = 3 * x + 1)
    (h₂ : 2 ^ b * z = 3 * y + 1) :
    2 ^ (a + b) * z = 9 * x + 3 + 2 ^ a := by
  rw [pow_add]
  calc
    (2 ^ a * 2 ^ b) * z = 2 ^ a * (2 ^ b * z) := by ring
    _ = 2 ^ a * (3 * y + 1) := by rw [h₂]
    _ = 3 * (2 ^ a * y) + 2 ^ a := by ring
    _ = 3 * (3 * x + 1) + 2 ^ a := by rw [h₁]
    _ = 9 * x + 3 + 2 ^ a := by ring

end SyracuseAudit
