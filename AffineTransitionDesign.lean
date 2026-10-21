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
      steps_pos := by omega
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
        simp [Function.iterate_add_apply, Nat.add_comm]
  · have hprod : B.slope * A.slope ≤ B.slope := by
      nlinarith [
        mul_nonneg B.slope_nonneg
          (show 0 ≤ 1 - A.slope by linarith)]
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
          B.offset := add_le_add_right hscale B.offset
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
    simpa [Nat.mul_assoc] using
      first_step_formula_mod_four_three (8 * k)
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
  norm_num at *
  push_cast at *
  nlinarith

/-- Concrete transition for the residue class n ≡ 3 (mod 32). The target
condition is intentionally True: the output residue need not be constant
modulo 32 because the valuation of 9*k+1 can vary with k. -/
def mod32ThreeTwoStep : BlockTransition
    syracuse
    (fun n => n % 32 = 3)
    (fun _ => True) where
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
    trivial
  value_bound := by
    intro n hn
    obtain ⟨k, rfl⟩ : ∃ k : ℕ, n = 32 * k + 3 := by
      refine ⟨n / 32, ?_⟩
      omega
    simpa [Nat.mul_add, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
      two_step_affine_bound_mod32_three k

#print axioms CollatzSyracuseAudit.transition_compose
#print axioms CollatzSyracuseAudit.strict_descent_of_affine
#print axioms CollatzSyracuseAudit.two_step_affine_bound_mod32_three
#print axioms CollatzSyracuseAudit.mod32ThreeTwoStep

end CollatzSyracuseAudit
