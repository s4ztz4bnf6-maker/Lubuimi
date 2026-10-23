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

/--
In the complementary odd residue class n = 3 mod 4, the unaccelerated
quotient after removing the single forced factor of two is odd.
This records the exact parity obstruction to obtaining a quarter-step
descent from this residue class.
-/
theorem half_step_odd_of_mod_four_three
    (n : ℕ) (hn : n % 4 = 3) :
    ((3 * n + 1) / 2) % 2 = 1 := by
  omega

/--
The forced half-step in the residue class n = 3 mod 4 is increasing for
n > 1. Thus a proof of global descent cannot rely on one-step monotonicity
in every odd residue class.
-/
theorem half_step_growth_of_mod_four_three
    (n : ℕ) (hn : n % 4 = 3) (hn_two : 2 ≤ n) :
    n < (3 * n + 1) / 2 := by
  omega

#print axioms CollatzSyracuseAudit.half_step_odd_of_mod_four_three
#print axioms CollatzSyracuseAudit.half_step_growth_of_mod_four_three

/--
Exact integer descent margin for the quarter-step in the residue class
n = 1 mod 4. The decrease is not merely positive: it is exactly (n-1)/4.
-/
theorem quarter_step_exact_gap
    (n : ℕ) (hn : n % 4 = 1) :
    n - (3 * n + 1) / 4 = (n - 1) / 4 := by
  omega

#print axioms CollatzSyracuseAudit.quarter_step_exact_gap

/--
Exact growth margin in the residue class n = 3 mod 4 after one forced
division by two. This complements `quarter_step_exact_gap` and quantifies
the local growth that a multi-step argument must overcome.
-/
theorem half_step_exact_growth
    (n : ℕ) (hn : n % 4 = 3) :
    (3 * n + 1) / 2 - n = (n + 1) / 2 := by
  omega

#print axioms CollatzSyracuseAudit.half_step_exact_growth


/--
Refine the n = 3 mod 4 obstruction by one more binary digit: if n = 3
mod 8, the forced half-step lands in the 1 mod 4 class. This is a
transition-classification lemma, not a global descent claim.
-/
theorem half_step_mod_four_one_of_mod_eight_three
    (n : ℕ) (hn : n % 8 = 3) :
    ((3 * n + 1) / 2) % 4 = 1 := by
  omega

/--
If n = 7 mod 8, the forced half-step remains in the 3 mod 4 class.
Together with the previous theorem this isolates the two possible
next residue classes after the forced half-step.
-/
theorem half_step_mod_four_three_of_mod_eight_seven
    (n : ℕ) (hn : n % 8 = 7) :
    ((3 * n + 1) / 2) % 4 = 3 := by
  omega

#print axioms CollatzSyracuseAudit.half_step_mod_four_one_of_mod_eight_three
#print axioms CollatzSyracuseAudit.half_step_mod_four_three_of_mod_eight_seven

end CollatzSyracuseAudit
