import Mathlib

/-!
Exact two-step Syracuse arithmetic, isolated from any global Collatz claim.

The hypotheses encode the two divisions without relying on truncated
natural-number division: 2^a * m = 3*n+1 and 2^b * k = 3*m+1.
-/

theorem syracuse_two_step_exact_identity
    (n m k a b : ℕ)
    (h₁ : 2 ^ a * m = 3 * n + 1)
    (h₂ : 2 ^ b * k = 3 * m + 1) :
    2 ^ (a + b) * k = 9 * n + 3 + 2 ^ a := by
  calc
    2 ^ (a + b) * k = 2 ^ a * (2 ^ b * k) := by
      rw [pow_add]
      ring
    _ = 2 ^ a * (3 * m + 1) := by rw [h₂]
    _ = 3 * (2 ^ a * m) + 2 ^ a := by ring
    _ = 3 * (3 * n + 1) + 2 ^ a := by rw [h₁]
    _ = 9 * n + 3 + 2 ^ a := by ring
