import Mathlib

namespace CollatzSyracuseAudit

/--
A certified accelerated-odd transition: the exponent a j is the exact
power of two removed at step j. This equality must be supplied by the
transition certificate, not inferred from a residue-class heuristic.
-/
theorem offset_identity_of_certified_steps
    (n a A C : ℕ → ℕ)
    (hA0 : A 0 = 0)
    (hC0 : C 0 = 0)
    (hA : ∀ j, A (j + 1) = A j + a j)
    (hC : ∀ j, C (j + 1) = 3 * C j + 2 ^ A j)
    (hstep : ∀ j, 2 ^ (a j) * n (j + 1) = 3 * n j + 1) :
    ∀ j, 2 ^ (A j) * n j = 3 ^ j * n 0 + C j := by
  intro j
  induction j with
  | zero =>
      simp [hA0, hC0]
  | succ j ih =>
      rw [hA j, hC j, pow_add]
      calc
        2 ^ A j * 2 ^ a j * n (j + 1)
            = 2 ^ A j * (2 ^ a j * n (j + 1)) := by ring
        _ = 2 ^ A j * (3 * n j + 1) := by rw [hstep j]
        _ = 3 * (2 ^ A j * n j) + 2 ^ A j := by ring
        _ = 3 * (3 ^ j * n 0 + C j) + 2 ^ A j := by rw [ih]
        _ = 3 ^ (j + 1) * n 0 + (3 * C j + 2 ^ A j) := by
              rw [pow_succ]
              ring


/--
The affine offset is at least geometric in the number of certified steps:
C k ≥ 3^(k-1) for every k ≥ 1. This follows only from the offset recurrence
and A j ≥ 0; it is not a Collatz termination result.
-/
theorem offset_geometric_lower_bound
    (A C : ℕ → ℕ)
    (hC0 : C 0 = 0)
    (hC : ∀ j, C (j + 1) = 3 * C j + 2 ^ A j) :
    ∀ j, 3 ^ j ≤ C (j + 1) := by
  intro j
  induction j with
  | zero =>
      rw [hC 0, hC0]
      exact Nat.one_le_iff_ne_zero.mpr (by positivity)
  | succ j ih =>
      calc
        3 ^ (j + 1) = 3 * 3 ^ j := by rw [pow_succ, Nat.mul_comm]
        _ ≤ 3 * C (j + 1) := Nat.mul_le_mul_left 3 ih
        _ ≤ C (j + 2) := by
          rw [hC (j + 1)]
          exact Nat.le_add_right _ _

/--
A sharper lower bound for the affine offset follows by solving the
recurrence inequality C (j+1) ≥ 3 * C j + 1. In closed form,
2 * C j + 1 ≥ 3^j. This improves the coarse bound C (j+1) ≥ 3^j
for later blocks, but remains an offset estimate rather than a termination
proof.
-/
theorem offset_doubled_geometric_lower_bound
    (A C : ℕ → ℕ)
    (hC0 : C 0 = 0)
    (hC : ∀ j, C (j + 1) = 3 * C j + 2 ^ A j) :
    ∀ j, 3 ^ j ≤ 2 * C j + 1 := by
  intro j
  induction j with
  | zero =>
      simp [hC0]
  | succ j ih =>
      rw [hC j, pow_succ]
      have hp : 1 ≤ 2 ^ A j := Nat.one_le_pow _ _ (by omega)
      nlinarith

#print axioms offset_doubled_geometric_lower_bound

/--
For odd-to-odd certified transitions, at least one factor of two is removed.
This is a local consequence of parity, not a claim that the valuation is at
least two or that every step decreases the odd iterate.
-/
theorem positive_exponent_of_odd_transition
    (n next a : ℕ)
    (hn : n % 2 = 1)
    (hnext : next % 2 = 1)
    (hstep : 2 ^ a * next = 3 * n + 1) :
    0 < a := by
  by_contra hnot
  have ha : a = 0 := by omega
  subst a
  norm_num at hstep
  omega

