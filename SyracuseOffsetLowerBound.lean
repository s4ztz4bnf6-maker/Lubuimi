import SyracuseOffsetIdentity

namespace CollatzSyracuseAudit

/--
The affine offset grows at least geometrically: if
  C (j+1) = 3 * C j + 2 ^ A j
and C 0 = 0, then C k ≥ 3^(k-1) for every positive k.

This is a necessary lower bound on the offset, not a descent theorem.
In particular, it does not show that the offset margin is positive or
negative for any given orbit.
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
        simp
        exact le_of_lt (pow_pos (by norm_num : 0 < (2 : ℕ)) _)
      · have hkpos : 0 < k := Nat.pos_of_ne_zero hk0
        have hprev := ih hkpos
        rw [hrec]
        have hexp : Nat.succ k - 1 = k := by omega
        rw [hexp]
        calc
          3 ^ k = 3 * 3 ^ (k - 1) := by
            rw [← pow_succ]
            congr 1
            omega
          _ ≤ 3 * C k := Nat.mul_le_mul_left 3 hprev
          _ ≤ 3 * C k + 2 ^ A k := Nat.le_add_right _ _

#print axioms CollatzSyracuseAudit.offset_lower_bound_of_recurrence

end CollatzSyracuseAudit
