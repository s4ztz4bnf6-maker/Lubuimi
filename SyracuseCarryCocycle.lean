import Mathlib

/-!
# Exact Syracuse carry-cocycle composition

A block is recorded by its number of odd steps N, its total 2-adic valuation A,
and its exact additive offset C, with the affine certificate

  2^A * output = 3^N * input + C.

The offset is retained explicitly: valuation totals alone do not determine
whether a block descends. This file proves only the algebraic composition law,
not that a global descent certificate exists for every Collatz orbit.
-/

namespace SyracuseCarryCocycle

structure Block where
  oddSteps : ℕ
  valuationSum : ℕ
  offset : ℕ
deriving DecidableEq, Repr

/-- Compose two blocks in temporal order: first, then second. -/
def compose (first second : Block) : Block where
  oddSteps := first.oddSteps + second.oddSteps
  valuationSum := first.valuationSum + second.valuationSum
  offset :=
    3 ^ second.oddSteps * first.offset +
      2 ^ first.valuationSum * second.offset

/-- The carry-cocycle composition law is associative. -/
theorem compose_assoc (first second third : Block) :
    compose (compose first second) third =
      compose first (compose second third) := by
  cases first with
  | mk n a c =>
    cases second with
    | mk m b d =>
      cases third with
      | mk l e f =>
        simp [compose, Nat.pow_add, Nat.add_assoc]
        <;> ring

/--
Two certified affine blocks compose to the affine certificate associated
with compose. No assumption about a global trajectory is used.
-/
theorem compose_affine
    (first second : Block) (x y z : ℕ)
    (hfirst :
      2 ^ first.valuationSum * y =
        3 ^ first.oddSteps * x + first.offset)
    (hsecond :
      2 ^ second.valuationSum * z =
        3 ^ second.oddSteps * y + second.offset) :
    2 ^ (first.valuationSum + second.valuationSum) * z =
      3 ^ (first.oddSteps + second.oddSteps) * x +
        (3 ^ second.oddSteps * first.offset +
          2 ^ first.valuationSum * second.offset) := by
  calc
    2 ^ (first.valuationSum + second.valuationSum) * z =
        2 ^ first.valuationSum *
          (2 ^ second.valuationSum * z) := by
            rw [pow_add]
            ring
    _ = 2 ^ first.valuationSum *
          (3 ^ second.oddSteps * y + second.offset) := by
            rw [hsecond]
    _ = 3 ^ second.oddSteps *
          (2 ^ first.valuationSum * y) +
          2 ^ first.valuationSum * second.offset := by
            ring
    _ = 3 ^ second.oddSteps *
          (3 ^ first.oddSteps * x + first.offset) +
          2 ^ first.valuationSum * second.offset := by
            rw [hfirst]
    _ = 3 ^ (first.oddSteps + second.oddSteps) * x +
          (3 ^ second.oddSteps * first.offset +
            2 ^ first.valuationSum * second.offset) := by
            rw [pow_add]
            ring

/-- Exact base-six residue fact: every odd n has 3*n+1 congruent to 4 mod 6.
This guarantees evenness, but does not imply divisibility by 4 or make division
by 2 a single-digit shift in base six. -/
theorem odd_step_residue_mod_six (n : ℕ) (hn : n % 2 = 1) :
    (3 * n + 1) % 6 = 4 := by
  omega

/-- The residue theorem gives one factor of two, not necessarily two. -/
theorem odd_step_even (n : ℕ) (hn : n % 2 = 1) :
    2 ∣ 3 * n + 1 := by
  have hmod := odd_step_residue_mod_six n hn
  omega

/-- Normalized block data: scale is 2^A/3^N and debt is C/3^N.
The composition law retains the additive carry debt explicitly. -/
structure NormalizedBlock where
  scale : ℚ
  debt : ℚ
deriving DecidableEq, Repr

/-- Compose normalized blocks in temporal order: first, then second. -/
def composeNormalized (first second : NormalizedBlock) : NormalizedBlock where
  scale := first.scale * second.scale
  debt := first.debt + first.scale * second.debt

/-- Normalized carry-gain composition is associative. -/
theorem composeNormalized_assoc
    (first second third : NormalizedBlock) :
    composeNormalized (composeNormalized first second) third =
      composeNormalized first (composeNormalized second third) := by
  cases first with
  | mk l1 q1 =>
    cases second with
    | mk l2 q2 =>
      cases third with
      | mk l3 q3 =>
        simp [composeNormalized]
        constructor <;> ring

/-- Exact threshold criterion for a normalized block.
If x_next = (x + debt)/scale and scale is positive, then x_next < x
exactly when debt < (scale - 1) * x. -/
theorem descent_iff_carry_debt_below_gain
    (scale debt x : ℚ) (hscale : 0 < scale) :
    (x + debt) / scale < x ↔ debt < (scale - 1) * x := by
  rw [div_lt_iff₀ hscale]
  constructor <;> intro h <;> nlinarith

/-- When both block scales exceed one, the threshold of the concatenated
block is a weighted average of the two thresholds. This exact identity is
the key structural property of the normalized carry-gain cocycle. -/
theorem composed_threshold_weighted_average
    (scale₁ scale₂ debt₁ debt₂ : ℚ)
    (h₁ : 1 < scale₁) (h₂ : 1 < scale₂) :
    (debt₁ + scale₁ * debt₂) / (scale₁ * scale₂ - 1) =
      ((scale₁ - 1) * (debt₁ / (scale₁ - 1)) +
        scale₁ * (scale₂ - 1) * (debt₂ / (scale₂ - 1))) /
          (scale₁ * scale₂ - 1) := by
  have h₁' : scale₁ - 1 ≠ 0 := ne_of_gt (by linarith)
  have h₂' : scale₂ - 1 ≠ 0 := ne_of_gt (by linarith)
  have h₁₂ : scale₁ * scale₂ - 1 ≠ 0 := ne_of_gt (by nlinarith)
  field_simp [h₁', h₂', h₁₂]

#print axioms SyracuseCarryCocycle.composed_threshold_weighted_average

#print axioms SyracuseCarryCocycle.composeNormalized_assoc
#print axioms SyracuseCarryCocycle.descent_iff_carry_debt_below_gain

#print axioms SyracuseCarryCocycle.odd_step_residue_mod_six
#print axioms SyracuseCarryCocycle.odd_step_even

#print axioms SyracuseCarryCocycle.compose_assoc
#print axioms SyracuseCarryCocycle.compose_affine

end SyracuseCarryCocycle
