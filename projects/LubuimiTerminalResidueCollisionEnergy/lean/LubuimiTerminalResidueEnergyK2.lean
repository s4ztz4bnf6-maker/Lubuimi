import Mathlib

set_option autoImplicit false

/-!
# Exact k = 2 terminal-residue Markov computation

This module formalizes the finite rational transition matrix and the
two-step terminal distribution for the six units modulo 9, ordered as
1, 2, 4, 5, 7, 8.  It is deliberately a finite exact computation:
it does not claim the general Markov theorem or identify the collision
energy with the historical APW4/BIB reserve.
-/

namespace LubuimiTerminalResidueEnergyK2

/-- The six unit residues modulo 9, in the fixed column order. -/
def stateValue (i : Fin 6) : ℕ :=
  match i.val with
  | 0 => 1
  | 1 => 2
  | 2 => 4
  | 3 => 5
  | 4 => 7
  | 5 => 8
  | _ => 0

/-- Numerators of the first-step row from the zero state. -/
def initialNumerator (j : Fin 6) : ℕ :=
  match j.val with
  | 0 => 1
  | 1 => 2
  | 2 => 4
  | 3 => 32
  | 4 => 16
  | 5 => 8
  | _ => 0

/-- Numerators of a transition row whose source is 1 modulo 3. -/
def rowOneNumerator (j : Fin 6) : ℕ :=
  match j.val with
  | 0 => 16
  | 1 => 32
  | 2 => 1
  | 3 => 8
  | 4 => 4
  | 5 => 2
  | _ => 0

/-- Numerators of a transition row whose source is 2 modulo 3. -/
def rowTwoNumerator (j : Fin 6) : ℕ :=
  match j.val with
  | 0 => 4
  | 1 => 8
  | 2 => 16
  | 3 => 2
  | 4 => 1
  | 5 => 32
  | _ => 0

/-- The integer numerator of the rational transition matrix. -/
def transitionNumerator (i j : Fin 6) : ℕ :=
  if stateValue i % 3 = 1 then rowOneNumerator j
  else rowTwoNumerator j

/-- The two-step numerator before division by 63 squared. -/
def twoStepNumerator (j : Fin 6) : ℕ :=
  ∑ i : Fin 6, initialNumerator i * transitionNumerator i j

/-- Numerators of the claimed two-step distribution. -/
def outputNumerator (j : Fin 6) : ℕ :=
  match j.val with
  | 0 => 8
  | 1 => 16
  | 2 => 11
  | 3 => 4
  | 4 => 2
  | 5 => 22
  | _ => 0

/-- Every displayed row has denominator 63. -/
theorem initialRow_sum :
    (∑ j : Fin 6, initialNumerator j) = 63 := by
  native_decide

theorem rowOne_sum :
    (∑ j : Fin 6, rowOneNumerator j) = 63 := by
  native_decide

theorem rowTwo_sum :
    (∑ j : Fin 6, rowTwoNumerator j) = 63 := by
  native_decide

/-- Every unit-state transition row is stochastic after division by 63. -/
theorem transitionRow_sum (i : Fin 6) :
    (∑ j : Fin 6, transitionNumerator i j) = 63 := by
  unfold transitionNumerator
  split
  · exact rowOne_sum
  · exact rowTwo_sum

/-- Exact multiplication of the initial row by the transition matrix. -/
theorem twoStepNumerator_eq (j : Fin 6) :
    twoStepNumerator j = 63 * outputNumerator j := by
  native_decide

/-- The exact rational two-step terminal mass at each unit residue. -/
def twoStepMass (j : Fin 6) : ℚ :=
  (twoStepNumerator j : ℚ) / (63 * 63)

/-- The two-step distribution is (8,16,11,4,2,22)/63. -/
theorem twoStepMass_eq (j : Fin 6) :
    twoStepMass j = (outputNumerator j : ℚ) / 63 := by
  unfold twoStepMass
  rw [twoStepNumerator_eq]
  push_cast
  norm_num

/-- The exact second moment of the two-step terminal distribution. -/
def twoStepEnergy : ℚ :=
  ∑ j : Fin 6, (twoStepMass j) ^ 2

/-- The k = 2 terminal-residue collision energy is exactly 5/21. -/
theorem twoStepEnergy_eq_five_div_twentyOne :
    twoStepEnergy = (5 : ℚ) / 21 := by
  native_decide

#print axioms initialRow_sum
#print axioms rowOne_sum
#print axioms rowTwo_sum
#print axioms transitionRow_sum
#print axioms twoStepNumerator_eq
#print axioms twoStepMass_eq
#print axioms twoStepEnergy_eq_five_div_twentyOne

end LubuimiTerminalResidueEnergyK2
