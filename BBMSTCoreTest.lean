import Mathlib

namespace BBMST

theorem denominator_lower_bound
    (δ s : ℚ)
    (hδ_pos : 0 < δ)
    (hδ_half : δ ≤ 1 / 2)
    (hs_pos : 0 < s) :
    2 * δ * s ^ 2 ≤ 4 * δ * (1 - δ) * s ^ 2
      ∧ 0 < 4 * δ * (1 - δ) * s ^ 2 := by
  have h_one_minus : 0 < 1 - δ := by
    linarith
  have hfactor : 2 * δ ≤ 4 * δ * (1 - δ) := by
    nlinarith
  have hs_sq : 0 < s ^ 2 := sq_pos_of_pos hs_pos
  constructor
  · calc
      2 * δ * s ^ 2 ≤ (4 * δ * (1 - δ)) * s ^ 2 :=
        mul_le_mul_of_nonneg_right hfactor (sq_nonneg s)
      _ = 4 * δ * (1 - δ) * s ^ 2 := by ring
  · positivity

def momentFactor (s δ z : ℚ) : ℚ :=
  1 + z / ((1 - δ) * s)

def momentRun (initial z : ℚ) :
    List (ℚ × ℚ) → ℚ
  | [] => initial
  | (s, δ) :: rest =>
      momentRun (initial * momentFactor s δ z) z rest

def momentProduct (z : ℚ) :
    List (ℚ × ℚ) → ℚ
  | [] => 1
  | (s, δ) :: rest =>
      momentFactor s δ z * momentProduct z rest

theorem momentRun_eq_initial_mul_product
    (initial z : ℚ) (params : List (ℚ × ℚ)) :
    momentRun initial z params =
      initial * momentProduct z params := by
  induction params generalizing initial with
  | nil =>
      simp [momentRun, momentProduct]
  | cons q rest ih =>
      rcases q with ⟨s, δ⟩
      simp only [momentRun, momentProduct]
      rw [ih]
      ring

#print axioms BBMST.denominator_lower_bound
#print axioms BBMST.momentRun_eq_initial_mul_product

end BBMST
