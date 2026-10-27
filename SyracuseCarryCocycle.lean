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
        simp [compose, Nat.pow_add, Nat.mul_add, Nat.add_mul] <;> ring

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

#print axioms SyracuseCarryCocycle.compose_assoc
#print axioms SyracuseCarryCocycle.compose_affine

end SyracuseCarryCocycle
