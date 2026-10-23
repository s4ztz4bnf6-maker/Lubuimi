import Mathlib
import BBMSTFiberMassCore

/-!
# Normalized finite-probability interface for the BBMST fiber audit

This module specializes the map-derived weighted-fiber squeeze to a finite
probability mass function. It is still only the algebraic interface: the
source-faithful construction of BBMST's geometric probability space and its
conditional fiber estimates remain separate obligations.
-/

namespace BBMSTProbabilityInterface

/--
If mass is a normalized finite probability distribution and every source
point's label-weight lies in [beta, gamma], then the weighted sum over
actual fibers lies in [beta, gamma]. The fibers are induced by label,
not supplied as independent data.
-/
theorem normalized_probability_weighted_fiber_squeeze
    {Ω Ι : Type*} [DecidableEq Ω] [DecidableEq Ι]
    (s : Finset Ω) (label : Ω → Ι)
    (mass : Ω → ℚ) (alpha : Ι → ℚ) (beta gamma : ℚ)
    (hmass : ∀ x ∈ s, 0 ≤ mass x)
    (hprob : (∑ x ∈ s, mass x) = 1)
    (hlower : ∀ x ∈ s, beta ≤ alpha (label x))
    (hupper : ∀ x ∈ s, alpha (label x) ≤ gamma) :
    beta ≤
        (∑ i ∈ s.image label,
          alpha i * (∑ x ∈ s with label x = i, mass x)) ∧
      (∑ i ∈ s.image label,
          alpha i * (∑ x ∈ s with label x = i, mass x)) ≤ gamma := by
  have hsqueeze :=
    BBMSTFiberMassCore.finite_fiber_weighted_partition_squeeze
      s label mass alpha beta gamma hmass hlower hupper
  constructor
  · calc
      beta = beta * (∑ x ∈ s, mass x) := by rw [hprob]; ring
      _ ≤ (∑ i ∈ s.image label,
          alpha i * (∑ x ∈ s with label x = i, mass x)) := hsqueeze.1
  · calc
      (∑ i ∈ s.image label,
          alpha i * (∑ x ∈ s with label x = i, mass x))
          ≤ gamma * (∑ x ∈ s, mass x) := hsqueeze.2
      _ = gamma := by rw [hprob]; ring

#print axioms normalized_probability_weighted_fiber_squeeze

end BBMSTProbabilityInterface


/--
A concrete finite-incidence fraction lies in [0,1] when the counted
incidences form a subset of a nonempty finite sample space. This theorem
connects an actual cardinality ratio to the abstract covered-fraction
interface; it does not identify this ratio with BBMST's geometric alpha_k
until the relevant sample space and incidence set are constructed.
-/
theorem finite_incidence_fraction_mem_unit_interval
    {Ω : Type*} [DecidableEq Ω]
    (sample incidences : Finset Ω)
    (hinc : incidences ⊆ sample) (hnonempty : sample.Nonempty) :
    0 ≤ (incidences.card : ℚ) / (sample.card : ℚ) ∧
      (incidences.card : ℚ) / (sample.card : ℚ) ≤ 1 :=
  BBMSTFiberMassCore.finite_card_ratio_mem_unit_interval
    sample incidences hinc hnonempty

#print axioms finite_incidence_fraction_mem_unit_interval
