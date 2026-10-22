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



/-- Exact third valuation class: for odd inputs, valuation three occurs
precisely at the residue class 13 modulo 16. This is a local congruence
statement, not a global Collatz descent theorem. -/
theorem v2_three_mul_add_one_eq_three_iff_mod_sixteen_thirteen
    (n : ℕ) (hn : n % 2 = 1) :
    v2 (3 * n + 1) = 3 ↔ n % 16 = 13 := by
  have hnum : 3 * n + 1 ≠ 0 := by omega
  rw [v2_eq_iff_dvd_pow_not_next (3 * n + 1) 3 hnum]
  norm_num
  constructor
  · rintro ⟨hdiv, hnot⟩
    have hmod8 : (3 * n + 1) % 8 = 0 :=
      Nat.dvd_iff_mod_eq_zero.mp hdiv
    have hmod16 : (3 * n + 1) % 16 ≠ 0 := by
      intro hz
      apply hnot
      exact Nat.dvd_iff_mod_eq_zero.mpr hz
    omega
  · intro hmodn
    constructor
    · apply Nat.dvd_of_mod_eq_zero
      omega
    · intro hdiv
      have hz : (3 * n + 1) % 16 = 0 :=
        Nat.dvd_iff_mod_eq_zero.mp hdiv
      omega

#print axioms v2_three_mul_add_one_eq_three_iff_mod_sixteen_thirteen



/-- Exact fourth valuation class: v₂(3n+1)=4 precisely when n is 5
modulo 32, for odd n. This is another local class, not a global descent
result. -/
theorem v2_three_mul_add_one_eq_four_iff_mod_thirty_two_five
    (n : ℕ) (hn : n % 2 = 1) :
    v2 (3 * n + 1) = 4 ↔ n % 32 = 5 := by
  have hnum : 3 * n + 1 ≠ 0 := by omega
  rw [v2_eq_iff_dvd_pow_not_next (3 * n + 1) 4 hnum]
  norm_num
  constructor
  · rintro ⟨hdiv, hnot⟩
    have hmod16 : (3 * n + 1) % 16 = 0 :=
      Nat.dvd_iff_mod_eq_zero.mp hdiv
    have hmod32 : (3 * n + 1) % 32 ≠ 0 := by
      intro hz
      apply hnot
      exact Nat.dvd_iff_mod_eq_zero.mpr hz
    omega
  · intro hmodn
    constructor
    · apply Nat.dvd_of_mod_eq_zero
      omega
    · intro hdiv
      have hz : (3 * n + 1) % 32 = 0 :=
        Nat.dvd_iff_mod_eq_zero.mp hdiv
      omega

#print axioms v2_three_mul_add_one_eq_four_iff_mod_thirty_two_five



/-- Exact fifth valuation class: for odd n, v₂(3n+1)=5 exactly when
n is 53 modulo 64. This is still a local residue-class theorem. -/
theorem v2_three_mul_add_one_eq_five_iff_mod_sixty_four_fifty_three
    (n : ℕ) (hn : n % 2 = 1) :
    v2 (3 * n + 1) = 5 ↔ n % 64 = 53 := by
  have hnum : 3 * n + 1 ≠ 0 := by omega
  rw [v2_eq_iff_dvd_pow_not_next (3 * n + 1) 5 hnum]
  norm_num
  constructor
  · rintro ⟨hdiv, hnot⟩
    have hmod32 : (3 * n + 1) % 32 = 0 :=
      Nat.dvd_iff_mod_eq_zero.mp hdiv
    have hmod64 : (3 * n + 1) % 64 ≠ 0 := by
      intro hz
      apply hnot
      exact Nat.dvd_iff_mod_eq_zero.mpr hz
    omega
  · intro hmodn
    constructor
    · apply Nat.dvd_of_mod_eq_zero
      omega
    · intro hdiv
      have hz : (3 * n + 1) % 64 = 0 :=
        Nat.dvd_iff_mod_eq_zero.mp hdiv
      omega

#print axioms v2_three_mul_add_one_eq_five_iff_mod_sixty_four_fifty_three

end CollatzSyracuseAudit

/-- Exact sixth valuation class: among odd inputs, v₂(3n+1)=6 exactly
when n is 21 modulo 128. This records the unique exact-valuation lift at
the next 2-adic level; it remains a local congruence result. -/
theorem v2_three_mul_add_one_eq_six_iff_mod_one_twenty_eight_twenty_one
    (n : ℕ) (hn : n % 2 = 1) :
    v2 (3 * n + 1) = 6 ↔ n % 128 = 21 := by
  have hnum : 3 * n + 1 ≠ 0 := by omega
  rw [v2_eq_iff_dvd_pow_not_next (3 * n + 1) 6 hnum]
  norm_num
  constructor
  · rintro ⟨hdiv, hnot⟩
    have hmod64 : (3 * n + 1) % 64 = 0 :=
      Nat.dvd_iff_mod_eq_zero.mp hdiv
    have hmod128 : (3 * n + 1) % 128 ≠ 0 := by
      intro hz
      apply hnot
      exact Nat.dvd_iff_mod_eq_zero.mpr hz
    omega
  · intro hmodn
    constructor
    · apply Nat.dvd_of_mod_eq_zero
      omega
    · intro hdiv
      have hz : (3 * n + 1) % 128 = 0 :=
        Nat.dvd_iff_mod_eq_zero.mp hdiv
      omega

#print axioms v2_three_mul_add_one_eq_six_iff_mod_one_twenty_eight_twenty_one

