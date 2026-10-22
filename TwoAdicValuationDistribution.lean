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
  have hpow := Nat.prime_two.pow_dvd_iff_le_factorization hn
  constructor
  · intro h
    constructor
    · exact hpow.mpr (by omega)
    · intro hnext
      have hle := hpow.mp hnext
      omega
  · rintro ⟨hdiv, hnot⟩
    have hj := hpow.mp hdiv
    have hnext : ¬ j + 1 ≤ n.factorization 2 := by
      intro hle
      apply hnot
      exact hpow.mpr hle
    omega

#print axioms v2_eq_iff_dvd_pow_not_next

end CollatzSyracuseAudit
