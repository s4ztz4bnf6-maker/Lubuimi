import AffineTransitionValuation
import Mathlib.Tactic

namespace CollatzSyracuseAudit

/-- Exact valuation is equivalent to divisibility by the corresponding power
of two, but not by the next power. This is the elementary local lemma needed
before counting valuation classes in finite residue spaces. -/
theorem v2_eq_iff_dvd_pow_not_next
    (n j : ℕ) (hn : n ≠ 0) :
    v2 n = j ↔ 2 ^ j ∣ n ∧ ¬ 2 ^ (j + 1) ∣ n := by
  unfold v2
  have hpowj := Nat.prime_two.pow_dvd_iff_le_factorization (k := j) hn
  have hpowNext := Nat.prime_two.pow_dvd_iff_le_factorization (k := j + 1) hn
  constructor
  · intro h
    constructor
    · exact hpowj.mpr (by omega)
    · intro hnext
      have hle := hpowNext.mp hnext
      omega
  · rintro ⟨hdiv, hnot⟩
    have hj := hpowj.mp hdiv
    have hnext : ¬ j + 1 ≤ n.factorization 2 := by
      intro hle
      apply hnot
      exact hpowNext.mpr hle
    omega

#print axioms v2_eq_iff_dvd_pow_not_next


/-- For odd n, the numerator 3n+1 is even, so its 2-adic valuation is
at least one. This establishes the lower endpoint of the valuation distribution
without any probabilistic assumptions. -/
theorem one_le_v2_three_mul_add_one_of_odd
    (n : ℕ) (hn : n % 2 = 1) :
    1 ≤ v2 (3 * n + 1) := by
  have hnum : 3 * n + 1 ≠ 0 := by omega
  have hdiv : 2 ^ 1 ∣ 3 * n + 1 := by
    apply Nat.dvd_of_mod_eq_zero
    omega
  have hpow := Nat.prime_two.pow_dvd_iff_le_factorization (k := 1) hnum
  unfold v2
  exact hpow.mp hdiv

#print axioms one_le_v2_three_mul_add_one_of_odd

/-- Exact first-step split: among odd inputs, the accelerated Syracuse
numerator 3*n+1 has valuation exactly one precisely in the residue class
3 mod 4. This is a deterministic congruence statement, not a density claim. -/
theorem v2_three_mul_add_one_eq_one_iff_mod_four_three
    (n : ℕ) (hn : n % 2 = 1) :
    v2 (3 * n + 1) = 1 ↔ n % 4 = 3 := by
  have hnum : 3 * n + 1 ≠ 0 := by omega
  rw [v2_eq_iff_dvd_pow_not_next (3 * n + 1) 1 hnum]
  norm_num
  constructor
  · rintro ⟨hdiv, hnot⟩
    have hmod2 : (3 * n + 1) % 2 = 0 := Nat.dvd_iff_mod_eq_zero.mp hdiv
    have hmod4 : (3 * n + 1) % 4 ≠ 0 := by
      intro hz
      apply hnot
      exact Nat.dvd_iff_mod_eq_zero.mpr hz
    omega
  · intro hmodn
    constructor
    · apply Nat.dvd_of_mod_eq_zero
      omega
    · intro hdiv
      have hz : (3 * n + 1) % 4 = 0 := Nat.dvd_iff_mod_eq_zero.mp hdiv
      omega

#print axioms v2_three_mul_add_one_eq_one_iff_mod_four_three


/-- Exact second-step split: for odd inputs, valuation two occurs precisely
in the residue class 1 mod 8. This is another finite local statement; it does
not assert a global descent property. -/
theorem v2_three_mul_add_one_eq_two_iff_mod_eight_one
    (n : ℕ) (hn : n % 2 = 1) :
    v2 (3 * n + 1) = 2 ↔ n % 8 = 1 := by
  have hnum : 3 * n + 1 ≠ 0 := by omega
  rw [v2_eq_iff_dvd_pow_not_next (3 * n + 1) 2 hnum]
  norm_num
  constructor
  · rintro ⟨hdiv, hnot⟩
    have hmod4 : (3 * n + 1) % 4 = 0 :=
      Nat.dvd_iff_mod_eq_zero.mp hdiv
    have hmod8 : (3 * n + 1) % 8 ≠ 0 := by
      intro hz
      apply hnot
      exact Nat.dvd_iff_mod_eq_zero.mpr hz
    omega
  · intro hmodn
    constructor
    · apply Nat.dvd_of_mod_eq_zero
      omega
    · intro hdiv
      have hz : (3 * n + 1) % 8 = 0 :=
        Nat.dvd_iff_mod_eq_zero.mp hdiv
      omega

#print axioms v2_three_mul_add_one_eq_two_iff_mod_eight_one

end CollatzSyracuseAudit
