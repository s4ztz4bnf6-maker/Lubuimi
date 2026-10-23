import Mathlib

namespace CollatzSyracuseAudit

/--
The affine offset grows at least geometrically: if
  C (j+1) = 3 * C j + 2 ^ A j
and C 0 = 0, then C k ≥ 3^(k-1) for every positive k.

This is a necessary lower bound on the offset, not a descent theorem.
It does not establish the strict offset margin for any actual orbit.
-/
theorem offset_lower_bound_of_recurrence
    (A C : ℕ → ℕ)
    (hC0 : C 0 = 0)
    (hC : ∀ j, C (j + 1) = 3 * C j + 2 ^ A j) :
    ∀ k, 0 < k → 3 ^ (k - 1) ≤ C k := by
  intro k
  induction k with
  | zero =>
      intro hk
      omega
  | succ k ih =>
      intro hk
      have hrec := hC k
      by_cases hk0 : k = 0
      · subst k
        rw [hrec, hC0]
        simp only [Nat.succ_eq_add_one, Nat.add_sub_cancel_right, Nat.zero_add]
        have hpos : 0 < 2 ^ A 0 := pow_pos (by norm_num : 0 < (2 : ℕ)) _
        omega
      · have hkpos : 0 < k := Nat.pos_of_ne_zero hk0
        have hprev := ih hkpos
        rw [hrec]
        have hexp : Nat.succ k - 1 = k := by omega
        rw [hexp]
        have hpow : 3 ^ k = 3 * 3 ^ (k - 1) := by
          have hle : 1 ≤ k := Nat.succ_le_iff.mpr hkpos
          have hsub : k - 1 + 1 = k := Nat.sub_add_cancel hle
          rw [← hsub, pow_succ]
          ring
        calc
          3 ^ k = 3 * 3 ^ (k - 1) := hpow
          _ ≤ 3 * C k := Nat.mul_le_mul_left 3 hprev
          _ ≤ 3 * C k + 2 ^ A k := Nat.le_add_right _ _

#print axioms CollatzSyracuseAudit.offset_lower_bound_of_recurrence

end CollatzSyracuseAudit
