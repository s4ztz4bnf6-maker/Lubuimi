import Mathlib

set_option autoImplicit false

namespace CollatzSyracuseAudit

/--
A certified odd Syracuse transition with removed exponent at least two
strictly decreases every odd input greater than one. The exceptional fixed
point n = 1 is explicitly excluded; at n = 1, exponent two gives equality.
This is a local descent theorem, not a proof that every orbit eventually
reaches 1.
-/
theorem strict_descent_if_exponent_ge_two
    (n next a : ℕ)
    (hn_odd : n % 2 = 1)
    (hn_gt_one : 1 < n)
    (hstep : 2 ^ a * next = 3 * n + 1)
    (ha : 2 ≤ a) :
    next < n := by
  have hpow : 4 ≤ 2 ^ a := by
    calc
      4 = 2 ^ 2 := by norm_num
      _ ≤ 2 ^ a := Nat.pow_le_pow_right (by omega : 1 ≤ 2) ha
  have hscaled : 4 * next ≤ 2 ^ a * next :=
    Nat.mul_le_mul_right next hpow
  have hupper : 3 * n + 1 < 4 * n := by omega
  have hlt : 4 * next < 4 * n := by
    rw [hstep] at hscaled
    omega
  omega

#print axioms strict_descent_if_exponent_ge_two

end CollatzSyracuseAudit
