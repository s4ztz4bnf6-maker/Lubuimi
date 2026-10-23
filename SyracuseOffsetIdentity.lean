import Mathlib

namespace CollatzSyracuseAudit

/--
A certified accelerated-odd transition: the exponent a j is the exact
power of two removed at step j. This equality must be supplied by the
transition certificate, not inferred from a residue-class heuristic.
-/
theorem offset_identity_of_certified_steps
    (n a A C : ℕ → ℕ)
    (hA0 : A 0 = 0)
    (hC0 : C 0 = 0)
    (hA : ∀ j, A (j + 1) = A j + a j)
    (hC : ∀ j, C (j + 1) = 3 * C j + 2 ^ A j)
    (hstep : ∀ j, 2 ^ (a j) * n (j + 1) = 3 * n j + 1) :
    ∀ j, 2 ^ (A j) * n j = 3 ^ j * n 0 + C j := by
  intro j
  induction j with
  | zero =>
      simp [hA0, hC0]
  | succ j ih =>
      rw [hA j, hC j, pow_add]
      calc
        2 ^ A j * 2 ^ a j * n (j + 1)
            = 2 ^ A j * (2 ^ a j * n (j + 1)) := by ring
        _ = 2 ^ A j * (3 * n j + 1) := by rw [hstep j]
        _ = 3 * (2 ^ A j * n j) + 2 ^ A j := by ring
        _ = 3 * (3 ^ j * n 0 + C j) + 2 ^ A j := by rw [ih]
        _ = 3 ^ (j + 1) * n 0 + (3 * C j + 2 ^ A j) := by
              rw [pow_succ]
              ring

/--
A strict offset margin is sufficient for a genuine decrease of the iterate.
This isolates the exact inequality still needed after the offset identity:
the lemma does not assert that the margin holds for arbitrary trajectories.
-/
theorem strict_descent_of_offset_margin
    (n0 nj A C j : ℕ)
    (hidentity : 2 ^ A * nj = 3 ^ j * n0 + C)
    (hmargin : 3 ^ j * n0 + C < 2 ^ A * n0) :
    nj < n0 := by
  have hprod : 2 ^ A * nj < 2 ^ A * n0 := by
    rw [hidentity]
    exact hmargin
  exact (Nat.mul_lt_mul_left (pow_pos (by norm_num : 0 < (2 : ℕ)) A)).mp hprod

/--
Under the exact offset identity, descent is equivalent to the strict margin.
This is a characterization, not a proof that any given trajectory satisfies
the margin.
-/
theorem descent_iff_offset_margin
    (n0 nj A C j : ℕ)
    (hidentity : 2 ^ A * nj = 3 ^ j * n0 + C) :
    nj < n0 ↔ 3 ^ j * n0 + C < 2 ^ A * n0 := by
  constructor
  · intro hdesc
    have hprod : 2 ^ A * nj < 2 ^ A * n0 :=
      (Nat.mul_lt_mul_left (pow_pos (by norm_num : 0 < (2 : ℕ)) A)).mpr hdesc
    rw [hidentity] at hprod
    exact hprod
  · intro hmargin
    exact strict_descent_of_offset_margin n0 nj A C j hidentity hmargin

#print axioms CollatzSyracuseAudit.offset_identity_of_certified_steps
#print axioms CollatzSyracuseAudit.strict_descent_of_offset_margin
#print axioms CollatzSyracuseAudit.descent_iff_offset_margin

end CollatzSyracuseAudit
