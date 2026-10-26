import Mathlib

/-!
# Quantitative interior-band mass bound

This is an elementary bridge for the BBMST audit. It says that fibers whose
covered fraction lies in [δ, 1-δ] contribute at least δ(1-δ) times their
source mass to the weighted interior-mass sum. It does NOT prove that the
source geometry supplies enough mass in this band.
-/

namespace BBMSTInteriorBand

/-- On the interior band, the Bernoulli factor is bounded below by
δ(1-δ). The proof uses the exact factorization
α(1-α) - δ(1-δ) = (α-δ)(1-δ-α). -/
theorem interior_factor_lower_bound
    (δ α : ℚ)
    (hlo : δ ≤ α)
    (hhi : α ≤ 1 - δ) :
    δ * (1 - δ) ≤ α * (1 - α) := by
  have h1 : 0 ≤ α - δ := sub_nonneg.mpr hlo
  have h2 : 0 ≤ 1 - δ - α := by linarith
  nlinarith [mul_nonneg h1 h2]

/-- Quantitative lower bound on the weighted mass of fibers in the
δ-interior band. All masses are nonnegative; the sum is taken over the
actual filtered finite index set. -/
theorem interior_band_weighted_mass_lower_bound
    {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass alpha : ι → ℚ) (δ : ℚ)
    (hδ : 0 ≤ δ)
    (hδhalf : δ ≤ 1 / 2)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (halpha0 : ∀ i ∈ s, 0 ≤ alpha i)
    (halpha1 : ∀ i ∈ s, alpha i ≤ 1) :
    δ * (1 - δ) *
        (∑ i ∈ s.filter (fun i => δ ≤ alpha i ∧ alpha i ≤ 1 - δ),
          mass i)
      ≤
      ∑ i ∈ s.filter (fun i => δ ≤ alpha i ∧ alpha i ≤ 1 - δ),
        alpha i * (1 - alpha i) * mass i := by
  rw [Finset.mul_sum]
  apply Finset.sum_le_sum
  intro i hi
  have his : i ∈ s := (Finset.mem_filter.mp hi).1
  have hband := (Finset.mem_filter.mp hi).2
  have hfactor := interior_factor_lower_bound δ (alpha i) hband.1 hband.2
  exact mul_le_mul_of_nonneg_right hfactor (hmass i his)

/-- Every summand of the interior-mass sum is nonnegative when alpha is
a genuine proportion and the underlying masses are nonnegative. -/
theorem interior_term_nonnegative
    {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass alpha : ι → ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (halpha0 : ∀ i ∈ s, 0 ≤ alpha i)
    (halpha1 : ∀ i ∈ s, alpha i ≤ 1) :
    0 ≤ ∑ i ∈ s, alpha i * (1 - alpha i) * mass i := by
  apply Finset.sum_nonneg
  intro i hi
  exact mul_nonneg
    (mul_nonneg (halpha0 i hi) (sub_nonneg.mpr (halpha1 i hi)))
    (hmass i hi)

#print axioms interior_factor_lower_bound
#print axioms interior_band_weighted_mass_lower_bound
#print axioms interior_term_nonnegative

end BBMSTInteriorBand
