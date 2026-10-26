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

/--
For n = 3 mod 8, a half-step followed by division of the next numerator
by four gives an intermediate quotient larger than n. The quotient need
not be odd: additional powers of two may still have to be removed before
the accelerated Syracuse state is reached. This is therefore a local
growth identity, not a claim about two complete accelerated odd steps.
-/
theorem two_stage_growth_of_mod_eight_three
    (n : ℕ) (hn : n % 8 = 3) :
    n < (3 * ((3 * n + 1) / 2) + 1) / 4 := by
  omega

#print axioms CollatzSyracuseAudit.two_stage_growth_of_mod_eight_three

/--
Exact offset for the intermediate quotient in the 3 mod 8 branch.
The quotient exceeds n by exactly (n + 5) / 8. It is deliberately named
an intermediate quotient because further powers of two may remain.
-/
theorem two_stage_exact_offset_of_mod_eight_three
    (n : ℕ) (hn : n % 8 = 3) :
    (3 * ((3 * n + 1) / 2) + 1) / 4 - n = (n + 5) / 8 := by
  omega

#print axioms CollatzSyracuseAudit.two_stage_exact_offset_of_mod_eight_three


/--
For n = 7 mod 8, the first half-step remains 3 mod 4, so a second
forced division by two is available. This gives an exact two-half-step
formula; it is not the fully accelerated Syracuse map when more powers
of two divide the numerator.
-/
theorem two_half_steps_formula_of_mod_eight_seven
    (n : ℕ) (hn : n % 8 = 7) :
    (3 * ((3 * n + 1) / 2) + 1) / 2 = (9 * n + 5) / 4 := by
  omega

/-- The two forced half-steps in the 7 mod 8 class increase n. -/
theorem two_half_steps_growth_of_mod_eight_seven
    (n : ℕ) (hn : n % 8 = 7) :
    n < (3 * ((3 * n + 1) / 2) + 1) / 2 := by
  omega

#print axioms CollatzSyracuseAudit.two_half_steps_formula_of_mod_eight_seven
#print axioms CollatzSyracuseAudit.two_half_steps_growth_of_mod_eight_seven


/--
A sharper local branch than the generic 1 mod 4 result: for n = 5 mod 8,
the numerator 3*n+1 is divisible by 8, so removing at least three factors
of two already gives a strict decrease. This is only a residue-class
lemma; it does not assert that the quotient is odd or that the full
2-adic valuation is exactly three.
-/
theorem eighth_step_descent_of_mod_eight_five
    (n : ℕ) (hn : n % 8 = 5) (hn_two : 2 ≤ n) :
    (3 * n + 1) / 8 < n := by
  omega

/-- Exact gap for the 5 mod 8 branch after division by eight. -/
theorem eighth_step_exact_gap_of_mod_eight_five
    (n : ℕ) (hn : n % 8 = 5) :
    n - (3 * n + 1) / 8 = (5 * n - 1) / 8 := by
  omega

#print axioms eighth_step_descent_of_mod_eight_five
#print axioms eighth_step_exact_gap_of_mod_eight_five


/--
Exact valuation-three branch: for n = 13 mod 16, the numerator 3*n+1
is divisible by 8 but not by 16. Therefore the fully accelerated odd
Syracuse step is exactly (3*n+1)/8, rather than merely an intermediate
quotient. This is a local transition certificate, not a global descent
theorem for all odd inputs.
-/
theorem exact_three_factors_of_mod_sixteen_thirteen
    (n : ℕ) (hn : n % 16 = 13) :
    (3 * n + 1) % 8 = 0 ∧ (3 * n + 1) / 8 % 2 = 1 := by
  constructor <;> omega

/--
The exact valuation-three branch is strictly descending for n > 1.
Unlike the general 5 mod 8 lemma, the residue 13 mod 16 certifies that
the quotient is odd and hence is the actual accelerated Syracuse state.
-/
theorem accelerated_descent_of_mod_sixteen_thirteen
    (n : ℕ) (hn : n % 16 = 13) (hn_two : 2 ≤ n) :
    (3 * n + 1) / 8 < n := by
  omega

#print axioms exact_three_factors_of_mod_sixteen_thirteen
#print axioms accelerated_descent_of_mod_sixteen_thirteen


/--
Exact quotient formula on the valuation-three residue class. Writing
n = 16k + 13 gives (3*n+1)/8 = 6k+5. Besides certifying oddness,
this makes the local descent gap explicit: n - (3*n+1)/8 = 10k+8.
-/
theorem exact_quotient_formula_of_mod_sixteen_thirteen
    (n : ℕ) (hn : n % 16 = 13) :
    (3 * n + 1) / 8 = 6 * (n / 16) + 5 := by
  omega

/-- The exact positive gap in the same residue class. -/
theorem exact_descent_gap_of_mod_sixteen_thirteen
    (n : ℕ) (hn : n % 16 = 13) :
    n - (3 * n + 1) / 8 = 10 * (n / 16) + 8 := by
  rw [exact_quotient_formula_of_mod_sixteen_thirteen n hn]
  omega

#print axioms exact_quotient_formula_of_mod_sixteen_thirteen
#print axioms exact_descent_gap_of_mod_sixteen_thirteen


