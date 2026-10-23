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

/-- The one-step valuation-one branch is the residue class 3 modulo 4.
This is a finite congruence fact, not a statement about eventual descent. -/
theorem numerator_mod_four_eq_two_iff_residue_three (n : ℕ) :
    (3 * n + 1) % 4 = 2 ↔ n % 4 = 3 := by
  omega

#print axioms numerator_mod_four_eq_two_iff_residue_three

/-- General exact-valuation criterion: for a nonzero natural number, the
2-adic exponent is exactly a iff the number is divisible by 2^a but not by
2^(a+1). This packages the divisibility/nondivisibility induction step for
finite valuation words without hard-coding exponents 1, 2, 3, or 4. -/
theorem v2_eq_iff_pow_dvd_not_next_pow_dvd
    (m a : ℕ) (hm : m ≠ 0) :
    CollatzSyracuseAudit.v2 m = a ↔
      2 ^ a ∣ m ∧ ¬ 2 ^ (a + 1) ∣ m := by
  unfold CollatzSyracuseAudit.v2
  have hpow : 2 ^ a ∣ m ↔ a ≤ m.factorization 2 := by
    exact Nat.prime_two.pow_dvd_iff_le_factorization hm
  have hnext :
      2 ^ (a + 1) ∣ m ↔ a + 1 ≤ m.factorization 2 := by
    exact Nat.prime_two.pow_dvd_iff_le_factorization hm
  constructor
  · intro hv
    constructor
    · exact hpow.mpr (by omega)
    · intro hdiv
      have hle := hnext.mp hdiv
      omega
  · rintro ⟨hdiv, hnot⟩
    have hge := hpow.mp hdiv
    have hnotle : ¬ a + 1 ≤ m.factorization 2 := by
      intro hle
      exact hnot (hnext.mpr hle)
    omega

#print axioms v2_eq_iff_pow_dvd_not_next_pow_dvd


namespace CollatzSyracuseAudit

/-- A local descent certificate records the exact prefix scale and affine
margin. It certifies only the supplied realized trajectory, not global
termination of every Syracuse orbit. -/
structure DescentPrefixCertificate (a n : ℕ → ℕ) where
  k : ℕ
  scale_gt : 3 ^ k < 2 ^ cumulativeExponent a k
  margin :
    3 ^ k * n 0 + affineConstantTerm a k <
      2 ^ cumulativeExponent a k * n 0

/-- A descent-prefix certificate is sound for the exact transition sequence. -/
theorem descentPrefixCertificate_sound
    (a n : ℕ → ℕ)
    (hstep : ∀ i, 2 ^ (a i) * n (i + 1) = 3 * n i + 1)
    (C : DescentPrefixCertificate a n) :
    n C.k < n 0 :=
  (strict_descent_iff_affine_margin a n hstep C.k).2 C.margin

#print axioms descentPrefixCertificate_sound

/-- A dual obstruction records a positive scale difference but an offset
large enough to prevent the strict affine margin at this prefix. The scale
condition is essential: without it, the difference is not a positive
descent denominator. -/
structure NonDescentPrefixObstruction (a n : ℕ → ℕ) where
  k : ℕ
  scale_gt : 3 ^ k < 2 ^ cumulativeExponent a k
  offset_bound :
    (2 ^ cumulativeExponent a k - 3 ^ k) * n 0 ≤
      affineConstantTerm a k

/-- The obstruction certificate rules out strict descent at its recorded
prefix. This is the exact multiplicative form of the floor-threshold
obstruction, avoiding division in the kernel-facing certificate. -/
theorem nonDescentPrefixObstruction_sound
    (a n : ℕ → ℕ)
    (hstep : ∀ i, 2 ^ (a i) * n (i + 1) = 3 * n i + 1)
    (O : NonDescentPrefixObstruction a n) :
    n 0 ≤ n O.k := by
  have hscale := O.scale_gt
  have hD :
      3 ^ O.k + (2 ^ cumulativeExponent a O.k - 3 ^ O.k) =
        2 ^ cumulativeExponent a O.k :=
    Nat.add_sub_of_le (Nat.le_of_lt hscale)
  have hsum :
      3 ^ O.k * n 0 +
          (2 ^ cumulativeExponent a O.k - 3 ^ O.k) * n 0 ≤
        3 ^ O.k * n 0 + affineConstantTerm a O.k :=
    Nat.add_le_add_left O.offset_bound (3 ^ O.k * n 0)
  have hscaleEq :
      3 ^ O.k * n 0 +
          (2 ^ cumulativeExponent a O.k - 3 ^ O.k) * n 0 =
        2 ^ cumulativeExponent a O.k * n 0 := by
    rw [← Nat.add_mul, hD]
  have hbound :
      2 ^ cumulativeExponent a O.k * n 0 ≤
        3 ^ O.k * n 0 + affineConstantTerm a O.k := by
    rw [← hscaleEq]
    exact hsum
  by_contra hnot
  have hdesc : n O.k < n 0 := by omega
  have hmargin :=
    (strict_descent_iff_affine_margin a n hstep O.k).1 hdesc
  omega

#print axioms nonDescentPrefixObstruction_sound

end CollatzSyracuseAudit
