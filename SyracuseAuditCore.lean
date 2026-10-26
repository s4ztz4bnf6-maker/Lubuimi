import Mathlib

namespace SyracuseAudit

/-- Exact reconstruction after dividing by a known power of two. -/
theorem numerator_reconstruction (n q : ℕ) (h : 2 ^ q ∣ 3 * n + 1) :
    2 ^ q * ((3 * n + 1) / 2 ^ q) = 3 * n + 1 := by
  exact Nat.mul_div_cancel' h

/--
If 2^q divides x but 2^(q+1) does not, the quotient x / 2^q
cannot itself be divisible by 2. This is the exactness step needed
to turn a divisibility cylinder into an exact 2-adic valuation cylinder.
-/
theorem quotient_not_divisible_by_two_of_exact_power
    (x q : ℕ) (hdiv : 2 ^ q ∣ x) (hnext : ¬ 2 ^ (q + 1) ∣ x) :
    ¬ 2 ∣ x / 2 ^ q := by
  intro hquot
  rcases hquot with ⟨k, hk⟩
  have hrec : 2 ^ q * (x / 2 ^ q) = x :=
    Nat.mul_div_cancel' hdiv
  apply hnext
  refine ⟨k, ?_⟩
  rw [pow_succ]
  calc
    x = 2 ^ q * (x / 2 ^ q) := hrec.symm
    _ = 2 ^ q * (2 * k) := by rw [hk]
    _ = 2 ^ q * 2 * k := by ring

/--
Exactness is already forced when a prescribed transition has an odd
quotient: if 2^a*m = 3*n+1 and m is odd, then 2^(a+1) cannot divide
3*n+1. Thus a transition certificate need not carry this non-divisibility
as an independent field; it can be derived from the equality and oddness.
-/
theorem no_next_power_divides_of_odd_quotient
    (n m a : ℕ) (hm : Odd m)
    (hstep : 2 ^ a * m = 3 * n + 1) :
    ¬ 2 ^ (a + 1) ∣ 3 * n + 1 := by
  rintro ⟨k, hk⟩
  rcases hm with ⟨j, hj⟩
  have hmul : 2 ^ a * m = 2 ^ a * (2 * k) := by
    calc
      2 ^ a * m = 3 * n + 1 := hstep
      _ = 2 ^ (a + 1) * k := hk
      _ = 2 ^ a * (2 * k) := by rw [pow_succ]; ring
  have hmeq : m = 2 * k := Nat.mul_left_cancel hmul
  rw [hj] at hmeq
  omega

end SyracuseAudit
