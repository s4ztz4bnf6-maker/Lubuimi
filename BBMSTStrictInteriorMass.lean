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


namespace BBMSTStrictInteriorMass

/--
Quantitative interior-fiber bound. If one fiber has mass at least δ and
its conditional proportion is at least δ away from both endpoints 0 and 1,
then the weighted Bernoulli term is at least δ^3. This is the quantitative
form needed when the source proof requires an explicit margin rather than
mere strict positivity. The geometric hypothesis producing such a fiber
remains separate.
-/
theorem weighted_interior_mass_ge_delta_cube
    {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass alpha : ι → ℚ) (δ : ℚ)
    (hδ : 0 < δ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (ha0 : ∀ i ∈ s, 0 ≤ alpha i)
    (ha1 : ∀ i ∈ s, alpha i ≤ 1)
    (hwitness : ∃ i ∈ s,
      δ ≤ mass i ∧ δ ≤ alpha i ∧ alpha i ≤ 1 - δ) :
    δ ^ 3 ≤ ∑ i ∈ s, alpha i * (1 - alpha i) * mass i := by
  obtain ⟨i, hi, hmassδ, halphaδ, halphaUpper⟩ := hwitness
  have hδ0 : 0 ≤ δ := le_of_lt hδ
  have hδComplement : δ ≤ 1 - alpha i := by linarith
  have hprod_mul : δ * δ ≤ alpha i * (1 - alpha i) :=
    mul_le_mul halphaδ hδComplement hδ0 (ha0 i hi)
  have hprod : δ ^ 2 ≤ alpha i * (1 - alpha i) := by
    simpa [pow_two] using hprod_mul
  have hmassTerm :
      δ ^ 2 * δ ≤ δ ^ 2 * mass i :=
    mul_le_mul_of_nonneg_left hmassδ (sq_nonneg δ)
  have hprodTerm :
      δ ^ 2 * mass i ≤ (alpha i * (1 - alpha i)) * mass i :=
    mul_le_mul_of_nonneg_right hprod (hmass i hi)
  have hterm :
      δ ^ 3 ≤ alpha i * (1 - alpha i) * mass i := by
    calc
      δ ^ 3 = δ ^ 2 * δ := by ring
      _ ≤ δ ^ 2 * mass i := hmassTerm
      _ ≤ (alpha i * (1 - alpha i)) * mass i := hprodTerm
      _ = alpha i * (1 - alpha i) * mass i := by ring
  let f : ι → ℚ := fun j => alpha j * (1 - alpha j) * mass j
  have hnonneg : ∀ j ∈ s, 0 ≤ f j := by
    intro j hj
    dsimp [f]
    exact mul_nonneg
      (mul_nonneg (ha0 j hj) (sub_nonneg.mpr (ha1 j hj)))
      (hmass j hj)
  have hle : f i ≤ ∑ j ∈ s, f j :=
    Finset.single_le_sum (fun j hj => hnonneg j hj) hi
  have hbound : δ ^ 3 ≤ ∑ j ∈ s, f j :=
    le_trans hterm hle
  simpa [f] using hbound

#print axioms weighted_interior_mass_ge_delta_cube

end BBMSTStrictInteriorMass
