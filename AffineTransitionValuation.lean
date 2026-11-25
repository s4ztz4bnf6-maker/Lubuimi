import SyracuseReferenceTest

namespace CollatzSyracuseAudit

/-- Multiplication by 32 adds exactly five factors of two. -/
theorem v2_mul_32 (a : ℕ) (ha : a ≠ 0) :
    v2 (32 * a) = 5 + v2 a := by
  unfold v2
  rw [Nat.factorization_mul (by norm_num : 32 ≠ 0) ha]
  simp only [Finsupp.add_apply]
  rw [show (32 : ℕ) = 2 ^ 5 by norm_num,
    Nat.factorization_pow_self (by norm_num : Nat.Prime 2)]

#print axioms CollatzSyracuseAudit.v2_mul_32

end CollatzSyracuseAudit
