import BBMSTPointwiseUpdate

/-!
# BBMST: lift pointwise fiber normalization to weighted finite totals

This module isolates a safe algebraic bridge: once the source-specific
pointwise update has been shown to preserve each fiber's total mass, summing
over the prefix space preserves the total weighted mass. This does not assume
that the geometric hypotheses of the source lemma hold.
-/

namespace BBMSTPointwiseUpdate

/-- Weighted aggregation of pointwise fiber normalization. The weight may be
any rational-valued prefix mass; no positivity assumption is needed for this
pure algebraic identity. -/
theorem weighted_fiber_normalization
    {ι : Type*} (s : Finset ι)
    (w α c u : ι → ℚ)
    (hnorm : ∀ x ∈ s, α x * c x + (1 - α x) * u x = 1) :
    (∑ x ∈ s, w x *
      (α x * c x + (1 - α x) * u x)) =
      ∑ x ∈ s, w x := by
  classical
  apply Finset.sum_congr rfl
  intro x hx
  rw [hnorm x hx]
  ring

/-- The corresponding conservation statement for normalized fiber totals:
each prefix contributes exactly its original weight, so the total is
unchanged. This is the algebraic aggregation step needed before connecting
the update to a concrete finite probability space. -/
theorem weighted_fiber_mass_conserved
    {ι : Type*} (s : Finset ι)
    (w α c u : ι → ℚ)
    (hnorm : ∀ x ∈ s, α x * c x + (1 - α x) * u x = 1) :
    (∑ x ∈ s, w x *
      (α x * c x + (1 - α x) * u x)) =
      ∑ x ∈ s, w x := by
  exact weighted_fiber_normalization s w α c u hnorm

#print axioms weighted_fiber_normalization
#print axioms weighted_fiber_mass_conserved

end BBMSTPointwiseUpdate
