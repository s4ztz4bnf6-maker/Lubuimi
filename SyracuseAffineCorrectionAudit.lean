import SyracuseAffineCorrectionSum

/-!
Explicit build root for the affine correction module. This imports the
actual declarations and asks Lean to report their transitive axioms.
The results remain conditional affine algebra, not a global Collatz proof.
-/

#check SyracuseAudit.affineCompositionRhs_closed_form
#check SyracuseAudit.nat_descent_iff_correction_bound
#check SyracuseAudit.finite_prefix_descent_iff_correction_bound
#print axioms SyracuseAudit.affineCompositionRhs_closed_form
#print axioms SyracuseAudit.nat_descent_iff_correction_bound
#print axioms SyracuseAudit.finite_prefix_descent_iff_correction_bound
