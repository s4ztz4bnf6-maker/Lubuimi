import Mathlib

namespace CollatzSyracuseAudit

/-- Exponent of the prime 2 in the factorization of a natural number. -/
def v2 (m : ℕ) : ℕ :=
  m.factorization 2

/-- Syracuse step, defined by removing all powers of two from 3*n+1. -/
def syracuse (n : ℕ) : ℕ :=
  (3 * n + 1) / 2 ^ v2 (3 * n + 1)

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

end CollatzSyracuseAudit
