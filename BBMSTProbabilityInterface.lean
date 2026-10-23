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


/--
If the incidence set is a proper subset of a nonempty finite sample space,
its normalized rational cardinality is strictly below one. This distinguishes
a genuinely uncovered sample point from the merely non-strict [0,1] bound.
-/
theorem finite_proper_incidence_fraction_lt_one
    {Ω : Type*} [DecidableEq Ω]
    (sample incidences : Finset Ω)
    (hproper : incidences ⊂ sample) (hnonempty : sample.Nonempty) :
    (incidences.card : ℚ) / (sample.card : ℚ) < 1 := by
  have hden : (0 : ℚ) < (sample.card : ℚ) := by
    exact_mod_cast hnonempty.card_pos
  have hnum : (incidences.card : ℚ) < (sample.card : ℚ) := by
    exact_mod_cast Finset.card_lt_card hproper
  apply (div_lt_iff₀ hden).2
  nlinarith

#print axioms finite_proper_incidence_fraction_lt_one


/--
Exact uncovered-mass identity for a finite uniform sample: the deficit
from full incidence coverage is exactly the normalized size of the
complement. This is the concrete bridge needed before a geometric
BBMST alpha_k estimate can be interpreted as a coverage bound.
-/
theorem finite_incidence_deficit_eq_complement_fraction
    {Ω : Type*} [DecidableEq Ω]
    (sample incidences : Finset Ω)
    (hinc : incidences ⊆ sample) (hnonempty : sample.Nonempty) :
    1 - (incidences.card : ℚ) / (sample.card : ℚ) =
      ((sample \ incidences).card : ℚ) / (sample.card : ℚ) := by
  have hle : incidences.card ≤ sample.card := Finset.card_le_card hinc
  have hden : (sample.card : ℚ) ≠ 0 := by
    exact_mod_cast hnonempty.card_pos.ne'
  calc
    1 - (incidences.card : ℚ) / (sample.card : ℚ)
        = ((sample.card : ℚ) - (incidences.card : ℚ)) /
            (sample.card : ℚ) := by
              field_simp
              ring
    _ = ((sample \ incidences).card : ℚ) / (sample.card : ℚ) := by
          rw [Finset.card_sdiff_of_subset hinc, Nat.cast_sub hle]

#print axioms finite_incidence_deficit_eq_complement_fraction


/--
For a nonempty finite uniform sample, the incidence fraction is strictly
below one exactly when at least one sample point is uncovered. This makes
the coverage interpretation of the normalized fraction bidirectional.
-/
theorem finite_incidence_fraction_lt_one_iff_complement_nonempty
    {Ω : Type*} [DecidableEq Ω]
    (sample incidences : Finset Ω)
    (hinc : incidences ⊆ sample) (hnonempty : sample.Nonempty) :
    (incidences.card : ℚ) / (sample.card : ℚ) < 1 ↔
      (sample \\ incidences).Nonempty := by
  have hden : (0 : ℚ) < (sample.card : ℚ) := by
    exact_mod_cast hnonempty.card_pos
  constructor
  · intro hfrac
    have hnum : (incidences.card : ℚ) < (sample.card : ℚ) :=
      (div_lt_iff₀ hden).mp hfrac
    have hcard : incidences.card < sample.card := by
      exact_mod_cast hnum
    have hdiff : 0 < (sample \\ incidences).card := by
      rw [Finset.card_sdiff_of_subset hinc]
      omega
    exact Finset.card_pos.mp hdiff
  · intro hcompl
    have hdiff : 0 < (sample \\ incidences).card :=
      Finset.card_pos.mpr hcompl
    have hcard : incidences.card < sample.card := by
      rw [Finset.card_sdiff_of_subset hinc] at hdiff
      omega
    have hnum : (incidences.card : ℚ) < (sample.card : ℚ) := by
      exact_mod_cast hcard
    exact (div_lt_iff₀ hden).2 hnum

#print axioms finite_incidence_fraction_lt_one_iff_complement_nonempty
