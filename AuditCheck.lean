import ErdosSelfridge_v17_fixed
import Mathlib.Tactic

set_option autoImplicit false

/-- Raw-definition diagnostic only: the recursive product collapses when the
delta list is empty.  The admitted criterion's length guard is audited below. -/
theorem audit_sieveProd_empty_delta (ss : List ℚ) (x : ℚ) :
    sieveProd ss [] x = 1 := by
  cases ss <;> simp [sieveProd]

/-- Concrete raw degeneracy at ca1 = ca3 = 1, ss = [1], delta = [].
This does not satisfy the nonempty block-list length guard. -/
theorem audit_raw_empty_delta_sieveTerm :
    sieveTerm 1 1 [1] [] 0 = 0 := by
  norm_num [sieveTerm, M1bound, M2bound, ck, sieveProd]

/-- The corresponding one-block raw sieve sum is also zero. -/
theorem audit_raw_empty_delta_sieveSum :
    sieveSum 1 1 [1] [] = 0 := by
  norm_num [sieveSum, sieveTerm, M1bound, M2bound, ck, sieveProd]

/-- In the actual admitted interface, an empty delta list cannot have the
required length when the associated block list is nonempty. -/
theorem audit_empty_delta_length_guard
    (blocks : List ℚ) (hblocks : 0 < blocks.length) :
    ([] : List ℚ).length ≠ blocks.length := by
  simp
  omega

/-- A genuine odd covering system has at least one odd prime divisor among
its moduli: coverage supplies an index, the modulus is greater than one,
and oddness excludes the prime 2. -/
theorem audit_extractPrimes_nonempty
    {K : Nat} (cs : CoveringSystem K) (h_odd : CS_allOdd cs) :
    extractPrimes cs ≠ [] := by
  obtain ⟨i, _hi⟩ := cs.covers 0
  have hmod : 1 < cs.moduli i := cs.moduli_gt_one i
  obtain ⟨p, hp, hpdvd⟩ :=
    Nat.exists_prime_and_dvd (show cs.moduli i ≠ 1 by omega)
  have hn0 : cs.moduli i ≠ 0 := by omega
  have hmemFactors : p ∈ (cs.moduli i).primeFactorsList :=
    (Nat.mem_primeFactorsList hn0).mpr ⟨hp, hpdvd⟩
  have hpodd : p % 2 = 1 := by
    rcases hp.eq_two_or_odd with hp2 | hpodd
    · subst p
      have hmodEven : cs.moduli i % 2 = 0 :=
        Nat.mod_eq_zero_of_dvd hpdvd
      have hodd_i : cs.moduli i % 2 = 1 := h_odd i
      omega
    · exact hpodd
  have hpExtract : p ∈ extractPrimes cs := by
    simp only [extractPrimes]
    rw [Finset.mem_sort]
    simp only [Finset.mem_filter]
    refine ⟨?_, hpodd⟩
    rw [Finset.mem_biUnion]
    exact ⟨i, Finset.mem_univ i, List.mem_toFinset.mpr hmemFactors⟩
  intro hnil
  simp [hnil] at hpExtract

/-- The length guard in the actual covering-system criterion forces a
nonempty delta list; the raw empty-list degeneracy cannot be instantiated
for a genuine all-odd covering system. -/
theorem audit_actual_delta_nonempty
    {K : Nat} (cs : CoveringSystem K) (h_odd : CS_allOdd cs)
    (δs : List ℚ)
    (hδ_len : δs.length = (nonsfBlockSizes cs).length) :
    δs ≠ [] := by
  have hprimes : 0 < (extractPrimes cs).length :=
    List.length_pos_iff.mpr (audit_extractPrimes_nonempty cs h_odd)
  have hblocks : 0 < (nonsfBlockSizes cs).length := by
    simpa [nonsfBlockSizes] using hprimes
  have hdelta : 0 < δs.length := by omega
  intro hnil
  simp [hnil] at hdelta

#print axioms audit_extractPrimes_nonempty
#print axioms audit_actual_delta_nonempty

/-- For every in-range delta accepted by the current criterion, the denominator
in sieveTerm is strictly positive; totalized 0/0 is therefore not reached in
the admissible in-range case. -/
theorem audit_sieveTerm_denominator_pos
    (δs : List ℚ) (k : Nat)
    (hk : k < δs.length)
    (hδ : ∀ i, i < δs.length →
      0 < δs.getD i 0 ∧ δs.getD i 0 < 1) :
    0 < 4 * δs.getD k 0 * (1 - δs.getD k 0) := by
  have h0 := (hδ k hk).1
  have h1 := (hδ k hk).2
  have htail : 0 < 1 - δs.getD k 0 := by linarith
  positivity

theorem audit_rational_zero_div_zero : (0 : ℚ) / 0 = 0 := by
  norm_num

#print axioms admitted_sieve_criterion
#print axioms admitted_sf_sieve_certificate_exists
#print axioms erdos_selfridge_conditional_on_admitted_sieve_interfaces
