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

/--
The accelerated quotient transition has exact 2-adic valuation: its right
hand side is divisible by 2^(a k), but not by 2^(a k+1).  The nondivisibility
uses oddness of the next quotient state, supplied by the exact terminal
prefix residue.  This is a finite-word local statement, not global
Collatz termination.
-/
theorem quotientState_transition_exact_power_two
    (a n : Nat → Nat) (k : Nat)
    (hExactK :
      affineCompositionRhs a n k %
          2 ^ (prefixExponentSum a k + 1) =
        2 ^ prefixExponentSum a k)
    (hExactNext :
      affineCompositionRhs a n (k + 1) %
          2 ^ (prefixExponentSum a (k + 1) + 1) =
        2 ^ prefixExponentSum a (k + 1)) :
    2 ^ a k ∣ 3 * quotientState a n k + 1 ∧
      ¬ 2 ^ (a k + 1) ∣ 3 * quotientState a n k + 1 := by
  have htransition :=
    quotientState_transition_of_exact a n k hExactK hExactNext
  constructor
  · exact ⟨quotientState a n (k + 1), htransition.symm⟩
  · intro hdiv
    rw [← htransition] at hdiv
    have hstrong :
        2 ^ (a k + 1) ∣ 2 ^ a k * quotientState a n (k + 1) := hdiv
    rw [pow_succ] at hstrong
    have htwo : 2 ∣ quotientState a n (k + 1) :=
      (Nat.mul_dvd_mul_iff_left
        (by positivity : 0 < 2 ^ a k)).mp hstrong
    obtain ⟨t, ht⟩ :=
      quotientState_odd a n (k + 1) hExactNext
    rw [ht] at htwo
    omega

/-- For every modulus exponent A, iterate count r, and affine offset C,
the terminal congruence has exactly one solution class modulo 2^(A+1).
This is a finite residue-class statement and does not assert realization of
a prescribed valuation word. -/
theorem terminalCongruence_unique_residue_class
    (A r C : Nat) :
    ∃! x : ZMod (2 ^ (A + 1)),
      (3 ^ r : ZMod (2 ^ (A + 1))) * x + C = 2 ^ A := by
  have hbase : Nat.Coprime 3 2 := by norm_num
  have hcop : Nat.Coprime (3 ^ r) (2 ^ (A + 1)) := by
    exact Nat.Coprime.pow_left (Nat.Coprime.pow_right hbase)
  have hunit : IsUnit (3 ^ r : ZMod (2 ^ (A + 1))) :=
    (ZMod.isUnit_iff_coprime).2 hcop
  obtain ⟨u, hu⟩ := hunit
  refine ⟨(↑(u⁻¹) : ZMod (2 ^ (A + 1))) *
      ((2 ^ A : ZMod (2 ^ (A + 1))) - C), ?_, ?_⟩
  · rw [← hu]
    simp [mul_assoc, sub_add_cancel]
  · intro y hy
    have hy' :
        (↑u : ZMod (2 ^ (A + 1))) * y + C = 2 ^ A := by
      simpa only [← hu] using hy
    have hmul :
        (↑u : ZMod (2 ^ (A + 1))) * y =
          (2 ^ A : ZMod (2 ^ (A + 1))) - C := by
      apply add_right_cancel
      calc
        (↑u : ZMod (2 ^ (A + 1))) * y + C = 2 ^ A := hy'
        _ = ((2 ^ A : ZMod (2 ^ (A + 1))) - C) + C := by simp
    calc
      y = (↑(u⁻¹) : ZMod (2 ^ (A + 1))) *
          ((↑u : ZMod (2 ^ (A + 1))) * y) := by simp [mul_assoc]
      _ = (↑(u⁻¹) : ZMod (2 ^ (A + 1))) *
          ((2 ^ A : ZMod (2 ^ (A + 1))) - C) := by rw [hmul]

#print axioms terminalCongruence_unique_residue_class

#print axioms terminalExact_factor
#print axioms quotientState_factor
#print axioms quotientState_odd
#print axioms quotientState_transition_of_exact
#print axioms quotientSequence_from_terminal
#print axioms quotientState_transition_exact_power_two

end SyracuseAudit
