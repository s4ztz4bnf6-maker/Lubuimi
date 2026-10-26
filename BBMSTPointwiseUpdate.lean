import Mathlib

set_option autoImplicit false

/-!
# BBMST pointwise update: scalar normalization

This module formalizes the source's two distinct pointwise multipliers.
It proves their weighted normalization for a genuine interior fiber
(0 < alpha < 1, 0 < delta < 1), plus basic admissibility bounds. It does not
yet construct the evolving probability measure or prove the full finite-set
distortion statements of Lemma 2.1.
-/

namespace BBMSTPointwiseUpdate

/-- Multiplier on points in the removed/covered part of a fiber. -/
noncomputable def coveredMultiplier (α δ : ℚ) : ℚ :=
  max 0 ((α - δ) / (α * (1 - δ)))

/-- Multiplier on points outside the removed/covered part of a fiber. -/
noncomputable def uncoveredMultiplier (α δ : ℚ) : ℚ :=
  min (1 / (1 - α)) (1 / (1 - δ))

/-- The covered multiplier is always nonnegative. -/
theorem coveredMultiplier_nonneg (α δ : ℚ) :
    0 ≤ coveredMultiplier α δ := by
  exact le_max_left 0 ((α - δ) / (α * (1 - δ)))

/-- On an interior fiber, the uncovered multiplier is strictly positive. -/
theorem uncoveredMultiplier_pos
    (α δ : ℚ) (hα1 : α < 1) (hδ1 : δ < 1) :
    0 < uncoveredMultiplier α δ := by
  have hα : 0 < (1 : ℚ) / (1 - α) := div_pos one_pos (by linarith)
  have hδ : 0 < (1 : ℚ) / (1 - δ) := div_pos one_pos (by linarith)
  exact lt_min hα hδ

/-- The two source multipliers conserve the total mass of an interior fiber:
the covered fraction is weighted by the first multiplier and its complement
by the second. The proof splits at α = δ, where the max/min switch branches. -/
theorem pointwise_update_normalized
    (α δ : ℚ) (hα0 : 0 < α) (hα1 : α < 1)
    (hδ0 : 0 < δ) (hδ1 : δ < 1) :
    α * coveredMultiplier α δ +
      (1 - α) * uncoveredMultiplier α δ = 1 := by
  have hαden : 0 < α * (1 - δ) := mul_pos hα0 (by linarith)
  have hαcomp : 0 < 1 - α := by linarith
  have hδcomp : 0 < 1 - δ := by linarith
  by_cases hαδ : α ≤ δ
  · have hratio : (α - δ) / (α * (1 - δ)) ≤ 0 :=
      div_nonpos_of_nonpos_of_nonneg
        (sub_nonpos.mpr hαδ) (le_of_lt hαden)
    have hmin : 1 / (1 - α) ≤ 1 / (1 - δ) := by
      rw [div_le_div_iff₀ hαcomp hδcomp]
      nlinarith
    simp only [coveredMultiplier, uncoveredMultiplier,
      max_eq_left hratio, min_eq_left hmin]
    field_simp
    ring
  · have hδα : δ ≤ α := le_of_not_ge hαδ
    have hratio : 0 ≤ (α - δ) / (α * (1 - δ)) :=
      div_nonneg (sub_nonneg.mpr hδα) (le_of_lt hαden)
    have hmin : 1 / (1 - δ) ≤ 1 / (1 - α) := by
      rw [div_le_div_iff₀ hδcomp hαcomp]
      nlinarith
    simp only [coveredMultiplier, uncoveredMultiplier,
      max_eq_right hratio, min_eq_right hmin]
    field_simp
    ring

#print axioms coveredMultiplier_nonneg
#print axioms uncoveredMultiplier_pos
#print axioms pointwise_update_normalized

end BBMSTPointwiseUpdate
