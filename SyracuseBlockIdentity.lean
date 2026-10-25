import Mathlib

set_option autoImplicit false

namespace CollatzSyracuseAudit

/--
Exact two-step identity for certified accelerated transitions.
If 2^a * n₁ = 3*n₀+1 and 2^b * n₂ = 3*n₁+1, then
2^(a+b) * n₂ = 9*n₀ + 3 + 2^a.
The positive additive term is retained explicitly; this identity is not
a descent theorem and does not assume that the exponents are distributed
in any particular way.
-/
theorem accelerated_two_step_exact_identity
    (n₀ n₁ n₂ a b : ℕ)
    (h₀ : 2 ^ a * n₁ = 3 * n₀ + 1)
    (h₁ : 2 ^ b * n₂ = 3 * n₁ + 1) :
    2 ^ (a + b) * n₂ = 9 * n₀ + 3 + 2 ^ a := by
  calc
    2 ^ (a + b) * n₂ = 2 ^ a * (2 ^ b * n₂) := by
      rw [pow_add]
      ring
    _ = 2 ^ a * (3 * n₁ + 1) := by rw [h₁]
    _ = 3 * (2 ^ a * n₁) + 2 ^ a := by ring
    _ = 3 * (3 * n₀ + 1) + 2 ^ a := by rw [h₀]
    _ = 9 * n₀ + 3 + 2 ^ a := by ring

#print axioms accelerated_two_step_exact_identity

end CollatzSyracuseAudit