/--
Exact valuation-four residue class: if n ≡ 5 (mod 32), then 3*n+1
is divisible by 16 but not by 32. Thus the fully accelerated Syracuse
step is exactly (3*n+1)/16. This is a local certificate only.
-/
theorem exact_four_factors_of_mod_thirty_two_five
    (n : ℕ) (hn : n % 32 = 5) :
    (3 * n + 1) % 16 = 0 ∧ (3 * n + 1) / 16 % 2 = 1 := by
  constructor <;> omega

/--
On n ≡ 5 (mod 32), the exact accelerated quotient is 6k+1 for
k = n/32. The quotient is odd, so it is the actual Syracuse state.
-/
theorem exact_quotient_formula_of_mod_thirty_two_five
    (n : ℕ) (hn : n % 32 = 5) :
    (3 * n + 1) / 16 = 6 * (n / 32) + 1 := by
  omega

/-- Exact descent gap on the valuation-four residue class n ≡ 5 mod 32. -/
theorem exact_descent_gap_of_mod_thirty_two_five
    (n : ℕ) (hn : n % 32 = 5) :
    n - (3 * n + 1) / 16 = 26 * (n / 32) + 4 := by
  rw [exact_quotient_formula_of_mod_thirty_two_five n hn]
  omega

#print axioms exact_four_factors_of_mod_thirty_two_five
#print axioms exact_quotient_formula_of_mod_thirty_two_five
#print axioms exact_descent_gap_of_mod_thirty_two_five


end CollatzSyracuseAudit


/--
Exact integer balance for a fully accelerated odd step.  If
`3*n + 1 = 2^a*q`, then the signed change `q - n`
satisfies this identity.  This is the algebraic core behind the logarithmic
potential discussion, but by itself gives no lower bound on the cumulative
exponents `a` and hence no global termination theorem.
-/
theorem accelerated_step_integer_balance
    (n q : ℤ) (a : ℕ)
    (hstep : 3 * n + 1 = (2 : ℤ) ^ a * q) :
    (2 : ℤ) ^ a * (q - n) = (3 - (2 : ℤ) ^ a) * n + 1 := by
  calc
    (2 : ℤ) ^ a * (q - n)
        = (2 : ℤ) ^ a * q - (2 : ℤ) ^ a * n := by ring
    _ = (3 * n + 1) - (2 : ℤ) ^ a * n := by rw [hstep]
    _ = (3 - (2 : ℤ) ^ a) * n + 1 := by ring

#print axioms accelerated_step_integer_balance


/--
A complete accelerated step is strictly descending whenever at least two
factors of two are removed, provided the input is greater than one.
The explicit lower-bound hypothesis on the power isolates the arithmetic
core from the valuation theorem that must establish it in applications.
-/
theorem accelerated_step_descent_of_four_le_power
    (n q : ℤ) (a : ℕ)
    (hn : 2 ≤ n) (hq : 0 ≤ q)
    (hpow : 4 ≤ (2 : ℤ) ^ a)
    (hstep : 3 * n + 1 = (2 : ℤ) ^ a * q) :
    q < n := by
  have hmul : 4 * q ≤ (2 : ℤ) ^ a * q :=
    mul_le_mul_of_nonneg_right hpow hq
  have hmul' : 4 * q ≤ 3 * n + 1 := by
    calc
      4 * q ≤ (2 : ℤ) ^ a * q := hmul
      _ = 3 * n + 1 := by rw [← hstep]
  nlinarith

#print axioms accelerated_step_descent_of_four_le_power

/--
Sharp complementary case: if exactly one factor of two is removed,
the quotient grows for every input greater than one. This explains why the
two-adic valuation cannot be ignored in a descent argument.
-/
theorem accelerated_step_growth_of_exactly_one_factor
    (n q : ℤ)
    (hn : 1 < n)
    (hstep : 3 * n + 1 = 2 * q) :
    n < q := by
  nlinarith

#print axioms accelerated_step_growth_of_exactly_one_factor



/--
Exact valuation-two branch: if an odd input is 1 modulo 8, then 3*n+1
is divisible by 4 but not by 8, so the accelerated Syracuse quotient
(3*n+1)/4 is odd. This identifies the exact valuation, rather than only
a quotient that might still be even.
-/
theorem exact_two_factors_of_mod_eight_one
    (n : ℕ) (hn : n % 8 = 1) :
    (3 * n + 1) % 4 = 0 ∧ ((3 * n + 1) / 4) % 2 = 1 := by
  constructor <;> omega

#print axioms exact_two_factors_of_mod_eight_one


/--
On the residue class n = 1 mod 8, the exact accelerated quotient has the
closed form 6*(n/8)+1. This exposes the descent margin explicitly and
does not rely on a heuristic average valuation.
-/
theorem exact_quotient_formula_of_mod_eight_one
    (n : ℕ) (hn : n % 8 = 1) :
    (3 * n + 1) / 4 = 6 * (n / 8) + 1 := by
  omega

/--
For n = 1 mod 8 and n > 1, the exact valuation-two Syracuse step descends.
The formula quantifies the gap as 2*(n/8), while the separate valuation
certificate above ensures this quotient is odd and hence fully accelerated.
-/
theorem accelerated_descent_of_mod_eight_one
    (n : ℕ) (hn : n % 8 = 1) (hn_two : 2 ≤ n) :
    (3 * n + 1) / 4 < n := by
  omega

#print axioms exact_quotient_formula_of_mod_eight_one
#print axioms accelerated_descent_of_mod_eight_one
