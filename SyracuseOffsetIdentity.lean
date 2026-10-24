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

/-!
The accumulated 2-adic exponent is at least the number of accelerated odd
steps whenever every certified transition removes at least one factor of two.
This is a rigorous baseline growth bound. Since 3^N grows faster than 2^N,
the estimate alone is explicitly insufficient for the global descent margin.
-/

theorem accumulated_exponent_ge_step_count
    (A a : ℕ → ℕ)
    (hA0 : A 0 = 0)
    (hA : ∀ j, A (j + 1) = A j + a j)
    (ha : ∀ j, 0 < a j) :
    ∀ j, j ≤ A j := by
  intro j
  induction j with
  | zero =>
      simp [hA0]
  | succ j ih =>
      rw [hA j]
      have haj : 1 ≤ a j := Nat.succ_le_iff.mpr (ha j)
      omega

#print axioms accumulated_exponent_ge_step_count

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
  have hdecomp : (2 ^ A - 3 ^ j) + 3 ^ j = 2 ^ A :=
    Nat.sub_add_cancel hgap
  have hmul :
      2 ^ A * n0 = (2 ^ A - 3 ^ j) * n0 + 3 ^ j * n0 := by
    calc
      2 ^ A * n0 = ((2 ^ A - 3 ^ j) + 3 ^ j) * n0 :=
        congrArg (fun x : ℕ => x * n0) hdecomp.symm
      _ = (2 ^ A - 3 ^ j) * n0 + 3 ^ j * n0 := Nat.add_mul _ _ _
  constructor
  · intro h
    rw [hmul] at h
    have h' : C + 3 ^ j * n0 <
        (2 ^ A - 3 ^ j) * n0 + 3 ^ j * n0 := by
      simpa [Nat.add_comm] using h
    omega
  · intro h
    have h' : C + 3 ^ j * n0 <
        (2 ^ A - 3 ^ j) * n0 + 3 ^ j * n0 :=
      Nat.add_lt_add_right h (3 ^ j * n0)
    rw [hmul]
    simpa [Nat.add_comm] using h'

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
Canonical affine identity for the accelerated Syracuse trajectory.
Unlike the abstract recurrence lemma, this statement fixes the correction
term to the canonical offset generated by the exponent word. Thus the offset
cannot be chosen independently to make a descent margin hold.
-/
theorem canonical_offset_identity_of_certified_steps
    (n a A : ℕ → ℕ)
    (hA0 : A 0 = 0)
    (hA : ∀ j, A (j + 1) = A j + a j)
    (hstep : ∀ j, 2 ^ (a j) * n (j + 1) = 3 * n j + 1) :
    ∀ j, 2 ^ (A j) * n j = 3 ^ j * n 0 + canonicalOffset A j := by
  intro j
  exact offset_identity_of_certified_steps n a A (canonicalOffset A)
    hA0 rfl hA (by intro k; rfl) hstep j

#print axioms canonical_offset_identity_of_certified_steps


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
Construct a block certificate from an actual sequence of certified
accelerated-Syracuse transitions. Unlike an abstract arithmetic witness,
this constructor fixes the finish, accumulated exponent, and offset to the
same trajectory and its canonical recurrence.
-/
def SyracuseBlockArithmeticCertificate.of_certified_transitions
    (n a A : ℕ → ℕ) (steps : ℕ)
    (hA0 : A 0 = 0)
    (hA : ∀ j, A (j + 1) = A j + a j)
    (hstep : ∀ j, 2 ^ (a j) * n (j + 1) = 3 * n j + 1) :
    SyracuseBlockArithmeticCertificate := by
  refine
    { start := n 0
      finish := n steps
      steps := steps
      exponent := A steps
      offset := canonicalOffset A steps
      affine_identity := ?_
      offset_floor := ?_ }
  · exact canonical_offset_identity_of_certified_steps n a A hA0 hA hstep steps
  · exact canonicalOffset_doubled_geometric_lower_bound A steps