/--
A strict offset margin is sufficient for a genuine decrease of the iterate.
This isolates the exact inequality still needed after the offset identity:
the lemma does not assert that the margin holds for arbitrary trajectories.
-/
theorem strict_descent_of_offset_margin
    (n0 nj A C j : ℕ)
    (hidentity : 2 ^ A * nj = 3 ^ j * n0 + C)
    (hmargin : 3 ^ j * n0 + C < 2 ^ A * n0) :
    nj < n0 := by
  have hprod : 2 ^ A * nj < 2 ^ A * n0 := by
    rw [hidentity]
    exact hmargin
  exact (Nat.mul_lt_mul_left (pow_pos (by norm_num : 0 < (2 : ℕ)) A)).mp hprod

/--
Under the exact offset identity, descent is equivalent to the strict margin.
This is a characterization, not a proof that any given trajectory satisfies
the margin.
-/
theorem descent_iff_offset_margin
    (n0 nj A C j : ℕ)
    (hidentity : 2 ^ A * nj = 3 ^ j * n0 + C) :
    nj < n0 ↔ 3 ^ j * n0 + C < 2 ^ A * n0 := by
  constructor
  · intro hdesc
    have hprod : 2 ^ A * nj < 2 ^ A * n0 :=
      (Nat.mul_lt_mul_left (pow_pos (by norm_num : 0 < (2 : ℕ)) A)).mpr hdesc
    rw [hidentity] at hprod
    exact hprod
  · intro hmargin
    exact strict_descent_of_offset_margin n0 nj A C j hidentity hmargin


/--
An odd quotient certifies maximality of the removed power of two:
if 2^a * next = 3*n+1 and next is odd, then the right-hand side
is not divisible by 2^(a+1). This is the exactness condition missing
from a merely scaled transition equation.
-/
theorem exponent_is_maximal_of_odd_quotient
    (n next a : ℕ)
    (hnext : next % 2 = 1)
    (hstep : 2 ^ a * next = 3 * n + 1) :
    ¬ 2 ^ (a + 1) ∣ 3 * n + 1 := by
  intro hdvd
  rcases hdvd with ⟨k, hk⟩
  have hEq : 2 ^ a * next = 2 ^ (a + 1) * k :=
    hstep.trans hk
  have hEq' : 2 ^ a * next = 2 ^ a * (2 * k) := by
    calc
      2 ^ a * next = 2 ^ (a + 1) * k := hEq
      _ = (2 ^ a * 2) * k := by rw [pow_succ]
      _ = 2 ^ a * (2 * k) := by ring
  have hcancel : next = 2 * k :=
    Nat.mul_left_cancel (by positivity : 0 < 2 ^ a) hEq'
  rw [hcancel] at hnext
  omega

#print axioms CollatzSyracuseAudit.offset_identity_of_certified_steps
#print axioms CollatzSyracuseAudit.offset_geometric_lower_bound
#print axioms CollatzSyracuseAudit.strict_descent_of_offset_margin
#print axioms CollatzSyracuseAudit.descent_iff_offset_margin
#print axioms CollatzSyracuseAudit.exponent_is_maximal_of_odd_quotient

/--
Necessary exponent threshold for any certified strict descent: combining
the affine offset identity with C ≥ 3^j, descent forces
3^j * (n0 + 1) < 2^A * n0. This sharpens the open margin obligation
without claiming the threshold holds on arbitrary trajectories.
-/
theorem descent_implies_geometric_exponent_threshold
    (n0 nj A C j : ℕ)
    (hidentity : 2 ^ A * nj = 3 ^ j * n0 + C)
    (hoffset : 3 ^ j ≤ C)
    (hdesc : nj < n0) :
    3 ^ j * (n0 + 1) < 2 ^ A * n0 := by
  have hmargin : 3 ^ j * n0 + C < 2 ^ A * n0 := by
    have hprod : 2 ^ A * nj < 2 ^ A * n0 :=
      (Nat.mul_lt_mul_left (pow_pos (by norm_num : 0 < (2 : ℕ)) A)).mpr hdesc
    rw [hidentity] at hprod
    exact hprod
  have hle : 3 ^ j * (n0 + 1) ≤ 3 ^ j * n0 + C := by
    calc
      3 ^ j * (n0 + 1) = 3 ^ j * n0 + 3 ^ j := by
        rw [Nat.mul_add, Nat.mul_one]
      _ ≤ 3 ^ j * n0 + C := Nat.add_le_add_left hoffset _
  exact lt_of_le_of_lt hle hmargin

