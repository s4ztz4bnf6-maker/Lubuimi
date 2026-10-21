import Mathlib

/-!
# Affine transition certificates for Syracuse-style dynamics

This is an isolated design module. It formalizes composition of affine upper
bounds for blocks of a deterministic map. It does not assert that a finite
residue graph covers every Syracuse trajectory; that global coverage is a
separate obligation.
-/

namespace CollatzSyracuseAudit

/-- A block certificate for a deterministic map S, on residue classes
modulo M, over a domain predicate Valid.

run_eq_iterate ties the block's execution function to exactly steps
iterations of S. value_bound records an affine upper bound with rational
slope and offset. -/
structure BlockTransition (S : ℕ → ℕ) (M : ℕ)
    (Valid : ℕ → Prop) where
  source : Fin M
  target : Fin M
  steps : ℕ
  steps_pos : 0 < steps
  run : ℕ → ℕ
  run_eq_iterate : ∀ n, run n = (S^[steps]) n
  slope : ℚ
  offset : ℚ
  slope_nonneg : 0 ≤ slope
  slope_lt_one : slope < 1
  offset_nonneg : 0 ≤ offset
  valid_after :
    ∀ n, Valid n → n % M = source.val → Valid (run n)
  target_correct :
    ∀ n, Valid n → n % M = source.val → run n % M = target.val
  value_bound :
    ∀ n, Valid n → n % M = source.val →
      (run n : ℚ) ≤ slope * (n : ℚ) + offset

/-- Consecutive block certificates compose. The second block's source must
match the first block's target. The resulting slope and offset are the exact
composition of the two affine upper bounds. -/
theorem transition_compose
    {S : ℕ → ℕ} {M : ℕ} {Valid : ℕ → Prop}
    (A B : BlockTransition S M Valid)
    (hmatch : A.target = B.source) :
    BlockTransition S M Valid := by
  refine
    { source := A.source
      target := B.target
      steps := A.steps + B.steps
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
      valid_after := ?_
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
  · intro n hn hsource
    exact B.valid_after (A.run n)
      (A.valid_after n hn hsource)
      (by rw [A.target_correct n hn hsource, hmatch])
  · intro n hn hsource
    exact B.target_correct (A.run n)
      (A.valid_after n hn hsource)
      (by rw [A.target_correct n hn hsource, hmatch])
  · intro n hn hsource
    have hA := A.value_bound n hn hsource
    have hB := B.value_bound (A.run n)
      (A.valid_after n hn hsource)
      (by rw [A.target_correct n hn hsource, hmatch])
    have hscale :=
      mul_le_mul_of_nonneg_left hA B.slope_nonneg
    calc
      (B.run (A.run n) : ℚ) ≤
          B.slope * (A.run n : ℚ) + B.offset := hB
      _ ≤ B.slope * (A.slope * (n : ℚ) + A.offset) +
          B.offset := add_le_add_right hscale B.offset
      _ = (B.slope * A.slope) * (n : ℚ) +
          (B.slope * A.offset + B.offset) := by ring

/-- A strict affine decrease follows when the starting value exceeds the
offset threshold offset / (1 - slope). This is an algebraic lemma; applying
it to a block also requires that block's value_bound. -/
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

#print axioms CollatzSyracuseAudit.transition_compose
#print axioms CollatzSyracuseAudit.strict_descent_of_affine

end CollatzSyracuseAudit
