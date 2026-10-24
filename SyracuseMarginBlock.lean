import Mathlib

/-!
# Exact margin evolution on a prescribed block of valuation-one steps

This file isolates the algebraic effect of a run of exponents equal to one.
It is deliberately stated for an integer-valued margin recurrence, so no
truncated natural subtraction can hide a sign issue. The theorem is not a
global Collatz descent result: admissibility of a block and control of all
possible blocks remain separate obligations.
-/

namespace CollatzSyracuseAudit

/--
On a block where the cumulative exponent grows by exactly one at each step,
the margin recurrence has a closed form. The hypothesis hA is explicitly
restricted to the block under consideration.
-/
theorem margin_ones_block
    (D : ℕ → ℤ) (A : ℕ → ℕ) (j r : ℕ)
    (hD : ∀ k, D (k + 1) = 3 * D k - (2 : ℤ) ^ (A k + 1))
    (hA : ∀ t ≤ r, A (j + t) = A j + t) :
    D (j + r) =
      (3 : ℤ) ^ r * D j -
        (2 : ℤ) ^ (A j + 1) * ((3 : ℤ) ^ r - (2 : ℤ) ^ r) := by
  induction r with
  | zero =>
      simp
  | succ r ih =>
      have hA' : ∀ t ≤ r, A (j + t) = A j + t := by
        intro t ht
        exact hA t (by omega)
      have hAjr : A (j + r) = A j + r := hA r (by omega)
      calc
        D (j + (r + 1)) =
            3 * D (j + r) - (2 : ℤ) ^ (A (j + r) + 1) := by
              rw [show j + (r + 1) = (j + r) + 1 by omega]
              exact hD (j + r)
        _ = 3 * D (j + r) - (2 : ℤ) ^ (A j + r + 1) := by
              rw [hAjr]
        _ = 3 * ((3 : ℤ) ^ r * D j -
              (2 : ℤ) ^ (A j + 1) * ((3 : ℤ) ^ r - (2 : ℤ) ^ r)) -
              (2 : ℤ) ^ (A j + r + 1) := by
              rw [ih hA']
        _ = (3 : ℤ) ^ (r + 1) * D j -
              (2 : ℤ) ^ (A j + 1) *
                ((3 : ℤ) ^ (r + 1) - (2 : ℤ) ^ (r + 1)) := by
              have hexp : A j + r + 1 = (A j + 1) + r := by omega
              rw [hexp, pow_add, pow_succ, pow_succ]
              ring

#print axioms margin_ones_block

end CollatzSyracuseAudit