#print axioms CollatzSyracuseAudit.descent_implies_geometric_exponent_threshold


/--
Correctly indexed offset threshold for an actual recurrence-generated block.
The recurrence gives 3^j ≤ 2*C + 1 (not in general 3^j ≤ C); combining
this sharper offset estimate with descent yields the displayed doubled
inequality. This avoids silently assuming an offset floor that the recurrence
does not guarantee.
-/
theorem descent_implies_doubled_exponent_threshold
    (n0 nj A C j : ℕ)
    (hidentity : 2 ^ A * nj = 3 ^ j * n0 + C)
    (hoffset : 3 ^ j ≤ 2 * C + 1)
    (hdesc : nj < n0) :
    2 * (3 ^ j * n0) + 3 ^ j - 1 < 2 * (2 ^ A * n0) := by
  have hmargin : 3 ^ j * n0 + C < 2 ^ A * n0 := by
    have hprod : 2 ^ A * nj < 2 ^ A * n0 :=
      (Nat.mul_lt_mul_left (pow_pos (by norm_num : 0 < (2 : ℕ)) A)).mpr hdesc
    rw [hidentity] at hprod
    exact hprod
  have hle : 2 * (3 ^ j * n0) + 3 ^ j - 1 ≤
      2 * (3 ^ j * n0 + C) := by
    omega
  have hdouble : 2 * (3 ^ j * n0 + C) < 2 * (2 ^ A * n0) := by
    omega
  exact lt_of_le_of_lt hle hdouble

#print axioms descent_implies_doubled_exponent_threshold

/--
Any strict descent over a certified block with positive starting value
requires the accumulated power of two to dominate the corresponding power
of three. This is weaker than the full threshold above, but isolates the
necessary exponential-growth comparison without logarithms or real analysis.
-/
theorem descent_implies_power_growth
    (n0 nj A C j : ℕ)
    (hn0 : 0 < n0)
    (hidentity : 2 ^ A * nj = 3 ^ j * n0 + C)
    (hoffset : 3 ^ j ≤ C)
    (hdesc : nj < n0) :
    3 ^ j < 2 ^ A := by
  have hthreshold :=
    descent_implies_geometric_exponent_threshold
      n0 nj A C j hidentity hoffset hdesc
  have hmul : 3 ^ j * n0 < 2 ^ A * n0 := by
    calc
      3 ^ j * n0 ≤ 3 ^ j * (n0 + 1) := by
        exact Nat.mul_le_mul_left (3 ^ j) (Nat.le_succ n0)
      _ < 2 ^ A * n0 := hthreshold
  exact (Nat.mul_lt_mul_right hn0).mp hmul

#print axioms CollatzSyracuseAudit.descent_implies_power_growth


/--
Exact gap form of the offset barrier. When the accumulated power of two is
at least the corresponding power of three, strict descent is equivalent to
the additive offset being smaller than the gap times the starting value.
This exposes the precise integer inequality behind the floor threshold.
-/
theorem offset_margin_iff_gap_product
    (n0 A C j : ℕ) (hgap : 3 ^ j ≤ 2 ^ A) :
    3 ^ j * n0 + C < 2 ^ A * n0 ↔
      C < (2 ^ A - 3 ^ j) * n0 := by
  have hdecomp : 2 ^ A = (2 ^ A - 3 ^ j) + 3 ^ j :=
    Nat.sub_add_cancel hgap
  rw [hdecomp, Nat.add_mul]
  omega

