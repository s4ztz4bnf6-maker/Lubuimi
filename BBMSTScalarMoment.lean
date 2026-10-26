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
theorem removedFraction_zero (δ : ℚ) (hδ0 : 0 ≤ δ) (hδ1 : δ < 1) :
    removedFraction 0 δ = 0 := by
  have hden : 0 < 1 - δ := by linarith
  have hnum : 0 - δ ≤ 0 := by linarith [hδ0]
  have hquot : (0 - δ) / (1 - δ) ≤ 0 :=
    div_nonpos_of_nonpos_of_nonneg hnum (le_of_lt hden)
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


/-- The weighted removed mass is bounded by the minimum of the first and
second weighted moments. This is the exact scalar-to-moment interface needed
before identifying these sums with the BBMST quantities Mₖ⁽¹⁾ and Mₖ⁽²⁾. -/
theorem weighted_removedFraction_sum_min {ι : Type*} [Fintype ι]
    (w α : ι → ℚ) (δ : ℚ)
    (hw : ∀ i, 0 ≤ w i)
    (hα0 : ∀ i, 0 ≤ α i)
    (hα1 : ∀ i, α i ≤ 1)
    (hδ0 : 0 < δ) (hδ1 : δ < 1) :
    (∑ i, w i * removedFraction (α i) δ) ≤
      min (∑ i, w i * α i)
        (∑ i, w i * ((α i) ^ 2 / (4 * δ * (1 - δ)))) := by
  rcases weighted_removedFraction_bounds w α δ hw hα0 hα1 hδ0 hδ1 with
    ⟨hfirst, hsecond⟩
  exact le_min hfirst hsecond

#print axioms weighted_removedFraction_sum_min

#print axioms weighted_removedFraction_bounds

#print axioms removedFraction_bounds
#print axioms removedFraction_zero
#print axioms removedFraction_one

end BBMSTScalarMoment


/-!
## Source-update normalization audit

The paper's local update has two different multipliers, one on the covered
part of a fiber and one on its complement. The following scalar identity
checks that their weighted average is one on a nondegenerate fiber. The
endpoint cases are handled separately in the actual finite-space proof,
because the corresponding part of the fiber is empty.
-/

/-- Covered-part multiplier in the BBMST update, on a nondegenerate fiber. -/
noncomputable def coveredUpdateMultiplier (α δ : ℚ) : ℚ :=
  max 0 ((α - δ) / (α * (1 - δ)))

/-- Uncovered-part multiplier in the BBMST update, on a nondegenerate fiber. -/
noncomputable def uncoveredUpdateMultiplier (α δ : ℚ) : ℚ :=
  min (1 / (1 - α)) (1 / (1 - δ))

/-- The source update preserves the total mass of each nondegenerate fiber:
the covered proportion times its multiplier plus the complementary
proportion times its multiplier equals one. This is scalar normalization,
not yet the full Lemma 2.1 measure-preservation theorem. -/
theorem source_update_fiber_normalization
    (α δ : ℚ) (hα0 : 0 < α) (hα1 : α < 1)
    (hδ0 : 0 < δ) (hδ1 : δ < 1) :
    α * coveredUpdateMultiplier α δ +
      (1 - α) * uncoveredUpdateMultiplier α δ = 1 := by
  have hαden : 0 < α * (1 - δ) := by positivity
  have hδden : 0 < 1 - δ := by linarith
  have hαcomp : 0 < 1 - α := by linarith
  by_cases hcut : α ≤ δ
  · have hcovered : (α - δ) / (α * (1 - δ)) ≤ 0 :=
      div_nonpos_of_nonpos_of_nonneg (by linarith)
        (le_of_lt hαden)
    have hunc : 1 / (1 - α) ≤ 1 / (1 - δ) := by
      apply (div_le_div_iff₀ hαcomp hδden).2
      nlinarith
    simp only [coveredUpdateMultiplier, uncoveredUpdateMultiplier,
      max_eq_left hcovered, min_eq_left hunc]
    field_simp
    <;> ring
  · have hcut' : δ < α := lt_of_not_ge hcut
    have hcovered : 0 ≤ (α - δ) / (α * (1 - δ)) :=
      div_nonneg (by linarith) (le_of_lt hαden)
    have hunc : 1 / (1 - δ) ≤ 1 / (1 - α) := by
      apply (div_le_div_iff₀ hδden hαcomp).2
      nlinarith
    simp only [coveredUpdateMultiplier, uncoveredUpdateMultiplier,
      max_eq_right hcovered, min_eq_right hunc]
    field_simp
    <;> ring

#print axioms source_update_fiber_normalization


/-- On a nondegenerate fiber, the covered-part multiplier never increases
pointwise mass. This is the local contraction inequality used when a set is
contained in the newly covered region. -/
theorem coveredUpdateMultiplier_le_one
    (α δ : ℚ) (hα0 : 0 < α) (hα1 : α ≤ 1)
    (hδ0 : 0 < δ) (hδ1 : δ < 1) :
    coveredUpdateMultiplier α δ ≤ 1 := by
  have hden : 0 < α * (1 - δ) := by positivity
  have hquot : (α - δ) / (α * (1 - δ)) ≤ 1 := by
    apply (div_le_iff₀ hden).2
    nlinarith
  unfold coveredUpdateMultiplier
  exact max_le (by norm_num) hquot

/-- The uncovered-part multiplier is bounded by the global distortion
factor 1/(1-δ). This is the pointwise estimate needed before summing over
fibers to obtain the global measure-distortion inequality. -/
theorem uncoveredUpdateMultiplier_le_global_factor
    (α δ : ℚ) (hα1 : α < 1) (hδ1 : δ < 1) :
    uncoveredUpdateMultiplier α δ ≤ 1 / (1 - δ) := by
  unfold uncoveredUpdateMultiplier
  exact min_le_right _ _

#print axioms coveredUpdateMultiplier_le_one
#print axioms uncoveredUpdateMultiplier_le_global_factor
