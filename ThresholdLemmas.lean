import Mathlib

/-- A threshold crossing with a factorization by 2^k forces k = 1. -/
theorem threshold_factor_eq_one
    (x B y k : ℕ)
    (hB : 2 ≤ B)
    (hx : x < B)
    (hy : B ≤ y)
    (hk : 1 ≤ k)
    (hfactor : 3 * x + 1 = 2 ^ k * y) :
    k = 1 := by
  by_contra hne
  have hk2 : 2 ≤ k := by omega
  have hpow : 4 ≤ 2 ^ k := by
    calc
      4 = 2 ^ 2 := by norm_num
      _ ≤ 2 ^ k := Nat.pow_le_pow_right (by omega) hk2
  have hlow : 4 * B ≤ 2 ^ k * y := by
    calc
      4 * B ≤ 2 ^ k * B := Nat.mul_le_mul_right B hpow
      _ ≤ 2 ^ k * y := Nat.mul_le_mul_left (2 ^ k) hy
  have hupp : 3 * x + 1 < 4 * B := by omega
  rw [hfactor] at hlow
  omega

/-- Odd x and odd y in 3*x + 1 = 2*y imply x = 3 (mod 4). -/
theorem threshold_mod_four
    (x y : ℕ)
    (hfactor : 3 * x + 1 = 2 * y)
    (hx_odd : x % 2 = 1)
    (hy_odd : y % 2 = 1) :
    x % 4 = 3 := by
  omega

/-- The threshold condition B ≤ y is equivalent to 2*B ≤ 3*x+1. -/
theorem threshold_iff_double
    (B x y : ℕ)
    (hfactor : 3 * x + 1 = 2 * y) :
    B ≤ y ↔ 2 * B ≤ 3 * x + 1 := by
  rw [hfactor]
  omega
