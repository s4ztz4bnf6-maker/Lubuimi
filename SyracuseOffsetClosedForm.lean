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

/--
Exact arithmetic reduction for a prescribed exponent prefix.

The affine prefix value is below the scaled starting value precisely when
its offset is smaller than the difference of the two scaled coefficients.
The domination hypothesis is essential for interpreting the natural-number
subtraction as a nonnegative margin. This is an algebraic reduction only:
it does not establish that the actual Syracuse exponent word satisfies the
resulting inequality.
-/
theorem affine_prefix_descent_iff_product_margin
    (n A C j : ℕ)
    (hdom : 3 ^ j ≤ 2 ^ A) :
    3 ^ j * n + C < 2 ^ A * n ↔
      C < 2 ^ A * n - 3 ^ j * n := by
  have hprod : 3 ^ j * n ≤ 2 ^ A * n :=
    Nat.mul_le_mul_right n hdom
  omega

#print axioms offsetClosedForm_succ
#print axioms offset_eq_closed_form

end CollatzSyracuseAudit
