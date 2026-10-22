import Mathlib

namespace CollatzSyracuseAudit

/-- If an affine numerator is strictly below n times the positive denominator,
its natural-number quotient is strictly below n. -/
theorem affine_quotient_lt_of_numerator_lt
    (n numerator denominator : ℕ)
    (hden : 0 < denominator)
    (hnum : numerator < denominator * n) :
    numerator / denominator < n := by
  exact (Nat.div_lt_iff_lt_mul hden).2 (by simpa [Nat.mul_comm] using hnum)

/-- Exact descent criterion for a block whose affine numerator is A*n+B:
this is the arithmetic obligation that remains after the cocycle identity
has identified the actual iterate with that quotient. -/
theorem affine_block_descent
    (n A B denominator : ℕ)
    (hden : 0 < denominator)
    (hbound : A * n + B < denominator * n) :
    (A * n + B) / denominator < n := by
  exact affine_quotient_lt_of_numerator_lt n (A * n + B) denominator
    hden hbound

/-- In the positive-coefficient regime, an explicit difference bound implies
the affine numerator inequality. -/
theorem affine_bound_from_difference
    (n A B denominator : ℕ)
    (hA : A < denominator)
    (hB : B < (denominator - A) * n) :
    A * n + B < denominator * n := by
  have hdiff : A + (denominator - A) = denominator := Nat.add_sub_of_le (Nat.le_of_lt hA)
  calc
    A * n + B < A * n + (denominator - A) * n := Nat.add_lt_add_left hB _
    _ = (A + (denominator - A)) * n := by rw [Nat.add_mul]
    _ = denominator * n := by rw [hdiff]

#print axioms affine_quotient_lt_of_numerator_lt
#print axioms affine_block_descent
#print axioms affine_bound_from_difference

end CollatzSyracuseAudit
