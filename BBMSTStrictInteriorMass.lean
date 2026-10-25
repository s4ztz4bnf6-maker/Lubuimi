import Mathlib
import BBMSTFiberMassCore

/-!
# Strict interior-mass witness for BBMST fiber arguments

This module isolates a sufficient condition for strict positivity of a
finite weighted Bernoulli variance term. It does not claim that the
source paper's geometry supplies the witness; that remains a separate
statement-fidelity obligation.
-/

namespace BBMSTStrictInteriorMass

/--
If at least one positive-mass fiber has a strictly interior proportion,
then the total weighted Bernoulli term is strictly positive. All other
terms need only be nonnegative. No normalization and no division are used.
-/
theorem weighted_interior_mass_positive
    {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass alpha : ι → ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (ha0 : ∀ i ∈ s, 0 ≤ alpha i)
    (ha1 : ∀ i ∈ s, alpha i ≤ 1)
    (hwitness : ∃ i ∈ s, 0 < mass i ∧ 0 < alpha i ∧ alpha i < 1) :
    0 < ∑ i ∈ s, alpha i * (1 - alpha i) * mass i := by
  let f : ι → ℚ := fun i => alpha i * (1 - alpha i) * mass i
  have hnonneg : ∀ i ∈ s, 0 ≤ f i := by
    intro i hi
    dsimp [f]
    exact mul_nonneg
      (mul_nonneg (ha0 i hi) (sub_nonneg.mpr (ha1 i hi)))
      (hmass i hi)
  obtain ⟨i, hi, hmi, hai0, hai1⟩ := hwitness
  have hpositive : 0 < f i := by
    dsimp [f]
    exact mul_pos (mul_pos hai0 (sub_pos.mpr hai1)) hmi
  have hle : f i ≤ ∑ j ∈ s, f j :=
    Finset.single_le_sum (fun j hj => hnonneg j hj) hi
  have hsum : 0 < ∑ j ∈ s, f j := lt_of_lt_of_le hpositive hle
  simpa [f] using hsum

/--
Exact converse: under nonnegative masses and proportions in [0,1], the
weighted Bernoulli sum is positive if and only if some included fiber has
positive mass and a strictly interior proportion. This removes the need to
treat positivity as an independent algebraic assumption. It does NOT prove
that BBMST's geometric construction supplies such a fiber.
-/
theorem weighted_interior_mass_positive_iff
    {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass alpha : ι → ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (ha0 : ∀ i ∈ s, 0 ≤ alpha i)
    (ha1 : ∀ i ∈ s, alpha i ≤ 1) :
    (0 < ∑ i ∈ s, alpha i * (1 - alpha i) * mass i) ↔
      ∃ i ∈ s, 0 < mass i ∧ 0 < alpha i ∧ alpha i < 1 := by
  constructor
  · intro hsum
    by_contra hwitness
    let f : ι → ℚ := fun i => alpha i * (1 - alpha i) * mass i
    have hnonneg : ∀ i ∈ s, 0 ≤ f i := by
      intro i hi
      dsimp [f]
      exact mul_nonneg
        (mul_nonneg (ha0 i hi) (sub_nonneg.mpr (ha1 i hi)))
        (hmass i hi)
    have hzero : ∀ i ∈ s, f i = 0 := by
      intro i hi
      have hfi : 0 ≤ f i := hnonneg i hi
      have hnotpos : ¬ 0 < f i := by
        intro hfiPos
        have hmi : 0 < mass i := by
          by_contra h
          have hmi0 : mass i = 0 := by linarith [hmass i hi]
          simp [f, hmi0] at hfiPos
        have hai0 : 0 < alpha i := by
          by_contra h
          have haiZero : alpha i = 0 := by linarith [ha0 i hi]
          simp [f, haiZero] at hfiPos
        have hai1 : alpha i < 1 := by
          by_contra h
          have haiOne : alpha i = 1 := by linarith [ha1 i hi]
          simp [f, haiOne] at hfiPos
        exact hwitness ⟨i, hi, hmi, hai0, hai1⟩
      exact le_antisymm (le_of_not_gt hnotpos) hfi
    have hsumZero : (∑ i ∈ s, f i) = 0 := by
      apply Finset.sum_eq_zero
      intro i hi
      exact hzero i hi
    have hsumEq : (∑ i ∈ s, f i) =
        ∑ i ∈ s, alpha i * (1 - alpha i) * mass i := by
      rfl
    rw [hsumEq] at hsumZero
    linarith
  · intro hwitness
    exact weighted_interior_mass_positive s mass alpha hmass ha0 ha1 hwitness

#print axioms weighted_interior_mass_positive
#print axioms weighted_interior_mass_positive_iff

end BBMSTStrictInteriorMass