/-- Exact seventh valuation class: v₂(3n+1)=7 precisely for n=213
modulo 256 among odd inputs. The residue is the non-divisible-by-256 lift
of the class divisible by 128. -/
theorem v2_three_mul_add_one_eq_seven_iff_mod_two_fifty_six_two_thirteen
    (n : ℕ) (hn : n % 2 = 1) :
    v2 (3 * n + 1) = 7 ↔ n % 256 = 213 := by
  have hnum : 3 * n + 1 ≠ 0 := by omega
  rw [v2_eq_iff_dvd_pow_not_next (3 * n + 1) 7 hnum]
  norm_num
  constructor
  · rintro ⟨hdiv, hnot⟩
    have hmod128 : (3 * n + 1) % 128 = 0 :=
      Nat.dvd_iff_mod_eq_zero.mp hdiv
    have hmod256 : (3 * n + 1) % 256 ≠ 0 := by
      intro hz
      apply hnot
      exact Nat.dvd_iff_mod_eq_zero.mpr hz
    omega
  · intro hmodn
    constructor
    · apply Nat.dvd_of_mod_eq_zero
      omega
    · intro hdiv
      have hz : (3 * n + 1) % 256 = 0 :=
        Nat.dvd_iff_mod_eq_zero.mp hdiv
      omega

#print axioms v2_three_mul_add_one_eq_seven_iff_mod_two_fifty_six_two_thirteen


/-- Exact eighth valuation class: among odd inputs, v₂(3n+1)=8 precisely
when n is 85 modulo 512. The congruence is the unique lift divisible by
256 but not by 512. This remains a local arithmetic statement. -/
theorem v2_three_mul_add_one_eq_eight_iff_mod_five_twelve_eighty_five
    (n : ℕ) (hn : n % 2 = 1) :
    v2 (3 * n + 1) = 8 ↔ n % 512 = 85 := by
  have hnum : 3 * n + 1 ≠ 0 := by omega
  rw [v2_eq_iff_dvd_pow_not_next (3 * n + 1) 8 hnum]
  norm_num
  constructor
  · rintro ⟨hdiv, hnot⟩
    have hmod256 : (3 * n + 1) % 256 = 0 :=
      Nat.dvd_iff_mod_eq_zero.mp hdiv
    have hmod512 : (3 * n + 1) % 512 ≠ 0 := by
      intro hz
      apply hnot
      exact Nat.dvd_iff_mod_eq_zero.mpr hz
    omega
  · intro hmodn
    constructor
    · apply Nat.dvd_of_mod_eq_zero
      omega
    · intro hdiv
      have hz : (3 * n + 1) % 512 = 0 :=
        Nat.dvd_iff_mod_eq_zero.mp hdiv
      omega

#print axioms v2_three_mul_add_one_eq_eight_iff_mod_five_twelve_eighty_five


/-- Exact ninth valuation class: among odd inputs, v₂(3n+1)=9 precisely
when n is 341 modulo 1024. This is the unique exact-valuation lift at
the next 2-adic level; it does not imply global termination. -/
theorem v2_three_mul_add_one_eq_nine_iff_mod_ten_twenty_four_three_forty_one
    (n : ℕ) (hn : n % 2 = 1) :
    v2 (3 * n + 1) = 9 ↔ n % 1024 = 341 := by
  have hnum : 3 * n + 1 ≠ 0 := by omega
  rw [v2_eq_iff_dvd_pow_not_next (3 * n + 1) 9 hnum]
  norm_num
  constructor
  · rintro ⟨hdiv, hnot⟩
    have hmod512 : (3 * n + 1) % 512 = 0 :=
      Nat.dvd_iff_mod_eq_zero.mp hdiv
    have hmod1024 : (3 * n + 1) % 1024 ≠ 0 := by
      intro hz
      apply hnot
      exact Nat.dvd_iff_mod_eq_zero.mpr hz
    omega
  · intro hmodn
    constructor
    · apply Nat.dvd_of_mod_eq_zero
      omega
    · intro hdiv
      have hz : (3 * n + 1) % 1024 = 0 :=
        Nat.dvd_iff_mod_eq_zero.mp hdiv
      omega

#print axioms v2_three_mul_add_one_eq_nine_iff_mod_ten_twenty_four_three_forty_one

/-- Exact tenth valuation class: among odd inputs, v₂(3n+1)=10 precisely
when n is 341 modulo 2048. The proof is a finite congruence certificate only;
the general valuation-counting theorem and global descent remain open tasks. -/
theorem v2_three_mul_add_one_eq_ten_iff_mod_two_thousand_forty_eight_three_forty_one
    (n : ℕ) (hn : n % 2 = 1) :
    v2 (3 * n + 1) = 10 ↔ n % 2048 = 341 := by
  have hnum : 3 * n + 1 ≠ 0 := by omega
  rw [v2_eq_iff_dvd_pow_not_next (3 * n + 1) 10 hnum]
  norm_num
  constructor
  · rintro ⟨hdiv, hnot⟩
    have hmod1024 : (3 * n + 1) % 1024 = 0 :=
      Nat.dvd_iff_mod_eq_zero.mp hdiv
    have hmod2048 : (3 * n + 1) % 2048 ≠ 0 := by
      intro hz
      apply hnot
      exact Nat.dvd_iff_mod_eq_zero.mpr hz
    omega
  · intro hmodn
    constructor
    · apply Nat.dvd_of_mod_eq_zero
      omega
    · intro hdiv
      have hz : (3 * n + 1) % 2048 = 0 :=
        Nat.dvd_iff_mod_eq_zero.mp hdiv
      omega

#print axioms v2_three_mul_add_one_eq_ten_iff_mod_two_thousand_forty_eight_three_forty_one

