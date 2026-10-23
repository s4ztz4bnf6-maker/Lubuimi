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
  have hscale : 2 ^ cumulativeExponent a k ≤ 3 ^ k := by
    omega
  have hno := no_strict_descent_when_scale_le a n hstep k hscale
  omega

#print axioms strict_descent_forces_scale_gt


/-- Exact descent criterion with the additive affine residual exposed.
Unlike the scale-only obstruction, this equivalence is both necessary and
sufficient: the valuation scale and the accumulated offset must be compared
together. -/
theorem strict_descent_iff_affine_margin
    (a n : ℕ → ℕ)
    (hstep : ∀ i, 2 ^ (a i) * n (i + 1) = 3 * n i + 1)
    (k : ℕ) :
    n k < n 0 ↔
      3 ^ k * n 0 + affineConstantTerm a k <
        2 ^ cumulativeExponent a k * n 0 := by
  have hid := affine_iteration_identity a n hstep k
  have hscale : 0 < 2 ^ cumulativeExponent a k := by positivity
  constructor
  · intro hdesc
    have hmul :
        2 ^ cumulativeExponent a k * n k <
          2 ^ cumulativeExponent a k * n 0 :=
      Nat.mul_lt_mul_of_pos_left hdesc hscale
    rw [hid] at hmul
    exact hmul
  · intro hmargin
    have hmul :
        2 ^ cumulativeExponent a k * n k <
          2 ^ cumulativeExponent a k * n 0 := by
      rw [hid]
      exact hmargin
    exact Nat.lt_of_mul_lt_mul_left hmul

#print axioms strict_descent_iff_affine_margin


/-- A finite valuation word is realizable only when it is carried by an
actual state sequence. The exact valuation field rules out symbolic
"phantom paths": each exponent is the 2-adic valuation of the actual
transition numerator, and the recurrence fixes the next state. -/
structure RealizedValuationWord (k : ℕ) where
  state : Fin (k + 1) → ℕ
  exponent : Fin k → ℕ
  transition : ∀ i : Fin k,
    2 ^ exponent i * state i.succ = 3 * state i.castSucc + 1
  exact_valuation : ∀ i : Fin k,
    exponent i = v2 (3 * state i.castSucc + 1)

/-- In a realized word, the exponent at each position is determined by the
current state; it is not an independent symbolic choice. -/
theorem realized_exponent_forced
    {k : ℕ} (W : RealizedValuationWord k) (i : Fin k) :
    W.exponent i = v2 (3 * W.state i.castSucc + 1) :=
  W.exact_valuation i

#print axioms realized_exponent_forced

end CollatzSyracuseAudit
