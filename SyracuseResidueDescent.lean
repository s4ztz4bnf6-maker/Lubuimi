import Mathlib

namespace CollatzSyracuseAudit

/-- Exponent of the prime 2 in the factorization of a natural number. -/
def v2 (m : ℕ) : ℕ := m.factorization 2

/-- Syracuse step, defined by removing all powers of two from 3*n+1. -/
def syracuse (n : ℕ) : ℕ :=
  (3 * n + 1) / 2 ^ v2 (3 * n + 1)

/-- A divisor by 4 forces at least two factors of 2 in the factorization. -/
theorem two_le_v2_of_four_dvd
    (m : ℕ) (hm : m ≠ 0) (hfour : 4 ∣ m) :
    2 ≤ v2 m := by
  have hpow : 2 ^ 2 ∣ m := by
    norm_num at hfour ⊢
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

/--
Local strict descent for the accelerated Syracuse map on the residue class
n ≡ 1 (mod 4). This is a residue-class theorem only; it does not assert that
every orbit visits this class or that all orbits terminate.
-/
theorem syracuse_strict_descent_of_mod_four_one
    (n : ℕ) (hn : n % 4 = 1) (hn_two : 2 ≤ n) :
    syracuse n < n := by
  have hfour_mod : (3 * n + 1) % 4 = 0 := by omega
  have hfour : 4 ∣ 3 * n + 1 :=
    Nat.dvd_of_mod_eq_zero hfour_mod
  have hm : 3 * n + 1 ≠ 0 := by omega
  have hv2 : 2 ≤ v2 (3 * n + 1) :=
    two_le_v2_of_four_dvd (3 * n + 1) hm hfour
  have hden : 4 ≤ 2 ^ v2 (3 * n + 1) :=
    pow_two_ge_four (v2 (3 * n + 1)) hv2
  have hquot :
      (3 * n + 1) / 2 ^ v2 (3 * n + 1) ≤ (3 * n + 1) / 4 :=
    div_pow_le_div_four (3 * n + 1) (v2 (3 * n + 1)) hden
  have hquarter : (3 * n + 1) / 4 < n := by omega
  change (3 * n + 1) / 2 ^ v2 (3 * n + 1) < n
  exact lt_of_le_of_lt hquot hquarter

#print axioms CollatzSyracuseAudit.syracuse_strict_descent_of_mod_four_one

end CollatzSyracuseAudit
