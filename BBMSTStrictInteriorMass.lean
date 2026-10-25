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

#print axioms weighted_interior_mass_positive

end BBMSTStrictInteriorMass
