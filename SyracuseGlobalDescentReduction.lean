import Mathlib

namespace CollatzSyracuseAudit

/-- Finite reachability, closed under concatenation and one-step iteration. -/
inductive OrbitReaches (T : ℕ → ℕ) : ℕ → ℕ → Prop
  | refl (n : ℕ) : OrbitReaches T n n
  | step {n m : ℕ} : OrbitReaches T n m → OrbitReaches T n (T m)
  | trans {n m r : ℕ} :
      OrbitReaches T n m → OrbitReaches T m r → OrbitReaches T n r

/--
Well-founded reduction principle. If every n > 1 has a finite orbit segment
to a positive m < n, then every positive n reaches 1. The premise is the
substantive number-theoretic obligation; this theorem alone is not Collatz.
-/
theorem every_positive_reaches_one_of_orbit_descent
    (T : ℕ → ℕ)
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
