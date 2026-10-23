import SyracuseSecondStep

/-!
# Modulo-32 residue exhaustion for accelerated Syracuse

This is a finite, kernel-checked classification of odd inputs at modulus 32.
It records two proved descent sectors and leaves the remaining odd sectors
explicitly open except for their exact first-step affine transition.
It is not a global termination argument.
-/

namespace CollatzSyracuseAudit

inductive Residue32Class where
  | strictDescent
  | exactTransition
  | critical
  deriving DecidableEq, Repr

def classifyResidue32 (r : Fin 32) : Residue32Class :=
  if r.val % 2 = 0 then .critical
  else if r.val % 4 = 1 then .strictDescent
  else if r.val = 3 ∨ r.val = 19 then .strictDescent
  else .exactTransition

/-- Every canonical residue is assigned exactly one of the three labels. -/
theorem residue32_classification_total (r : Fin 32) :
    classifyResidue32 r = .strictDescent ∨
    classifyResidue32 r = .exactTransition ∨
    classifyResidue32 r = .critical := by
  unfold classifyResidue32
  by_cases h2 : r.val % 2 = 0
  · simp [h2]
  · by_cases h4 : r.val % 4 = 1
    · simp [h2, h4]
    · by_cases h3 : r.val = 3
      · simp [h2, h4, h3]
      · by_cases h19 : r.val = 19
        · simp [h2, h4, h3, h19]
        · simp [h2, h4, h3, h19]

/-- A residue 3 modulo 32 has a strict two-step descent. -/
theorem two_step_descent_mod32_three (n : ℕ) (hmod : n % 32 = 3) :
    syracuse (syracuse n) < n := by
  have hn : n = 32 * (n / 32) + 3 := by omega
  rw [hn]
  have hshape : 32 * (n / 32) + 3 = 4 * (8 * (n / 32)) + 3 := by omega
  rw [hshape]
  exact second_step_descent_of_m_mod_eight_zero (n / 32)

/-- A residue 19 modulo 32 has a strict two-step descent. -/
theorem two_step_descent_mod32_nineteen (n : ℕ) (hmod : n % 32 = 19) :
    syracuse (syracuse n) < n := by
  have hn : n = 32 * (n / 32) + 19 := by omega
  rw [hn]
  have hshape :
      32 * (n / 32) + 19 = 4 * (8 * (n / 32) + 4) + 3 := by omega
  rw [hshape]
  exact second_step_descent_of_m_mod_eight_four (n / 32)

/-- Exhaustion of odd inputs modulo 32 at the current proof frontier:
either a one-step descent, a proved two-step descent, or an explicit
remaining sector together with its exact affine first step. The final case
is deliberately not claimed to descend. -/
theorem odd_input_mod32_exhaustion
    (n : ℕ) (hnodd : n % 2 = 1) (hnlarge : 2 ≤ n) :
    syracuse n < n ∨
      syracuse (syracuse n) < n ∨
      (∃ m : ℕ, n = 4 * m + 3 ∧ syracuse n = 6 * m + 5 ∧
        n % 32 ≠ 3 ∧ n % 32 ≠ 19) := by
  have hmod4 : n % 4 = 1 ∨ n % 4 = 3 := by omega
  rcases hmod4 with h1 | h3
  · exact Or.inl (syracuse_descent_mod_four_one n h1 hnlarge)
  · by_cases hres3 : n % 32 = 3
    · exact Or.inr (Or.inl (two_step_descent_mod32_three n hres3))
    · by_cases hres19 : n % 32 = 19
      · exact Or.inr (Or.inl (two_step_descent_mod32_nineteen n hres19))
      · apply Or.inr
        apply Or.inr
        refine ⟨n / 4, ?_, ?_, hres3, hres19⟩
        · omega
        · rw [show n = 4 * (n / 4) + 3 by omega]
          exact first_step_formula_mod_four_three (n / 4)

#print axioms residue32_classification_total
#print axioms two_step_descent_mod32_three
#print axioms two_step_descent_mod32_nineteen
#print axioms odd_input_mod32_exhaustion

end CollatzSyracuseAudit
