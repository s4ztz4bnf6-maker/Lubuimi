import Mathlib
import SyracuseQuarterDescent

namespace CollatzSyracuseAudit

/-- Exponent of the prime 2 in the factorization of a natural number. -/
def v2 (m : ℕ) : ℕ :=
  m.factorization 2

/-- Syracuse step, defined by removing all powers of two from 3*n+1. -/
def syracuse (n : ℕ) : ℕ :=
  (3 * n + 1) / 2 ^ v2 (3 * n + 1)

 /-- Every accelerated Syracuse output is odd: the full 2-adic
factorization exponent removes every factor of two from the numerator. -/
theorem syracuse_output_odd (n : ℕ) :
    syracuse n % 2 = 1 := by
  unfold syracuse v2
  let m := 3 * n + 1
  change (m / 2 ^ m.factorization 2) % 2 = 1
  have hm : m ≠ 0 := by
    dsimp [m]
    omega
  have hdvd : 2 ^ m.factorization 2 ∣ m :=
    (Nat.prime_two.pow_dvd_iff_le_factorization hm).2 le_rfl
  have hcancel :
      (m / 2 ^ m.factorization 2) * 2 ^ m.factorization 2 = m :=
    Nat.div_mul_cancel hdvd
  have hnot : ¬ 2 ∣ m / 2 ^ m.factorization 2 := by
    intro heven
    obtain ⟨q, hq⟩ := heven
    have hpow : 2 ^ (m.factorization 2 + 1) ∣ m := by
      refine ⟨q, ?_⟩
      calc
        m = (m / 2 ^ m.factorization 2) * 2 ^ m.factorization 2 :=
          hcancel.symm
        _ = (2 * q) * 2 ^ m.factorization 2 := by rw [hq]
        _ = q * 2 ^ (m.factorization 2 + 1) := by
          rw [pow_succ]
          ring
    have hle :=
      (Nat.prime_two.pow_dvd_iff_le_factorization hm).mp hpow
    omega
  have hmod : (m / 2 ^ m.factorization 2) % 2 ≠ 0 := by
    intro hz
    apply hnot
    exact Nat.dvd_iff_mod_eq_zero.mpr hz
  have hlt : (m / 2 ^ m.factorization 2) % 2 < 2 :=
    Nat.mod_lt _ (by omega)
  omega

/-- If n is odd, then 3*n+1 is even. -/
theorem three_mul_add_one_even
    (n : ℕ) (h : n % 2 = 1) :
    (3 * n + 1) % 2 = 0 := by
  omega

/-- Smoke test: the factorization-based reference definition elaborates. -/
example (n : ℕ) : syracuse n = (3 * n + 1) / 2 ^ v2 (3 * n + 1) := by
  rfl

/-- A divisor by 4 forces at least two factors of 2 in the factorization. -/
theorem two_le_v2_of_four_dvd
    (m : ℕ) (hm : m ≠ 0) (hfour : 4 ∣ m) :
    2 ≤ v2 m := by
  have hpow : 2 ^ 2 ∣ m := by
    simpa using hfour
  exact (Nat.prime_two.pow_dvd_iff_le_factorization hm).mp hpow

/-- Monotonicity of the power of 2 gives the denominator bound. -/
theorem pow_two_ge_four
    (a : ℕ) (ha : 2 ≤ a) :
    4 ≤ 2 ^ a := by
  calc
    4 = 2 ^ 2 := by norm_num
    _ ≤ 2 ^ a := Nat.pow_le_pow_right (by omega) ha

/-- Natural-number division decreases when its positive divisor increases. -/
theorem div_pow_le_div_four
    (N a : ℕ) (ha : 4 ≤ 2 ^ a) :
    N / 2 ^ a ≤ N / 4 := by
  apply (Nat.le_div_iff_mul_le (by norm_num : 0 < 4)).2
  calc
    (N / 2 ^ a) * 4 ≤ (N / 2 ^ a) * 2 ^ a :=
      Nat.mul_le_mul_left (N / 2 ^ a) ha
    _ ≤ N := Nat.div_mul_le_self N (2 ^ a)

#print axioms CollatzSyracuseAudit.two_le_v2_of_four_dvd
#print axioms CollatzSyracuseAudit.pow_two_ge_four
#print axioms CollatzSyracuseAudit.div_pow_le_div_four

/-- If the odd Syracuse input has at least two factors of 2 in 3*n+1,
then the accelerated Syracuse step is strictly smaller than n (for n > 1). -/
theorem syracuse_descent_of_four_dvd
    (n : ℕ) (hn : n % 2 = 1) (hn_two : 2 ≤ n)
    (hfour : 4 ∣ 3 * n + 1) :
    syracuse n < n := by
  have hm : 3 * n + 1 ≠ 0 := by omega
  have ha : 2 ≤ v2 (3 * n + 1) :=
    two_le_v2_of_four_dvd (3 * n + 1) hm hfour
  have hden : 4 ≤ 2 ^ v2 (3 * n + 1) :=
    pow_two_ge_four (v2 (3 * n + 1)) ha
  have hdiv :
      (3 * n + 1) / 2 ^ v2 (3 * n + 1) ≤ (3 * n + 1) / 4 :=
    div_pow_le_div_four (3 * n + 1) (v2 (3 * n + 1)) hden
  have hmodm : (3 * n + 1) % 4 = 0 :=
    Nat.dvd_iff_mod_eq_zero.mp hfour
  have hnmod : n % 4 = 1 := by omega
  have hquarter : (3 * n + 1) / 4 < n :=
    quarter_descent_of_mod_four_one n hnmod hn_two
  dsimp [syracuse]
  omega

#print axioms CollatzSyracuseAudit.syracuse_descent_of_four_dvd

/-- The residue condition n = 1 (mod 4) supplies the divisibility-by-four
hypothesis needed for the accelerated Syracuse descent theorem. -/
theorem syracuse_descent_mod_four_one
    (n : ℕ) (hnmod : n % 4 = 1) (hn_two : 2 ≤ n) :
    syracuse n < n := by
  have hn_odd : n % 2 = 1 := by omega
  have hfour : 4 ∣ 3 * n + 1 := by
    apply Nat.dvd_iff_mod_eq_zero.mpr
    omega
  exact syracuse_descent_of_four_dvd n hn_odd hn_two hfour

#print axioms CollatzSyracuseAudit.syracuse_descent_mod_four_one

end CollatzSyracuseAudit