#print axioms SyracuseBlockArithmeticCertificate.of_certified_transitions


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
      calc
        canonicalOffset A (m + (n + 1)) =
            3 * canonicalOffset A (m + n) + 2 ^ A (m + n) := by
              rw [Nat.add_succ, canonicalOffset]
        _ = 3 * (3 ^ n * canonicalOffset A m +
              canonicalOffset (fun i => A (m + i)) n) +
              2 ^ A (m + n) := by rw [ih]
        _ = 3 ^ (n + 1) * canonicalOffset A m +
              (3 * canonicalOffset (fun i => A (m + i)) n +
                2 ^ A (m + n)) := by
              rw [pow_succ]
              ring
        _ = 3 ^ (n + 1) * canonicalOffset A m +
              canonicalOffset (fun i => A (m + i)) (n + 1) := by
              rw [canonicalOffset]

#print axioms canonicalOffset_split

/--
Finite-memory congruence for the canonical offset. If r ≤ n, the contribution
from the first m steps is a multiple of 3^r, so the offset after m+n steps
agrees modulo 3^r with the offset generated by the last n exponents alone.
This is a local arithmetic filter, not an orbit-realizability theorem.
-/
theorem canonicalOffset_mod_pow_three_suffix
    (A : ℕ → ℕ) (m n r : ℕ) (hr : r ≤ n) :
    canonicalOffset A (m + n) % 3 ^ r =
      canonicalOffset (fun i => A (m + i)) n % 3 ^ r := by
  rw [canonicalOffset_split]
  have hpow : 3 ^ n = 3 ^ r * 3 ^ (n - r) := by
    rw [← pow_add]
    congr 1
    omega
  have hdiv : 3 ^ r ∣ 3 ^ n * canonicalOffset A m := by
    refine ⟨3 ^ (n - r) * canonicalOffset A m, ?_⟩
    rw [hpow]
    ring
  simp [Nat.add_mod, Nat.mod_eq_zero_of_dvd hdiv]

#print axioms canonicalOffset_mod_pow_three_suffix


/--
Terminal divisibility filter for a certified Syracuse block. Any exact
affine identity forces the offset-adjusted numerator to be divisible by
the accumulated power of two. This is a necessary arithmetic filter for
candidate exponent words, not a sufficient orbit-realizability criterion.
-/
theorem terminal_divisibility_of_offset_identity
    (n0 nj A C j : ℕ)
    (hidentity : 2 ^ A * nj = 3 ^ j * n0 + C) :
    2 ^ A ∣ 3 ^ j * n0 + C := by
  exact ⟨nj, hidentity.symm⟩

#print axioms terminal_divisibility_of_offset_identity


/--
An exponent-one transition has a forced starting residue: if
2 * next = 3 * n + 1 and next is odd, then n is 3 modulo 4.
This is a necessary local admissibility condition on valuation words.
-/
theorem exponent_one_forces_residue_three
    (n next : ℕ)
    (hnext : next % 2 = 1)
    (hstep : 2 * next = 3 * n + 1) :
    n % 4 = 3 := by
  have hmod : (2 * next) % 4 = (3 * n + 1) % 4 := by
    rw [hstep]
  omega

#print axioms exponent_one_forces_residue_three






/--
An exponent-two transition has a forced starting residue modulo eight:
if 4 * next = 3 * n + 1 and next is odd, then n ≡ 1 (mod 8).
This complements the exponent-one residue filter and constrains actual
valuation words. It is a necessary local condition, not a global descent
theorem.
-/
theorem exponent_two_forces_residue_one_mod_eight
    (n next : ℕ)
    (hnext : next % 2 = 1)
    (hstep : 4 * next = 3 * n + 1) :
    n % 8 = 1 := by
  have hmod : (4 * next) % 8 = (3 * n + 1) % 8 := by
    rw [hstep]
  omega

#print axioms exponent_two_forces_residue_one_mod_eight



/--
An exponent-three transition has a forced starting residue modulo sixteen:
if 8 * next = 3 * n + 1 and next is odd, then n ≡ 13 (mod 16).
This is another necessary local filter on a realizable valuation word.
-/
theorem exponent_three_forces_residue_thirteen_mod_sixteen
    (n next : ℕ)
    (hnext : next % 2 = 1)
    (hstep : 8 * next = 3 * n + 1) :
    n % 16 = 13 := by
  have hmod : (8 * next) % 16 = (3 * n + 1) % 16 := by
    rw [hstep]
  omega

