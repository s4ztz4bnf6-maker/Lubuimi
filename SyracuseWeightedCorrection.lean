import SyracuseOffsetIdentity

/-
# Weighted expansion of the Syracuse block correction

The signed margin recurrence has a local correction
`(2^a - 4) * 2^A`: valuation one contributes a negative term, valuation two
contributes zero, and valuation at least three contributes a positive term.
The theorem below expands the accumulated block correction as an exact
weighted sum. This is the algebraic input for any later argument that tries
to bound negative valuation-one contributions by positive large-valuation
contributions.

It does not establish that the required balance holds along every integer
orbit, and it is not a proof of global Collatz termination.
-/

namespace CollatzSyracuseAudit

/-- The local signed correction contributed by the accelerated step at index
`j`. -/
def signedCorrectionTerm (A a : ℕ → ℕ) (m j : ℕ) : ℤ :=
  ((2 : ℤ) ^ a (m + j) - 4) * (2 : ℤ) ^ A (m + j)

/-- Exact closed form for the recursively accumulated block correction.
Each local correction is multiplied by the appropriate power of three from
the remaining steps in the block. -/
theorem signedOffsetBlockCorrection_eq_weighted_sum
    (A a : ℕ → ℕ) (m r : ℕ) :
    signedOffsetBlockCorrection A a m r =
      ∑ j ∈ Finset.range r,
        (3 : ℤ) ^ (r - (j + 1)) * signedCorrectionTerm A a m j := by
  induction r with
  | zero =>
      simp [signedOffsetBlockCorrection]
  | succ r ih =>
      simp only [signedOffsetBlockCorrection, Finset.sum_range_succ,
        Nat.sub_self, pow_zero, one_mul]
      rw [ih, Finset.mul_sum]
      have hsum :
          ∑ j ∈ Finset.range r,
            3 * ((3 : ℤ) ^ (r - (j + 1)) *
              signedCorrectionTerm A a m j) =
          ∑ j ∈ Finset.range r,
            (3 : ℤ) ^ ((r + 1) - (j + 1)) *
              signedCorrectionTerm A a m j := by
        apply Finset.sum_congr rfl
        intro j hj
        have hpow : (r + 1) - (j + 1) = (r - (j + 1)) + 1 := by
          have hj' : j < r := Finset.mem_range.mp hj
          omega
        rw [hpow, pow_succ]
        ring
      rw [hsum]
      rfl

#print axioms signedOffsetBlockCorrection_eq_weighted_sum

/-- The local correction is negative exactly at exponent one, zero at
exponent two, and positive for exponent at least three. This is a sign
classification only; the global balance of the weighted sum remains open. -/
theorem signedCorrectionTerm_sign
    (A a : ℕ → ℕ) (m j : ℕ) :
    (a (m + j) = 1 →
        signedCorrectionTerm A a m j < 0) ∧
    (a (m + j) = 2 →
        signedCorrectionTerm A a m j = 0) ∧
    (3 ≤ a (m + j) →
        0 < signedCorrectionTerm A a m j) := by
  constructor
  · intro ha
    unfold signedCorrectionTerm
    rw [ha]
    have hpos : 0 < (2 : ℤ) ^ A (m + j) :=
      pow_pos (by norm_num : (0 : ℤ) < 2) _
    norm_num
  constructor
  · intro ha
    unfold signedCorrectionTerm
    rw [ha]
    norm_num
  · intro ha
    unfold signedCorrectionTerm
    have hpowNat : 2 ^ 2 < 2 ^ a (m + j) :=
      Nat.pow_lt_pow_right (by norm_num : 1 < (2 : ℕ)) ha
    have hpow : (4 : ℤ) < (2 : ℤ) ^ a (m + j) := by
      exact_mod_cast hpowNat
    exact mul_pos (by linarith) (pow_pos (by norm_num : (0 : ℤ) < 2) _)

#print axioms signedCorrectionTerm_sign


/--
For an exact odd-to-odd accelerated Syracuse transition, the negative
valuation-one correction occurs exactly in the residue class 3 modulo 4.
Conversely, residue class 1 modulo 4 forces valuation at least two. This
turns the sign split in `signedCorrectionTerm_sign` into an arithmetic
residue-class test; it is still only a local classification, not a global
frequency estimate.
-/
theorem valuation_one_iff_residue_three_mod_four
    (n next a : ℕ)
    (hn : n % 2 = 1)
    (hnext : next % 2 = 1)
    (hstep : 2 ^ a * next = 3 * n + 1) :
    a = 1 ↔ n % 4 = 3 := by
  constructor
  · intro ha
    subst a
    omega
  · intro hmod
    have ha_pos : 0 < a :=
      positive_exponent_of_odd_transition n next a hn hnext hstep
    by_contra hne
    have ha_ge_two : 2 ≤ a := by omega
    have hexp : a = 2 + (a - 2) := by omega
    have hfactor : 2 ^ a = 4 * 2 ^ (a - 2) := by
      rw [hexp, pow_add]
      norm_num
    have hfour : 4 ∣ 3 * n + 1 := by
      refine ⟨2 ^ (a - 2) * next, ?_⟩
      rw [← hstep, hfactor]
      ring
    have hzero : (3 * n + 1) % 4 = 0 :=
      Nat.dvd_iff_mod_eq_zero.mp hfour
    omega

#print axioms valuation_one_iff_residue_three_mod_four

end CollatzSyracuseAudit
