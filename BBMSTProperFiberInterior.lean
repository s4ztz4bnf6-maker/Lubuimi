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


/--
Quantitative finite-cardinality strengthening: a nonempty proper subset of
a fiber of size q has proportion alpha with both alpha and 1-alpha at least
1/q. Consequently alpha*(1-alpha) is at least 1/q^2. This is a uniform
geometric contribution bound before multiplying by the fiber's probability
mass; it does not supply a lower bound on that probability mass.
-/
theorem finite_proper_fiber_card_ratio_quadratic_floor
    {Ω : Type*} [DecidableEq Ω]
    (s t : Finset Ω)
    (hts : t ⊂ s)
    (ht : t.Nonempty)
    (hs : s.Nonempty) :
    1 / (s.card : ℚ) ^ 2 ≤
      ((t.card : ℚ) / (s.card : ℚ)) *
        (1 - (t.card : ℚ) / (s.card : ℚ)) := by
  have hq : (0 : ℚ) < (s.card : ℚ) := by
    exact_mod_cast hs.card_pos
  have hq1 : (1 : ℚ) ≤ (s.card : ℚ) := by
    have hn : 1 ≤ s.card := Nat.one_le_iff_ne_zero.mpr
      (Finset.card_ne_zero.mpr hs)
    exact_mod_cast hn
  have ht1 : (1 : ℚ) ≤ (t.card : ℚ) := by
    have hn : 1 ≤ t.card := Nat.one_le_iff_ne_zero.mpr
      (Finset.card_ne_zero.mpr ht)
    exact_mod_cast hn
  have hcard : t.card < s.card := Finset.card_lt_card hts
  have hremNat : t.card + 1 ≤ s.card := Nat.succ_le_iff.mpr hcard
  have hrem : (t.card : ℚ) + 1 ≤ (s.card : ℚ) := by
    exact_mod_cast hremNat
  have hratio : 1 / (s.card : ℚ) ≤ (t.card : ℚ) / (s.card : ℚ) := by
    exact (div_le_div_iff_of_pos_right hq).2 (by linarith)
  have hcomplement :
      1 / (s.card : ℚ) ≤
        1 - (t.card : ℚ) / (s.card : ℚ) := by
    have hdiv : (t.card : ℚ) / (s.card : ℚ) ≤
        1 - 1 / (s.card : ℚ) := by
      apply (div_le_iff₀ hq).2
      have hcardle : (t.card : ℚ) ≤ (s.card : ℚ) - 1 := by
        linarith
      rw [show (1 - 1 / (s.card : ℚ)) * (s.card : ℚ) =
          (s.card : ℚ) - 1 by field_simp]
      exact hcardle
    linarith
  have hfloor : 0 ≤ 1 / (s.card : ℚ) := by positivity
  have hratio_nonneg :
      0 ≤ (t.card : ℚ) / (s.card : ℚ) :=
    div_nonneg (by positivity) (le_of_lt hq)
  calc
    1 / (s.card : ℚ) ^ 2 =
        (1 / (s.card : ℚ)) * (1 / (s.card : ℚ)) := by
          field_simp
    _ ≤ ((t.card : ℚ) / (s.card : ℚ)) *
          (1 / (s.card : ℚ)) :=
      mul_le_mul_of_nonneg_right hratio hfloor
    _ ≤ ((t.card : ℚ) / (s.card : ℚ)) *
          (1 - (t.card : ℚ) / (s.card : ℚ)) :=
      mul_le_mul_of_nonneg_left hcomplement hratio_nonneg

#print axioms finite_proper_fiber_card_ratio_quadratic_floor


/--
Quantitative mass contribution of a proper finite fiber: if its probability
mass is m>0 and its coordinate fiber has q points, its contribution to the
weighted interior sum is at least m/q². This isolates both the combinatorial
factor and the still-separate need for a lower bound on m.
-/
theorem finite_proper_fiber_mass_contribution_lower_bound
    {Ω : Type*} [DecidableEq Ω]
    (s t : Finset Ω) (mass : ℚ)
    (hts : t ⊂ s) (ht : t.Nonempty) (hs : s.Nonempty)
    (hmass : 0 < mass) :
    mass / (s.card : ℚ) ^ 2 ≤
      ((t.card : ℚ) / (s.card : ℚ)) *
        (1 - (t.card : ℚ) / (s.card : ℚ)) * mass := by
  have hfloor := finite_proper_fiber_card_ratio_quadratic_floor s t hts ht hs
  have hmass0 : 0 ≤ mass := le_of_lt hmass
  calc
    mass / (s.card : ℚ) ^ 2 =
        mass * (1 / (s.card : ℚ) ^ 2) := by ring
    _ ≤ mass *
        (((t.card : ℚ) / (s.card : ℚ)) *
          (1 - (t.card : ℚ) / (s.card : ℚ))) :=
      mul_le_mul_of_nonneg_left hfloor hmass0
    _ = ((t.card : ℚ) / (s.card : ℚ)) *
          (1 - (t.card : ℚ) / (s.card : ℚ)) * mass := by ring

#print axioms finite_proper_fiber_mass_contribution_lower_bound


/--
Sharp integer-cardinality floor: among nonempty proper subsets of a fiber
of size q, alpha*(1-alpha) is minimized when the subset has size 1 or q-1,
so the lower bound is (q-1)/q^2 (stronger than 1/q^2). This remains only a
finite combinatorial estimate; it does not establish existence or positive
mass of a source-geometric fiber.
-/
theorem finite_proper_fiber_card_ratio_sharp_floor
    {Ω : Type*} [DecidableEq Ω]
    (s t : Finset Ω)
    (hts : t ⊂ s)
    (ht : t.Nonempty)
    (hs : s.Nonempty) :
    ((s.card : ℚ) - 1) / (s.card : ℚ) ^ 2 ≤
      ((t.card : ℚ) / (s.card : ℚ)) *
        (1 - (t.card : ℚ) / (s.card : ℚ)) := by
  have hq : (0 : ℚ) < (s.card : ℚ) := by
    exact_mod_cast hs.card_pos
  have hk : (1 : ℚ) ≤ (t.card : ℚ) := by
    have hn : 1 ≤ t.card := Nat.one_le_iff_ne_zero.mpr
      (Finset.card_ne_zero.mpr ht)
    exact_mod_cast hn
  have hcard : t.card < s.card := Finset.card_lt_card hts
  have hqk : (1 : ℚ) ≤ (s.card : ℚ) - (t.card : ℚ) := by
    have hn : t.card + 1 ≤ s.card := Nat.succ_le_iff.mpr hcard
    have hnQ : (t.card : ℚ) + 1 ≤ (s.card : ℚ) := by
      exact_mod_cast hn
    linarith
  have hprod :
      (s.card : ℚ) - 1 ≤
        (t.card : ℚ) * ((s.card : ℚ) - (t.card : ℚ)) := by
    nlinarith [mul_nonneg (sub_nonneg.mpr hk)
      (sub_nonneg.mpr hqk)]
  have hq2 : (s.card : ℚ) ≠ 0 := ne_of_gt hq
  field_simp
  nlinarith [hprod]
#print axioms finite_proper_fiber_card_ratio_sharp_floor
