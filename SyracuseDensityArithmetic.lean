import Mathlib

/-!
# Exact arithmetic supporting the Syracuse density argument

These lemmas are deliberately elementary, kernel-checkable components of the
finite-horizon Chernoff calculation. They do not claim a density theorem or
universal Collatz convergence. The counting and limit-transfer lemmas remain
separate obligations.
-/

namespace SyracuseDensityArithmetic

/-- The rational Chernoff base used for the lower tail A_N < 9N/5 is strictly
less than one. Raising the proposed base to the fifth power removes the
fractional exponent and reduces the check to exact rational arithmetic. -/
theorem chernoff_base_lt_one :
    ((9 : ℚ) / 10) ^ 5 * ((9 : ℚ) / 8) ^ 4 < 1 := by
  norm_num

/-- Equivalent denominator-cleared form of the strict Chernoff constant
inequality. Keeping this form available makes the proof independent of
floating-point approximations. -/
theorem chernoff_base_fifth_power_lt_one :
    (9 : ℚ) ^ 5 * 9 ^ 4 < 10 ^ 5 * 8 ^ 4 := by
  norm_num

/-- A finite valuation word with all entries positive and total below a
threshold has each entry below that threshold. This is the elementary
boundedness fact needed to turn the bad-word family into a finite union. -/
theorem coordinate_lt_sum
    {N : ℕ} (a : Fin N → ℕ)
    (ha : ∀ i, 1 ≤ a i) (i : Fin N) :
    a i < ∑ j, a j := by
  classical
  have hsum := Finset.single_le_sum
    (s := Finset.univ) (f := fun j : Fin N => a j)
    (fun j hj => Nat.zero_le (a j)) (Finset.mem_univ i)
  have hother : 0 < ∑ j ∈ (Finset.univ.erase i), a j := by
    have hne : (Finset.univ.erase i).Nonempty := by
      by_contra hempty
      have hcard : (Finset.univ.erase i).card = 0 :=
        Finset.card_eq_zero.mpr (Finset.not_nonempty_iff_eq_empty.mp hempty)
      have hN : Fintype.card (Fin N) = 1 := by
        have := congrArg Finset.card (Finset.erase_eq_empty.mp (by
          simpa [Finset.card_eq_zero] using hcard))
        simp at this
      simp at hN
    exact Finset.sum_pos' (fun j hj => Nat.zero_le (a j))
      (by
        obtain ⟨j, hj⟩ := hne
        exact ⟨j, hj, Nat.lt_of_lt_of_le (ha j) (Nat.le_refl _)⟩)
  have hdecomp : (∑ j : Fin N, a j) =
      a i + ∑ j ∈ (Finset.univ.erase i), a j := by
    rw [← Finset.add_sum_erase _ _ (Finset.mem_univ i)]
  omega

end SyracuseDensityArithmetic
