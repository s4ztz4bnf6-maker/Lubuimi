import Mathlib

namespace CollatzSyracuseAudit

/--
Exact two-step valuation transition on the residue class n = 11 (mod 16).
The first accelerated step has valuation one, and the next has valuation two.
This is a local transition certificate, not a global descent theorem.
-/
theorem exact_transition_one_then_two_of_mod_sixteen_eleven
    (n : ℕ) (hn : n % 16 = 11) :
    (3 * n + 1) % 2 = 0 ∧
    ((3 * n + 1) / 2) % 2 = 1 ∧
    (3 * ((3 * n + 1) / 2) + 1) % 4 = 0 ∧
    ((3 * ((3 * n + 1) / 2) + 1) / 4) % 2 = 1 := by
  omega

#print axioms exact_transition_one_then_two_of_mod_sixteen_eleven

/--
Residue class n = 7 (mod 8) forces two consecutive accelerated
valuation-one steps. This is a local residue certificate only.
-/
theorem valuation_one_twice_of_mod_eight_seven
    (n : ℕ) (hn : n % 8 = 7) :
    (3 * n + 1) % 4 = 2 ∧
    (3 * ((3 * n + 1) / 2) + 1) % 4 = 2 := by
  omega

/--
The two consecutive valuation-one congruences characterize n = 7 (mod 8).
The statement uses exact modular conditions, not an assumed valuation function.
-/
theorem two_valuation_one_iff_mod_eight_seven
    (n : ℕ) :
    ((3 * n + 1) % 4 = 2 ∧
      (3 * ((3 * n + 1) / 2) + 1) % 4 = 2) ↔ n % 8 = 7 := by
  constructor
  · intro h
    omega
  · exact valuation_one_twice_of_mod_eight_seven n

#print axioms valuation_one_twice_of_mod_eight_seven
#print axioms two_valuation_one_iff_mod_eight_seven

end CollatzSyracuseAudit


/--
Three consecutive accelerated valuation-one steps are characterized by the
single starting residue n = 15 (mod 16). The three modular conditions encode
v₂(3 n_j + 1) = 1 at each of the first three odd Syracuse states. This is
a finite-prefix classification, not a claim about eventual descent.
-/
theorem three_valuation_one_iff_mod_sixteen_fifteen
    (n : ℕ) :
    ((3 * n + 1) % 4 = 2 ∧
      (3 * ((3 * n + 1) / 2) + 1) % 4 = 2 ∧
      (3 * ((3 * ((3 * n + 1) / 2) + 1) / 2) + 1) % 4 = 2)
      ↔ n % 16 = 15 := by
  constructor
  · intro h
    omega
  · intro hn
    omega

#print axioms three_valuation_one_iff_mod_sixteen_fifteen


/--
Four consecutive accelerated valuation-one steps are characterized by
n = 31 (mod 32). This extends the exact finite-prefix residue classification
by one step; it does not imply that such a block repeats or that an orbit
eventually descends.
-/
theorem four_valuation_one_iff_mod_thirty_two_thirty_one
    (n : ℕ) :
    ((3 * n + 1) % 4 = 2 ∧
      (3 * ((3 * n + 1) / 2) + 1) % 4 = 2 ∧
      (3 * ((3 * ((3 * n + 1) / 2) + 1) / 2) + 1) % 4 = 2 ∧
      (3 * ((3 * ((3 * ((3 * n + 1) / 2) + 1) / 2) + 1) / 2) + 1) % 4 = 2)
      ↔ n % 32 = 31 := by
  constructor
  · intro h
    omega
  · intro hn
    omega

#print axioms four_valuation_one_iff_mod_thirty_two_thirty_one


set_option maxHeartbeats 1000000

/--
Five consecutive accelerated valuation-one steps are characterized by
n = 63 (mod 64). This is the next finite-cylinder case in the exact
initial-run pattern; it is not a global Collatz descent result.
-/
theorem five_valuation_one_iff_mod_sixty_four_sixty_three
    (n : ℕ) :
    ((3 * n + 1) % 4 = 2 ∧
      (3 * ((3 * n + 1) / 2) + 1) % 4 = 2 ∧
      (3 * ((3 * ((3 * n + 1) / 2) + 1) / 2) + 1) % 4 = 2 ∧
      (3 * ((3 * ((3 * ((3 * n + 1) / 2) + 1) / 2) + 1) / 2) + 1) % 4 = 2 ∧
      (3 * ((3 * ((3 * ((3 * ((3 * n + 1) / 2) + 1) / 2) + 1) / 2) + 1) / 2) + 1) % 4 = 2)
      ↔ n % 64 = 63 := by
  constructor
  · intro h
    omega
  · intro hn
    omega

#print axioms five_valuation_one_iff_mod_sixty_four_sixty_three


/--
Exact two-step affine identity underlying a prescribed pair of Syracuse
valuation steps. If p and q are the corresponding powers of two and
3*x + 1 = p*y, 3*y + 1 = q*z, then eliminating y gives
9*x + 3 + p = p*q*z. This is an algebraic invariant only; valuation
exactness and a global descent conclusion require additional hypotheses.
-/
theorem two_step_affine_identity
    (x y z p q : ℕ)
    (h₁ : 3 * x + 1 = p * y)
    (h₂ : 3 * y + 1 = q * z) :
    9 * x + 3 + p = p * q * z := by
  calc
    9 * x + 3 + p = 3 * (3 * x + 1) + p := by ring
    _ = 3 * (p * y) + p := by rw [h₁]
    _ = p * (3 * y + 1) := by ring
    _ = p * (q * z) := congrArg (fun t : ℕ => p * t) h₂
    _ = p * q * z := by ring

