import Mathlib

namespace SyracuseAudit

/--
Composing two prescribed Syracuse odd steps eliminates the intermediate
state. This is an algebraic identity conditional on both step equations;
it does not assert that a given valuation word is realizable.
-/
theorem two_step_affine_identity
    (x y z a b : ℕ)
    (h₁ : 2 ^ a * y = 3 * x + 1)
    (h₂ : 2 ^ b * z = 3 * y + 1) :
    2 ^ (a + b) * z = 9 * x + 3 + 2 ^ a := by
  rw [pow_add]
  calc
    (2 ^ a * 2 ^ b) * z = 2 ^ a * (2 ^ b * z) := by ring
    _ = 2 ^ a * (3 * y + 1) := by rw [h₂]
    _ = 3 * (2 ^ a * y) + 2 ^ a := by ring
    _ = 3 * (3 * x + 1) + 2 ^ a := by rw [h₁]
    _ = 9 * x + 3 + 2 ^ a := by ring

/--
Three prescribed odd Syracuse steps eliminate both intermediate states.
As with the two-step identity, this is conditional algebra, not a claim that
an arbitrary exponent word is realizable by an orbit.
-/
theorem three_step_affine_identity
    (x y z w a b c : ℕ)
    (h₁ : 2 ^ a * y = 3 * x + 1)
    (h₂ : 2 ^ b * z = 3 * y + 1)
    (h₃ : 2 ^ c * w = 3 * z + 1) :
    2 ^ (a + b + c) * w = 27 * x + 9 + 3 * 2 ^ a + 2 ^ (a + b) := by
  calc
    2 ^ (a + b + c) * w = (2 ^ a * 2 ^ b * 2 ^ c) * w := by
      simp only [pow_add]
    _ = (2 ^ a * 2 ^ b) * (2 ^ c * w) := by ring
    _ = (2 ^ a * 2 ^ b) * (3 * z + 1) := by rw [h₃]
    _ = 3 * ((2 ^ a * 2 ^ b) * z) + 2 ^ (a + b) := by
      rw [← pow_add]
      ring
    _ = 3 * (2 ^ a * (2 ^ b * z)) + 2 ^ (a + b) := by ring
    _ = 3 * (2 ^ a * (3 * y + 1)) + 2 ^ (a + b) := by rw [h₂]
    _ = 3 * (3 * (2 ^ a * y) + 2 ^ a) + 2 ^ (a + b) := by ring
    _ = 3 * (3 * (3 * x + 1) + 2 ^ a) + 2 ^ (a + b) := by rw [h₁]
    _ = 27 * x + 9 + 3 * 2 ^ a + 2 ^ (a + b) := by ring


/--
Four prescribed odd Syracuse steps eliminate all intermediate states.
This remains a conditional affine identity: it does not establish
realizability of an arbitrary valuation word or global Collatz convergence.
-/
theorem four_step_affine_identity
    (x y z w v a b c d : ℕ)
    (h₁ : 2 ^ a * y = 3 * x + 1)
    (h₂ : 2 ^ b * z = 3 * y + 1)
    (h₃ : 2 ^ c * w = 3 * z + 1)
    (h₄ : 2 ^ d * v = 3 * w + 1) :
    2 ^ (a + b + c + d) * v =
      81 * x + 27 + 9 * 2 ^ a + 3 * 2 ^ (a + b) + 2 ^ (a + b + c) := by
  calc
    2 ^ (a + b + c + d) * v =
        (2 ^ a * 2 ^ b * 2 ^ c * 2 ^ d) * v := by
      simp only [pow_add]
    _ = (2 ^ a * 2 ^ b * 2 ^ c) * (2 ^ d * v) := by ring
    _ = (2 ^ a * 2 ^ b * 2 ^ c) * (3 * w + 1) := by rw [h₄]
    _ = 3 * ((2 ^ a * 2 ^ b * 2 ^ c) * w) + 2 ^ (a + b + c) := by
      rw [← pow_add, ← pow_add]
      ring
    _ = 3 * ((2 ^ a * 2 ^ b) * (2 ^ c * w)) + 2 ^ (a + b + c) := by ring
    _ = 3 * ((2 ^ a * 2 ^ b) * (3 * z + 1)) + 2 ^ (a + b + c) := by rw [h₃]
    _ = 9 * ((2 ^ a * 2 ^ b) * z) + 3 * 2 ^ (a + b) +
        2 ^ (a + b + c) := by
      rw [← pow_add]
      ring
    _ = 9 * (2 ^ a * (2 ^ b * z)) + 3 * 2 ^ (a + b) +
        2 ^ (a + b + c) := by ring
    _ = 9 * (2 ^ a * (3 * y + 1)) + 3 * 2 ^ (a + b) +
        2 ^ (a + b + c) := by rw [h₂]
    _ = 27 * (2 ^ a * y) + 9 * 2 ^ a + 3 * 2 ^ (a + b) +
        2 ^ (a + b + c) := by ring
    _ = 27 * (3 * x + 1) + 9 * 2 ^ a + 3 * 2 ^ (a + b) +
        2 ^ (a + b + c) := by rw [h₁]
    _ = 81 * x + 27 + 9 * 2 ^ a + 3 * 2 ^ (a + b) +
        2 ^ (a + b + c) := by ring



