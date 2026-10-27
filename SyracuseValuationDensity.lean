import Mathlib

/-!
# Finite valuation-one count bound

This module proves the finite combinatorial implication used in the
necessary-density analysis of a hypothetical divergent accelerated Syracuse
orbit. It does not formalize the logarithmic limit argument and does not prove
or refute the Collatz conjecture.
-/

namespace SyracuseValuationDensity

/-- Each positive integer valuation is at least two unless it equals one. -/
theorem two_le_add_one_indicator (a : ℕ) (ha : 1 ≤ a) :
    2 ≤ a + (if a = 1 then 1 else 0) := by
  by_cases h : a = 1
  · simp [h]
  · have htwo : 2 ≤ a := by omega
    simpa [h] using htwo

/-- Over any finite index set, twice the number of indices is bounded by
the sum of the positive integer valuations plus the number of valuation-one
indices (represented as an indicator sum). -/
theorem twice_card_le_sum_add_one_count
    {α : Type*} [DecidableEq α]
    (s : Finset α) (a : α → ℕ)
    (ha : ∀ x ∈ s, 1 ≤ a x) :
    2 * s.card ≤
      (∑ x ∈ s, a x) + (∑ x ∈ s, if a x = 1 then (1 : ℕ) else 0) := by
  calc
    2 * s.card = ∑ x ∈ s, (2 : ℕ) := by simp
    _ ≤ ∑ x ∈ s, (a x + if a x = 1 then (1 : ℕ) else 0) := by
      apply Finset.sum_le_sum
      intro x hx
      exact two_le_add_one_indicator (a x) (ha x hx)
    _ = (∑ x ∈ s, a x) +
        (∑ x ∈ s, if a x = 1 then (1 : ℕ) else 0) := by
      rw [Finset.sum_add_distrib]

#print axioms two_le_add_one_indicator
#print axioms twice_card_le_sum_add_one_count

end SyracuseValuationDensity