#print axioms offset_margin_iff_gap_product

/--
Arithmetic certificate for a block of accelerated odd Syracuse steps.
The record isolates the exact affine identity and the geometric offset
floor required by the descent-margin argument. It does not claim that an
arbitrary tuple comes from a genuine orbit; that provenance must be proved
when constructing a certificate from transitions.
-/
structure SyracuseBlockArithmeticCertificate where
  start : ℕ
  finish : ℕ
  steps : ℕ
  exponent : ℕ
  offset : ℕ
  affine_identity :
    2 ^ exponent * finish = 3 ^ steps * start + offset
  offset_floor :
    3 ^ steps ≤ 2 * offset + 1

/-- A certified arithmetic block descends exactly when its strict offset
margin holds. This exposes the remaining global obligation as data on each
block rather than hiding it inside the affine identity. -/
theorem SyracuseBlockArithmeticCertificate.descent_iff_margin
    (b : SyracuseBlockArithmeticCertificate) :
    b.finish < b.start ↔
      3 ^ b.steps * b.start + b.offset <
        2 ^ b.exponent * b.start := by
  exact descent_iff_offset_margin b.start b.finish b.exponent
    b.offset b.steps b.affine_identity

/-- Any descending arithmetic block with positive starting value must
remove enough powers of two to dominate its number of odd steps. -/
theorem SyracuseBlockArithmeticCertificate.descent_implies_power_growth
    (b : SyracuseBlockArithmeticCertificate)
    (hstart : 0 < b.start) (hdesc : b.finish < b.start) :
    3 ^ b.steps < 2 ^ b.exponent := by
  have hthreshold :=
    CollatzSyracuseAudit.descent_implies_doubled_exponent_threshold
      b.start b.finish b.exponent b.offset b.steps
      b.affine_identity b.offset_floor hdesc
  have hpow : 1 ≤ 3 ^ b.steps := Nat.one_le_pow _ _ (by omega)
  have hmul2 :
      2 * (3 ^ b.steps * b.start) <
        2 * (2 ^ b.exponent * b.start) := by
    omega
  have hmul : 3 ^ b.steps * b.start < 2 ^ b.exponent * b.start :=
    (Nat.mul_lt_mul_left (by omega : 0 < 2)).mp hmul2
  exact (Nat.mul_lt_mul_right hstart).mp hmul

#print axioms SyracuseBlockArithmeticCertificate.descent_iff_margin
#print axioms SyracuseBlockArithmeticCertificate.descent_implies_power_growth


/--
Canonical offset generated by the valuation word. This recursion is the
division-free form of the weighted correction sum
  C_N = sum_{i < N} 3^(N-1-i) * 2^(A_i).
It is deliberately defined from the exact recurrence, so no logarithmic
estimate or unproved orbit property enters.
-/
def canonicalOffset (A : ℕ → ℕ) : ℕ → ℕ
  | 0 => 0
  | n + 1 => 3 * canonicalOffset A n + 2 ^ A n

/--
Uniqueness of the affine correction term: the initial condition and exact
recurrence determine every offset value. This prevents a later argument from
silently substituting an independently chosen offset sequence.
-/
theorem offset_eq_canonical
    (A C : ℕ → ℕ)
    (hC0 : C 0 = 0)
    (hC : ∀ j, C (j + 1) = 3 * C j + 2 ^ A j) :
    ∀ n, C n = canonicalOffset A n := by
  intro n
  induction n with
  | zero =>
      simp [canonicalOffset, hC0]
  | succ n ih =>
      simp only [canonicalOffset]
      rw [hC n, ih]

