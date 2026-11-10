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
