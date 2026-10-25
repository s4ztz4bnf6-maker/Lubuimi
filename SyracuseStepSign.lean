import Mathlib

set_option autoImplicit false

namespace CollatzSyracuseAudit

/--
For a certified accelerated transition with exponent exactly one, the next
state is strictly larger than the current state whenever n > 1.
Together with strict_descent_if_exponent_ge_two, this proves that the
one-step sign of the accelerated map is determined by whether the valuation
is exactly one or at least two. It is not a global convergence statement.
-/
theorem strict_growth_if_exponent_eq_one
    (n next : ℕ)
    (hn_gt_one : 1 < n)
    (hstep : 2 * next = 3 * n + 1) :
    n < next := by
  omega

/--
Exact dichotomy for a certified accelerated step: exponent one means growth;
any exponent at least two means strict descent. The transition equation
supplies the actual quotient, so no division-by-zero or noncanonical quotient
convention enters this local result.
-/
theorem certified_step_sign_dichotomy
    (n next a : ℕ)
    (hn_gt_one : 1 < n)
    (hstep : 2 ^ a * next = 3 * n + 1)
    (ha_pos : 1 ≤ a) :
    (a = 1 ∧ n < next) ∨ (2 ≤ a ∧ next < n) := by
  by_cases ha_one : a = 1
  · left
    constructor
    · exact ha_one
    · simpa [ha_one] using
        strict_growth_if_exponent_eq_one n next hn_gt_one (by simpa [ha_one] using hstep)
  · right
    constructor
    · omega
    · exact strict_descent_if_exponent_ge_two n next a (by omega) hn_gt_one hstep (by omega)
where
  strict_descent_if_exponent_ge_two
    (n next a : ℕ)
    (hn_odd : n % 2 = 1)
    (hn_gt_one : 1 < n)
    (hstep : 2 ^ a * next = 3 * n + 1)
    (ha : 2 ≤ a) : next < n := by
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

#print axioms strict_growth_if_exponent_eq_one
#print axioms certified_step_sign_dichotomy

end CollatzSyracuseAudit