#print axioms exponent_three_forces_residue_thirteen_mod_sixteen


/--
An exponent-four transition forces its starting odd input to be five
modulo thirty-two: if 16 * next = 3 * n + 1 and next is odd, then
n ≡ 5 (mod 32). This extends the exact local admissibility filters;
it is not a global descent result.
-/
theorem exponent_four_forces_residue_five_mod_thirty_two
    (n next : ℕ)
    (hnext : next % 2 = 1)
    (hstep : 16 * next = 3 * n + 1) :
    n % 32 = 5 := by
  have hmod : (16 * next) % 32 = (3 * n + 1) % 32 := by
    rw [hstep]
  omega

#print axioms exponent_four_forces_residue_five_mod_thirty_two

/--
An exponent-five transition forces its odd starting input to be 53 modulo
64: if 32 * next = 3 * n + 1 and next is odd, then n ≡ 53 (mod 64).
This extends the local admissibility sieve for realized valuation words;
it is a necessary condition, not a global descent theorem.
-/
theorem exponent_five_forces_residue_fifty_three_mod_sixty_four
    (n next : ℕ)
    (hnext : next % 2 = 1)
    (hstep : 32 * next = 3 * n + 1) :
    n % 64 = 53 := by
  have hmod : (32 * next) % 64 = (3 * n + 1) % 64 := by
    rw [hstep]
  omega

#print axioms exponent_five_forces_residue_fifty_three_mod_sixty_four

/--
An exponent-six transition forces its odd starting input to 21 modulo
128. This is the next level of the valuation-word admissibility sieve.
-/
theorem exponent_six_forces_residue_twenty_one_mod_one_twenty_eight
    (n next : ℕ)
    (hnext : next % 2 = 1)
    (hstep : 64 * next = 3 * n + 1) :
    n % 128 = 21 := by
  have hmod : (64 * next) % 128 = (3 * n + 1) % 128 := by
    rw [hstep]
  omega

#print axioms exponent_six_forces_residue_twenty_one_mod_one_twenty_eight




/--
Any strict descent with a strictly positive affine offset forces the
multiplicative coefficient 2^A to exceed 3^j. Unlike the stronger
geometric-offset threshold above, this implication needs only C > 0;
it does not assume C ≥ 3^j. For nonempty canonical Syracuse blocks,
positivity follows from the positive final correction term.
-/
theorem descent_implies_power_growth_of_positive_offset
    (n0 nj A C j : ℕ)
    (hn0 : 0 < n0)
    (hC : 0 < C)
    (hidentity : 2 ^ A * nj = 3 ^ j * n0 + C)
    (hdesc : nj < n0) :
    3 ^ j < 2 ^ A := by
  have hpowpos : 0 < 2 ^ A := by positivity
  have hprod : 2 ^ A * nj < 2 ^ A * n0 :=
    (Nat.mul_lt_mul_left hpowpos).mpr hdesc
  have hmargin : 3 ^ j * n0 + C < 2 ^ A * n0 := by
    rw [← hidentity]
    exact hprod
  have hmul : 3 ^ j * n0 < 2 ^ A * n0 := by omega
  exact (Nat.mul_lt_mul_right hn0).mp hmul

#print axioms descent_implies_power_growth_of_positive_offset


/--
Every nonempty canonical offset is strictly positive, because its final
recurrence step adds a positive power of two. This supplies the positivity
hypothesis needed to apply the weaker descent threshold to an actual
canonical block, without assuming the stronger geometric offset floor.
-/
theorem canonicalOffset_pos_of_pos_steps
    (A : ℕ → ℕ) (j : ℕ) (hj : 0 < j) :
    0 < canonicalOffset A j := by
  cases j with
  | zero => omega
  | succ j =>
      simp [canonicalOffset]

