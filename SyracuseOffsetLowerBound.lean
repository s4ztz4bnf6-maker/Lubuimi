import Mathlib

namespace CollatzSyracuseAudit

/--
The affine offset grows at least geometrically: if
  C (j+1) = 3 * C j + 2 ^ A j
and C 0 = 0, then C k ≥ 3^(k-1) for every positive k.

This is a necessary lower bound on the offset, not a descent theorem.
It does not establish the strict offset margin for any actual orbit.
-/
theorem offset_lower_bound_of_recurrence
    (A C : ℕ → ℕ)
    (hC0 : C 0 = 0)
    (hC : ∀ j, C (j + 1) = 3 * C j + 2 ^ A j) :
    ∀ k, 0 < k → 3 ^ (k - 1) ≤ C k := by
  have hshift : ∀ j, 3 ^ j ≤ C (j + 1) := by
    intro j
    induction j with
    | zero =>
        have hC1 : 1 ≤ C 1 := by
          rw [hC 0, hC0]
          have hp : 0 < 2 ^ A 0 := by positivity
          omega
        simpa using hC1
    | succ j ih =>
        calc
          3 ^ (j + 1) = 3 * 3 ^ j := by rw [pow_succ]; ring
          _ ≤ 3 * C (j + 1) := Nat.mul_le_mul_left 3 ih
          _ ≤ C ((j + 1) + 1) := by
            rw [hC (j + 1)]
            exact Nat.le_add_right _ _
  intro k hk
  have hk1 : 1 ≤ k := by omega
  have hsub : k - 1 + 1 = k := Nat.sub_add_cancel hk1
  rw [← hsub]
  exact hshift (k - 1)

#print axioms CollatzSyracuseAudit.offset_lower_bound_of_recurrence

end CollatzSyracuseAudit
