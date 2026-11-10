import Mathlib

namespace CollatzSyracuseAudit

/--
For the canonical offset recurrence C (n+1) = 3*C n + 2^(A n),
the induction step for 3^n ≤ C n + 2^n is exposed as a separate lemma.
The assumption n ≤ A n supplies 2^n ≤ 2^(A n); the remainder is
ordinary arithmetic. This lemma is local and makes no global Collatz claim.
-/
theorem canonicalOffset_lower_bound_step
    (n Cn An : ℕ)
    (hbound : 3 ^ n ≤ Cn + 2 ^ n)
    (hpow : 2 ^ n ≤ 2 ^ An) :
    3 ^ (n + 1) ≤ (3 * Cn + 2 ^ An) + 2 ^ (n + 1) := by
  have hpow_succ : 2 ^ (n + 1) = 2 * 2 ^ n := by
    rw [pow_succ]
    norm_num
  rw [pow_succ]
  nlinarith

end CollatzSyracuseAudit
