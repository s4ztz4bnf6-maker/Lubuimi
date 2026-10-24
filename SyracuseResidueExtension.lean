import Mathlib

namespace CollatzSyracuseAudit

/--
Exact valuation-seven branch: n ≡ 213 (mod 256) implies 3*n+1 is
divisible by 128 and the quotient is odd. Hence the accelerated Syracuse
step is exactly (3*n+1)/128 on this residue class.
-/
theorem exact_seven_factors_of_mod_two_hundred_fifty_six_two_hundred_thirteen
    (n : ℕ) (hn : n % 256 = 213) :
    (3 * n + 1) % 128 = 0 ∧ ((3 * n + 1) / 128) % 2 = 1 := by
  constructor <;> omega

/--
Closed quotient formula on the exact valuation-seven class. If
n = 256*k + 213, then (3*n+1)/128 = 6*k+5.
-/
theorem exact_quotient_formula_of_mod_two_hundred_fifty_six_two_hundred_thirteen
    (n : ℕ) (hn : n % 256 = 213) :
    (3 * n + 1) / 128 = 6 * (n / 256) + 5 := by
  omega

/--
The valuation-seven branch is strictly descending for n > 1, with an
explicit gap of 250*(n/256)+208.
-/
theorem accelerated_descent_of_mod_two_hundred_fifty_six_two_hundred_thirteen
    (n : ℕ) (hn : n % 256 = 213) (hn_two : 2 ≤ n) :
    (3 * n + 1) / 128 < n := by
  omega

/--
Exact descent gap on the valuation-seven residue class.
-/
theorem exact_descent_gap_of_mod_two_hundred_fifty_six_two_hundred_thirteen
    (n : ℕ) (hn : n % 256 = 213) :
    n - (3 * n + 1) / 128 = 250 * (n / 256) + 208 := by
  rw [exact_quotient_formula_of_mod_two_hundred_fifty_six_two_hundred_thirteen n hn]
  omega

#print axioms CollatzSyracuseAudit.exact_seven_factors_of_mod_two_hundred_fifty_six_two_hundred_thirteen
#print axioms CollatzSyracuseAudit.exact_quotient_formula_of_mod_two_hundred_fifty_six_two_hundred_thirteen
#print axioms CollatzSyracuseAudit.accelerated_descent_of_mod_two_hundred_fifty_six_two_hundred_thirteen
#print axioms CollatzSyracuseAudit.exact_descent_gap_of_mod_two_hundred_fifty_six_two_hundred_thirteen

end CollatzSyracuseAudit
