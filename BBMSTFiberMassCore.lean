import Mathlib

/-!
# BBMST fiber-mass algebra core

This module isolates the elementary rational mass-splitting identity needed
before formalizing the probability-space and fiber argument in Lemma 2.1 of
Balister–Bollobás–Morris–Sahasrabudhe–Tiba.

Scope boundary: these are algebraic bookkeeping lemmas only. They do not define
the paper's evolving probability measures, prove its distortion bounds, or
discharge either admitted sieve axiom in ErdosSelfridge_v17_fixed.
-/

namespace BBMSTFiberMassCore

/-- A mass split into an alpha-fraction and its complement conserves total mass.
No division is used, so the statement remains valid at alpha = 0 and alpha = 1. -/
theorem fiber_mass_split (mass alpha : ℚ) :
    alpha * mass + (1 - alpha) * mass = mass := by
  ring

/-- The zero-fraction endpoint: all mass is in the complementary part. -/
theorem fiber_mass_split_zero (mass : ℚ) :
    (0 : ℚ) * mass + (1 - 0) * mass = mass := by
  ring

/-- The full-fraction endpoint: all mass is in the retained part. -/
theorem fiber_mass_split_one (mass : ℚ) :
    (1 : ℚ) * mass + (1 - 1) * mass = mass := by
  ring

/-- Explicit dependency audit for the conservation identities. -/
#print axioms fiber_mass_split
#print axioms fiber_mass_split_zero
#print axioms fiber_mass_split_one

end BBMSTFiberMassCore
