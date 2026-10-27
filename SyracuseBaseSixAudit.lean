import Mathlib

/-!
# Base-six audit for the Syracuse odd step

Base six makes the residue of 3*n+1 modulo 6 transparent for odd n, but
this is only a one-bit divisibility fact. It does not eliminate carries in
base-six division by two, nor does it fix the 2-adic valuation beyond its
first factor of two.
-/

namespace SyracuseBaseSixAudit

/-- Every odd n has 3*n+1 congruent to 4 modulo 6. -/
theorem odd_step_mod_six (n : ℕ) (hodd : n % 2 = 1) :
    (3 * n + 1) % 6 = 4 := by
  omega

/-- The final base-six digit guarantees evenness, but not divisibility by 4. -/
theorem odd_step_mod_four_counterpattern (n : ℕ)
    (hmod : n % 4 = 3) :
    (3 * n + 1) % 4 = 2 := by
  omega

/-- In the other odd residue class, the odd step is divisible by 4.
Thus the 2-adic valuation varies with more than the parity bit. -/
theorem odd_step_mod_four_alternate (n : ℕ)
    (hmod : n % 4 = 1) :
    (3 * n + 1) % 4 = 0 := by
  omega

example : (3 * 3 + 1) % 4 = 2 := by norm_num
example : (3 * 1 + 1) % 4 = 0 := by norm_num

#print axioms SyracuseBaseSixAudit.odd_step_mod_six
#print axioms SyracuseBaseSixAudit.odd_step_mod_four_counterpattern
#print axioms SyracuseBaseSixAudit.odd_step_mod_four_alternate

end SyracuseBaseSixAudit
