import Mathlib

namespace CollatzSyracuseAudit

/-- Division-free canonical offset for a prescribed cumulative exponent word. -/
def offsetLowerBoundModel (A : ℕ → ℕ) : ℕ → ℕ
  | 0 => 0
  | n + 1 => 3 * offsetLowerBoundModel A n + 2 ^ A n

/--
If the cumulative 2-adic exponent at time n is at least n, then the canonical
offset satisfies 3^n ≤ C_n + 2^n. This is stronger than the generic
doubled bound 3^n ≤ 2*C_n+1 for sufficiently large offsets, and follows
from the exact recurrence rather than a heuristic average multiplier.
It is a lower bound on the offset, not the upper bound needed for descent.
-/
theorem canonical_offset_plus_power_ge_power
    (A : ℕ → ℕ) (hA : ∀ n, n ≤ A n) :
    ∀ n, 3 ^ n ≤ offsetLowerBoundModel A n + 2 ^ n := by
  intro n
  induction n with
  | zero =>
      simp [offsetLowerBoundModel]
  | succ n ih =>
      simp only [offsetLowerBoundModel, pow_succ]
      have hpow : 2 ^ n ≤ 2 ^ A n :=
        Nat.pow_le_pow_right (by omega : 1 ≤ (2 : ℕ)) (hA n)
      nlinarith [ih, hpow]

/--
Sharpness calibration: when every cumulative exponent is exactly its index,
the lower-bound inequality is an equality. Thus the hypothesis A n ≥ n alone
cannot yield a strictly stronger universal lower bound for this offset model.
-/
theorem canonical_offset_is_sharp
    : ∀ n, offsetLowerBoundModel (fun j => j) n + 2 ^ n = 3 ^ n := by
  intro n
  induction n with
  | zero =>
      simp [offsetLowerBoundModel]
  | succ n ih =>
      simp only [offsetLowerBoundModel, pow_succ]
      nlinarith [ih]

#print axioms canonical_offset_plus_power_ge_power
#print axioms canonical_offset_is_sharp

end CollatzSyracuseAudit
