import Mathlib

/-!
# Finite valuation-balance inequalities

These are finite combinatorial consequences for positive integer valuations.
They are the discrete part of a necessary-density condition for a hypothetical
divergent accelerated Syracuse orbit. The logarithmic limit argument is kept
separate; this module does not prove or refute the Collatz conjecture.
-/

namespace SyracuseValuationDensity

/-- A positive integer valuation contributes at least two, except that
valuation one contributes one less and valuation at least three contributes
one extra. -/
theorem two_add_ge3_indicator_le_a_add_one_indicator (a : ℕ)
    (ha : 1 ≤ a) :
    2 + (if 3 ≤ a then 1 else 0) ≤
      a + (if a = 1 then 1 else 0) := by
  by_cases h1 : a = 1
  · simp [h1]
  · by_cases h3 : 3 ≤ a
    · have hthree : 3 ≤ a := h3
      simp [h1, h3]
      omega
    · have htwo : a = 2 := by omega
      simp [h1, h3, htwo]

/-- Summing the pointwise inequality yields a finite balance law:
twice the number of indices plus the count of valuations at least three
is bounded by the valuation sum plus the count of valuations equal to one. -/
theorem finite_valuation_balance
    {α : Type*} [DecidableEq α]
    (s : Finset α) (a : α → ℕ)
    (ha : ∀ x ∈ s, 1 ≤ a x) :
    2 * s.card + (∑ x ∈ s, if 3 ≤ a x then (1 : ℕ) else 0) ≤
      (∑ x ∈ s, a x) + (∑ x ∈ s, if a x = 1 then (1 : ℕ) else 0) := by
  calc
    2 * s.card + (∑ x ∈ s, if 3 ≤ a x then (1 : ℕ) else 0) =
        (∑ x ∈ s, (2 : ℕ)) +
          (∑ x ∈ s, if 3 ≤ a x then (1 : ℕ) else 0) := by simp
    _ = ∑ x ∈ s, (2 + if 3 ≤ a x then (1 : ℕ) else 0) := by
      rw [Finset.sum_add_distrib]
    _ ≤ ∑ x ∈ s, (a x + if a x = 1 then (1 : ℕ) else 0) := by
      apply Finset.sum_le_sum
      intro x hx
      exact two_add_ge3_indicator_le_a_add_one_indicator (a x) (ha x hx)
    _ = (∑ x ∈ s, a x) +
        (∑ x ∈ s, if a x = 1 then (1 : ℕ) else 0) := by
      rw [Finset.sum_add_distrib]

#print axioms two_add_ge3_indicator_le_a_add_one_indicator
#print axioms finite_valuation_balance

end SyracuseValuationDensity
