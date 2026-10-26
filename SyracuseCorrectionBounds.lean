import SyracuseBlockDescent

namespace CollatzSyracuseAudit

/-- The correction term of a nonempty exponent block is at least its leading power of three. -/
theorem blockCorrection_lower_bound (as : List ℕ) (hne : as ≠ []) :
    3 ^ (as.length - 1) ≤ blockCorrection as := by
  cases as with
  | nil => contradiction
  | cons a as =>
      simp [blockCorrection]
      exact Nat.le_add_right _ _

#print axioms blockCorrection_lower_bound

end CollatzSyracuseAudit