/--
For a nonempty canonical affine block, strict descent forces 3^j < 2^A.
Unlike the earlier threshold theorem requiring 3^j ≤ C, this corollary uses
only the recurrence-defined offset's positivity. It is still a necessary
condition, not a proof that the block descends.
-/
theorem canonical_block_descent_implies_power_growth
    (n0 nj A j : ℕ)
    (hn0 : 0 < n0)
    (hj : 0 < j)
    (hidentity :
      2 ^ A * nj = 3 ^ j * n0 + canonicalOffset A j)
    (hdesc : nj < n0) :
    3 ^ j < 2 ^ A := by
  exact CollatzSyracuseAudit.descent_implies_power_growth_of_positive_offset
    n0 nj A (canonicalOffset A j) j hn0
    (canonicalOffset_pos_of_pos_steps A j hj) hidentity hdesc

#print axioms canonicalOffset_pos_of_pos_steps
#print axioms canonical_block_descent_implies_power_growth


/--
Exact residue law for the canonical affine offset: modulo three, the
newest correction term determines the whole next offset because all earlier
terms are multiples of three. This is a consistency filter on exponent words,
not a sufficient criterion for orbit realizability.
-/
theorem canonicalOffset_succ_mod_three
    (A : ℕ → ℕ) (n : ℕ) :
    canonicalOffset A (n + 1) % 3 = (2 ^ A n) % 3 := by
  simp [canonicalOffset, Nat.add_mod]

#print axioms canonicalOffset_succ_mod_three


/--
Exponent-seven admissibility filter: if an accelerated odd transition removes
exactly seven powers of two, then its odd input lies in the residue class
213 modulo 256. This is a necessary local constraint on a valuation word,
not a global descent statement.
-/
theorem exponent_seven_forces_residue_two_hundred_thirteen_mod_two_hundred_fifty_six
    (n next : ℕ)
    (hnext : next % 2 = 1)
    (hstep : 128 * next = 3 * n + 1) :
    n % 256 = 213 := by
  have hmod : (128 * next) % 256 = (3 * n + 1) % 256 := by
    rw [hstep]
  omega

#print axioms exponent_seven_forces_residue_two_hundred_thirteen_mod_two_hundred_fifty_six



/--
Sharper canonical-offset floor from the exact transition constraint A j ≥ j:
3^n ≤ C_n + 2^n, equivalently 3^n - 2^n ≤ C_n when the subtraction is
nonnegative. The induction uses the actual recurrence and the accumulated
valuation lower bound; it does not assume descent or any global orbit claim.
-/
theorem canonicalOffset_plus_two_pow_lower_bound
    (A : ℕ → ℕ)
    (hA : ∀ j, j ≤ A j) :
    ∀ n, 3 ^ n ≤ canonicalOffset A n + 2 ^ n := by
  intro n
  induction n with
  | zero =>
      simp [canonicalOffset]
  | succ n ih =>
      have hAeq : n + (A n - n) = A n := Nat.add_sub_of_le (hA n)
      have hpow : 2 ^ n ≤ 2 ^ A n := by
        rw [← hAeq, pow_add]
        calc
          2 ^ n = 2 ^ n * 1 := by simp
          _ ≤ 2 ^ n * 2 ^ (A n - n) :=
            Nat.mul_le_mul_left _ (Nat.one_le_pow _ _ (by omega))
      have h2succ : 2 ^ (n + 1) = 2 * 2 ^ n := by
        rw [pow_succ, Nat.mul_comm]
      calc
        3 ^ (n + 1) = 3 * 3 ^ n := by
          rw [pow_succ, Nat.mul_comm]
        _ ≤ 3 * (canonicalOffset A n + 2 ^ n) :=
          Nat.mul_le_mul_left 3 ih
        _ = 3 * canonicalOffset A n + 3 * 2 ^ n := by ring
        _ ≤ 3 * canonicalOffset A n + 2 ^ A n + 2 ^ (n + 1) := by
          rw [h2succ]
          nlinarith [hpow]
        _ = canonicalOffset A (n + 1) + 2 ^ (n + 1) := by
          simp only [canonicalOffset]


/--
Exact exponent-seven transition family. For every k, the odd input
n = 256*k + 213 satisfies 3*n + 1 = 2^7*(6*k+5), with odd successor
6*k+5, so the accelerated Syracuse step is exactly 6*k+5 and is strictly
smaller than n. This is a genuine infinite local family, not a global
termination argument.
-/
theorem exponent_seven_family_exact_transition_and_descent (k : ℕ) :
    128 * (6 * k + 5) = 3 * (256 * k + 213) + 1 ∧
    (6 * k + 5) % 2 = 1 ∧
    6 * k + 5 < 256 * k + 213 := by
  constructor
  · omega
  constructor <;> omega

