import Mathlib

/-!
# Residue-octet correction potential for accelerated Syracuse

For odd inputs, the residue classes modulo 8 split the one-step correction
into two negative classes (3 and 7), one zero class (1), and one positive
class (5). This file proves a local lower-bound balance over the four odd
residue classes. It does NOT assume that an actual Syracuse orbit samples
these classes uniformly; that missing orbit-frequency theorem is precisely
the global obstruction.
-/

namespace SyracuseResiduePotential

/-- Signed correction coefficient associated to removing a powers of two. -/
def correctionCoefficient (a : ℕ) : ℤ := (2 : ℤ) ^ a - 4

/--
The four odd residue classes modulo 8 have nonnegative total lower bound
for their correction coefficients: classes 3 and 7 contribute -2 each,
class 1 contributes 0, while class 5 contributes at least +4.
This is a finite local balance identity, not a claim about frequencies along
a Syracuse trajectory.
-/
theorem odd_residue_octet_lower_bound
    (a1 a3 a5 a7 : ℕ)
    (h1 : a1 = 2)
    (h3 : a3 = 1)
    (h5 : 3 ≤ a5)
    (h7 : a7 = 1) :
    0 ≤ correctionCoefficient a1 + correctionCoefficient a3 +
      correctionCoefficient a5 + correctionCoefficient a7 := by
  have hpowNat : 2 ^ 3 ≤ 2 ^ a5 :=
    Nat.pow_le_pow_right (by norm_num : 1 ≤ (2 : ℕ)) h5
  have hpow : (8 : ℤ) ≤ (2 : ℤ) ^ a5 := by
    exact_mod_cast hpowNat
  unfold correctionCoefficient
  rw [h1, h3, h7]
  norm_num
  omega

/--
For any odd n, its residue modulo 8 lies in one of the four odd classes.
This finite partition underlies the potential above, but says nothing about
long-run frequencies along a Syracuse orbit.
-/
theorem odd_residue_classes_partition (n : ℕ) (hodd : n % 2 = 1) :
    n % 8 = 1 ∨ n % 8 = 3 ∨ n % 8 = 5 ∨ n % 8 = 7 := by
  omega

#print axioms odd_residue_octet_lower_bound
#print axioms odd_residue_classes_partition

end SyracuseResiduePotential
