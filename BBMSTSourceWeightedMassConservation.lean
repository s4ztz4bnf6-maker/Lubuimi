import BBMSTPointwiseUpdate

namespace BBMSTPointwiseUpdate

/-- The source multipliers conserve any finite weighted fiber mass when
each indexed fiber is genuinely interior. This connects the pointwise
Lemma 2.1 normalization to the finite weighted aggregation step without
postulating a separate normalization function. -/
theorem weighted_source_update_mass_conserved
    {ι : Type*} (s : Finset ι)
    (w α δ : ι → ℚ)
    (hα0 : ∀ x ∈ s, 0 < α x)
    (hα1 : ∀ x ∈ s, α x < 1)
    (hδ0 : ∀ x ∈ s, 0 < δ x)
    (hδ1 : ∀ x ∈ s, δ x < 1) :
    (∑ x ∈ s, w x *
      (α x * coveredMultiplier (α x) (δ x) +
        (1 - α x) * uncoveredMultiplier (α x) (δ x))) =
      ∑ x ∈ s, w x := by
  classical
  apply Finset.sum_congr rfl
  intro x hx
  rw [pointwise_update_normalized (α x) (δ x)
    (hα0 x hx) (hα1 x hx) (hδ0 x hx) (hδ1 x hx)]
  ring

#print axioms weighted_source_update_mass_conserved

end BBMSTPointwiseUpdate