/--
Prefix sums of a prescribed valuation word.  This definition is deliberately
independent of any claim that the word is realizable by a Syracuse orbit.
-/
def prefixExponentSum (a : Nat → Nat) : Nat → Nat
  | 0 => 0
  | k + 1 => prefixExponentSum a k + a k

/--
Recursive closed-form accumulator for composing the affine step equations.
Its successor rule is C_(k+1) = 3 C_k + 2^(A_k).
-/
def affineCompositionRhs (a n : Nat → Nat) : Nat → Nat
  | 0 => n 0
  | k + 1 => 3 * affineCompositionRhs a n k + 2 ^ prefixExponentSum a k

/--
General finite-prefix affine identity.  If each prescribed step satisfies
2^(a k) * n(k+1) = 3*n(k)+1, then the accumulated exponent gives the
corresponding affine composition.  This theorem is conditional algebra only:
it does not establish exact 2-adic valuations, realizability of arbitrary
words, or global Collatz convergence.
-/
theorem finite_prefix_affine_identity
    (a n : Nat → Nat)
    (hstep : ∀ k, 2 ^ a k * n (k + 1) = 3 * n k + 1) :
    ∀ N, 2 ^ prefixExponentSum a N * n N = affineCompositionRhs a n N := by
  intro N
  induction N with
  | zero =>
      simp [prefixExponentSum, affineCompositionRhs]
  | succ k ih =>
      change 2 ^ (prefixExponentSum a k + a k) * n (k + 1) =
        3 * affineCompositionRhs a n k + 2 ^ prefixExponentSum a k
      rw [pow_add]
      calc
        (2 ^ prefixExponentSum a k * 2 ^ a k) * n (k + 1) =
            2 ^ prefixExponentSum a k * (2 ^ a k * n (k + 1)) := by ring
        _ = 2 ^ prefixExponentSum a k * (3 * n k + 1) := by rw [hstep k]
        _ = 3 * (2 ^ prefixExponentSum a k * n k) +
            2 ^ prefixExponentSum a k := by ring
        _ = 3 * affineCompositionRhs a n k +
            2 ^ prefixExponentSum a k := by rw [ih]


/--
Exact closed-form identity for a run of valuation-one Syracuse steps.
If every step is the unaccelerated odd recurrence
  2 * n (i+1) = 3 * n i + 1,
then 2^k * (n k + 1) = 3^k * (n 0 + 1).
This is an algebraic invariant; parity is not needed for the identity itself.
When all states are odd, the extra factor of two in n k + 1 yields the
state-dependent divisibility obstruction recorded in the companion research
note. This lemma alone is not a global descent or convergence result.
-/
theorem constant_valuation_one_identity
    (n : Nat → Nat)
    (hstep : ∀ i, 2 * n (i + 1) = 3 * n i + 1) :
    ∀ k, 2 ^ k * n k + 2 ^ k = 3 ^ k * (n 0 + 1) := by
  intro k
  induction k with
  | zero =>
      simp
  | succ k ih =>
      calc
        2 ^ (k + 1) * n (k + 1) + 2 ^ (k + 1)
            = 2 ^ k * (2 * n (k + 1)) + 2 ^ k * 2 := by
                rw [pow_succ]
                ring
        _ = 2 ^ k * (3 * n k + 1) + 2 ^ k * 2 := by
                rw [hstep k]
        _ = 3 * (2 ^ k * n k + 2 ^ k) := by ring
        _ = 3 * (3 ^ k * (n 0 + 1)) := by rw [ih]
        _ = 3 ^ (k + 1) * (n 0 + 1) := by
                rw [pow_succ]
                ring


