import Mathlib
import Mathlib.Order.Interval.Finset.Nat

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
  have hfactor : 1 ≤ 2 ^ b := Nat.succ_le_iff.mpr (by positivity)
  calc
    2 ^ a = 2 ^ a * 1 := by simp
    _ ≤ 2 ^ a * 2 ^ b :=
      Nat.mul_le_mul_left _ hfactor

/-- Each child block has exactly the dyadic number of atoms prescribed
by its exponent. -/
theorem card_childBlock (Bstar b : ℕ) (hb : 1 ≤ b) (hB : b ≤ Bstar) :
    (childBlock Bstar b).card = 2 ^ (Bstar - b) := by
  rw [childBlock, Nat.card_Ico]
  have hM :
      2 ^ Bstar =
        2 ^ (Bstar - b + 1) * 2 ^ (b - 1) := by
    rw [← pow_add]
    congr 1
    omega
  have hfactor : 1 ≤ 2 ^ (b - 1) := Nat.succ_le_iff.mpr (by positivity)
  have hleft : 2 ^ (Bstar - b + 1) ≤ 2 ^ Bstar := by
    rw [hM]
    calc
      2 ^ (Bstar - b + 1) = 2 ^ (Bstar - b + 1) * 1 := by simp
      _ ≤ 2 ^ (Bstar - b + 1) * 2 ^ (b - 1) :=
        Nat.mul_le_mul_left _ hfactor
  have hright : 2 ^ (Bstar - b) ≤ 2 ^ Bstar := by
    calc
      2 ^ (Bstar - b) ≤ 2 ^ ((Bstar - b) + b) :=
        pow_two_le_pow_two_add (Bstar - b) b
      _ = 2 ^ Bstar := by congr 1; omega
  have hdouble :
      2 ^ (Bstar - b + 1) = 2 ^ (Bstar - b) * 2 := by
    rw [pow_succ]
  omega

/-- Distinct child blocks are disjoint in increasing exponent order. -/
theorem childBlock_disjoint (Bstar b₁ b₂ : ℕ)
    (hb₁ : 1 ≤ b₁) (hb₂ : b₂ ≤ Bstar) (hlt : b₁ < b₂) :
    Disjoint (childBlock Bstar b₁) (childBlock Bstar b₂) := by
  apply Finset.disjoint_left.mpr
  intro x hx₁ hx₂
  have hx₁' := Finset.mem_Ico.mp hx₁
  have hx₂' := Finset.mem_Ico.mp hx₂
  have hexp : Bstar - b₂ + 1 ≤ Bstar - b₁ := by omega
  have hpow :
      2 ^ (Bstar - b₂ + 1) ≤ 2 ^ (Bstar - b₁) := by
    calc
      2 ^ (Bstar - b₂ + 1) ≤
          2 ^ ((Bstar - b₂ + 1) +
            ((Bstar - b₁) - (Bstar - b₂ + 1))) :=
        pow_two_le_pow_two_add _ _
      _ = 2 ^ (Bstar - b₁) := by congr 1; omega
  have hend :
      2 ^ Bstar - 2 ^ (Bstar - b₁) ≤
        2 ^ Bstar - 2 ^ (Bstar - b₂ + 1) :=
    Nat.sub_le_sub_left hpow _
  unfold childBlock at hx₁ hx₂
  simp only [Finset.mem_Ico] at hx₁ hx₂
  omega

