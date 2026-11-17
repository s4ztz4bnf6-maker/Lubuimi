/-
Copyright (c) 2026 Ta-Yoshua Lubuimi.
SPDX-License-Identifier: LicenseRef-Lubuimi-Commercial-Revenue-Share

Original project contribution. Third-party imports and dependencies retain
their own licenses. AI assistance is disclosed in the repository notice.
-/

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
      change
        4 * (3 * wordSum k A + (2 : Int) ^ A k)
          - (3 * wordSum k (fun i => A (i + 1)) + (2 : Int) ^ A (k + 1)) =
        -(3 * signedSurplus k A
          + ((2 : Int) ^ A (k + 1) - 4 * (2 : Int) ^ A k))
      calc
        _ = 3 * (4 * wordSum k A - wordSum k (fun i => A (i + 1)))
              + (4 * (2 : Int) ^ A k - (2 : Int) ^ A (k + 1)) := by ring
        _ = 3 * overlapResidual k A
              + (4 * (2 : Int) ^ A k - (2 : Int) ^ A (k + 1)) := by rfl
        _ = 3 * (-signedSurplus k A)
              + (4 * (2 : Int) ^ A k - (2 : Int) ^ A (k + 1)) := by rw [ih]
        _ = -(3 * signedSurplus k A
              + ((2 : Int) ^ A (k + 1) - 4 * (2 : Int) ^ A k)) := by ring

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
    have hqn : q < n := by
      by_contra h
      have hnq : n ≤ q := le_of_not_gt h
      have hle : den * n ≤ den * q :=
        mul_le_mul_of_nonneg_left hnq (le_of_lt hden_pos)
      exact (not_lt_of_ge hle) hmul
    exact hqn


/-! ## Concrete accelerated-trajectory affine identity

We first formalize the orbit through its exact division witnesses.  This avoids
assuming any unproved property of a valuation function: a later bridge will
instantiate `g` with the actual 2-adic valuation and prove the witness
equation from divisibility.
-/

/-- Cumulative exponent of the exact powers of two removed from the orbit. -/
def valuationPrefix (g : Nat → Nat) : Nat → Nat
  | 0 => 0
  | k + 1 => valuationPrefix g k + g (k + 1)

/-- Affine correction in the accelerated Syracuse iterate. -/
def affineCorrection (g : Nat → Nat) : Nat → Nat
  | 0 => 0
  | k + 1 => 3 * affineCorrection g k + 2 ^ valuationPrefix g k

/-- Exact finite-prefix affine identity for any trajectory satisfying
    x_(k+1) * 2^(g_(k+1)) = 3*x_k+1. -/
theorem affine_trajectory_identity
    (n : Nat) (x g : Nat → Nat)
    (hx0 : x 0 = n)
    (hstep : ∀ k, x (k + 1) * 2 ^ g (k + 1) = 3 * x k + 1) :
    ∀ k, 2 ^ valuationPrefix g k * x k =
      3 ^ k * n + affineCorrection g k := by
  intro k
  induction k with
  | zero =>
      simp [valuationPrefix, affineCorrection, hx0]
  | succ k ih =>
      simp only [valuationPrefix, affineCorrection, pow_add]
      calc
        (2 ^ valuationPrefix g k * 2 ^ g (k + 1)) * x (k + 1)
            = 2 ^ valuationPrefix g k * (x (k + 1) * 2 ^ g (k + 1)) := by ring
        _ = 2 ^ valuationPrefix g k * (3 * x k + 1) := by rw [hstep k]
        _ = 3 * (2 ^ valuationPrefix g k * x k) + 2 ^ valuationPrefix g k := by ring
        _ = 3 * (3 ^ k * n + affineCorrection g k) +
              2 ^ valuationPrefix g k := by rw [ih]
        _ = 3 ^ (k + 1) * n
              + (3 * affineCorrection g k + 2 ^ valuationPrefix g k) := by
              simp [pow_succ]
              ring
        _ = 3 ^ (k + 1) * n + affineCorrection g (k + 1) := by
              rfl

/-- The affine correction has the expected weighted-word expansion. -/
theorem affineCorrection_succ
    (g : Nat → Nat) (k : Nat) :
    affineCorrection g (k + 1) =
      3 * affineCorrection g k + 2 ^ valuationPrefix g k := by
  rfl


#print axioms affine_trajectory_identity
#print axioms overlap_identity
#print axioms overlapResidual_succ
#print axioms descent_threshold

end TaYoshuaLubuimi.TLDRB

-- End of the explicit finite-prefix affine and dynamic-residual audit surface.
