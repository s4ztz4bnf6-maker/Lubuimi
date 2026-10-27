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
        ext <;> simp [compose, Nat.pow_add, Nat.add_assoc] <;> ring

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

#print axioms SyracuseCarryCocycle.odd_step_residue_mod_six
#print axioms SyracuseCarryCocycle.odd_step_even

#print axioms SyracuseCarryCocycle.compose_assoc
#print axioms SyracuseCarryCocycle.compose_affine

end SyracuseCarryCocycle
