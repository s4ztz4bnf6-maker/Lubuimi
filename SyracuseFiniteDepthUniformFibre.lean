import Mathlib

/-!
# Finite-depth uniform fibre: dyadic interval partition

This module formalizes the finite combinatorial partition from the
Syracuse finite-depth uniform-fibre note. It is independent of historical
APW4 event/BIB indexing and of any infinite-path claim.
-/

namespace SyracuseUniformFibre

/-- The dyadic block assigned to the exact child exponent b. -/
def childBlock (Bstar b : ℕ) : Finset ℕ :=
  Finset.Ico
    (2 ^ Bstar - 2 ^ (Bstar - b + 1))
    (2 ^ Bstar - 2 ^ (Bstar - b))

/-- The terminal tail block after retaining exponents through B. -/
def tailBlock (Bstar B : ℕ) : Finset ℕ :=
  Finset.Ico (2 ^ Bstar - 2 ^ (Bstar - B)) (2 ^ Bstar)

/-- The union of the first B child blocks, in their original order. -/
def childBlocks (Bstar : ℕ) : ℕ → Finset ℕ
  | 0 => ∅
  | B + 1 => childBlocks Bstar B ∪ childBlock Bstar (B + 1)

/-- Adjacent half-open integer intervals join to the enclosing interval. -/
theorem ico_union_adjacent (a b c : ℕ) (hab : a ≤ b) (hbc : b ≤ c) :
    Finset.Ico a b ∪ Finset.Ico b c = Finset.Ico a c := by
  ext x
  simp [Finset.mem_Ico]
  omega

/--
At every finite cutoff B ≤ Bstar, the retained child blocks together
with the tail form an exact partition of [0, 2^Bstar).
-/
theorem childBlocks_tail_partition (Bstar B : ℕ) (hB : B ≤ Bstar) :
    childBlocks Bstar B ∪ tailBlock Bstar B =
      Finset.range (2 ^ Bstar) := by
  induction B with
  | zero =>
      simp [childBlocks, tailBlock]
  | succ B ih =>
      have hB' : B ≤ Bstar := by omega
      have hq : Bstar - (B + 1) + 1 = Bstar - B := by omega
      have hpow : 2 ^ (Bstar - (B + 1)) ≤ 2 ^ (Bstar - B) := by
        rw [← hq]
        simp [pow_succ]
      have hinterval :
          childBlock Bstar (B + 1) ∪ tailBlock Bstar (B + 1) =
            tailBlock Bstar B := by
        unfold childBlock tailBlock
        rw [hq]
        apply ico_union_adjacent
        · exact Nat.sub_le_sub_left hpow _
        · exact Nat.sub_le _ _
      calc
        childBlocks Bstar (B + 1) ∪ tailBlock Bstar (B + 1)
            = (childBlocks Bstar B ∪ childBlock Bstar (B + 1)) ∪
                tailBlock Bstar (B + 1) := rfl
        _ = childBlocks Bstar B ∪
              (childBlock Bstar (B + 1) ∪ tailBlock Bstar (B + 1)) := by
                ext x
                simp
        _ = childBlocks Bstar B ∪ tailBlock Bstar B := by
              rw [hinterval]
        _ = Finset.range (2 ^ Bstar) := ih hB'

end SyracuseUniformFibre
