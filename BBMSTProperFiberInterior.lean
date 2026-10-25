import Mathlib
import BBMSTFiberMassCore

set_option autoImplicit false

namespace BBMSTProperFiberInterior

/--
If the removed points form a nonempty proper subset of a nonempty finite
fiber, their exact cardinality proportion lies strictly between zero and one.
This is the ratio-safe finite-set bridge for the source definition of alpha_k(x);
it does not assert that BBMST's geometry supplies such a fiber.
-/
theorem finite_proper_nonempty_subset_card_ratio_strict_interior
    {Ω : Type*} [DecidableEq Ω]
    (s t : Finset Ω)
    (hts : t ⊂ s)
    (ht : t.Nonempty)
    (hs : s.Nonempty) :
    0 < (t.card : ℚ) / (s.card : ℚ) ∧
      (t.card : ℚ) / (s.card : ℚ) < 1 := by
  have hden : (0 : ℚ) < (s.card : ℚ) := by
    exact_mod_cast hs.card_pos
  have hnum : (0 : ℚ) < (t.card : ℚ) := by
    exact_mod_cast ht.card_pos
  have hcard : t.card < s.card := Finset.card_lt_card hts
  have hnum_lt : (t.card : ℚ) < (s.card : ℚ) := by
    exact_mod_cast hcard
  constructor
  · exact div_pos hnum hden
  · exact (div_lt_one₀ hden).2 hnum_lt

/--
A positive-mass fiber with a nonempty proper removed subset contributes
strictly positive alpha * (1-alpha) * mass to the BBMST interior-mass
sum. This isolates the finite combinatorial witness obligation in a form
that can be connected to the paper's geometric construction.
-/
theorem finite_proper_fiber_gives_positive_interior_term
    {Ω : Type*} [DecidableEq Ω]
    (s t : Finset Ω) (mass : ℚ)
    (hts : t ⊂ s) (ht : t.Nonempty) (hs : s.Nonempty)
    (hmass : 0 < mass) :
    0 < ((t.card : ℚ) / (s.card : ℚ)) *
      (1 - (t.card : ℚ) / (s.card : ℚ)) * mass := by
  obtain ⟨hlo, hhi⟩ :=
    finite_proper_nonempty_subset_card_ratio_strict_interior s t hts ht hs
  exact mul_pos (mul_pos hlo (sub_pos.mpr hhi)) hmass

#print axioms finite_proper_nonempty_subset_card_ratio_strict_interior
#print axioms finite_proper_fiber_gives_positive_interior_term

end BBMSTProperFiberInterior
