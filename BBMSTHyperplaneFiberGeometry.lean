import Mathlib

/-!
# Finite hyperplane-fiber geometry for BBMST

This module formalizes the elementary geometric fact that, when a
hyperplane fixes the last coordinate, each fixed prefix has at most one
compatible final coordinate. It is only the single-hyperplane lemma; the
union bound, second-moment pair expansion, and source probability update
remain to be proved.
-/

namespace BBMSTHyperplaneFiberGeometry

/-- The last-coordinate values compatible with a fixed value imposed by one
hyperplane. In a concrete product model, the prefix coordinates have already
been checked, so only this last-coordinate condition remains. -/
def compatibleLastCoordinates {α : Type*} [DecidableEq α]
    (S : Finset α) (fixedValue : α) : Finset α :=
  S.filter (fun y => y = fixedValue)

/-- A single hyperplane fixing the last coordinate contributes at most one
point to any fiber over a fixed prefix. This is the elementary geometric
input needed before bounding a union of newly exposed hyperplanes. -/
theorem compatible_last_coordinates_card_le_one
    {α : Type*} [DecidableEq α] (S : Finset α) (fixedValue : α) :
    (compatibleLastCoordinates S fixedValue).card ≤ 1 := by
  apply Finset.card_le_one.mpr
  intro x hx y hy
  have hx' : x = fixedValue :=
    (Finset.mem_filter.mp hx).2
  have hy' : y = fixedValue :=
    (Finset.mem_filter.mp hy).2
  exact hx'.trans hy'.symm

/-- If a fiber is covered by a finite union of single-hyperplane last-coordinate
sets, its cardinality is at most the number of hyperplanes. This is the
combinatorial target to connect to alpha_k(x); the union itself is left
explicit rather than replacing the geometry by an assumed alpha bound. -/
theorem finite_union_card_le_sum
    {α ι : Type*} [DecidableEq α] [DecidableEq ι]
    (H : Finset ι) (fiber : ι → Finset α) (hcard : ∀ i ∈ H, (fiber i).card ≤ 1) :
    (H.biUnion fiber).card ≤ H.card := by
  classical
  calc
    (H.biUnion fiber).card ≤ ∑ i ∈ H, (fiber i).card := Finset.card_biUnion_le
    _ ≤ ∑ i ∈ H, (1 : ℕ) := by
      apply Finset.sum_le_sum
      intro i hi
      exact hcard i hi
    _ = H.card := by simp

end BBMSTHyperplaneFiberGeometry
