import Mathlib

/-!
# Exact arithmetic supporting the Syracuse density argument

These are elementary, kernel-checkable components of the finite-horizon
Chernoff calculation. They do not claim a density theorem or universal
Collatz convergence. Counting cylinders, disjoint decomposition, and the
upper-density limit transfer remain separate obligations.
-/

namespace SyracuseDensityArithmetic

/-- The rational Chernoff base used for the lower tail A_N < 9N/5 is strictly
less than one. Raising the proposed base to the fifth power removes the
fractional exponent and reduces the check to exact rational arithmetic. -/
theorem chernoff_base_lt_one :
    ((9 : ℚ) / 10) ^ 5 * ((9 : ℚ) / 8) ^ 4 < 1 := by
  norm_num

/-- Equivalent denominator-cleared form of the strict Chernoff constant
inequality. This avoids any floating-point approximation. -/
theorem chernoff_base_fifth_power_lt_one :
    (9 : ℚ) ^ 5 * 9 ^ 4 < 10 ^ 5 * 8 ^ 4 := by
  norm_num

/-- If a positive finite valuation word has total below a threshold, each
coordinate is below that threshold. This boundedness fact is needed to turn
the bad-word family into a finite union. -/
theorem coordinate_lt_threshold
    {N : ℕ} (a : Fin N → ℕ) (B : ℕ)
    (hbound : (∑ i : Fin N, a i) < B) (i : Fin N) :
    a i < B := by
  classical
  have hle : a i ≤ ∑ j : Fin N, a j := by
    exact Finset.single_le_sum
      (s := Finset.univ) (f := fun j : Fin N => a j)
      (fun j hj => Nat.zero_le (a j)) (Finset.mem_univ i)
  omega


/-- Exact integer form of a bad-prefix restriction: if the surplus
5*A - 9*N is negative, then A is at most floor((9*N-1)/5).
This is the deterministic constraint to combine with the affine orbit
identity; it is not by itself a contradiction. -/
theorem bad_surplus_forces_valuation_sum_bound
    (A N : ℕ) (hbad : 5 * A < 9 * N) :
    A ≤ (9 * N - 1) / 5 := by
  omega

/-- Contrapositive bookkeeping for the universal threshold target: failure
of crossing at every positive time gives the strict bad-prefix inequality
at every positive horizon. -/
theorem no_threshold_crossing_gives_bad_prefix
    (A : ℕ → ℕ)
    (hnever : ∀ N, 1 ≤ N → ¬ 5 * A N ≥ 9 * N) :
    ∀ N, 1 ≤ N → A N ≤ (9 * N - 1) / 5 := by
  intro N hN
  have hnot := hnever N hN
  have hlt : 5 * A N < 9 * N := by omega
  exact bad_surplus_forces_valuation_sum_bound (A N) N hlt

#print axioms bad_surplus_forces_valuation_sum_bound
#print axioms no_threshold_crossing_gives_bad_prefix

end SyracuseDensityArithmetic
