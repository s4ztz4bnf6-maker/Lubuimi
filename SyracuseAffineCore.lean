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

/--
Three prescribed odd Syracuse steps eliminate both intermediate states.
As with the two-step identity, this is conditional algebra, not a claim that
an arbitrary exponent word is realizable by an orbit.
-/
theorem three_step_affine_identity
    (x y z w a b c : ℕ)
    (h₁ : 2 ^ a * y = 3 * x + 1)
    (h₂ : 2 ^ b * z = 3 * y + 1)
    (h₃ : 2 ^ c * w = 3 * z + 1) :
    2 ^ (a + b + c) * w = 27 * x + 9 + 3 * 2 ^ a + 2 ^ (a + b) := by
  rw [pow_add, pow_add]
  calc
    (2 ^ a * 2 ^ b * 2 ^ c) * w =
        (2 ^ a * 2 ^ b) * (2 ^ c * w) := by ring
    _ = (2 ^ a * 2 ^ b) * (3 * z + 1) := by rw [h₃]
    _ = 3 * ((2 ^ a * 2 ^ b) * z) + 2 ^ (a + b) := by
      rw [← pow_add]
      ring
    _ = 3 * (2 ^ a * (2 ^ b * z)) + 2 ^ (a + b) := by ring
    _ = 3 * (2 ^ a * (3 * y + 1)) + 2 ^ (a + b) := by rw [h₂]
    _ = 3 * (3 * (2 ^ a * y) + 2 ^ a) + 2 ^ (a + b) := by ring
    _ = 3 * (3 * (3 * x + 1) + 2 ^ a) + 2 ^ (a + b) := by rw [h₁]
    _ = 27 * x + 9 + 3 * 2 ^ a + 2 ^ (a + b) := by ring


/--
Four prescribed odd Syracuse steps eliminate all intermediate states.
This remains a conditional affine identity: it does not establish
realizability of an arbitrary valuation word or global Collatz convergence.
-/
theorem four_step_affine_identity
    (x y z w v a b c d : ℕ)
    (h₁ : 2 ^ a * y = 3 * x + 1)
    (h₂ : 2 ^ b * z = 3 * y + 1)
    (h₃ : 2 ^ c * w = 3 * z + 1)
    (h₄ : 2 ^ d * v = 3 * w + 1) :
    2 ^ (a + b + c + d) * v =
      81 * x + 27 + 9 * 2 ^ a + 3 * 2 ^ (a + b) + 2 ^ (a + b + c) := by
  rw [pow_add, pow_add, pow_add]
  calc
    (2 ^ a * 2 ^ b * 2 ^ c * 2 ^ d) * v =
        (2 ^ a * 2 ^ b * 2 ^ c) * (2 ^ d * v) := by ring
    _ = (2 ^ a * 2 ^ b * 2 ^ c) * (3 * w + 1) := by rw [h₄]
    _ = 3 * ((2 ^ a * 2 ^ b * 2 ^ c) * w) + 2 ^ (a + b + c) := by
      rw [← pow_add, ← pow_add]
      ring
    _ = 3 * ((2 ^ a * 2 ^ b) * (2 ^ c * w)) + 2 ^ (a + b + c) := by ring
    _ = 3 * ((2 ^ a * 2 ^ b) * (3 * z + 1)) + 2 ^ (a + b + c) := by rw [h₃]
    _ = 9 * ((2 ^ a * 2 ^ b) * z) + 3 * 2 ^ (a + b) +
        2 ^ (a + b + c) := by
      rw [← pow_add]
      ring
    _ = 9 * (2 ^ a * (2 ^ b * z)) + 3 * 2 ^ (a + b) +
        2 ^ (a + b + c) := by ring
    _ = 9 * (2 ^ a * (3 * y + 1)) + 3 * 2 ^ (a + b) +
        2 ^ (a + b + c) := by rw [h₂]
    _ = 27 * (2 ^ a * y) + 9 * 2 ^ a + 3 * 2 ^ (a + b) +
        2 ^ (a + b + c) := by ring
    _ = 27 * (3 * x + 1) + 9 * 2 ^ a + 3 * 2 ^ (a + b) +
        2 ^ (a + b + c) := by rw [h₁]
    _ = 81 * x + 27 + 9 * 2 ^ a + 3 * 2 ^ (a + b) +
        2 ^ (a + b + c) := by ring

end SyracuseAudit
