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

end CollatzSyracuseAudit
