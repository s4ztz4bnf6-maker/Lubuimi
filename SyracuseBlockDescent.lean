import Mathlib

/-!
# Exact finite-block identity for odd-only Syracuse dynamics

This file formalizes only the finite algebraic bridge.  A realized step with
exponent a is represented by the division-free equation
  2^a * next = 3 * current + 1.
No universal descent or Collatz convergence is assumed.
-/

namespace CollatzSyracuseAudit

/-- The positive correction term in the exact block identity. -/
def blockCorrection : List ℕ → ℕ
  | [] => 0
  | a :: as => 3 ^ as.length + 2 ^ a * blockCorrection as

/-- A list of exponents is realized by a chain of exact odd-only steps. -/
inductive RealizesBlock : List ℕ → ℕ → ℕ → Prop where
  | nil (n : ℕ) : RealizesBlock [] n n
  | cons {a : ℕ} {as : List ℕ} {n mid finish : ℕ}
      (hstep : 2 ^ a * mid = 3 * n + 1)
      (hrest : RealizesBlock as mid finish) :
      RealizesBlock (a :: as) n finish

/-!
The stricter relation below models actual odd-only Syracuse blocks: every
state is odd and every exponent is positive. The equation
2^a * next = 3 * current + 1 together with odd(next) makes a the exact
2-adic valuation of 3 * current + 1.
-/
inductive RealizesOddBlock : List ℕ → ℕ → ℕ → Prop where
  | nil {n : ℕ} (hn : Odd n) : RealizesOddBlock [] n n
  | cons {a : ℕ} {as : List ℕ} {n mid finish : ℕ}
      (hn : Odd n)
      (ha : 0 < a)
      (hstep : 2 ^ a * mid = 3 * n + 1)
      (hrest : RealizesOddBlock as mid finish) :
      RealizesOddBlock (a :: as) n finish

/--
For every realized finite block, the denominator powers clear exactly:
2^(sum exponents) * finish = 3^(number of steps) * start + correction.
The statement is over naturals and introduces no division or approximation.
-/
theorem exact_block_identity
    {as : List ℕ} {start finish : ℕ}
    (h : RealizesBlock as start finish) :
    2 ^ as.sum * finish =
      3 ^ as.length * start + blockCorrection as := by
  induction h with
  | nil n =>
      simp [blockCorrection]
  | @cons a as n mid finish hstep hrest ih =>
      simp only [List.sum_cons, List.length_cons, blockCorrection]
      calc
        2 ^ (a + as.sum) * finish =
            2 ^ a * (2 ^ as.sum * finish) := by
              rw [pow_add]
              ring
        _ = 2 ^ a * (3 ^ as.length * mid + blockCorrection as) := by
              rw [ih]
        _ = 3 ^ (as.length + 1) * n +
              (3 ^ as.length + 2 ^ a * blockCorrection as) := by
              rw [show as.length + 1 = Nat.succ as.length by omega, pow_succ]
              calc
                2 ^ a * (3 ^ as.length * mid + blockCorrection as) =
                    3 ^ as.length * (2 ^ a * mid) +
                      2 ^ a * blockCorrection as := by ring
                _ = 3 ^ as.length * (3 * n + 1) +
                      2 ^ a * blockCorrection as := by rw [hstep]
                _ = 3 ^ as.length * 3 * n +
                      (3 ^ as.length + 2 ^ a * blockCorrection as) := by ring

/-- Every odd-only block is also a block of exact algebraic steps. -/
theorem RealizesOddBlock.toRealizesBlock
    {as : List ℕ} {start finish : ℕ}
    (h : RealizesOddBlock as start finish) : RealizesBlock as start finish := by
  induction h with
  | nil hn => exact RealizesBlock.nil _
  | @cons a as n mid finish hn ha hstep hrest ih =>
      exact RealizesBlock.cons hstep ih

/-- Exact block identity specialized to genuine odd-only blocks. -/
theorem exact_odd_block_identity
    {as : List ℕ} {start finish : ℕ}
    (h : RealizesOddBlock as start finish) :
    2 ^ as.sum * finish =
      3 ^ as.length * start + blockCorrection as :=
  exact_block_identity h.toRealizesBlock

/**
Exact descent criterion with no subtraction or division: the endpoint is
smaller precisely when the correction-adjusted affine expression lies below
the scaled initial value.
*/
theorem block_descends_iff
    {as : List ℕ} {start finish : ℕ}
    (h : RealizesBlock as start finish) :
    finish < start ↔
      3 ^ as.length * start + blockCorrection as < 2 ^ as.sum * start := by
  have hidentity := exact_block_identity h
  have hscale : 0 < 2 ^ as.sum := by positivity
  constructor
  · intro hlt
    have hmul := Nat.mul_lt_mul_of_pos_left hlt hscale
    rw [hidentity] at hmul
    exact hmul
  · intro hlt
    by_contra hnot
    have hle : start ≤ finish := Nat.le_of_not_gt hnot
    have hmul : 2 ^ as.sum * start ≤ 2 ^ as.sum * finish :=
      Nat.mul_le_mul_left (2 ^ as.sum) hle
    rw [hidentity] at hmul
    omega

/-- The correction recurrence agrees with the chronological block split. -/
theorem blockCorrection_cons (a : ℕ) (as : List ℕ) :
    blockCorrection (a :: as) =
      3 ^ as.length + 2 ^ a * blockCorrection as := rfl

#print axioms exact_block_identity
#print axioms exact_odd_block_identity
#print axioms block_descends_iff
#print axioms blockCorrection_cons

end CollatzSyracuseAudit
