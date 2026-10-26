import SyracuseRecordTime

namespace SyracuseAudit

/-- Number of valuation-one steps in the first N positions.  For actual
accelerated Syracuse orbits every valuation is positive, so these are exactly
the steps with the smallest possible valuation. -/
def lowValuationCount (a : Nat → Nat) : Nat → Nat
  | 0 => 0
  | N + 1 => lowValuationCount a N + if a N ≤ 1 then 1 else 0

/-- Any positive valuation sequence has surplus at least N minus five times
the number of valuation-one steps. A valuation-one step contributes -4 to
the surplus; every valuation at least two contributes at least +1. -/
theorem valuationSurplus_ge_length_sub_five_low_count
    (a : Nat → Nat) (ha : ∀ k, 1 ≤ a k) :
    ∀ N : ℕ, (N : ℤ) - 5 * (lowValuationCount a N : ℤ) ≤
      valuationSurplus a N := by
  intro N
  induction N with
  | zero =>
      simp [lowValuationCount, valuationSurplus, prefixExponentSum]
  | succ N ih =>
      have hinc := valuationSurplus_increment a N
      have hstep :
          valuationSurplus a (N + 1) =
            valuationSurplus a N + (5 * (a N : ℤ) - 9) := by
        linarith
      rw [hstep]
      simp only [lowValuationCount]
      push_cast
      have hpos := ha N
      by_cases hlow : a N ≤ 1
      · have hone : a N = 1 := by omega
        simp [hone]
        linarith
      · have hlarge : 2 ≤ a N := by omega
        simp [hlow]
        have hinc : 1 ≤ 5 * (a N : ℤ) - 9 := by omega
        linarith

/-- A hypothetical orbit whose surplus is still negative at time N must
have more than N/5 valuation-one steps in that prefix. This is a deterministic
necessary condition, not a probabilistic density estimate. -/
theorem negative_surplus_forces_many_valuation_one_steps
    (a : Nat → Nat) (ha : ∀ k, 1 ≤ a k) (N : Nat)
    (hneg : valuationSurplus a N < 0) :
    (N : ℤ) < 5 * (lowValuationCount a N : ℤ) := by
  have hbound :=
    valuationSurplus_ge_length_sub_five_low_count a ha N
  omega


/-- If the current odd input is 3 modulo 8, then after one exact
halving the next numerator is divisible by four. The stronger statement
without this modulo-eight hypothesis is false: 7 -> 11 -> 17 has two
consecutive exact halvings. -/
theorem valuation_one_step_forces_next_div_four_of_mod_eight
    (n m : ℕ) (hn8 : n % 8 = 3) (hm : m % 2 = 1)
    (hstep : 3 * n + 1 = 2 * m) :
    (3 * m + 1) % 4 = 0 := by
  omega

/-- A concrete counterexample to the false claim that exact-halving steps
cannot be consecutive: both 7 -> 11 and 11 -> 17 are exact halvings. -/
theorem two_consecutive_exact_halving_steps_exist :
    3 * 7 + 1 = 2 * 11 ∧ 3 * 11 + 1 = 2 * 17 := by
  norm_num

#print axioms valuationSurplus_ge_length_sub_five_low_count
#print axioms negative_surplus_forces_many_valuation_one_steps

end SyracuseAudit
