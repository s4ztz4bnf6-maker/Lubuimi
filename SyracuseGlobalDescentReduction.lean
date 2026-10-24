import Mathlib

namespace CollatzSyracuseAudit

/--
Reachability by finitely many applications of a map. This relation separates
the global well-founded induction argument from the arithmetic work needed
to construct a descending orbit segment.
-/
inductive OrbitReaches (T : ℕ → ℕ) : ℕ → ℕ → Prop
  | refl (n : ℕ) : OrbitReaches T n n
  | step {n m : ℕ} : OrbitReaches T n m → OrbitReaches T n (T m)

theorem OrbitReaches.trans {T : ℕ → ℕ} {n m r : ℕ}
    (hnm : OrbitReaches T n m) (hmr : OrbitReaches T m r) :
    OrbitReaches T n r := by
  induction hmr with
  | refl =>
      exact hnm
  | @step m r hmr ih =>
      exact OrbitReaches.step (ih)

/--
Global descent reduction: if every integer n > 1 has a finite orbit segment
ending at a positive integer strictly below n, and 1 is fixed, then every
positive starting value reaches 1.

This theorem is a genuine well-founded-induction bridge. It does NOT prove
the arithmetic descent premise for Syracuse/Collatz; that is the remaining
number-theoretic obligation.
-/
theorem every_positive_reaches_one_of_orbit_descent
    (T : ℕ → ℕ)
    (hone : T 1 = 1)
    (hdescent : ∀ n : ℕ, 1 < n →
      ∃ m : ℕ, 0 < m ∧ m < n ∧ OrbitReaches T n m) :
    ∀ n : ℕ, 0 < n → OrbitReaches T n 1 := by
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
      intro hn
      by_cases hbase : n = 1
      · subst n
        exact OrbitReaches.refl 1
      · have hgt : 1 < n := by omega
        obtain ⟨m, hmpos, hmlt, hpath⟩ := hdescent n hgt
        have hmtarget : OrbitReaches T m 1 := ih m hmlt hmpos
        exact OrbitReaches.trans hpath hmtarget

#print axioms every_positive_reaches_one_of_orbit_descent

end CollatzSyracuseAudit
