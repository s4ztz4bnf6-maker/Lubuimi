import SyracuseOffsetIdentity

/-!
# Closed form for the Syracuse affine offset

For a certified odd-to-odd exponent word, the offset recurrence
C (j+1) = 3*C j + 2^(A j) has the exact finite-sum solution
C j = ∑ i<j, 3^(j-(i+1))*2^(A i).

This is a bookkeeping identity, not a descent theorem. Its purpose is to
expose exactly which earlier exponent positions contribute to the terminal
offset, so later residue-cylinder and margin arguments can reason about
the whole exponent word rather than only its last step.
-/

namespace CollatzSyracuseAudit

/-- Closed-form affine offset associated with a cumulative exponent sequence. -/
def offsetClosedForm (A : ℕ → ℕ) (j : ℕ) : ℕ :=
  ∑ i ∈ Finset.range j, 3 ^ (j - (i + 1)) * 2 ^ (A i)

/-- One-step recurrence of the closed-form offset. -/
theorem offsetClosedForm_succ (A : ℕ → ℕ) (j : ℕ) :
    offsetClosedForm A (j + 1) =
      3 * offsetClosedForm A j + 2 ^ (A j) := by
  unfold offsetClosedForm
  rw [Finset.sum_range_succ]
  have hsum :
      (∑ i ∈ Finset.range j, 3 ^ ((j + 1) - (i + 1)) * 2 ^ (A i)) =
        3 * (∑ i ∈ Finset.range j, 3 ^ (j - (i + 1)) * 2 ^ (A i)) := by
    calc
      (∑ i ∈ Finset.range j, 3 ^ ((j + 1) - (i + 1)) * 2 ^ (A i))
          = ∑ i ∈ Finset.range j,
              3 * (3 ^ (j - (i + 1)) * 2 ^ (A i)) := by
                apply Finset.sum_congr rfl
                intro i hi
                have hij : (j + 1) - (i + 1) = (j - (i + 1)) + 1 := by
                  have hi' : i < j := Finset.mem_range.mp hi
                  omega
                rw [hij, pow_succ]
                ring
      _ = 3 * (∑ i ∈ Finset.range j, 3 ^ (j - (i + 1)) * 2 ^ (A i)) := by
            rw [Finset.mul_sum]
  simp only [Nat.sub_self, pow_zero, one_mul]
  rw [hsum]

/-- The recursively accumulated offset equals its closed form at every prefix. -/
theorem offset_eq_closed_form
    (A C : ℕ → ℕ)
    (hC0 : C 0 = 0)
    (hC : ∀ j, C (j + 1) = 3 * C j + 2 ^ (A j)) :
    ∀ j, C j = offsetClosedForm A j := by
  intro j
  induction j with
  | zero =>
      simp [offsetClosedForm, hC0]
  | succ j ih =>
      rw [hC j, offsetClosedForm_succ, ih]

#print axioms offsetClosedForm_succ
#print axioms offset_eq_closed_form

end CollatzSyracuseAudit