/-- A child block retained through cutoff B is disjoint from the tail. -/
theorem childBlock_disjoint_tail (Bstar b B : ℕ)
    (hb : 1 ≤ b) (hcut : b ≤ B) (hB : B ≤ Bstar) :
    Disjoint (childBlock Bstar b) (tailBlock Bstar B) := by
  apply Finset.disjoint_left.mpr
  intro x hxChild hxTail
  have hxChild' := Finset.mem_Ico.mp hxChild
  have hxTail' := Finset.mem_Ico.mp hxTail
  have hexp : Bstar - B ≤ Bstar - b := by omega
  have hpow :
      2 ^ (Bstar - B) ≤ 2 ^ (Bstar - b) := by
    calc
      2 ^ (Bstar - B) ≤
          2 ^ ((Bstar - B) + ((Bstar - b) - (Bstar - B))) :=
        pow_two_le_pow_two_add _ _
      _ = 2 ^ (Bstar - b) := by congr 1; omega
  have hend :
      2 ^ Bstar - 2 ^ (Bstar - b) ≤
        2 ^ Bstar - 2 ^ (Bstar - B) :=
    Nat.sub_le_sub_left hpow _
  unfold childBlock tailBlock at hxChild hxTail
  simp only [Finset.mem_Ico] at hxChild hxTail
  omega

/-- The tail block has exactly the dyadic number of atoms prescribed
by the cutoff. -/
theorem card_tailBlock (Bstar B : ℕ) (hB : B ≤ Bstar) :
    (tailBlock Bstar B).card = 2 ^ (Bstar - B) := by
  rw [tailBlock, Nat.card_Ico]
  have hM :
      2 ^ Bstar = 2 ^ (Bstar - B) * 2 ^ B := by
    rw [← pow_add]
    congr 1
    omega
  have hfactor : 1 ≤ 2 ^ B := Nat.succ_le_iff.mpr (by positivity)
  have hleft : 2 ^ (Bstar - B) ≤ 2 ^ Bstar := by
    rw [hM]
    calc
      2 ^ (Bstar - B) = 2 ^ (Bstar - B) * 1 := by simp
      _ ≤ 2 ^ (Bstar - B) * 2 ^ B :=
        Nat.mul_le_mul_left _ hfactor
  exact Nat.sub_sub_self hleft

#print axioms ico_union_adjacent
#print axioms childBlocks_tail_partition
#print axioms card_childBlock
#print axioms card_tailBlock
#print axioms childBlock_disjoint
#print axioms childBlock_disjoint_tail

/-- The lower endpoint of the tail moves right as the cutoff increases. -/
private theorem tailLower_mono (Bstar B : ℕ) (hB : B + 1 ≤ Bstar) :
    2 ^ Bstar - 2 ^ (Bstar - B) ≤
      2 ^ Bstar - 2 ^ (Bstar - (B + 1)) := by
  have hq : Bstar - (B + 1) + 1 = Bstar - B := by omega
  have hpow : 2 ^ (Bstar - (B + 1)) ≤ 2 ^ (Bstar - B) := by
    rw [← hq]
    simp [pow_succ]
  exact Nat.sub_le_sub_left hpow _

/-- Every retained child atom lies strictly before the current tail. -/
theorem mem_childBlocks_lt_tailLower
    (Bstar B x : ℕ) (hB : B ≤ Bstar)
    (hx : x ∈ childBlocks Bstar B) :
    x < 2 ^ Bstar - 2 ^ (Bstar - B) := by
  induction B with
  | zero =>
      simp [childBlocks] at hx
  | succ B ih =>
      rcases Finset.mem_union.mp hx with hx | hx
      · have hB' : B ≤ Bstar := by omega
        have hxlt := ih hB' hx
        have hmono := tailLower_mono Bstar B hB
        exact lt_of_lt_of_le hxlt hmono
      · have hxI : x ∈ childBlock Bstar (B + 1) := hx
        change x < 2 ^ Bstar - 2 ^ (Bstar - (B + 1))
        exact (Finset.mem_Ico.mp hxI).2

/-- The combined child region and its terminal tail are disjoint. -/
theorem childBlocks_disjoint_tail
    (Bstar B : ℕ) (hB : B ≤ Bstar) :
    Disjoint (childBlocks Bstar B) (tailBlock Bstar B) := by
  apply Finset.disjoint_left.mpr
  intro x hxChild hxTail
  have hxlt := mem_childBlocks_lt_tailLower Bstar B x hB hxChild
  have htail := (Finset.mem_Ico.mp hxTail).1
  omega

#print axioms mem_childBlocks_lt_tailLower
#print axioms childBlocks_disjoint_tail

end SyracuseUniformFibre
