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

#print axioms CollatzSyracuseAudit.offset_identity_of_certified_steps

end CollatzSyracuseAudit
