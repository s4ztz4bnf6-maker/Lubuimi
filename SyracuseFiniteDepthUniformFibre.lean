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

/-- A power of two is monotone in its natural exponent. -/
private theorem pow_two_le_pow_two_add (a b : ℕ) :
    2 ^ a ≤ 2 ^ (a + b) := by
  rw [pow_add]
  calc
    2 ^ a = 2 ^ a * 1 := by simp
    _ ≤ 2 ^ a * 2 ^ b :=
      Nat.mul_le_mul_left _ (by positivity)

/-- Each child block has exactly the dyadic number of atoms prescribed
by its exponent. -/
theorem card_childBlock (Bstar b : ℕ) (hb : 1 ≤ b) (hB : b ≤ Bstar) :
    (childBlock Bstar b).card = 2 ^ (Bstar - b) := by
  rw [childBlock, Finset.card_Ico]
  have hM :
      2 ^ Bstar =
        2 ^ (Bstar - b + 1) * 2 ^ (b - 1) := by
    rw [← pow_add]
    congr 1
    omega
  have hfactor : 1 ≤ 2 ^ (b - 1) := by positivity
  have hleft : 2 ^ (Bstar - b + 1) ≤ 2 ^ Bstar := by
    rw [hM]
    calc
      2 ^ (Bstar - b + 1) = 2 ^ (Bstar - b + 1) * 1 := by simp
      _ ≤ 2 ^ (Bstar - b + 1) * 2 ^ (b - 1) :=
        Nat.mul_le_mul_left _ hfactor
  have hright : 2 ^ (Bstar - b) ≤ 2 ^ Bstar :=
    pow_two_le_pow_two_add (Bstar - b) b
  have hdouble :
      2 ^ (Bstar - b + 1) = 2 ^ (Bstar - b) * 2 := by
    rw [pow_succ]
    norm_num
  omega

/-- The tail block has exactly the dyadic number of atoms prescribed
by the cutoff. -/
theorem card_tailBlock (Bstar B : ℕ) (hB : B ≤ Bstar) :
    (tailBlock Bstar B).card = 2 ^ (Bstar - B) := by
  rw [tailBlock, Finset.card_Ico]
  have hM :
      2 ^ Bstar = 2 ^ (Bstar - B) * 2 ^ B := by
    rw [← pow_add]
    congr 1
    omega
  have hfactor : 1 ≤ 2 ^ B := by positivity
  have hleft : 2 ^ (Bstar - B) ≤ 2 ^ Bstar := by
    rw [hM]
    calc
      2 ^ (Bstar - B) = 2 ^ (Bstar - B) * 1 := by simp
      _ ≤ 2 ^ (Bstar - B) * 2 ^ B :=
        Nat.mul_le_mul_left _ hfactor
  omega

#print axioms ico_union_adjacent
#print axioms childBlocks_tail_partition
#print axioms card_childBlock
#print axioms card_tailBlock

end SyracuseUniformFibre
