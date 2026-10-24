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
