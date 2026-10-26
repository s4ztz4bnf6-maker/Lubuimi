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
      by_cases hlow : a N ≤ 1
      · have hone : a N = 1 := by omega
        rw [if_pos hlow, hone]
        have hcast : (1 : ℤ) = 1 := rfl
        linarith
      · rw [if_neg hlow]
        have hlarge : 2 ≤ a N := by omega
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


/-- If an accelerated odd Syracuse step has valuation exactly one, its next
odd value is 1 modulo 4. Consequently the next numerator is divisible by 4,
so two valuation-one steps cannot be consecutive. This is an orbit constraint,
not a claim about arbitrary independent valuation words. -/
theorem valuation_one_step_forces_next_div_four
    (n m : ℕ) (hn : n % 2 = 1) (hm : m % 2 = 1)
    (hstep : 3 * n + 1 = 2 * m) :
    (3 * m + 1) % 4 = 0 := by
  omega

/-- Two successive odd-to-odd Syracuse steps cannot both divide the
numerator by exactly two: the first step forces the next numerator to be
0 modulo 4, whereas a second exact halving with odd output would make it
2 modulo 4. -/
theorem no_consecutive_exact_halving_steps
    (n0 n1 n2 : ℕ)
    (hn0 : n0 % 2 = 1) (hn1 : n1 % 2 = 1)
    (hn2 : n2 % 2 = 1)
    (hstep0 : 3 * n0 + 1 = 2 * n1)
    (hstep1 : 3 * n1 + 1 = 2 * n2) :
    False := by
  have hmod0 := valuation_one_step_forces_next_div_four
    n0 n1 hn0 hn1 hstep0
  omega


#print axioms valuationSurplus_ge_length_sub_five_low_count
#print axioms negative_surplus_forces_many_valuation_one_steps

end SyracuseAudit
