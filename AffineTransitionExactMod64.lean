import AffineTransitionDesign
import AffineTransitionValuation

namespace CollatzSyracuseAudit

/-- Exact two-step Syracuse output for inputs congruent to 3 modulo 64. -/
theorem mod64_three_two_step_exact (m : ℕ) :
    syracuse (syracuse (64 * m + 3)) = 18 * m + 1 := by
  have hinput : 64 * m + 3 = 4 * (16 * m) + 3 := by omega
  rw [hinput, first_step_formula_mod_four_three (16 * m)]
  exact second_step_formula_of_m_mod_sixteen_zero m

/--
Exact accelerated two-step formula on the residue class 35 modulo 64.
The first step is 96*m+53; the next numerator is 32*(9*m+5).
The valuation-scaling lemma removes the fixed factor 32 exactly, leaving
the Syracuse normalization of 9*m+5. This is an exact local identity,
not a global descent claim.
-/
theorem mod64_thirtyfive_two_step_exact (m : ℕ) :
    syracuse (syracuse (64 * m + 35)) =
      (9 * m + 5) / 2 ^ v2 (9 * m + 5) := by
  have hfirst : syracuse (64 * m + 35) = 96 * m + 53 := by
    have hinput : 64 * m + 35 = 4 * (16 * m + 8) + 3 := by omega
    rw [hinput, first_step_formula_mod_four_three]
    omega
  rw [hfirst]
  have hfactor : 3 * (96 * m + 53) + 1 = 32 * (9 * m + 5) := by omega
  have hnonzero : 9 * m + 5 ≠ 0 := by omega
  have hval : v2 (3 * (96 * m + 53) + 1) =
      5 + v2 (9 * m + 5) := by
    rw [hfactor]
    exact v2_mul_32 (9 * m + 5) hnonzero
  dsimp [syracuse]
  rw [hfactor] at hval
  rw [hfactor, hval, pow_add]
  norm_num [Nat.mul_div_mul_left]

#print axioms CollatzSyracuseAudit.mod64_thirtyfive_two_step_exact

/-! A second explicit residue class with strict two-step descent. -/

/-- Inputs congruent to 35 modulo 64 strictly descend after two accelerated
Syracuse steps. The exact formula reduces the output to a quotient bounded
by its numerator, which is strictly below the original input. -/
theorem mod64_thirtyfive_two_step_descent (m : ℕ) :
    syracuse (syracuse (64 * m + 35)) < 64 * m + 35 := by
  rw [mod64_thirtyfive_two_step_exact]
  calc
    (9 * m + 5) / 2 ^ v2 (9 * m + 5) ≤ 9 * m + 5 :=
      Nat.div_le_self _ _
    _ < 64 * m + 35 := by omega

#print axioms mod64_thirtyfive_two_step_descent

/-- Residue-class interface: every natural number congruent to 35 modulo 64
strictly descends after two accelerated Syracuse steps. -/
theorem mod64_thirtyfive_two_step_descent_of_residue (n : ℕ)
    (hn : n % 64 = 35) :
    syracuse (syracuse n) < n := by
  have hdecomp : n = 64 * (n / 64) + 35 := by omega
  rw [hdecomp]
  exact mod64_thirtyfive_two_step_descent (n / 64)

#print axioms mod64_thirtyfive_two_step_descent_of_residue

/-- The second-step numerator for inputs congruent to 35 modulo 64
is 32 times the residual factor 9*m+5. -/
theorem mod64_thirtyfive_second_numerator_factor32 (m : ℕ) :
    3 * (96 * m + 53) + 1 = 32 * (9 * m + 5) := by
  omega

/-- The first Syracuse step from 64*m+35 is exact. -/
theorem mod64_thirtyfive_first_step_exact (m : ℕ) :
    syracuse (64 * m + 35) = 96 * m + 53 := by
  have hinput : 64 * m + 35 = 4 * (16 * m + 8) + 3 := by omega
  rw [hinput, first_step_formula_mod_four_three]
  omega

#print axioms CollatzSyracuseAudit.mod64_three_two_step_exact

/-- Inputs congruent to 3 modulo 64 strictly descend after two accelerated
Syracuse steps. The exact output is 18*m+1, which is below 64*m+3;
this closes a second explicit residue class without claiming global descent. -/
theorem mod64_three_two_step_descent (m : ℕ) :
    syracuse (syracuse (64 * m + 3)) < 64 * m + 3 := by
  rw [mod64_three_two_step_exact]
  omega

#print axioms mod64_three_two_step_descent

/-- Residue-class interface: any natural number congruent to 3 modulo 64
strictly descends after two accelerated Syracuse steps. -/
theorem mod64_three_two_step_descent_of_residue (n : ℕ)
    (hn : n % 64 = 3) :
    syracuse (syracuse n) < n := by
  have hdecomp : n = 64 * (n / 64) + 3 := by omega
  rw [hdecomp]
  exact mod64_three_two_step_descent (n / 64)

