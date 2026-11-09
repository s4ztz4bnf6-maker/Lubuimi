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


/-- Every odd natural lies in exactly one of the two residue classes
1 or 3 modulo 4. This makes the local obstruction to a one-step descent
explicit: the two cases require different arguments. -/
theorem odd_mod_four_split
    (n : ℕ) (hn : n % 2 = 1) :
    n % 4 = 1 ∨ n % 4 = 3 := by
  omega

/-- In the residue class 3 modulo 4, the first odd Syracuse quotient
(division by the known single factor 2) is strictly larger than n.
This proves why the modulo-4 split alone cannot establish global descent. -/
theorem first_step_growth_of_mod_four_three
    (n : ℕ) (hn : n % 4 = 3) :
    n < (3 * n + 1) / 2 := by
  omega

#print axioms CollatzSyracuseAudit.odd_mod_four_split
#print axioms CollatzSyracuseAudit.first_step_growth_of_mod_four_three

/-- If an odd input is 3 modulo 8, its first ordinary odd quotient
(3*n+1)/2 is 1 modulo 4. This is an exact deterministic branch statement,
not a claim that the following accelerated step descends below the original
input. -/
theorem successor_mod_four_one_of_mod_eight_three
    (n : ℕ) (hn : n % 8 = 3) :
    ((3 * n + 1) / 2) % 4 = 1 := by
  omega

/-- If an odd input is 7 modulo 8, its first ordinary odd quotient
(3*n+1)/2 is 3 modulo 4. This isolates the branch where the local
growth obstruction can repeat. -/
theorem successor_mod_four_three_of_mod_eight_seven
    (n : ℕ) (hn : n % 8 = 7) :
    ((3 * n + 1) / 2) % 4 = 3 := by
  omega

#print axioms CollatzSyracuseAudit.successor_mod_four_one_of_mod_eight_three
#print axioms CollatzSyracuseAudit.successor_mod_four_three_of_mod_eight_seven

end CollatzSyracuseAudit
