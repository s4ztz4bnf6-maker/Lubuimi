import SyracuseSecondStep

/-!
# Affine transition certificates for Syracuse-style dynamics

This isolated module formalizes composition of affine upper bounds for blocks
of a deterministic map. Source and target conditions are predicates rather
than fixed residue labels: a block may start in one residue class and end in
a different class, or in a union of classes. Global coverage of all
trajectories remains a separate theorem.
-/

namespace CollatzSyracuseAudit

/-- A block certificate for a deterministic map S, on a specified source
condition and target condition. The execution function is exactly steps
iterations of S; value_bound is an affine upper bound. -/
structure BlockTransition (S : ℕ → ℕ)
    (Source Target : ℕ → Prop) where
  steps : ℕ
  steps_pos : 0 < steps
  run : ℕ → ℕ
  run_eq_iterate : ∀ n, run n = (S^[steps]) n
  slope : ℚ
  offset : ℚ
  slope_nonneg : 0 ≤ slope
  slope_lt_one : slope < 1
  offset_nonneg : 0 ≤ offset
  target_correct : ∀ n, Source n → Target (run n)
  value_bound : ∀ n, Source n →
    (run n : ℚ) ≤ slope * (n : ℚ) + offset

/-- Consecutive affine block certificates compose when the first block's
target condition implies the second block's source condition. -/
def transition_compose
    {S : ℕ → ℕ} {Source Mid Target : ℕ → Prop}
    (A : BlockTransition S Source Mid)
    (B : BlockTransition S Mid Target) :
    BlockTransition S Source Target := by
  refine
    { steps := A.steps + B.steps
      steps_pos := by
        have hA := A.steps_pos
        have hB := B.steps_pos
        omega
      run := fun n => B.run (A.run n)
      run_eq_iterate := ?_
      slope := B.slope * A.slope
      offset := B.slope * A.offset + B.offset
      slope_nonneg := mul_nonneg B.slope_nonneg A.slope_nonneg
      slope_lt_one := ?_
      offset_nonneg := add_nonneg
        (mul_nonneg B.slope_nonneg A.offset_nonneg)
        B.offset_nonneg
      target_correct := ?_
      value_bound := ?_ }
  · intro n
    calc
      B.run (A.run n) = (S^[B.steps]) (A.run n) := B.run_eq_iterate _
      _ = (S^[B.steps]) ((S^[A.steps]) n) := by rw [A.run_eq_iterate]
      _ = (S^[A.steps + B.steps]) n := by
        calc
          (S^[B.steps]) ((S^[A.steps]) n) = (S^[B.steps + A.steps]) n :=
            (Function.iterate_add_apply S B.steps A.steps n).symm
          _ = (S^[A.steps + B.steps]) n := by congr 1 <;> omega
  · have hprod : B.slope * A.slope ≤ B.slope := by
      nlinarith [
        mul_nonneg B.slope_nonneg
          (sub_nonneg.mpr (le_of_lt A.slope_lt_one))]
    exact lt_of_le_of_lt hprod B.slope_lt_one
  · intro n hn
    exact B.target_correct (A.run n) (A.target_correct n hn)
  · intro n hn
    have hA := A.value_bound n hn
    have hB := B.value_bound (A.run n) (A.target_correct n hn)
    have hscale :=
      mul_le_mul_of_nonneg_left hA B.slope_nonneg
    calc
      (B.run (A.run n) : ℚ) ≤
          B.slope * (A.run n : ℚ) + B.offset := hB
      _ ≤ B.slope * (A.slope * (n : ℚ) + A.offset) +
          B.offset := add_le_add_left hscale B.offset
      _ = (B.slope * A.slope) * (n : ℚ) +
          (B.slope * A.offset + B.offset) := by ring

/-- If slope < 1, offset >= 0, and n exceeds the affine threshold, then
the affine upper bound is strictly below n. -/
theorem strict_descent_of_affine
    (slope offset n : ℚ)
    (hslope_nonneg : 0 ≤ slope)
    (hslope_lt_one : slope < 1)
    (hoffset_nonneg : 0 ≤ offset)
    (hthreshold : offset / (1 - slope) < n) :
    slope * n + offset < n := by
  have hden : 0 < 1 - slope := by linarith
  have hmul : offset < n * (1 - slope) :=
    (div_lt_iff₀ hden).mp hthreshold
  nlinarith