#print axioms exponent_seven_family_exact_transition_and_descent



/-!
## Conditional quantitative offset control

If every certified odd transition removes at least two factors of two, the
canonical offset plus the geometric term is bounded by the accumulated
power of two. This is a genuine upper bound complementary to the previously
proved lower bounds. It applies only to blocks whose every exponent is at
least two; transitions with exponent one remain the global obstruction.
-/

/-- If each transition exponent is at least two, then
canonicalOffset A n + 3^n ≤ 2^(A n). The proof uses the actual accumulated
exponent recurrence, not an independently chosen offset. -/
theorem canonicalOffset_plus_three_pow_le_accumulated_power
    (A a : ℕ → ℕ)
    (hA0 : A 0 = 0)
    (hA : ∀ j, A (j + 1) = A j + a j)
    (ha : ∀ j, 2 ≤ a j) :
    ∀ n, canonicalOffset A n + 3 ^ n ≤ 2 ^ A n := by
  intro n
  induction n with
  | zero =>
      simp [canonicalOffset, hA0]
  | succ n ih =>
      have hfactor : 4 ≤ 2 ^ a n := by
        calc
          4 = 2 ^ 2 := by norm_num
          _ ≤ 2 ^ a n := Nat.pow_le_pow_right (by norm_num : 1 ≤ (2 : ℕ)) (ha n)
      have hscaled :
          3 * canonicalOffset A n + 3 * 3 ^ n ≤ 3 * 2 ^ A n := by
        have h := Nat.mul_le_mul_left 3 ih
        simpa [Nat.mul_add] using h
      have hfour :
          3 * 2 ^ A n + 2 ^ A n ≤ 2 ^ A n * 2 ^ a n := by
        calc
          3 * 2 ^ A n + 2 ^ A n = 4 * 2 ^ A n := by ring
          _ ≤ 2 ^ A n * 2 ^ a n := by
            have h := Nat.mul_le_mul_right (2 ^ A n) hfactor
            simpa [Nat.mul_comm] using h
      calc
        canonicalOffset A (n + 1) + 3 ^ (n + 1)
            = 3 * canonicalOffset A n + 2 ^ A n + 3 * 3 ^ n := by
                simp [canonicalOffset, pow_succ, Nat.mul_comm]
        _ = 3 * canonicalOffset A n + 3 * 3 ^ n + 2 ^ A n := by omega
        _ ≤ 3 * 2 ^ A n + 2 ^ A n := by omega
        _ ≤ 2 ^ A n * 2 ^ a n := hfour
        _ = 2 ^ (A n + a n) := by rw [pow_add]
        _ = 2 ^ A (n + 1) := by rw [hA n]

#print axioms canonicalOffset_plus_three_pow_le_accumulated_power

end CollatzSyracuseAudit


/-!
## Signed offset-margin recurrence

The signed margin measures the gap between the accumulated power of two and
the canonical affine offset plus the geometric term. Its exact recurrence
isolates the contribution of each valuation exponent; exponent one contributes
a negative term, exponent two contributes zero, and larger exponents contribute
a positive term. This is an identity, not a claim that arbitrary mixed words
eventually descend.
-/

/-- Signed descent margin associated with the canonical offset. -/
def signedOffsetMargin (A : ℕ → ℕ) (n : ℕ) : ℤ :=
  (2 : ℤ) ^ A n - (canonicalOffset A n : ℤ) - (3 : ℤ) ^ n

/-- Exact one-step recurrence for the signed offset margin. -/
theorem signedOffsetMargin_succ
    (A a : ℕ → ℕ)
    (hA : ∀ j, A (j + 1) = A j + a j)
    (n : ℕ) :
    signedOffsetMargin A (n + 1) =
      3 * signedOffsetMargin A n +
        ((2 : ℤ) ^ a n - 4) * (2 : ℤ) ^ A n := by
  simp only [signedOffsetMargin, canonicalOffset, hA n]
  push_cast
  rw [pow_add]
  ring

#print axioms signedOffsetMargin_succ
