import ParityCocycleResearch
import Mathlib

namespace CollatzSyracuseAudit

/-- If the exact affine numerator for the actual k-step orbit is below
2^k times the starting value, then the actual iterate is strictly smaller.
This is the orbit-linked form of the affine block criterion. It is conditional:
the required bound is not asserted for every n and k. -/
theorem cocycleIter_lt_of_affine_bound (n k : ℕ)
    (hbound :
      cocycleA n k * n + cocycleB n k < 2 ^ k * n) :
    cocycleIter n k < n := by
  have hmul : 2 ^ k * cocycleIter n k < 2 ^ k * n := by
    calc
      2 ^ k * cocycleIter n k = cocycleA n k * n + cocycleB n k :=
        cocycleIter_affine_identity n k
      _ < 2 ^ k * n := hbound
  exact (Nat.mul_lt_mul_left (Nat.pow_pos (by omega))).mp hmul

/-- The affine coefficient must be strictly below the denominator before
the difference-bound method can certify descent. This packages the key
logical gate without pretending it always holds on Collatz orbits. -/
theorem cocycleIter_lt_of_difference_bound (n k : ℕ)
    (hA : cocycleA n k < 2 ^ k)
    (hB : cocycleB n k < (2 ^ k - cocycleA n k) * n) :
    cocycleIter n k < n := by
  apply cocycleIter_lt_of_affine_bound n k
  have hdiff :
      cocycleA n k + (2 ^ k - cocycleA n k) = 2 ^ k :=
    Nat.add_sub_of_le (Nat.le_of_lt hA)
  calc
    cocycleA n k * n + cocycleB n k
        < cocycleA n k * n +
            (2 ^ k - cocycleA n k) * n := Nat.add_lt_add_left hB _
    _ = (cocycleA n k + (2 ^ k - cocycleA n k)) * n := by rw [Nat.add_mul]
    _ = 2 ^ k * n := by rw [hdiff]

#print axioms cocycleIter_lt_of_affine_bound
#print axioms cocycleIter_lt_of_difference_bound

end CollatzSyracuseAudit
