import Mathlib

namespace AdjacentValues

/-- The ternary-weighted binary exponential sum. -/
def T (n : ℕ) (e : Fin n → ℕ) : ℕ :=
  ∑ j : Fin n, 3 ^ (n - 1 - j.val) * 2 ^ (e j)

/-- Strict increase of an exponent vector indexed by Fin n. -/
def Admissible {n : ℕ} (e : Fin n → ℕ) : Prop :=
  StrictMono e

/--
Adding the same nonnegative integer to every exponent scales the value
of the sum by the corresponding power of two.
-/
theorem exponentShift (n s : ℕ) (e : Fin n → ℕ) :
    T n (fun j => e j + s) = 2 ^ s * T n e := by
  simp [T, pow_add, Finset.mul_sum, mul_comm, mul_left_comm, mul_assoc]

end AdjacentValues
