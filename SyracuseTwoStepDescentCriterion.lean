import Mathlib

/-!
A reusable local descent criterion for two Syracuse steps.

The recurrence identity is proved in SyracuseTwoStepExactIdentity.lean.
This lemma isolates the final order argument: once the exact right-hand side
is strictly below the scaled starting value, the endpoint is strictly smaller.
No frequency or average-valuation assumption is used.
-/

theorem syracuse_two_step_descent_of_scaled_bound
    (n k a b : ℕ)
    (hidentity : 2 ^ (a + b) * k = 9 * n + 3 + 2 ^ a)
    (hbound : 9 * n + 3 + 2 ^ a < 2 ^ (a + b) * n) :
    k < n := by
  by_contra hkn
  have hnk : n ≤ k := Nat.le_of_not_gt hkn
  have hmul : 2 ^ (a + b) * n ≤ 2 ^ (a + b) * k :=
    Nat.mul_le_mul_left (2 ^ (a + b)) hnk
  omega
