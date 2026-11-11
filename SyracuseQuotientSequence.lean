import Mathlib
import SyracuseAffineCore

/-!
# Constructive quotient states for finite Syracuse valuation words

This module starts the constructive realization layer on top of the already
verified backward terminal-congruence lemma.  It defines the quotient state
as the actual natural-number quotient, proves that every prefix numerator is
divisible by its accumulated power of two, proves that the quotient is odd,
and derives the exact accelerated transition equation.

No claim about infinite trajectories or global Collatz termination is made.
-/

namespace SyracuseAudit

/-- The accumulated quotient state attached to a finite affine prefix. -/
def quotientState (a n : Nat → Nat) (k : Nat) : Nat :=
  affineCompositionRhs a n k / 2 ^ prefixExponentSum a k

/-- Exact terminal residue at a prefix forces divisibility by its
accumulated power of two, with an explicit odd quotient witness. -/
theorem terminalExact_factor
    (a n : Nat → Nat) (k : Nat)
    (hExact :
      affineCompositionRhs a n k %
          2 ^ (prefixExponentSum a k + 1) =
        2 ^ prefixExponentSum a k) :
    ∃ t : Nat,
      affineCompositionRhs a n k =
        2 ^ prefixExponentSum a k * (2 * t + 1) := by
  let A := prefixExponentSum a k
  let C := affineCompositionRhs a n k
  have hdecomp :
      2 ^ A + 2 ^ (A + 1) * (C / 2 ^ (A + 1)) = C := by
    have h := Nat.mod_add_div C (2 ^ (A + 1))
    simpa [A, C, hExact] using h
  refine ⟨C / 2 ^ (A + 1), ?_⟩
  calc
    C = 2 ^ A + 2 ^ (A + 1) * (C / 2 ^ (A + 1)) := hdecomp.symm
    _ = 2 ^ A * (2 * (C / 2 ^ (A + 1)) + 1) := by
      rw [pow_succ]
      ring

/-- Every exact prefix numerator is the accumulated power of two times
its quotient state. -/
theorem quotientState_factor
    (a n : Nat → Nat) (k : Nat)
    (hExact :
      affineCompositionRhs a n k %
          2 ^ (prefixExponentSum a k + 1) =
        2 ^ prefixExponentSum a k) :
    2 ^ prefixExponentSum a k * quotientState a n k =
      affineCompositionRhs a n k := by
  obtain ⟨t, ht⟩ := terminalExact_factor a n k hExact
  have hpos : 0 < 2 ^ prefixExponentSum a k := by positivity
  calc
    2 ^ prefixExponentSum a k * quotientState a n k =
        2 ^ prefixExponentSum a k *
          (affineCompositionRhs a n k /
            2 ^ prefixExponentSum a k) := rfl
    _ = 2 ^ prefixExponentSum a k * (2 * t + 1) := by
      rw [ht, Nat.mul_div_cancel_left _ hpos]
    _ = affineCompositionRhs a n k := ht.symm

/-- The quotient state is odd whenever the corresponding prefix has the
exact terminal residue. -/
theorem quotientState_odd
    (a n : Nat → Nat) (k : Nat)
    (hExact :
      affineCompositionRhs a n k %
          2 ^ (prefixExponentSum a k + 1) =
        2 ^ prefixExponentSum a k) :
    ∃ t : Nat, quotientState a n k = 2 * t + 1 := by
  obtain ⟨t, ht⟩ := terminalExact_factor a n k hExact
  have hpos : 0 < 2 ^ prefixExponentSum a k := by positivity
  refine ⟨t, ?_⟩
  change affineCompositionRhs a n k /
      2 ^ prefixExponentSum a k = 2 * t + 1
  rw [ht]
  exact Nat.mul_div_cancel_left _ hpos

/-- Adjacent exact prefixes induce the accelerated Syracuse transition
equation for their quotient states. -/
theorem quotientState_transition_of_exact
    (a n : Nat → Nat) (k : Nat)
    (hExactK :
      affineCompositionRhs a n k %
          2 ^ (prefixExponentSum a k + 1) =
        2 ^ prefixExponentSum a k)
    (hExactNext :
      affineCompositionRhs a n (k + 1) %
          2 ^ (prefixExponentSum a (k + 1) + 1) =
        2 ^ prefixExponentSum a (k + 1)) :
    2 ^ a k * quotientState a n (k + 1) =
      3 * quotientState a n k + 1 := by
  let A := prefixExponentSum a k
  have hfactorK := quotientState_factor a n k hExactK
  have hfactorNext := quotientState_factor a n (k + 1) hExactNext
  have hsum : prefixExponentSum a (k + 1) = A + a k := by
    rfl
  have hrec :
      affineCompositionRhs a n (k + 1) =
        3 * affineCompositionRhs a n k + 2 ^ A := by
    simp [affineCompositionRhs, A]
  have hpow : 2 ^ prefixExponentSum a (k + 1) =
      2 ^ A * 2 ^ a k := by
    rw [hsum, pow_add]
  have hmul :
      2 ^ A * (2 ^ a k * quotientState a n (k + 1)) =
        2 ^ A * (3 * quotientState a n k + 1) := by
    calc
      2 ^ A * (2 ^ a k * quotientState a n (k + 1)) =
          2 ^ prefixExponentSum a (k + 1) *
            quotientState a n (k + 1) := by rw [hpow]; ring
      _ = affineCompositionRhs a n (k + 1) := hfactorNext
      _ = 3 * affineCompositionRhs a n k + 2 ^ A := hrec
      _ = 2 ^ A * (3 * quotientState a n k + 1) := by
        rw [← hfactorK]
        ring
  have hpos : 0 < 2 ^ A := by positivity
  nlinarith [hmul]

/-- The verified backward propagation theorem supplies exact residues at
all prefixes, so the quotient sequence is defined, odd, and follows the
prescribed accelerated transition at every finite step. -/
theorem quotientSequence_from_terminal
    (a n : Nat → Nat) (N : Nat)
    (ha : ∀ k, k < N → 1 ≤ a k)
    (hterminal :
      affineCompositionRhs a n N %
          2 ^ (prefixExponentSum a N + 1) =
        2 ^ prefixExponentSum a N) :
    (∀ k, k ≤ N →
      ∃ t : Nat, quotientState a n k = 2 * t + 1) ∧
    (∀ k, k < N →
      2 ^ a k * quotientState a n (k + 1) =
        3 * quotientState a n k + 1) := by
  have hprefix := terminalExact_backward_prefix a n N ha hterminal
  constructor
  · intro k hk
    exact quotientState_odd a n k (hprefix k hk)
  · intro k hk
    exact quotientState_transition_of_exact a n k
      (hprefix k (by omega)) (hprefix (k + 1) (by omega))

#print axioms terminalExact_factor
#print axioms quotientState_factor
#print axioms quotientState_odd
#print axioms quotientState_transition_of_exact
#print axioms quotientSequence_from_terminal

end SyracuseAudit
