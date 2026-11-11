import Mathlib

/-!
# Exact valuation information from a two-step Syracuse congruence

The congruence below is the affine two-step transition condition.  This
module proves that it already forces the starting value to be odd and its
first accelerated valuation to be exactly k.  It is a local finite
arithmetic result; it does not assert arbitrary infinite-word realization
or global Collatz convergence.
-/

namespace SyracuseAudit

/-- A two-step transition residue forces the initial value to be odd and
the first valuation to be exactly k. -/
theorem transition_congruence_forces_start_exact
    (n k j : ℕ) (hk : 1 ≤ k) (hj : 1 ≤ j)
    (htransition :
      (9 * n + 3 + 2 ^ k) % 2 ^ (k + j + 1) = 2 ^ (k + j)) :
    n % 2 = 1 ∧
      2 ^ k ∣ 3 * n + 1 ∧
      ¬ 2 ^ (k + 1) ∣ 3 * n + 1 := by
  let x : ℕ := 9 * n + 3 + 2 ^ k
  let m : ℕ := 2 ^ (k + j + 1)
  have hdecomp : 2 ^ (k + j) + m * (x / m) = x := by
    have h := Nat.mod_add_div x m
    simpa [x, m, htransition] using h
  have hpowLeft : 2 ^ (k + 1) ∣ 2 ^ (k + j) :=
    Nat.pow_dvd_pow 2 (by omega)
  have hpowRight : 2 ^ (k + 1) ∣ m := by
    dsimp [m]
    exact Nat.pow_dvd_pow 2 (by omega)
  have hmul : 2 ^ (k + 1) ∣ m * (x / m) :=
    dvd_mul_of_dvd_left hpowRight _
  have hdivBig : 2 ^ (k + 1) ∣ x := by
    rw [← hdecomp]
    exact Nat.dvd_add hpowLeft hmul
  have hdivSmall : 2 ^ k ∣ x :=
    dvd_trans (Nat.pow_dvd_pow 2 (by omega)) hdivBig
  have hmodX : x % 2 ^ k = 0 :=
    Nat.mod_eq_zero_of_dvd hdivSmall
  have hident : 9 * n + 3 = 3 * (3 * n + 1) := by ring
  have hmodThree : (3 * (3 * n + 1)) % 2 ^ k = 0 := by
    dsimp [x] at hmodX
    rw [hident] at hmodX
    simpa [Nat.add_mod] using hmodX
  have hdivThree : 2 ^ k ∣ 3 * (3 * n + 1) :=
    Nat.dvd_of_mod_eq_zero hmodThree
  have hcop : Nat.Coprime (2 ^ k) 3 :=
    Nat.Coprime.pow_left k (by norm_num : Nat.Coprime 2 3)
  have hdivStart : 2 ^ k ∣ 3 * n + 1 :=
    hcop.dvd_of_dvd_mul_left hdivThree
  have hdivBig' : 2 ^ (k + 1) ∣ 3 * (3 * n + 1) + 2 ^ k := by
    have hx : x = 3 * (3 * n + 1) + 2 ^ k := by
      dsimp [x]
      rw [hident]
    rw [← hx]
    exact hdivBig
  have hexact : ¬ 2 ^ (k + 1) ∣ 3 * n + 1 := by
    intro hnext
    have hdivThreeNext : 2 ^ (k + 1) ∣ 3 * (3 * n + 1) :=
      dvd_mul_of_dvd_right hnext 3
    have hdivPow : 2 ^ (k + 1) ∣ 2 ^ k := by
      simpa [Nat.add_sub_cancel_left] using
        Nat.dvd_sub hdivBig' hdivThreeNext
    have hle : 2 ^ (k + 1) ≤ 2 ^ k :=
      Nat.le_of_dvd (by positivity) hdivPow
    have hlt : 2 ^ k < 2 ^ (k + 1) := by
      rw [pow_succ]
      have hp : 0 < 2 ^ k := by positivity
      omega
    omega
  have htwoPow : 2 ∣ 2 ^ k :=
    Nat.pow_dvd_pow 2 hk
  have htwo : 2 ∣ 3 * n + 1 :=
    dvd_trans htwoPow hdivStart
  have hmod : (3 * n + 1) % 2 = 0 :=
    Nat.mod_eq_zero_of_dvd htwo
  have hmod' : (n % 2 + 1) % 2 = 0 := by
    simpa [Nat.add_mod, Nat.mul_mod] using hmod
  have hn : n % 2 = 1 := by omega
  exact ⟨hn, hdivStart, hexact⟩

#print axioms transition_congruence_forces_start_exact

end SyracuseAudit
