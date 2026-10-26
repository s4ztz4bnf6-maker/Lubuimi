import Mathlib

/-!
# Stopping-time bridge: descent implies eventual arrival at one

This file isolates the induction step needed by a Collatz/Syracuse proof.
It proves an abstract implication only. It does not prove the global descent
hypothesis for the Syracuse map.
-/

namespace StoppingTimeBridge

/-- The orbit of n under T reaches 1 after finitely many iterates. -/
def ReachesOne (T : ℕ → ℕ) (n : ℕ) : Prop :=
  ∃ k : ℕ, (T^[k]) n = 1

/--
If every positive n ≠ 1 has a positive, strictly smaller iterate, then
every positive input eventually reaches 1.

The descent witness may use any finite number of steps. This is the strong
induction bridge; the hard Collatz obligation is to prove its hypothesis for
the actual accelerated Syracuse map.
-/
theorem reaches_one_of_strict_iterate_descent
    (T : ℕ → ℕ)
    (hdesc : ∀ n : ℕ, 0 < n → n ≠ 1 →
      ∃ k m : ℕ, (T^[k]) n = m ∧ 0 < m ∧ m < n) :
    ∀ n : ℕ, 0 < n → ReachesOne T n := by
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
      intro hn
      by_cases h1 : n = 1
      · subst n
        exact ⟨0, by simp [ReachesOne]⟩
      · obtain ⟨k, m, hkm, hmpos, hmn⟩ := hdesc n hn h1
        obtain ⟨j, hj⟩ := ih m hmn hmpos
        refine ⟨j + k, ?_⟩
        have hcomp : (T^[j]) ((T^[k]) n) = 1 := by
          calc
            (T^[j]) ((T^[k]) n) = (T^[j]) m := by rw [hkm]
            _ = 1 := hj
        simpa only [Function.iterate_add_apply] using hcomp

#print axioms reaches_one_of_strict_iterate_descent

end StoppingTimeBridge