/--
Backward propagation of exact terminal parity through one affine Syracuse
accumulator step.  The terminal congruence at k+1 and positivity of a k
force the accumulator at k to have exact residue 2^(A_k) modulo 2^(A_k+1).
This is a local arithmetic statement only; it does not assert realizability
of arbitrary valuation words or global Collatz convergence.
-/
theorem terminalExact_backward_step
    (a n : Nat → Nat) (k : Nat)
    (ha : 1 ≤ a k)
    (hterminal :
      affineCompositionRhs a n (k + 1) %
          2 ^ (prefixExponentSum a (k + 1) + 1) =
        2 ^ prefixExponentSum a (k + 1)) :
    affineCompositionRhs a n k %
        2 ^ (prefixExponentSum a k + 1) =
      2 ^ prefixExponentSum a k := by
  let A := prefixExponentSum a k
  let B := prefixExponentSum a (k + 1)
  let C := affineCompositionRhs a n k
  have hAB : A + 1 ≤ B := by
    dsimp [A, B, prefixExponentSum]
    omega
  have hterm : (3 * C + 2 ^ A) % 2 ^ (B + 1) = 2 ^ B := by
    simpa [A, B, C, affineCompositionRhs, prefixExponentSum] using hterminal
  have hdecomp :
      2 ^ B + 2 ^ (B + 1) * ((3 * C + 2 ^ A) / 2 ^ (B + 1)) =
        3 * C + 2 ^ A := by
    simpa [hterm] using
      (Nat.mod_add_div (3 * C + 2 ^ A) (2 ^ (B + 1)))
  have hdiv : 2 ^ (A + 1) ∣ 3 * C + 2 ^ A := by
    rw [← hdecomp]
    apply Nat.dvd_add
    · exact Nat.pow_dvd_pow 2 hAB
    · exact dvd_mul_of_dvd_left
        (Nat.pow_dvd_pow 2 (by omega : A + 1 ≤ B + 1)) _
  have hdivSmall : 2 ^ A ∣ 3 * C + 2 ^ A := by
    exact dvd_trans (Nat.pow_dvd_pow 2 (Nat.le_succ A)) hdiv
  have hdivThree : 2 ^ A ∣ 3 * C := by
    exact (Nat.dvd_add_iff_right (dvd_self (2 ^ A))).mp hdivSmall
  have hcop : (2 ^ A).Coprime 3 := by
    exact Nat.Coprime.pow_left A (by norm_num : Nat.Coprime 2 3)
  have hdivC : 2 ^ A ∣ C :=
    hcop.dvd_of_dvd_mul_left hdivThree
  obtain ⟨q, hq⟩ := hdivC
  have hfactor : 3 * C + 2 ^ A = 2 ^ A * (3 * q + 1) := by
    rw [hq]
    ring
  have hstrong : 2 ^ (A + 1) ∣ 2 ^ A * (3 * q + 1) := by
    rw [← hfactor]
    exact hdiv
  have hparity : 2 ∣ 3 * q + 1 := by
    rw [pow_succ] at hstrong
    exact (Nat.mul_dvd_mul_iff_left (by positivity : 0 < 2 ^ A)).mp hstrong
  have hqOdd : ∃ r, q = 2 * r + 1 := by
    obtain ⟨s, hs⟩ := hparity
    omega
  obtain ⟨r, hr⟩ := hqOdd
  have hC : C = 2 ^ (A + 1) * r + 2 ^ A := by
    rw [hq, hr, pow_succ]
    ring
  have hlt : 2 ^ A < 2 ^ (A + 1) := by
    rw [pow_succ]
    have hpos : 0 < 2 ^ A := by positivity
    nlinarith
  calc
    C % 2 ^ (A + 1) =
        (2 ^ (A + 1) * r + 2 ^ A) % 2 ^ (A + 1) := by rw [hC]
    _ = ((2 ^ (A + 1) * r) % 2 ^ (A + 1) +
        (2 ^ A) % 2 ^ (A + 1)) % 2 ^ (A + 1) := by
          rw [Nat.add_mod]
    _ = 2 ^ A := by
          rw [Nat.mul_mod_right, Nat.mod_eq_of_lt hlt]
          simp


/--
Finite backward propagation of terminal exactness.  Every valuation in the
finite suffix is assumed positive; exactness at N then propagates to every
earlier index k ≤ N by repeated use of terminalExact_backward_step.
This is a finite accumulator statement, not a realization theorem for
arbitrary valuation words and not a global Collatz convergence result.
-/
theorem terminalExact_backward_prefix
    (a n : Nat → Nat) (N : Nat)
    (ha : ∀ k, k < N → 1 ≤ a k)
    (hterminal :
      affineCompositionRhs a n N %
          2 ^ (prefixExponentSum a N + 1) =
        2 ^ prefixExponentSum a N) :
    ∀ k, k ≤ N →
      affineCompositionRhs a n k %
          2 ^ (prefixExponentSum a k + 1) =
        2 ^ prefixExponentSum a k := by
  induction N with
  | zero =>
      intro ha hterminal k hk
      have hk0 : k = 0 := by omega
      subst k
      exact hterminal
  | succ N ih =>
      intro ha hterminal k hk
      by_cases hkEq : k = N + 1
      · subst k
        exact hterminal
      · have hkN : k ≤ N := by omega
        have hterminalN :
            affineCompositionRhs a n N %
                2 ^ (prefixExponentSum a N + 1) =
              2 ^ prefixExponentSum a N :=
          terminalExact_backward_step a n N (ha N (by omega)) hterminal
        exact ih (fun j hj => ha j (by omega)) hterminalN k hkN

#print axioms terminalExact_backward_prefix

#print axioms terminalExact_backward_step


#print axioms constant_valuation_one_identity

end SyracuseAudit
