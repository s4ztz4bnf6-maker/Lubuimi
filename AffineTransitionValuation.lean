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


/-- Generalization of `v2_mul_32`: multiplying a nonzero natural by
any power of two adds exactly that exponent to its 2-adic valuation. This
parameterized form is the reusable lemma for arbitrary-depth residue classes. -/
theorem v2_mul_pow_two (a k : ℕ) (ha : a ≠ 0) :
    v2 (2 ^ k * a) = k + v2 a := by
  unfold v2
  rw [Nat.factorization_mul (by positivity : 2 ^ k ≠ 0) ha]
  simp only [Finsupp.add_apply]
  rw [Nat.factorization_pow_self (by norm_num : Nat.Prime 2)]

#print axioms CollatzSyracuseAudit.v2_mul_pow_two
