import Mathlib

namespace CollatzSyracuseAudit

/--
For n congruent to 1 modulo 4, the accelerated odd step removes at least
two factors of 2: the quarter-step has the exact quotient shown below.
This is an arithmetic lemma, not a claim that every Collatz orbit reaches
this residue class.
-/
theorem quarter_step_formula
    (n : ℕ) (hn : n % 4 = 1) :
    (3 * n + 1) / 4 = 3 * (n / 4) + 1 := by
  omega

/--
If n > 1 and n is 1 modulo 4, dividing 3*n+1 by 4 strictly decreases n.
-/
theorem quarter_descent_of_mod_four_one
    (n : ℕ) (hn : n % 4 = 1) (hn_two : 2 ≤ n) :
    (3 * n + 1) / 4 < n := by
  omega

#print axioms CollatzSyracuseAudit.quarter_step_formula
#print axioms CollatzSyracuseAudit.quarter_descent_of_mod_four_one

end CollatzSyracuseAudit
