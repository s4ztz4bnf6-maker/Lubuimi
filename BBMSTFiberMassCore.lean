import Mathlib

/-!
# BBMST fiber-mass algebra core

This module isolates the elementary rational mass-splitting identity needed
before formalizing the probability-space and fiber argument in Lemma 2.1 of
Balister–Bollobás–Morris–Sahasrabudhe–Tiba.

Scope boundary: these are algebraic bookkeeping lemmas only. They do not define
the paper's evolving probability measures, prove its distortion bounds, or
discharge either admitted sieve axiom in ErdosSelfridge_v17_fixed.
-/

namespace BBMSTFiberMassCore

/-- A mass split into an alpha-fraction and its complement conserves total mass.
No division is used, so the statement remains valid at alpha = 0 and alpha = 1. -/
theorem fiber_mass_split (mass alpha : ℚ) :
    alpha * mass + (1 - alpha) * mass = mass := by
  ring

/-- The zero-fraction endpoint: all mass is in the complementary part. -/
theorem fiber_mass_split_zero (mass : ℚ) :
    (0 : ℚ) * mass + (1 - 0) * mass = mass := by
  ring

/-- The full-fraction endpoint: all mass is in the retained part. -/
theorem fiber_mass_split_one (mass : ℚ) :
    (1 : ℚ) * mass + (1 - 1) * mass = mass := by
  ring

/-- If alpha is a genuine proportion and mass is nonnegative,
both parts of the algebraic split are nonnegative. This is the positivity
obligation missing from mass conservation alone. -/
theorem fiber_mass_parts_nonneg
    (mass alpha : ℚ) (hmass : 0 ≤ mass)
    (ha0 : 0 ≤ alpha) (ha1 : alpha ≤ 1) :
    0 ≤ alpha * mass ∧ 0 ≤ (1 - alpha) * mass := by
  constructor
  · exact mul_nonneg ha0 hmass
  · exact mul_nonneg (sub_nonneg.mpr ha1) hmass

/-- A nonnegative finite collection of masses has nonnegative total mass. -/
theorem finite_mass_sum_nonneg {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass : ι → ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i) :
    0 ≤ ∑ i ∈ s, mass i := by
  classical
  apply Finset.sum_nonneg
  intro i hi
  exact hmass i hi