#print axioms two_step_affine_identity


/--
Exact three-step affine recurrence. The identity is obtained by eliminating
both intermediate states from the three equations `3*xᵢ + 1 = pᵢ*xᵢ₊₁`.
It is a finite algebraic invariant, not a descent or realizability theorem.
-/
theorem three_step_affine_identity
    (x₀ x₁ x₂ x₃ p₀ p₁ p₂ : ℕ)
    (h₀ : 3 * x₀ + 1 = p₀ * x₁)
    (h₁ : 3 * x₁ + 1 = p₁ * x₂)
    (h₂ : 3 * x₂ + 1 = p₂ * x₃) :
    27 * x₀ + 9 + 3 * p₀ + p₀ * p₁ = p₀ * p₁ * p₂ * x₃ := by
  calc
    27 * x₀ + 9 + 3 * p₀ + p₀ * p₁
        = 3 * (9 * x₀ + 3 + p₀) + p₀ * p₁ := by ring
    _ = 3 * (p₀ * p₁ * x₂) + p₀ * p₁ := by rw [two_step_affine_identity x₀ x₁ x₂ p₀ p₁ h₀ h₁]
    _ = p₀ * p₁ * (3 * x₂ + 1) := by ring
    _ = p₀ * p₁ * (p₂ * x₃) := by rw [h₂]
    _ = p₀ * p₁ * p₂ * x₃ := by ring

#print axioms three_step_affine_identity


/--
Exact four-step affine recurrence, obtained by eliminating three intermediate
states. This extends the finite algebraic invariant by one step; it does not
assert that the multipliers are exact powers of two or imply global descent.
-/
theorem four_step_affine_identity
    (x₀ x₁ x₂ x₃ x₄ p₀ p₁ p₂ p₃ : ℕ)
    (h₀ : 3 * x₀ + 1 = p₀ * x₁)
    (h₁ : 3 * x₁ + 1 = p₁ * x₂)
    (h₂ : 3 * x₂ + 1 = p₂ * x₃)
    (h₃ : 3 * x₃ + 1 = p₃ * x₄) :
    81 * x₀ + 27 + 9 * p₀ + 3 * p₀ * p₁ + p₀ * p₁ * p₂ =
      p₀ * p₁ * p₂ * p₃ * x₄ := by
  calc
    81 * x₀ + 27 + 9 * p₀ + 3 * p₀ * p₁ + p₀ * p₁ * p₂
        = 3 * (27 * x₀ + 9 + 3 * p₀ + p₀ * p₁) +
          p₀ * p₁ * p₂ := by ring
    _ = 3 * (p₀ * p₁ * p₂ * x₃) + p₀ * p₁ * p₂ := by
      rw [three_step_affine_identity x₀ x₁ x₂ x₃ p₀ p₁ p₂ h₀ h₁ h₂]
    _ = p₀ * p₁ * p₂ * (3 * x₃ + 1) := by ring
    _ = p₀ * p₁ * p₂ * (p₃ * x₄) := by rw [h₃]
    _ = p₀ * p₁ * p₂ * p₃ * x₄ := by ring

#print axioms four_step_affine_identity


/--
Exact five-step affine recurrence. This is a further finite instance of the
closed-form pattern; it is not a substitute for the general induction theorem.
-/
theorem five_step_affine_identity
    (x₀ x₁ x₂ x₃ x₄ x₅ p₀ p₁ p₂ p₃ p₄ : ℕ)
    (h₀ : 3 * x₀ + 1 = p₀ * x₁)
    (h₁ : 3 * x₁ + 1 = p₁ * x₂)
    (h₂ : 3 * x₂ + 1 = p₂ * x₃)
    (h₃ : 3 * x₃ + 1 = p₃ * x₄)
    (h₄ : 3 * x₄ + 1 = p₄ * x₅) :
    243 * x₀ + 81 + 27 * p₀ + 9 * p₀ * p₁ +
        3 * p₀ * p₁ * p₂ + p₀ * p₁ * p₂ * p₃ =
      p₀ * p₁ * p₂ * p₃ * p₄ * x₅ := by
  calc
    243 * x₀ + 81 + 27 * p₀ + 9 * p₀ * p₁ +
        3 * p₀ * p₁ * p₂ + p₀ * p₁ * p₂ * p₃
        = 3 * (81 * x₀ + 27 + 9 * p₀ + 3 * p₀ * p₁ +
          p₀ * p₁ * p₂) + p₀ * p₁ * p₂ * p₃ := by ring
    _ = 3 * (p₀ * p₁ * p₂ * p₃ * x₄) +
        p₀ * p₁ * p₂ * p₃ := by
      rw [four_step_affine_identity x₀ x₁ x₂ x₃ x₄ p₀ p₁ p₂ p₃
        h₀ h₁ h₂ h₃]
    _ = p₀ * p₁ * p₂ * p₃ * (3 * x₄ + 1) := by ring
    _ = p₀ * p₁ * p₂ * p₃ * (p₄ * x₅) := by rw [h₄]
    _ = p₀ * p₁ * p₂ * p₃ * p₄ * x₅ := by ring

#print axioms five_step_affine_identity
