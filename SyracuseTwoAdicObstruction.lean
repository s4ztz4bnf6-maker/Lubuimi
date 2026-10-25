import Mathlib

set_option autoImplicit false

namespace CollatzSyracuseAudit

/--
The usual one-step Collatz rule, extended from natural numbers to integers.
This integer extension is useful for checking claims about a larger ambient
space; it is not itself a proof about positive natural-number orbits.
-/
def collatzIntStep (n : ℤ) : ℤ :=
  if n % 2 = 0 then n / 2 else (3 * n + 1) / 2

/-- Zero is a fixed point of the integer extension. -/
theorem collatzIntStep_zero : collatzIntStep 0 = 0 := by
  norm_num [collatzIntStep]

/-- Minus one is a second, distinct fixed point of the integer extension. -/
theorem collatzIntStep_neg_one : collatzIntStep (-1) = -1 := by
  norm_num [collatzIntStep]

/--
The integer extension therefore cannot have a unique fixed point on all of
ℤ. This blocks the inference that merely enlarging the state space forces a
single global sink. It says nothing against convergence of all positive
natural-number starts to 1.
-/
theorem collatzIntStep_has_two_distinct_fixed_points :
    collatzIntStep 0 = 0 ∧
    collatzIntStep (-1) = -1 ∧
    (0 : ℤ) ≠ -1 := by
  exact ⟨collatzIntStep_zero, collatzIntStep_neg_one, by norm_num⟩

#print axioms collatzIntStep_zero
#print axioms collatzIntStep_neg_one
#print axioms collatzIntStep_has_two_distinct_fixed_points

end CollatzSyracuseAudit
