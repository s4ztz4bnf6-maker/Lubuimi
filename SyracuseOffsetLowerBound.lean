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

/-!
## Necessary multiplicative budget for any strictly descending certified block

This implication is deliberately one-way. It is a necessary condition on a
block whose exact affine identity is already certified; it does not establish
that every orbit has such a block.
-/

/-- If the exact affine block identity holds with a natural-number offset,
strict descent forces the cumulative power of two to exceed the power of
three. The additive offset is nonnegative automatically because it is in ℕ. -/
theorem strict_descent_forces_multiplicative_budget
    (A r n₀ nᵣ C : ℕ)
    (hn₀ : 0 < n₀)
    (hdesc : nᵣ < n₀)
    (hidentity : 2 ^ A * nᵣ = 3 ^ r * n₀ + C) :
    3 ^ r < 2 ^ A := by
  have hstep : 2 ^ A * nᵣ < 2 ^ A * n₀ :=
    Nat.mul_lt_mul_of_pos_left hdesc (by positivity)
  have hlower : 3 ^ r * n₀ ≤ 2 ^ A * nᵣ := by
    rw [hidentity]
    omega
  have hmul : 3 ^ r * n₀ < 2 ^ A * n₀ :=
    lt_of_le_of_lt hlower hstep
  exact (Nat.mul_lt_mul_right hn₀).mp hmul

/-- Re-express the necessary block budget in terms of valuation excess E,
where A = r + E. This is an exact natural-number inequality; no logarithmic
or floating-point approximation is involved. -/
theorem strict_descent_forces_excess_budget
    (r E n₀ nᵣ C : ℕ)
    (hn₀ : 0 < n₀)
    (hdesc : nᵣ < n₀)
    (hidentity : 2 ^ (r + E) * nᵣ = 3 ^ r * n₀ + C) :
    3 ^ r < 2 ^ (r + E) :=
  strict_descent_forces_multiplicative_budget
    (r + E) r n₀ nᵣ C hn₀ hdesc hidentity

#print axioms strict_descent_forces_multiplicative_budget
#print axioms strict_descent_forces_excess_budget