#print axioms mod64_three_two_step_descent_of_residue

#print axioms CollatzSyracuseAudit.mod64_thirtyfive_second_numerator_factor32
#print axioms CollatzSyracuseAudit.mod64_thirtyfive_first_step_exact


/-- Combined finite residue certificate: inputs congruent to either 3 or 35
modulo 64 strictly descend after two accelerated Syracuse steps. This joins
two exact cylinders into one reusable local criterion; it is not a global
descent theorem because most residue classes are not covered. -/
theorem mod64_three_or_thirtyfive_two_step_descent_of_residue (n : ℕ)
    (hn : n % 64 = 3 ∨ n % 64 = 35) :
    syracuse (syracuse n) < n := by
  rcases hn with h3 | h35
  · exact mod64_three_two_step_descent_of_residue n h3
  · exact mod64_thirtyfive_two_step_descent_of_residue n h35

#print axioms mod64_three_or_thirtyfive_two_step_descent_of_residue


/-- Exact two-step formula on the residue class 5 modulo 32. The first
step removes the fixed factor 16; the second removes the fixed factor 2,
leaving the normalized residual factor 9*m+2. -/
theorem mod32_five_two_step_exact (m : ℕ) :
    syracuse (syracuse (32 * m + 5)) =
      (9 * m + 2) / 2 ^ v2 (9 * m + 2) := by
  have hfirst_num : 3 * (32 * m + 5) + 1 = 16 * (6 * m + 1) := by omega
  have hfirst16 : 16 ∣ 3 * (32 * m + 5) + 1 := by
    rw [hfirst_num]
    exact ⟨6 * m + 1, rfl⟩
  have hfirst32 : ¬ 32 ∣ 3 * (32 * m + 5) + 1 := by
    rw [hfirst_num]
    intro h
    obtain ⟨q, hq⟩ := h
    omega
  have hfirst_val : v2 (3 * (32 * m + 5) + 1) = 4 :=
    v2_eq_four_of_sixteen_not_thirty_two _ (by omega) hfirst16 hfirst32
  have hfirst : syracuse (32 * m + 5) = 6 * m + 1 := by
    dsimp [syracuse]
    rw [hfirst_val, hfirst_num]
    norm_num
  rw [hfirst]
  have hsecond_num : 3 * (6 * m + 1) + 1 = 2 * (9 * m + 2) := by omega
  have hnonzero : 9 * m + 2 ≠ 0 := by omega
  have hsecond_val : v2 (3 * (6 * m + 1) + 1) =
      1 + v2 (9 * m + 2) := by
    rw [hsecond_num]
    exact v2_mul_pow_two (9 * m + 2) 1 hnonzero
  dsimp [syracuse]
  rw [hsecond_num, hsecond_val, pow_succ]
  norm_num [Nat.mul_div_mul_left]

#print axioms mod32_five_two_step_exact

/-- Inputs congruent to 5 modulo 32 strictly descend after two accelerated
steps: the exact output is at most 9*m+2, below 32*m+5. -/
theorem mod32_five_two_step_descent (m : ℕ) :
    syracuse (syracuse (32 * m + 5)) < 32 * m + 5 := by
  rw [mod32_five_two_step_exact]
  calc
    (9 * m + 2) / 2 ^ v2 (9 * m + 2) ≤ 9 * m + 2 :=
      Nat.div_le_self _ _
    _ < 32 * m + 5 := by omega

#print axioms mod32_five_two_step_descent

/-- Residue-class interface for descent on the class 5 modulo 32. -/
theorem mod32_five_two_step_descent_of_residue (n : ℕ)
    (hn : n % 32 = 5) :
    syracuse (syracuse n) < n := by
  have hdecomp : n = 32 * (n / 32) + 5 := by omega
  rw [hdecomp]
  exact mod32_five_two_step_descent (n / 32)

#print axioms mod32_five_two_step_descent_of_residue

/-- Three explicit odd residue classes modulo 32 guarantee strict descent
after two accelerated steps: 3, 5, and 19. This is a finite local
certificate, not a proof that every trajectory reaches these classes. -/
theorem two_step_descent_three_residue_classes_mod32 (n : ℕ)
    (hn : n % 32 = 3 ∨ n % 32 = 5 ∨ n % 32 = 19) :
    syracuse (syracuse n) < n := by
  rcases hn with h3 | hrest
  · exact two_step_descent_mod32_three_of_residue n h3
  rcases hrest with h5 | h19
  · exact mod32_five_two_step_descent_of_residue n h5
  · exact two_step_descent_mod32_nineteen_of_residue n h19

#print axioms two_step_descent_three_residue_classes_mod32

end CollatzSyracuseAudit
