import Mathlib
import BBMSTScalarMoment

set_option autoImplicit false

/-!
# BBMST finite weighted moment interface

This module connects the scalar removed-fraction inequality to finite weighted
sums. It deliberately keeps the weights explicit: in the source-faithful
application they must be identified with the previous-stage fiber masses.
The module does not itself construct the evolving BBMST probability measures
or prove Lemma 2.1.
-/

namespace BBMSTProbabilityInterface

/-- First weighted moment of the finite fiber proportions. -/
def firstMoment {ι : Type*} [Fintype ι]
    (w alpha : ι → ℚ) : ℚ :=
  ∑ i, w i * alpha i

/-- Second weighted moment of the finite fiber proportions. -/
def secondMoment {ι : Type*} [Fintype ι]
    (w alpha : ι → ℚ) : ℚ :=
  ∑ i, w i * alpha i ^ 2

/-- Total weight of a finite family. -/
def totalWeight {ι : Type*} [Fintype ι] (w : ι → ℚ) : ℚ :=
  ∑ i, w i

/-- The weighted removed fraction, before the source-specific identification
of the weights with the BBMST previous-stage measure. -/
noncomputable def removedMassBounded {ι : Type*} [Fintype ι]
    (w alpha : ι → ℚ) (delta : ℚ) : ℚ :=
  ∑ i, w i * BBMSTScalarMoment.removedFraction (alpha i) delta

/-- The scaled second-moment expression that appears directly in the
pointwise scalar inequality. -/
def scaledSecondMoment {ι : Type*} [Fintype ι]
    (w alpha : ι → ℚ) (delta : ℚ) : ℚ :=
  ∑ i, w i * (alpha i ^ 2 / (4 * delta * (1 - delta)))

/-- If weights are nonnegative and every fiber proportion lies in [0,1],
the removed mass is bounded by both the first weighted moment and the
scaled second-moment expression. -/
theorem removedMass_le_first_and_scaled_second
    {ι : Type*} [Fintype ι]
    (w alpha : ι → ℚ) (delta : ℚ)
    (hw : ∀ i, 0 ≤ w i)
    (ha0 : ∀ i, 0 ≤ alpha i)
    (ha1 : ∀ i, alpha i ≤ 1)
    (hd0 : 0 < delta) (hd1 : delta < 1) :
    removedMassBounded w alpha delta ≤ firstMoment w alpha ∧
      removedMassBounded w alpha delta ≤ scaledSecondMoment w alpha delta := by
  exact BBMSTScalarMoment.weighted_removedFraction_bounds
    w alpha delta hw ha0 ha1 hd0 hd1

/-- Compact minimum form of the finite weighted moment bound. -/
theorem removedMass_le_min_of_moments
    {ι : Type*} [Fintype ι]
    (w alpha : ι → ℚ) (delta : ℚ)
    (hw : ∀ i, 0 ≤ w i)
    (ha0 : ∀ i, 0 ≤ alpha i)
    (ha1 : ∀ i, alpha i ≤ 1)
    (hd0 : 0 < delta) (hd1 : delta < 1) :
    removedMassBounded w alpha delta ≤
      min (firstMoment w alpha) (scaledSecondMoment w alpha delta) := by
  exact BBMSTScalarMoment.weighted_removedFraction_sum_min
    w alpha delta hw ha0 ha1 hd0 hd1

 /-- Under nonnegative normalized weights and genuine proportions,
the first weighted moment lies in [0,1]. -/
theorem firstMoment_mem_unit_interval
    {ι : Type*} [Fintype ι]
    (w alpha : ι → ℚ)
    (hw : ∀ i, 0 ≤ w i)
    (ha0 : ∀ i, 0 ≤ alpha i)
    (ha1 : ∀ i, alpha i ≤ 1)
    (hnorm : totalWeight w = 1) :
    0 ≤ firstMoment w alpha ∧ firstMoment w alpha ≤ 1 := by
  constructor
  · unfold firstMoment
    apply Finset.sum_nonneg
    intro i hi
    exact mul_nonneg (hw i) (ha0 i)
  · calc
      firstMoment w alpha ≤ totalWeight w := by
        unfold firstMoment totalWeight
        apply Finset.sum_le_sum
        intro i hi
        calc
          w i * alpha i ≤ w i * 1 :=
            mul_le_mul_of_nonneg_left (ha1 i) (hw i)
          _ = w i := by ring
      _ = 1 := hnorm

/-- For proportions in [0,1], the second weighted moment is no larger than
the first, provided the weights are nonnegative. -/
theorem secondMoment_le_firstMoment
    {ι : Type*} [Fintype ι]
    (w alpha : ι → ℚ)
    (hw : ∀ i, 0 ≤ w i)
    (ha0 : ∀ i, 0 ≤ alpha i)
    (ha1 : ∀ i, alpha i ≤ 1) :
    secondMoment w alpha ≤ firstMoment w alpha := by
  unfold secondMoment firstMoment
  apply Finset.sum_le_sum
  intro i hi
  have hαsq : alpha i ^ 2 ≤ alpha i := by
    nlinarith [mul_nonneg (ha0 i) (sub_nonneg.mpr (ha1 i))]
  exact mul_le_mul_of_nonneg_left hαsq (hw i)

#print axioms firstMoment_mem_unit_interval
#print axioms secondMoment_le_firstMoment
#print axioms removedMass_le_first_and_scaled_second
#print axioms removedMass_le_min_of_moments

end BBMSTProbabilityInterface
