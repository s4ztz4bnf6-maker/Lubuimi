import Mathlib

/-!
# Exact threshold form of the Syracuse block-descent condition

This module does not prove that arbitrary Syracuse blocks descend. It
repackages the affine block identity into a threshold test.

For a certified block, take p = 3^N, q = 2^A, and R the accumulated
positive offset. Then p*n₀ + R < q*n₀ is equivalent, when p < q, to
R < (q-p)*n₀. This is an exact arithmetic characterization, not a global
Collatz result.
-/

namespace SyracuseThresholdMargin

theorem offset_margin_iff
    (n p q R : ℕ) (hpq : p < q) :
    p * n + R < q * n ↔ R < (q - p) * n := by
  have hdecomp : p + (q - p) = q :=
    Nat.add_sub_of_le (Nat.le_of_lt hpq)
  have hmul : q * n = p * n + (q - p) * n := by
    rw [← Nat.add_mul, hdecomp]
  rw [hmul]
  omega

theorem strict_margin_of_descent
    (n p q R : ℕ) (_hn : 0 < n)
    (hdesc : p * n + R < q * n) :
    p < q ∧ R < (q - p) * n := by
  have hpq : p < q := by
    by_contra hnot
    have hle : q ≤ p := Nat.le_of_not_gt hnot
    have hmul : q * n ≤ p * n := Nat.mul_le_mul_right n hle
    omega
  exact ⟨hpq, (offset_margin_iff n p q R hpq).mp hdesc⟩

theorem descent_of_strict_margin
    (n p q R : ℕ) (hpq : p < q)
    (hthreshold : R < (q - p) * n) :
    p * n + R < q * n :=
  (offset_margin_iff n p q R hpq).mpr hthreshold

#print axioms SyracuseThresholdMargin.offset_margin_iff
#print axioms SyracuseThresholdMargin.strict_margin_of_descent
#print axioms SyracuseThresholdMargin.descent_of_strict_margin

end SyracuseThresholdMargin
