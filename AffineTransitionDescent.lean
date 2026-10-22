import AffineTransitionExactMod64

namespace CollatzSyracuseAudit

/-- The residue class 3 modulo 64 has a strict two-step descent.
This is a concrete local certificate, not a theorem covering every odd input. -/
theorem mod64_three_two_step_descent (m : ℕ) :
    syracuse (syracuse (64 * m + 3)) < 64 * m + 3 := by
  rw [mod64_three_two_step_exact]
  omega

#print axioms mod64_three_two_step_descent

end CollatzSyracuseAudit
