import SyracuseAffineCore

/-!
# Syracuse suffix certificate: record-time interface

This module formalizes an exact algebraic reformulation of the suffix
condition used by the conditional geometric descent certificate. It does not
prove that a suitable record time occurs on every actual Syracuse orbit.
-/

namespace SyracuseAudit

/-- Cumulative valuation surplus for the 17/5 suffix certificate. -/
def valuationSurplus (a : Nat → Nat) (k : Nat) : ℤ :=
  5 * (prefixExponentSum a k : ℤ) - 9 * (k : ℤ)

/-- The suffix inequality is exactly the statement that the endpoint's
cumulative valuation surplus is at least the earlier surplus. -/
theorem suffix_inequality_iff_surplus_record
    (a : Nat → Nat) (j N : Nat) :
    5 * ((prefixExponentSum a N : ℤ) -
          (prefixExponentSum a j : ℤ)) ≥
      9 * ((N : ℤ) - (j : ℤ)) ↔
    valuationSurplus a N ≥ valuationSurplus a j := by
  simp only [valuationSurplus]
  omega

/-- The one-step change in the surplus is determined by the next
2-adic valuation. In particular it is positive iff the valuation is at
least two. -/
theorem valuationSurplus_increment
    (a : Nat → Nat) (k : Nat) :
    valuationSurplus a (k + 1) - valuationSurplus a k =
      5 * (a k : ℤ) - 9 := by
  simp [valuationSurplus, prefixExponentSum]
  ring

/-- Every suffix inequality ending at N is equivalent to N being a weak
record time of the surplus sequence. -/
theorem all_suffix_inequalities_iff_record_time
    (a : Nat → Nat) (N : Nat) :
    (∀ j, j < N →
      5 * ((prefixExponentSum a N : ℤ) -
            (prefixExponentSum a j : ℤ)) ≥
        9 * ((N : ℤ) - (j : ℤ))) ↔
    (∀ j, j < N → valuationSurplus a N ≥ valuationSurplus a j) := by
  constructor
  · intro h j hj
    exact (suffix_inequality_iff_surplus_record a j N).mp (h j hj)
  · intro h j hj
    exact (suffix_inequality_iff_surplus_record a j N).mpr (h j hj)

#print axioms suffix_inequality_iff_surplus_record
#print axioms valuationSurplus_increment
#print axioms all_suffix_inequalities_iff_record_time

/-- The surplus rises at a step exactly when the valuation is at least two.
This isolates the local source of a possible record-time certificate; it
does not assert that such record times occur with the frequency needed for
global descent. -/
theorem valuationSurplus_increment_pos_iff
    (a : Nat → Nat) (k : Nat) :
    0 < valuationSurplus a (k + 1) - valuationSurplus a k ↔
      2 ≤ a k := by
  rw [valuationSurplus_increment]
  omega

/-- A step with valuation zero or one strictly decreases the surplus by at
least four; this is the complementary local drift statement. -/
theorem valuationSurplus_increment_le_neg_four
    (a : Nat → Nat) (k : Nat) (ha : a k ≤ 1) :
    valuationSurplus a (k + 1) - valuationSurplus a k ≤ -4 := by
  rw [valuationSurplus_increment]
  have ha' : (a k : ℤ) ≤ 1 := by exact_mod_cast ha
  linarith

/-- Exact cumulative drift identity: the surplus at time N is the sum of
all local increments. This makes the record-time criterion a finite
prefix-sum constraint on the valuations, not merely a one-step observation. -/
theorem valuationSurplus_eq_sum_local_drift
    (a : Nat → Nat) (N : Nat) :
    valuationSurplus a N =
      ∑ k ∈ Finset.range N, (5 * (a k : ℤ) - 9) := by
  induction N with
  | zero =>
      simp [valuationSurplus, prefixExponentSum]
  | succ N ih =>
      calc
        valuationSurplus a (N + 1) =
            valuationSurplus a N + (5 * (a N : ℤ) - 9) := by
              have hinc := valuationSurplus_increment a N
              linarith
        _ = (∑ k ∈ Finset.range N, (5 * (a k : ℤ) - 9)) +
              (5 * (a N : ℤ) - 9) := by rw [ih]
        _ = ∑ k ∈ Finset.range (N + 1), (5 * (a k : ℤ) - 9) := by
              rw [Finset.sum_range_succ]


/-- Every weak record of the surplus sequence is nonnegative, because the
initial surplus is zero. Thus a suffix-certificate endpoint automatically
has cumulative valuation at least 9N/5. -/
theorem record_time_surplus_nonneg
    (a : Nat → Nat) (N : Nat)
    (hrecord : ∀ j, j < N → valuationSurplus a N ≥ valuationSurplus a j) :
    0 ≤ valuationSurplus a N := by
  by_cases hN : N = 0
  · subst N
    simp [valuationSurplus, prefixExponentSum]
  · have hNpos : 0 < N := Nat.pos_of_ne_zero hN
    have hstart : valuationSurplus a 0 = 0 := by
      simp [valuationSurplus, prefixExponentSum]
    have hle := hrecord 0 hNpos
    linarith

/-- The record-time nonnegativity condition is exactly the global prefix
valuation surplus inequality 5 A_N ≥ 9N. -/
theorem record_time_surplus_iff_exponent_threshold
    (a : Nat → Nat) (N : Nat) :
    0 ≤ valuationSurplus a N ↔
      9 * (N : ℤ) ≤ 5 * (prefixExponentSum a N : ℤ) := by
  simp [valuationSurplus]

#print axioms record_time_surplus_nonneg
#print axioms record_time_surplus_iff_exponent_threshold
#print axioms valuationSurplus_increment_pos_iff
#print axioms valuationSurplus_increment_le_neg_four

#print axioms valuationSurplus_eq_sum_local_drift

end SyracuseAudit