/-- Summing the retained and removed parts separately preserves
nonnegativity, provided every source mass is nonnegative and alpha is
a genuine proportion. This lifts pointwise positivity to finite totals. -/
theorem finite_fiber_mass_parts_nonneg {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass : ι → ℚ) (alpha : ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (ha0 : 0 ≤ alpha) (ha1 : alpha ≤ 1) :
    0 ≤ ∑ i ∈ s, alpha * mass i ∧
      0 ≤ ∑ i ∈ s, (1 - alpha) * mass i := by
  constructor
  · apply Finset.sum_nonneg
    intro i hi
    exact mul_nonneg ha0 (hmass i hi)
  · apply Finset.sum_nonneg
    intro i hi
    exact mul_nonneg (sub_nonneg.mpr ha1) (hmass i hi)

#print axioms fiber_mass_parts_nonneg
#print axioms finite_mass_sum_nonneg

/-- Finite weighted version of the split identity. Each point's mass
is divided algebraically into an alpha-part and a complementary part, and
summing both parts recovers the original total. No positivity assumption or
division is needed, including at alpha = 0 and alpha = 1. -/
theorem finite_fiber_mass_split {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass : ι → ℚ) (alpha : ℚ) :
    (∑ i ∈ s, alpha * mass i) +
      (∑ i ∈ s, (1 - alpha) * mass i) =
      ∑ i ∈ s, mass i := by
  classical
  calc
    (∑ i ∈ s, alpha * mass i) +
        (∑ i ∈ s, (1 - alpha) * mass i)
        = alpha * (∑ i ∈ s, mass i) +
            (1 - alpha) * (∑ i ∈ s, mass i) := by
              rw [← Finset.mul_sum, ← Finset.mul_sum]
    _ = ∑ i ∈ s, mass i := by ring

/-- General finite conservation theorem for an actual pointwise
retained/removed decomposition. This is the reusable bridge from a
pointwise fiber identity to total finite mass conservation. -/
theorem finite_mass_conservation {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (retained removed total : ι → ℚ)
    (h : ∀ i ∈ s, retained i + removed i = total i) :
    (∑ i ∈ s, retained i) + (∑ i ∈ s, removed i) =
      ∑ i ∈ s, total i := by
  classical
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i hi
  exact h i hi


/-- Fiber-dependent split: each point may have its own retained fraction.
This avoids assuming a single global alpha when the original probability
argument assigns different proportions to different fibers. -/
theorem finite_fiber_mass_split_variable_alpha {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass alpha : ι → ℚ) :
    (∑ i ∈ s, alpha i * mass i) +
      (∑ i ∈ s, (1 - alpha i) * mass i) =
      ∑ i ∈ s, mass i := by
  classical
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i hi
  ring

/-- Fiber-dependent retained and removed parts are nonnegative when
each local fraction lies in [0,1] and each source mass is nonnegative. -/
theorem finite_fiber_mass_parts_variable_alpha_nonneg
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    (mass alpha : ι → ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (ha0 : ∀ i ∈ s, 0 ≤ alpha i)
    (ha1 : ∀ i ∈ s, alpha i ≤ 1) :
    0 ≤ ∑ i ∈ s, alpha i * mass i ∧
      0 ≤ ∑ i ∈ s, (1 - alpha i) * mass i := by
  constructor
  · apply Finset.sum_nonneg
    intro i hi
    exact mul_nonneg (ha0 i hi) (hmass i hi)
  · apply Finset.sum_nonneg
    intro i hi
    exact mul_nonneg (sub_nonneg.mpr (ha1 i hi)) (hmass i hi)


/-- The retained/removed conservation law is valid pointwise even when
the retained fraction varies by fiber. This packages the split in the
same form consumed by the general finite_mass_conservation theorem. -/
theorem variable_alpha_fiber_conservation
    (mass alpha : ℚ) :
    alpha * mass + (1 - alpha) * mass = mass := by
  ring

/-- A finite family with varying local fractions conserves total mass.
This is the direct retained-plus-removed interface for the fiber model. -/
theorem finite_variable_alpha_mass_conservation
    {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass alpha : ι → ℚ) :
    (∑ i ∈ s, alpha i * mass i) +
      (∑ i ∈ s, (1 - alpha i) * mass i) =
      ∑ i ∈ s, mass i := by
  classical
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i hi
  ring


/-- Integrated finite-fiber interface: under local probability bounds and
nonnegative source masses, both pieces are nonnegative and their totals
exactly conserve the source mass. This remains an algebraic core lemma;
it does not assert that BBMST's geometric conditional proportions have
already been constructed. -/
theorem finite_fiber_mass_partition
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    (mass alpha : ι → ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (ha0 : ∀ i ∈ s, 0 ≤ alpha i)
    (ha1 : ∀ i ∈ s, alpha i ≤ 1) :
    (0 ≤ ∑ i ∈ s, alpha i * mass i) ∧
    (0 ≤ ∑ i ∈ s, (1 - alpha i) * mass i) ∧
    ((∑ i ∈ s, alpha i * mass i) +
      (∑ i ∈ s, (1 - alpha i) * mass i) =
      ∑ i ∈ s, mass i) := by
  have hnonneg :=
    finite_fiber_mass_parts_variable_alpha_nonneg s mass alpha
      hmass ha0 ha1
  have hconserve :=
    finite_mass_conservation s
      (fun i => alpha i * mass i)
      (fun i => (1 - alpha i) * mass i)
      mass (by
        intro i hi
        ring)
  exact ⟨hnonneg.1, hnonneg.2, hconserve⟩


/-- Each component of a variable-fiber split is bounded above by the
original total mass, provided the source masses are nonnegative and every
local fraction lies in [0,1]. Together with finite_fiber_mass_partition,
this gives a two-sided mass budget for both components. -/
theorem finite_fiber_mass_parts_le_total
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    (mass alpha : ι → ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (ha0 : ∀ i ∈ s, 0 ≤ alpha i)
    (ha1 : ∀ i ∈ s, alpha i ≤ 1) :
    (∑ i ∈ s, alpha i * mass i ≤ ∑ i ∈ s, mass i) ∧
    (∑ i ∈ s, (1 - alpha i) * mass i ≤ ∑ i ∈ s, mass i) := by
  constructor
  · apply Finset.sum_le_sum
    intro i hi
    calc
      alpha i * mass i ≤ 1 * mass i :=
        mul_le_mul_of_nonneg_right (ha1 i hi) (hmass i hi)
      _ = mass i := by ring
  · apply Finset.sum_le_sum
    intro i hi
    have hcomp1 : 1 - alpha i ≤ 1 := by linarith [ha0 i hi]
    calc
      (1 - alpha i) * mass i ≤ 1 * mass i :=
        mul_le_mul_of_nonneg_right hcomp1 (hmass i hi)
      _ = mass i := by ring


/--
A single packaged finite-fiber budget: each component is nonnegative, neither
component exceeds the source total, and their sum is exactly the source total.
This is a reusable algebraic interface for a later source-faithful geometric
fiber model; it does not itself construct BBMST's probability spaces.
-/
theorem finite_fiber_mass_budget
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    (mass alpha : ι → ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (ha0 : ∀ i ∈ s, 0 ≤ alpha i)
    (ha1 : ∀ i ∈ s, alpha i ≤ 1) :
    (0 ≤ ∑ i ∈ s, alpha i * mass i) ∧
    (∑ i ∈ s, alpha i * mass i ≤ ∑ i ∈ s, mass i) ∧
    (0 ≤ ∑ i ∈ s, (1 - alpha i) * mass i) ∧
    (∑ i ∈ s, (1 - alpha i) * mass i ≤ ∑ i ∈ s, mass i) ∧
    ((∑ i ∈ s, alpha i * mass i) +
      (∑ i ∈ s, (1 - alpha i) * mass i) = ∑ i ∈ s, mass i) := by
  have hparts := finite_fiber_mass_partition s mass alpha hmass ha0 ha1
  have hbounds := finite_fiber_mass_parts_le_total s mass alpha hmass ha0 ha1
  exact ⟨hparts.1, hbounds.1, hparts.2.1, hbounds.2, hparts.2.2⟩

#print axioms finite_fiber_mass_budget


/- Explicit dependency audit for the conservation identities. -/
#print axioms fiber_mass_split
#print axioms fiber_mass_split_zero
#print axioms fiber_mass_split_one
#print axioms finite_fiber_mass_split
#print axioms finite_mass_conservation
#print axioms finite_fiber_mass_parts_nonneg
#print axioms finite_fiber_mass_parts_variable_alpha_nonneg
#print axioms finite_fiber_mass_split_variable_alpha
#print axioms finite_variable_alpha_mass_conservation
#print axioms finite_fiber_mass_partition
#print axioms finite_fiber_mass_parts_le_total
#print axioms variable_alpha_fiber_conservation

end BBMSTFiberMassCore
