import AffineTransitionDesign

/-!
# Exact obstruction to descent from an insufficient cumulative valuation

The affine identity gives a deterministic obstruction, not a density
heuristic: if the cumulative power of two does not exceed the corresponding
power of three, the accelerated trajectory cannot have strictly descended
at that time. This is a local necessary-condition theorem only.
-/

namespace CollatzSyracuseAudit

theorem no_strict_descent_when_scale_le
    (a n : ℕ → ℕ)
    (hstep : ∀ i, 2 ^ (a i) * n (i + 1) = 3 * n i + 1)
    (k : ℕ)
    (hscale : 2 ^ cumulativeExponent a k ≤ 3 ^ k) :
    n 0 ≤ n k := by
  have hid := affine_iteration_identity a n hstep k
  have hpow : 0 < 2 ^ cumulativeExponent a k := by positivity
  have hmul : 2 ^ cumulativeExponent a k * n 0 ≤
      2 ^ cumulativeExponent a k * n k := by
    calc
      2 ^ cumulativeExponent a k * n 0 ≤ 3 ^ k * n 0 :=
        Nat.mul_le_mul_right (n 0) hscale
      _ ≤ 3 ^ k * n 0 + affineConstantTerm a k := by omega
      _ = 2 ^ cumulativeExponent a k * n k := hid.symm
  exact (Nat.le_of_mul_le_mul_left hmul hpow)

#print axioms no_strict_descent_when_scale_le

end CollatzSyracuseAudit

/-- Any strict descent at time k forces the cumulative 2-adic scale
to exceed 3^k. This is a necessary certificate, not a sufficient condition
for descent: the affine offset must still be controlled. -/
theorem strict_descent_forces_scale_gt
    (a n : ℕ → ℕ)
    (hstep : ∀ i, 2 ^ (a i) * n (i + 1) = 3 * n i + 1)
    (k : ℕ)
    (hdesc : n k < n 0) :
    3 ^ k < 2 ^ cumulativeExponent a k := by
  by_contra hnot
  have hscale : 2 ^ cumulativeExponent a k ≤ 3 ^ k :=
    Nat.le_of_not_gt hnot
  have hno := no_strict_descent_when_scale_le a n hstep k hscale
  omega

#print axioms strict_descent_forces_scale_gt