/-- Two accelerated Syracuse steps from n = 32*k+3 have the affine upper
bound (9/32)*n + 5/32. This is a concrete local certificate bound, not a
global Collatz result. -/
theorem two_step_affine_bound_mod32_three (k : ℕ) :
    (syracuse (syracuse (32 * k + 3)) : ℚ) ≤
      (9 / 32 : ℚ) * (32 * k + 3) + 5 / 32 := by
  have hfirst :
      syracuse (32 * k + 3) = 48 * k + 5 := by
    calc
      syracuse (32 * k + 3) = syracuse (4 * (8 * k) + 3) := by
        congr 1 <;> omega
      _ = 6 * (8 * k) + 5 :=
        first_step_formula_mod_four_three (8 * k)
      _ = 48 * k + 5 := by omega
  have hnum : 3 * (48 * k + 5) + 1 = 16 * (9 * k + 1) := by omega
  have h16 : 16 ∣ 3 * (48 * k + 5) + 1 := by
    rw [hnum]
    exact ⟨9 * k + 1, rfl⟩
  have hN : 3 * (48 * k + 5) + 1 ≠ 0 := by omega
  have hval : 4 ≤ v2 (3 * (48 * k + 5) + 1) := by
    have hpow : 2 ^ 4 ∣ 3 * (48 * k + 5) + 1 := by
      simpa using h16
    exact (Nat.prime_two.pow_dvd_iff_le_factorization hN).mp hpow
  have hden : 16 ≤ 2 ^ v2 (3 * (48 * k + 5) + 1) :=
    pow_two_ge_sixteen _ hval
  have hdiv :
      (3 * (48 * k + 5) + 1) /
          2 ^ v2 (3 * (48 * k + 5) + 1) ≤
        (3 * (48 * k + 5) + 1) / 16 :=
    div_pow_le_div_sixteen _ _ hden
  have hquot : (3 * (48 * k + 5) + 1) / 16 = 9 * k + 1 := by
    rw [hnum]
    norm_num
  rw [hfirst]
  dsimp [syracuse]
  have hout :
      (3 * (48 * k + 5) + 1) /
          2 ^ v2 (3 * (48 * k + 5) + 1) ≤ 9 * k + 1 := by
    omega
  calc
    (((3 * (48 * k + 5) + 1) /
        2 ^ v2 (3 * (48 * k + 5) + 1) : ℕ) : ℚ) ≤
        (9 * k + 1 : ℕ) := by exact_mod_cast hout
    _ = (9 / 32 : ℚ) * (32 * k + 3) + 5 / 32 := by
      push_cast
      ring

/- Concrete transition for the residue class n ≡ 3 (mod 32).
The exact output residue modulo 32 can vary with k, but every accelerated
Syracuse output is odd, so oddness is the target invariant. -/
def mod32ThreeTwoStep : BlockTransition
    syracuse
    (fun n => n % 32 = 3)
    (fun n => n % 2 = 1) where
  steps := 2
  steps_pos := by norm_num
  run := fun n => syracuse (syracuse n)
  run_eq_iterate := by
    intro n
    simp [Function.iterate_succ, Function.iterate_zero, Function.comp]
  slope := 9 / 32
  offset := 5 / 32
  slope_nonneg := by norm_num
  slope_lt_one := by norm_num
  offset_nonneg := by norm_num
  target_correct := by
    intro n hn
    exact syracuse_output_odd (syracuse n)
  value_bound := by
    intro n hn
    obtain ⟨k, rfl⟩ : ∃ k : ℕ, n = 32 * k + 3 := by
      refine ⟨n / 32, ?_⟩
      omega
    convert two_step_affine_bound_mod32_three k using 1 <;>
      push_cast <;> ring


/-- In the residue class n = 64*m+3, the parameter k in n=32*k+3
is 2*m, so the second-step numerator 9*k+1 is odd. -/
theorem mod64_three_second_numerator_odd (m : ℕ) :
    (9 * (2 * m) + 1) % 2 = 1 := by
  omega

/-- In the residue class n = 64*m+35, the parameter k in n=32*k+3
is 2*m+1, and the second-step numerator factors as 2*(9*m+5). -/
theorem mod64_thirtyfive_second_numerator_factor (m : ℕ) :
    9 * (2 * m + 1) + 1 = 2 * (9 * m + 5) := by
  omega

/-- Consequently the second-step numerator in the n = 64*m+35
case is even; further valuation analysis is delegated to 9*m+5. -/
theorem mod64_thirtyfive_second_numerator_even (m : ℕ) :
    (9 * (2 * m + 1) + 1) % 2 = 0 := by
  rw [mod64_thirtyfive_second_numerator_factor]
  omega

#print axioms CollatzSyracuseAudit.transition_compose
#print axioms CollatzSyracuseAudit.strict_descent_of_affine
#print axioms CollatzSyracuseAudit.two_step_affine_bound_mod32_three
#print axioms CollatzSyracuseAudit.mod32ThreeTwoStep
#print axioms CollatzSyracuseAudit.mod64_three_second_numerator_odd
#print axioms CollatzSyracuseAudit.mod64_thirtyfive_second_numerator_factor
#print axioms CollatzSyracuseAudit.mod64_thirtyfive_second_numerator_even


