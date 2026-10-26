import Mathlib

/-!
# BBMST scalar removed-mass inequality

This file isolates the scalar inequality underlying the two local moment bounds
in the BBMST fiber update. It is deliberately independent of the geometric
finite probability space; it does not prove Lemma 2.1 or the final sieve theorem.
-/

namespace BBMSTScalarMoment

/-- The normalized fraction of mass removed from a fiber of relative size α
at threshold δ. The max branch makes the expression meaningful for α ≤ δ. -/
noncomputable def removedFraction (α δ : ℚ) : ℚ :=
  max 0 ((α - δ) / (1 - δ))

/-- The removed fraction is bounded by the original fiber fraction and by
the second-moment expression. The assumptions ensure all denominators are
strictly positive. -/
theorem removedFraction_bounds (α δ : ℚ)
    (hα0 : 0 ≤ α) (hα1 : α ≤ 1)
    (hδ0 : 0 < δ) (hδ1 : δ < 1) :
    removedFraction α δ ≤ α ∧
      removedFraction α δ ≤ α ^ 2 / (4 * δ * (1 - δ)) := by
  have hden : 0 < 1 - δ := by linarith
  have hden2 : 0 < 4 * δ * (1 - δ) := by positivity
  by_cases hcut : α ≤ δ
  · have hquot : (α - δ) / (1 - δ) ≤ 0 :=
      div_nonpos_of_nonpos_of_nonneg (by linarith) (le_of_lt hden)
    unfold removedFraction
    rw [max_eq_left hquot]
    constructor
    · exact hα0
    · exact div_nonneg (sq_nonneg α) (le_of_lt hden2)
  · have hquot : 0 < (α - δ) / (1 - δ) :=
      div_pos (by linarith) hden
    have hnum : 4 * δ * (α - δ) ≤ α ^ 2 := by
      nlinarith [sq_nonneg (α - 2 * δ)]
    have hprod : 0 ≤ δ * (1 - α) :=
      mul_nonneg (le_of_lt hδ0) (sub_nonneg.mpr hα1)
    unfold removedFraction
    rw [max_eq_right (le_of_lt hquot)]
    constructor
    · apply (div_le_iff₀ hden).2
      nlinarith
    · rw [div_le_div_iff₀ hden hden2]
      have hscaled :=
        mul_le_mul_of_nonneg_right hnum (le_of_lt hden)
      nlinarith

/-- At α = 0 the removed mass fraction is exactly zero. -/
theorem removedFraction_zero (δ : ℚ) (hδ1 : δ < 1) :
    removedFraction 0 δ = 0 := by
  have hden : 0 < 1 - δ := by linarith
  have hquot : (0 - δ) / (1 - δ) ≤ 0 :=
    div_nonpos_of_nonpos_of_nonneg (by linarith) (le_of_lt hden)
  unfold removedFraction
  rw [max_eq_left hquot]

/-- At α = 1 the normalized removed fraction is exactly one, for 0 < δ < 1. -/
theorem removedFraction_one (δ : ℚ) (hδ0 : 0 < δ) (hδ1 : δ < 1) :
    removedFraction 1 δ = 1 := by
  have hden : 0 < 1 - δ := by linarith
  have hquot : 0 ≤ (1 - δ) / (1 - δ) := by positivity
  unfold removedFraction
  rw [max_eq_right hquot]
  field_simp


/-- Weighted finite-fiber form of the two scalar moment bounds.
The weights need only be nonnegative; normalization is not needed for this
inequality. In the BBMST application, the weights are the previous-stage
masses of the fibers. -/
theorem weighted_removedFraction_bounds {ι : Type*} [Fintype ι]
    (w α : ι → ℚ) (δ : ℚ)
    (hw : ∀ i, 0 ≤ w i)
    (hα0 : ∀ i, 0 ≤ α i)
    (hα1 : ∀ i, α i ≤ 1)
    (hδ0 : 0 < δ) (hδ1 : δ < 1) :
    (∑ i, w i * removedFraction (α i) δ) ≤ ∑ i, w i * α i ∧
    (∑ i, w i * removedFraction (α i) δ) ≤
      ∑ i, w i * ((α i) ^ 2 / (4 * δ * (1 - δ))) := by
  have hpoint := fun i =>
    removedFraction_bounds (α i) δ (hα0 i) (hα1 i) hδ0 hδ1
  constructor
  · apply Finset.sum_le_sum
    intro i hi
    exact mul_le_mul_of_nonneg_left (hpoint i).1 (hw i)
  · apply Finset.sum_le_sum
    intro i hi
    exact mul_le_mul_of_nonneg_left (hpoint i).2 (hw i)

#print axioms weighted_removedFraction_bounds

#print axioms removedFraction_bounds
#print axioms removedFraction_zero
#print axioms removedFraction_one

end BBMSTScalarMoment
