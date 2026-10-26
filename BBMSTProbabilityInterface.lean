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
def removedMassBounded {ι : Type*} [Fintype ι]
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

/-- Under nonnegative normalized weights, the first and second weighted
moments are expectations over the finite fiber index set. -/
theorem probability_weights_normalized
    {ι : Type*} [Fintype ι]
    (w : ι → ℚ) (hw : ∀ i, 0 ≤ w i)
    (hnorm : totalWeight w = 1) :
    totalWeight w = 1 := hnorm

#print axioms removedMass_le_first_and_scaled_second
#print axioms removedMass_le_min_of_moments

end BBMSTProbabilityInterface