/-- Two accelerated steps strictly decrease every input in the residue
class 3 modulo 32. This is a local descent theorem, not a global result. -/
theorem two_step_descent_mod32_three (k : ℕ) :
    syracuse (syracuse (32 * k + 3)) < 32 * k + 3 := by
  have hbound := two_step_affine_bound_mod32_three k
  have hq :
      (syracuse (syracuse (32 * k + 3)) : ℚ) ≤ (9 * k + 1 : ℚ) := by
    calc
      (syracuse (syracuse (32 * k + 3)) : ℚ) ≤
          (9 / 32 : ℚ) * (32 * k + 3) + 5 / 32 := hbound
      _ = (9 * k + 1 : ℚ) := by push_cast; ring
  have hn : syracuse (syracuse (32 * k + 3)) ≤ 9 * k + 1 := by
    exact_mod_cast hq
  omega

#print axioms CollatzSyracuseAudit.two_step_descent_mod32_three


/-- Two accelerated steps strictly decrease every input in the residue
class 19 modulo 32. The first step gives 48*k+29; the second has numerator
8*(18*k+11), whose odd factor fixes the valuation at exactly three. -/
theorem two_step_descent_mod32_nineteen (k : ℕ) :
    syracuse (syracuse (32 * k + 19)) < 32 * k + 19 := by
  have hfirst : syracuse (32 * k + 19) = 48 * k + 29 := by
    calc
      syracuse (32 * k + 19) =
          syracuse (4 * (8 * k + 4) + 3) := by congr 1 <;> omega
      _ = 6 * (8 * k + 4) + 5 :=
        first_step_formula_mod_four_three (8 * k + 4)
      _ = 48 * k + 29 := by omega
  have hsecond : syracuse (48 * k + 29) = 18 * k + 11 := by
    have heq : 48 * k + 29 = 6 * (8 * k + 4) + 5 := by omega
    rw [heq]
    exact second_step_formula_of_m_mod_eight_four k
  rw [hfirst, hsecond]
  omega

#print axioms CollatzSyracuseAudit.two_step_descent_mod32_nineteen


/-!
## Exact affine numerator identity for a valuation sequence

For a trajectory satisfying
  2^(a i) * n_(i+1) = 3*n_i + 1,
the cumulative exponent A_k and affine constant C_k obey
  2^A_k * n_k = 3^k*n_0 + C_k.
This is an exact identity, independent of any density heuristic. It is the
arithmetic bridge needed before comparing an iterate with its start value.
-/

/-- Sum of the first k two-adic exponents. -/
def cumulativeExponent (a : ℕ → ℕ) : ℕ → ℕ
  | 0 => 0
  | k + 1 => cumulativeExponent a k + a k

/-- Constant term in the exact affine numerator after k accelerated steps. -/
def affineConstantTerm (a : ℕ → ℕ) : ℕ → ℕ
  | 0 => 0
  | k + 1 => 3 * affineConstantTerm a k + 2 ^ cumulativeExponent a k

/-- One-step recurrence for the accumulated constant term. -/
theorem affineConstantTerm_succ (a : ℕ → ℕ) (k : ℕ) :
    affineConstantTerm a (k + 1) =
      3 * affineConstantTerm a k + 2 ^ cumulativeExponent a k := rfl

/-- Exact affine numerator identity for every finite trajectory whose
valuation exponents are a. The hypothesis states the division step without
using truncated natural division, so no divisibility information is lost. -/
theorem affine_iteration_identity
    (a n : ℕ → ℕ)
    (hstep : ∀ i, 2 ^ (a i) * n (i + 1) = 3 * n i + 1) :
    ∀ k, 2 ^ cumulativeExponent a k * n k =
      3 ^ k * n 0 + affineConstantTerm a k := by
  intro k
  induction k with
  | zero =>
      simp [cumulativeExponent, affineConstantTerm]
  | succ k ih =>
      rw [cumulativeExponent, affineConstantTerm, pow_succ]
      calc
        2 ^ (cumulativeExponent a k + a k) * n (k + 1) =
            2 ^ cumulativeExponent a k * (2 ^ a k * n (k + 1)) := by
              rw [pow_add]
              ring
        _ = 2 ^ cumulativeExponent a k * (3 * n k + 1) := by rw [hstep k]
        _ = 3 * (2 ^ cumulativeExponent a k * n k) +
              2 ^ cumulativeExponent a k := by ring
        _ = 3 * (3 ^ k * n 0 + affineConstantTerm a k) +
              2 ^ cumulativeExponent a k := by rw [ih]
        _ = 3 ^ (k + 1) * n 0 +
              (3 * affineConstantTerm a k + 2 ^ cumulativeExponent a k) := by
                rw [pow_succ]
                ring

#print axioms CollatzSyracuseAudit.affine_iteration_identity

end CollatzSyracuseAudit