/-- The canonical offset is nonnegative and grows at least geometrically:
3^n ≤ 2*C_n+1. This is a recurrence consequence only, not a descent bound. -/
theorem canonicalOffset_doubled_geometric_lower_bound
    (A : ℕ → ℕ) :
    ∀ n, 3 ^ n ≤ 2 * canonicalOffset A n + 1 := by
  intro n
  induction n with
  | zero =>
      simp [canonicalOffset]
  | succ n ih =>
      simp only [canonicalOffset]
      have hp : 1 ≤ 2 ^ A n := Nat.one_le_pow _ _ (by omega)
      rw [pow_succ]
      nlinarith


/--
The newest correction term is itself bounded by the full offset.
This isolates the final summand in the affine correction recurrence; it is
useful for local bounds but does not supply the upper bound needed for descent.
-/
theorem canonicalOffset_ge_last_weight
    (A : ℕ → ℕ) (n : ℕ) :
    2 ^ A n ≤ canonicalOffset A (n + 1) := by
  simp [canonicalOffset]

/--
Every canonical offset strictly increases with the number of certified steps.
The increase comes from the positive new correction term, not from any
assumption about the Syracuse orbit.
-/
theorem canonicalOffset_strict_mono_step
    (A : ℕ → ℕ) (n : ℕ) :
    canonicalOffset A n < canonicalOffset A (n + 1) := by
  simp [canonicalOffset]
  have hp : 0 < 2 ^ A n := Nat.pow_pos (by omega)
  omega

#print axioms canonicalOffset_ge_last_weight
#print axioms canonicalOffset_strict_mono_step


/--
Closed-form expansion of the canonical offset as a finite weighted sum.
The coefficient of the j-th valuation weight is exactly 3^(n-1-j).
This makes the accumulated correction term explicit and provides a direct
interface for later estimates; it is not itself a descent theorem.
-/
theorem canonicalOffset_eq_weighted_sum
    (A : ℕ → ℕ) :
    ∀ n, canonicalOffset A n =
      ∑ j ∈ Finset.range n, 3 ^ (n - 1 - j) * 2 ^ A j := by
  intro n
  induction n with
  | zero =>
      simp [canonicalOffset]
  | succ n ih =>
      rw [canonicalOffset, Finset.sum_range_succ]
      simp only [Nat.succ_sub_one]
      have hsum :
          (∑ j ∈ Finset.range n, 3 ^ (n - j) * 2 ^ A j) =
            3 * (∑ j ∈ Finset.range n, 3 ^ (n - 1 - j) * 2 ^ A j) := by
        calc
          (∑ j ∈ Finset.range n, 3 ^ (n - j) * 2 ^ A j) =
              ∑ j ∈ Finset.range n, (3 * 3 ^ (n - 1 - j)) * 2 ^ A j := by
                apply Finset.sum_congr rfl
                intro j hj
                have hjn : j < n := Finset.mem_range.mp hj
                have hexp : n - j = (n - 1 - j) + 1 := by omega
                rw [hexp, pow_succ]
                ring
          _ = 3 * (∑ j ∈ Finset.range n, 3 ^ (n - 1 - j) * 2 ^ A j) := by
                rw [Finset.mul_sum]
                simp_rw [mul_assoc]
      rw [hsum]
      simp only [Nat.sub_self, pow_zero, one_mul]
      rw [← ih]

#print axioms canonicalOffset_eq_weighted_sum


/--
Exact concatenation law for the canonical affine offset. Splitting a
valuation word after m steps separates the accumulated correction into
the first block, amplified by 3^n, and the correction generated by the
shifted second block. This is an identity for arbitrary exponent words;
orbit-realizability and descent remain separate obligations.
-/
theorem canonicalOffset_split
    (A : ℕ → ℕ) (m n : ℕ) :
    canonicalOffset A (m + n) =
      3 ^ n * canonicalOffset A m +
        canonicalOffset (fun i => A (m + i)) n := by
  induction n with
  | zero =>
      simp [canonicalOffset]
  | succ n ih =>
      simp only [Nat.add_succ, canonicalOffset]
      rw [ih, pow_succ]
      ring

#print axioms canonicalOffset_split

end CollatzSyracuseAudit
