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

/-- The correction recurrence agrees with the chronological block split. -/
theorem blockCorrection_cons (a : ℕ) (as : List ℕ) :
    blockCorrection (a :: as) =
      3 ^ as.length + 2 ^ a * blockCorrection as := rfl

#print axioms exact_block_identity
#print axioms blockCorrection_cons

end CollatzSyracuseAudit
