import Mathlib

/-!
# Ta-Yoshua Lubuimi Dynamic Residual Bound (TL-DRB)

This file formalizes two algebraic interfaces:
1. the overlapping-word residual identity;
2. the generic exact descent-threshold equivalence.

It does not formalize the Syracuse trajectory/valuation construction itself,
nor does it prove a global Collatz descent theorem.
-/

namespace TaYoshuaLubuimi.TLDRB

/-- Weighted exponential word sum, with the first entry receiving the
largest power of three. -/
def wordSum : Nat → (Nat → Nat) → Int
  | 0, _ => 0
  | k + 1, A => 3 * wordSum k A + (2 : Int) ^ (A k)

/-- Signed affine surplus recurrence associated with a partial-sum word. -/
def signedSurplus : Nat → (Nat → Nat) → Int
  | 0, _ => 0
  | k + 1, A =>
      3 * signedSurplus k A
        + ((2 : Int) ^ (A (k + 1)) - 4 * (2 : Int) ^ (A k))

/-- The two exponent words overlap by one position:
    (A 0,...,A (k-1)) and (A 1,...,A k). -/
def overlapResidual (k : Nat) (A : Nat → Nat) : Int :=
  4 * wordSum k A - wordSum k (fun i => A (i + 1))

/-- Exact TL-DRB overlap identity. No monotonicity assumption is needed
because this is an algebraic identity for every sequence A. -/
theorem overlap_identity (k : Nat) (A : Nat → Nat) :
    overlapResidual k A = - signedSurplus k A := by
  induction k with
  | zero =>
      simp [overlapResidual, wordSum, signedSurplus]
  | succ k ih =>
      simp only [overlapResidual, wordSum, signedSurplus]
      rw [ih]
      ring

/-- Forward one-step update of the overlap residual. -/
theorem overlapResidual_succ (k : Nat) (A : Nat → Nat) :
    overlapResidual (k + 1) A =
      3 * overlapResidual k A
        + (4 * (2 : Int) ^ (A k) - (2 : Int) ^ (A (k + 1))) := by
  simp [overlapResidual, wordSum]
  ring

/-- Generic exact threshold lemma.

If den is the positive denominator, den*q = p*n + C is the
finite-prefix affine equation, and den = p + C - R, then ordinary-size
descent is equivalent to the start-value-dependent residual inequality.
The Syracuse-specific proof obligations are to instantiate these hypotheses
from the valuation word and affine correction.
-/
theorem descent_threshold
    (n q p C R den : Int)
    (hden : den = p + C - R)
    (haffine : den * q = p * n + C)
    (hden_pos : 0 < den) :
    q < n ↔ n * R < (n - 1) * C := by
  constructor
  · intro hq
    have hmul : den * q < den * n :=
      mul_lt_mul_of_pos_left hq hden_pos
    rw [haffine] at hmul
    rw [hden] at hmul
    nlinarith
  · intro hres
    have hmul : den * q < den * n := by
      rw [haffine, hden]
      nlinarith
    exact (mul_lt_mul_left hden_pos).mp hmul

#print axioms overlap_identity
#print axioms overlapResidual_succ
#print axioms descent_threshold

end TaYoshuaLubuimi.TLDRB
