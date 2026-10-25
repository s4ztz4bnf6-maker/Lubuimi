import Mathlib

namespace SyracuseAudit

theorem numerator_reconstruction (n q : ℕ) (h : 2 ^ q ∣ 3 * n + 1) :
    2 ^ q * ((3 * n + 1) / 2 ^ q) = 3 * n + 1 := by
  exact Nat.mul_div_cancel' h

end SyracuseAudit
