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
