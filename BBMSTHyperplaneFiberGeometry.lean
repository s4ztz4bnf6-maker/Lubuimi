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


/-- A finite-coordinate hyperplane description: `none` means the coordinate
is free and `some a` means it is fixed to a. The final coordinate is
represented by the right summand of `Fin n ⊕ Unit`. -/
def fixesCompatiblePoint {n : ℕ} {α : Type*}
    (h : (Fin n ⊕ Unit) → Option α)
    (v : (Fin n ⊕ Unit) → α) : Prop :=
  ∀ i, match h i with
    | none => True
    | some a => v i = a

/-- Fiber of a fixed-coordinate hyperplane above a prefix x. -/
noncomputable def hyperplaneLastFiber {n : ℕ} {α : Type*} [DecidableEq α]
    (S : Finset α) (h : (Fin n ⊕ Unit) → Option α)
    (x : Fin n → α) : Finset α := by
  classical
  exact S.filter (fun y =>
    fixesCompatiblePoint h (Sum.elim x (fun _ : Unit => y)))

/-- If the hyperplane fixes the last coordinate, then over any prefix its
last-coordinate fiber has at most one element. This now expresses the
geometric statement through explicit coordinate-fixing data, rather than
assuming a precomputed singleton fiber. -/
theorem hyperplane_last_fiber_card_le_one
    {n : ℕ} {α : Type*} [DecidableEq α]
    (S : Finset α) (h : (Fin n ⊕ Unit) → Option α)
    (x : Fin n → α) (a : α)
    (hlast : h (Sum.inr ()) = some a) :
    (hyperplaneLastFiber S h x).card ≤ 1 := by
  classical
  apply Finset.card_le_one.mpr
  intro y hy z hz
  have hyMem := (Finset.mem_filter.mp hy).2
  have hzMem := (Finset.mem_filter.mp hz).2
  have hyFix : y = a := by
    simpa [fixesCompatiblePoint, hlast] using hyMem (Sum.inr ())
  have hzFix : z = a := by
    simpa [fixesCompatiblePoint, hlast] using hzMem (Sum.inr ())
  exact hyFix.trans hzFix.symm

#print axioms hyperplane_last_fiber_card_le_one


/-- If a finite union of last-coordinate hyperplane fibers is nonempty but
has fewer points than the full coordinate set, its exact relative size is
strictly between zero and one. Combined with a positive prefix mass, this is
the local geometric witness needed for positive interior mass. -/
theorem nonempty_small_hyperplane_union_has_strict_interior_fraction
    {α ι : Type*} [DecidableEq α] [DecidableEq ι]
    (S : Finset α) (I : Finset ι)
    (fiber : ι → Finset α)
    (hcard : ∀ i ∈ I, (fiber i).card ≤ 1)
    (hsmall : (I.card : ℕ) < S.card)
    (hne : (I.biUnion fiber).Nonempty) :
    0 < ((I.biUnion fiber).card : ℚ) / (S.card : ℚ) ∧
      ((I.biUnion fiber).card : ℚ) / (S.card : ℚ) < 1 := by
  have hSNat : 0 < S.card :=
    lt_of_le_of_lt (Nat.zero_le I.card) hsmall
  have hS : (0 : ℚ) < (S.card : ℚ) := by exact_mod_cast hSNat
  have hnumNat : 0 < (I.biUnion fiber).card :=
    Finset.card_pos.mpr hne
  have hnum : (0 : ℚ) < ((I.biUnion fiber).card : ℚ) := by
    exact_mod_cast hnumNat
  have hunion : (I.biUnion fiber).card ≤ I.card :=
    finite_union_card_le_sum I fiber hcard
  have hstrictNat : (I.biUnion fiber).card < S.card :=
    Nat.lt_of_le_of_lt hunion hsmall
  have hstrict : ((I.biUnion fiber).card : ℚ) < (S.card : ℚ) := by
    exact_mod_cast hstrictNat
  constructor
  · exact div_pos hnum hS
  · exact (div_lt_one₀ hS).2 hstrict

#print axioms nonempty_small_hyperplane_union_has_strict_interior_fraction

end BBMSTHyperplaneFiberGeometry
