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
