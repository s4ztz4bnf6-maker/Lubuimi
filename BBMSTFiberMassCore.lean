import Mathlib

/-!
# BBMST fiber-mass algebra core

This module isolates the elementary rational mass-splitting identity needed
before formalizing the probability-space and fiber argument in Lemma 2.1 of
Balister–Bollobás–Morris–Sahasrabudhe–Tiba.

Scope boundary: these are algebraic bookkeeping lemmas only. They do not define
the paper's evolving probability measures, prove its distortion bounds, or
discharge either admitted sieve axiom in ErdosSelfridge_v17_fixed.
-/

namespace BBMSTFiberMassCore

/-- A mass split into an alpha-fraction and its complement conserves total mass.
No division is used, so the statement remains valid at alpha = 0 and alpha = 1. -/
theorem fiber_mass_split (mass alpha : ℚ) :
    alpha * mass + (1 - alpha) * mass = mass := by
  ring

/-- The zero-fraction endpoint: all mass is in the complementary part. -/
theorem fiber_mass_split_zero (mass : ℚ) :
    (0 : ℚ) * mass + (1 - 0) * mass = mass := by
  ring

/-- The full-fraction endpoint: all mass is in the retained part. -/
theorem fiber_mass_split_one (mass : ℚ) :
    (1 : ℚ) * mass + (1 - 1) * mass = mass := by
  ring

/-- If alpha is a genuine proportion and mass is nonnegative,
both parts of the algebraic split are nonnegative. This is the positivity
obligation missing from mass conservation alone. -/
theorem fiber_mass_parts_nonneg
    (mass alpha : ℚ) (hmass : 0 ≤ mass)
    (ha0 : 0 ≤ alpha) (ha1 : alpha ≤ 1) :
    0 ≤ alpha * mass ∧ 0 ≤ (1 - alpha) * mass := by
  constructor
  · exact mul_nonneg ha0 hmass
  · exact mul_nonneg (sub_nonneg.mpr ha1) hmass

/-- A nonnegative finite collection of masses has nonnegative total mass. -/
theorem finite_mass_sum_nonneg {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass : ι → ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i) :
    0 ≤ ∑ i ∈ s, mass i := by
  classical
  apply Finset.sum_nonneg
  intro i hi
  exact hmass i hi

/-- Summing the retained and removed parts separately preserves
nonnegativity, provided every source mass is nonnegative and alpha is
a genuine proportion. This lifts pointwise positivity to finite totals. -/
theorem finite_fiber_mass_parts_nonneg {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass : ι → ℚ) (alpha : ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (ha0 : 0 ≤ alpha) (ha1 : alpha ≤ 1) :
    0 ≤ ∑ i ∈ s, alpha * mass i ∧
      0 ≤ ∑ i ∈ s, (1 - alpha) * mass i := by
  constructor
  · apply Finset.sum_nonneg
    intro i hi
    exact mul_nonneg ha0 (hmass i hi)
  · apply Finset.sum_nonneg
    intro i hi
    exact mul_nonneg (sub_nonneg.mpr ha1) (hmass i hi)

#print axioms fiber_mass_parts_nonneg
#print axioms finite_mass_sum_nonneg

/-- Finite weighted version of the split identity. Each point's mass
is divided algebraically into an alpha-part and a complementary part, and
summing both parts recovers the original total. No positivity assumption or
division is needed, including at alpha = 0 and alpha = 1. -/
theorem finite_fiber_mass_split {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass : ι → ℚ) (alpha : ℚ) :
    (∑ i ∈ s, alpha * mass i) +
      (∑ i ∈ s, (1 - alpha) * mass i) =
      ∑ i ∈ s, mass i := by
  classical
  calc
    (∑ i ∈ s, alpha * mass i) +
        (∑ i ∈ s, (1 - alpha) * mass i)
        = alpha * (∑ i ∈ s, mass i) +
            (1 - alpha) * (∑ i ∈ s, mass i) := by
              rw [← Finset.mul_sum, ← Finset.mul_sum]
    _ = ∑ i ∈ s, mass i := by ring

/-- General finite conservation theorem for an actual pointwise
retained/removed decomposition. This is the reusable bridge from a
pointwise fiber identity to total finite mass conservation. -/
theorem finite_mass_conservation {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (retained removed total : ι → ℚ)
    (h : ∀ i ∈ s, retained i + removed i = total i) :
    (∑ i ∈ s, retained i) + (∑ i ∈ s, removed i) =
      ∑ i ∈ s, total i := by
  classical
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i hi
  exact h i hi


/-- Fiber-dependent split: each point may have its own retained fraction.
This avoids assuming a single global alpha when the original probability
argument assigns different proportions to different fibers. -/
theorem finite_fiber_mass_split_variable_alpha {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass alpha : ι → ℚ) :
    (∑ i ∈ s, alpha i * mass i) +
      (∑ i ∈ s, (1 - alpha i) * mass i) =
      ∑ i ∈ s, mass i := by
  classical
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i hi
  ring

/-- Fiber-dependent retained and removed parts are nonnegative when
each local fraction lies in [0,1] and each source mass is nonnegative. -/
theorem finite_fiber_mass_parts_variable_alpha_nonneg
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    (mass alpha : ι → ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (ha0 : ∀ i ∈ s, 0 ≤ alpha i)
    (ha1 : ∀ i ∈ s, alpha i ≤ 1) :
    0 ≤ ∑ i ∈ s, alpha i * mass i ∧
      0 ≤ ∑ i ∈ s, (1 - alpha i) * mass i := by
  constructor
  · apply Finset.sum_nonneg
    intro i hi
    exact mul_nonneg (ha0 i hi) (hmass i hi)
  · apply Finset.sum_nonneg
    intro i hi
    exact mul_nonneg (sub_nonneg.mpr (ha1 i hi)) (hmass i hi)


/-- The retained/removed conservation law is valid pointwise even when
the retained fraction varies by fiber. This packages the split in the
same form consumed by the general finite_mass_conservation theorem. -/
theorem variable_alpha_fiber_conservation
    (mass alpha : ℚ) :
    alpha * mass + (1 - alpha) * mass = mass := by
  ring

/-- A finite family with varying local fractions conserves total mass.
This is the direct retained-plus-removed interface for the fiber model. -/
theorem finite_variable_alpha_mass_conservation
    {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass alpha : ι → ℚ) :
    (∑ i ∈ s, alpha i * mass i) +
      (∑ i ∈ s, (1 - alpha i) * mass i) =
      ∑ i ∈ s, mass i := by
  classical
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i hi
  ring


/-- Integrated finite-fiber interface: under local probability bounds and
nonnegative source masses, both pieces are nonnegative and their totals
exactly conserve the source mass. This remains an algebraic core lemma;
it does not assert that BBMST's geometric conditional proportions have
already been constructed. -/
theorem finite_fiber_mass_partition
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    (mass alpha : ι → ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (ha0 : ∀ i ∈ s, 0 ≤ alpha i)
    (ha1 : ∀ i ∈ s, alpha i ≤ 1) :
    (0 ≤ ∑ i ∈ s, alpha i * mass i) ∧
    (0 ≤ ∑ i ∈ s, (1 - alpha i) * mass i) ∧
    ((∑ i ∈ s, alpha i * mass i) +
      (∑ i ∈ s, (1 - alpha i) * mass i) =
      ∑ i ∈ s, mass i) := by
  have hnonneg :=
    finite_fiber_mass_parts_variable_alpha_nonneg s mass alpha
      hmass ha0 ha1
  have hconserve :=
    finite_mass_conservation s
      (fun i => alpha i * mass i)
      (fun i => (1 - alpha i) * mass i)
      mass (by
        intro i hi
        ring)
  exact ⟨hnonneg.1, hnonneg.2, hconserve⟩


/-- Each component of a variable-fiber split is bounded above by the
original total mass, provided the source masses are nonnegative and every
local fraction lies in [0,1]. Together with finite_fiber_mass_partition,
this gives a two-sided mass budget for both components. -/
theorem finite_fiber_mass_parts_le_total
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    (mass alpha : ι → ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (ha0 : ∀ i ∈ s, 0 ≤ alpha i)
    (ha1 : ∀ i ∈ s, alpha i ≤ 1) :
    (∑ i ∈ s, alpha i * mass i ≤ ∑ i ∈ s, mass i) ∧
    (∑ i ∈ s, (1 - alpha i) * mass i ≤ ∑ i ∈ s, mass i) := by
  constructor
  · apply Finset.sum_le_sum
    intro i hi
    calc
      alpha i * mass i ≤ 1 * mass i :=
        mul_le_mul_of_nonneg_right (ha1 i hi) (hmass i hi)
      _ = mass i := by ring
  · apply Finset.sum_le_sum
    intro i hi
    have hcomp1 : 1 - alpha i ≤ 1 := by linarith [ha0 i hi]
    calc
      (1 - alpha i) * mass i ≤ 1 * mass i :=
        mul_le_mul_of_nonneg_right hcomp1 (hmass i hi)
      _ = mass i := by ring


/--
A single packaged finite-fiber budget: each component is nonnegative, neither
component exceeds the source total, and their sum is exactly the source total.
This is a reusable algebraic interface for a later source-faithful geometric
fiber model; it does not itself construct BBMST's probability spaces.
-/
theorem finite_fiber_mass_budget
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    (mass alpha : ι → ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (ha0 : ∀ i ∈ s, 0 ≤ alpha i)
    (ha1 : ∀ i ∈ s, alpha i ≤ 1) :
    (0 ≤ ∑ i ∈ s, alpha i * mass i) ∧
    (∑ i ∈ s, alpha i * mass i ≤ ∑ i ∈ s, mass i) ∧
    (0 ≤ ∑ i ∈ s, (1 - alpha i) * mass i) ∧
    (∑ i ∈ s, (1 - alpha i) * mass i ≤ ∑ i ∈ s, mass i) ∧
    ((∑ i ∈ s, alpha i * mass i) +
      (∑ i ∈ s, (1 - alpha i) * mass i) = ∑ i ∈ s, mass i) := by
  have hparts := finite_fiber_mass_partition s mass alpha hmass ha0 ha1
  have hbounds := finite_fiber_mass_parts_le_total s mass alpha hmass ha0 ha1
  exact ⟨hparts.1, hbounds.1, hparts.2.1, hbounds.2, hparts.2.2⟩

#print axioms finite_fiber_mass_budget

/-- Uniform-envelope bound: if every local retained proportion is at most
`beta`, then the total retained mass is at most `beta` times the total
source mass. This is a useful interface for later distortion estimates;
it remains an algebraic statement and does not construct BBMST's geometric
conditional probabilities. -/
theorem finite_fiber_mass_le_uniform_envelope
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    (mass alpha : ι → ℚ) (beta : ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (halpha : ∀ i ∈ s, alpha i ≤ beta) :
    (∑ i ∈ s, alpha i * mass i) ≤ beta * (∑ i ∈ s, mass i) := by
  calc
    (∑ i ∈ s, alpha i * mass i) ≤
        ∑ i ∈ s, beta * mass i := by
      apply Finset.sum_le_sum
      intro i hi
      exact mul_le_mul_of_nonneg_right (halpha i hi) (hmass i hi)
    _ = beta * (∑ i ∈ s, mass i) := by
      rw [Finset.mul_sum]

#print axioms finite_fiber_mass_le_uniform_envelope


/-- Uniform-floor bound: if every local retained proportion is at least
`beta`, then the total retained mass is at least `beta` times the
source mass. Together with `finite_fiber_mass_le_uniform_envelope`, this
provides a two-sided squeeze whenever local proportions lie in a common
interval. It remains an algebraic interface, not a construction of BBMST's
geometric conditional probabilities. -/
theorem finite_fiber_mass_ge_uniform_floor
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    (mass alpha : ι → ℚ) (beta : ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (halpha : ∀ i ∈ s, beta ≤ alpha i) :
    beta * (∑ i ∈ s, mass i) ≤ (∑ i ∈ s, alpha i * mass i) := by
  calc
    beta * (∑ i ∈ s, mass i) =
        ∑ i ∈ s, beta * mass i := by
      rw [← Finset.mul_sum]
    _ ≤ ∑ i ∈ s, alpha i * mass i := by
      apply Finset.sum_le_sum
      intro i hi
      exact mul_le_mul_of_nonneg_right (halpha i hi) (hmass i hi)

#print axioms finite_fiber_mass_ge_uniform_floor


/- Explicit dependency audit for the conservation identities. -/
#print axioms fiber_mass_split
#print axioms fiber_mass_split_zero
#print axioms fiber_mass_split_one
#print axioms finite_fiber_mass_split
#print axioms finite_mass_conservation
#print axioms finite_fiber_mass_parts_nonneg
#print axioms finite_fiber_mass_parts_variable_alpha_nonneg
#print axioms finite_fiber_mass_split_variable_alpha
#print axioms finite_variable_alpha_mass_conservation
#print axioms finite_fiber_mass_partition
#print axioms finite_fiber_mass_parts_le_total
#print axioms variable_alpha_fiber_conservation


/-- Two-sided finite-fiber squeeze. If each local retained proportion lies
between beta and gamma, then the total retained mass lies between the
same constants times the total source mass. This is the exact interface
needed before substituting source-derived bounds on geometric fibers. -/
theorem finite_fiber_mass_squeeze
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    (mass alpha : ι → ℚ) (beta gamma : ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (hlower : ∀ i ∈ s, beta ≤ alpha i)
    (hupper : ∀ i ∈ s, alpha i ≤ gamma) :
    beta * (∑ i ∈ s, mass i) ≤
        (∑ i ∈ s, alpha i * mass i) ∧
      (∑ i ∈ s, alpha i * mass i) ≤
        gamma * (∑ i ∈ s, mass i) := by
  exact ⟨
    finite_fiber_mass_ge_uniform_floor s mass alpha beta hmass hlower,
    finite_fiber_mass_le_uniform_envelope s mass alpha gamma hmass hupper
  ⟩

#print axioms finite_fiber_mass_squeeze


/-- The fibers of a map partition a finite sample set: summing the source
mass inside each fiber and then summing over the attained fiber labels
recovers the original total mass. Unlike the abstract pointwise split
lemmas above, this identity constructs the fibers from an actual map and
uses the finite partition theorem. -/
theorem finite_fiber_partition_mass_conservation
    {Ω Ι : Type*} [DecidableEq Ω] [DecidableEq Ι]
    (s : Finset Ω) (label : Ω → Ι) (mass : Ω → ℚ) :
    (∑ i ∈ s.image label,
      ∑ x ∈ s with label x = i, mass x) =
      ∑ x ∈ s, mass x := by
  classical
  exact Finset.sum_fiberwise_of_maps_to
    (fun x hx => Finset.mem_image_of_mem label hx) mass

/-- If all point masses are nonnegative, every fiber mass in the concrete
finite partition is nonnegative. This gives the positivity hypothesis
needed by the weighted-envelope estimates without postulating fiber masses
as unrelated data. -/
theorem finite_fiber_partition_mass_nonneg
    {Ω Ι : Type*} [DecidableEq Ω] [DecidableEq Ι]
    (s : Finset Ω) (label : Ω → Ι) (mass : Ω → ℚ)
    (hmass : ∀ x ∈ s, 0 ≤ mass x) :
    ∀ i ∈ s.image label,
      0 ≤ ∑ x ∈ s with label x = i, mass x := by
  intro i hi
  apply Finset.sum_nonneg
  intro x hx
  exact hmass x (Finset.mem_filter.mp hx).1

#print axioms finite_fiber_partition_mass_conservation
#print axioms finite_fiber_partition_mass_nonneg


/-- Weighted fiber decomposition for a genuine label map. A coefficient is
constant on each fiber, so multiplying each fiber's source mass by its
label-dependent coefficient is exactly the same as weighting each source
point by the coefficient of its own label and summing over the source set.
This is the concrete bridge needed to transfer a conditional fiber bound
into a global mass bound. -/
theorem finite_fiber_weighted_partition_mass
    {Ω Ι : Type*} [DecidableEq Ω] [DecidableEq Ι]
    (s : Finset Ω) (label : Ω → Ι)
    (mass : Ω → ℚ) (alpha : Ι → ℚ) :
    (∑ i ∈ s.image label,
      alpha i * (∑ x ∈ s with label x = i, mass x)) =
      ∑ x ∈ s, alpha (label x) * mass x := by
  classical
  calc
    (∑ i ∈ s.image label,
      alpha i * (∑ x ∈ s with label x = i, mass x)) =
        ∑ i ∈ s.image label,
          ∑ x ∈ s with label x = i, alpha (label x) * mass x := by
            apply Finset.sum_congr rfl
            intro i hi
            rw [Finset.mul_sum]
            apply Finset.sum_congr rfl
            intro x hx
            have hxi : label x = i := (Finset.mem_filter.mp hx).2
            rw [hxi]
    _ = ∑ x ∈ s, alpha (label x) * mass x := by
          exact Finset.sum_fiberwise_of_maps_to (s := s)
            (fun x hx => Finset.mem_image_of_mem label hx)
            (fun x => alpha (label x) * mass x)

#print axioms finite_fiber_weighted_partition_mass


/-- Concrete weighted-fiber upper bound: when the label-dependent weight is
at most beta on every source point and source masses are nonnegative, the
weighted sum over fibers is at most beta times the original mass. This
combines the map-derived fiber identity with a pointwise envelope, so the
fiber masses are not arbitrary independent variables. -/
theorem finite_fiber_weighted_partition_upper_bound
    {Ω Ι : Type*} [DecidableEq Ω] [DecidableEq Ι]
    (s : Finset Ω) (label : Ω → Ι)
    (mass : Ω → ℚ) (alpha : Ι → ℚ) (beta : ℚ)
    (hmass : ∀ x ∈ s, 0 ≤ mass x)
    (halpha : ∀ x ∈ s, alpha (label x) ≤ beta) :
    (∑ i ∈ s.image label,
      alpha i * (∑ x ∈ s with label x = i, mass x)) ≤
      beta * (∑ x ∈ s, mass x) := by
  rw [finite_fiber_weighted_partition_mass]
  calc
    (∑ x ∈ s, alpha (label x) * mass x) ≤
        ∑ x ∈ s, beta * mass x := by
          apply Finset.sum_le_sum
          intro x hx
          exact mul_le_mul_of_nonneg_right (halpha x hx) (hmass x hx)
    _ = beta * (∑ x ∈ s, mass x) := by
          rw [Finset.mul_sum]

/-- Concrete weighted-fiber lower bound, dual to the upper-envelope lemma. -/
theorem finite_fiber_weighted_partition_lower_bound
    {Ω Ι : Type*} [DecidableEq Ω] [DecidableEq Ι]
    (s : Finset Ω) (label : Ω → Ι)
    (mass : Ω → ℚ) (alpha : Ι → ℚ) (beta : ℚ)
    (hmass : ∀ x ∈ s, 0 ≤ mass x)
    (halpha : ∀ x ∈ s, beta ≤ alpha (label x)) :
    beta * (∑ x ∈ s, mass x) ≤
      (∑ i ∈ s.image label,
        alpha i * (∑ x ∈ s with label x = i, mass x)) := by
  rw [finite_fiber_weighted_partition_mass]
  calc
    beta * (∑ x ∈ s, mass x) =
        ∑ x ∈ s, beta * mass x := by
          rw [Finset.mul_sum]
    _ ≤ ∑ x ∈ s, alpha (label x) * mass x := by
          apply Finset.sum_le_sum
          intro x hx
          exact mul_le_mul_of_nonneg_right (halpha x hx) (hmass x hx)

#print axioms finite_fiber_weighted_partition_upper_bound
#print axioms finite_fiber_weighted_partition_lower_bound


/-- Map-derived two-sided weighted-fiber squeeze. If every attained label's
coefficient lies between beta and gamma on the source points, then the
actual sum over fibers is bounded by beta and gamma times total source
mass. This packages the partition identity and both monotone bounds into
one interface for later geometric conditional-probability estimates. -/
theorem finite_fiber_weighted_partition_squeeze
    {Ω Ι : Type*} [DecidableEq Ω] [DecidableEq Ι]
    (s : Finset Ω) (label : Ω → Ι)
    (mass : Ω → ℚ) (alpha : Ι → ℚ) (beta gamma : ℚ)
    (hmass : ∀ x ∈ s, 0 ≤ mass x)
    (hlower : ∀ x ∈ s, beta ≤ alpha (label x))
    (hupper : ∀ x ∈ s, alpha (label x) ≤ gamma) :
    beta * (∑ x ∈ s, mass x) ≤
        (∑ i ∈ s.image label,
          alpha i * (∑ x ∈ s with label x = i, mass x)) ∧
      (∑ i ∈ s.image label,
          alpha i * (∑ x ∈ s with label x = i, mass x)) ≤
        gamma * (∑ x ∈ s, mass x) := by
  exact ⟨
    finite_fiber_weighted_partition_lower_bound
      s label mass alpha beta hmass hlower,
    finite_fiber_weighted_partition_upper_bound
      s label mass alpha gamma hmass hupper
  ⟩

#print axioms finite_fiber_weighted_partition_squeeze



/--
If a finite sum of nonnegative rational masses is zero, every summand is
zero. This is the key ratio-free fact for a zero-mass fiber: no conditional
probability is defined and no division by zero is used.
-/
theorem zero_sum_nonneg_forces_terms_zero
    {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass : ι → ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (hsum : (∑ i ∈ s, mass i) = 0) :
    ∀ i ∈ s, mass i = 0 := by
  intro i hi
  have hle : mass i ≤ ∑ j ∈ s, mass j :=
    Finset.single_le_sum (fun j hj => hmass j hj) hi
  have hupper : mass i ≤ 0 := by simpa [hsum] using hle
  exact le_antisymm hupper (hmass i hi)

/--
Zero total mass on a fiber forces every point mass in that fiber to vanish.
The fiber is induced by an actual label map; its members are filtered from
the original finite sample set rather than supplied as independent data.
-/
theorem zero_mass_fiber_forces_point_masses_zero
    {Ω Ι : Type*} [DecidableEq Ω] [DecidableEq Ι]
    (s : Finset Ω) (label : Ω → Ι) (mass : Ω → ℚ)
    (hmass : ∀ x ∈ s, 0 ≤ mass x) (i : Ι)
    (hzero : (∑ x ∈ s with label x = i, mass x) = 0) :
    ∀ x ∈ s.filter (fun x => label x = i), mass x = 0 := by
  exact zero_sum_nonneg_forces_terms_zero
    (s := s.filter (fun x => label x = i))
    (mass := mass)
    (by
      intro y hy
      exact hmass y (Finset.mem_filter.mp hy).1)
    (by simpa using hzero)

#print axioms zero_sum_nonneg_forces_terms_zero
#print axioms zero_mass_fiber_forces_point_masses_zero


/--
A zero-mass fiber contributes zero to every pointwise weighted sum.
This lets later conditional-measure arguments handle the zero-denominator
case without defining a ratio or dividing by the fiber mass.
-/
theorem zero_mass_fiber_weighted_sum_zero
    {Ω Ι : Type*} [DecidableEq Ω] [DecidableEq Ι]
    (s : Finset Ω) (label : Ω → Ι) (mass weight : Ω → ℚ)
    (hmass : ∀ x ∈ s, 0 ≤ mass x) (i : Ι)
    (hzero : (∑ x ∈ s with label x = i, mass x) = 0) :
    (∑ x ∈ s with label x = i, weight x * mass x) = 0 := by
  have hpoint := zero_mass_fiber_forces_point_masses_zero
    s label mass hmass i hzero
  apply Finset.sum_eq_zero
  intro x hx
  have hx' : x ∈ s.filter (fun y => label y = i) := by
    simp only [Finset.mem_filter]
    exact ⟨(Finset.mem_filter.mp hx).1, (Finset.mem_filter.mp hx).2⟩
  rw [hpoint x hx']
  ring

#print axioms zero_mass_fiber_weighted_sum_zero


/--
Concrete predicate split: a finite source set is partitioned by a predicate
into removed and retained contributions. Unlike an abstract alpha-split,
the two parts are determined pointwise by the actual predicate, and the
identity holds without any denominator or positivity assumptions.
-/
theorem finite_predicate_mass_partition
    {Ω : Type*} [DecidableEq Ω]
    (s : Finset Ω) (mass : Ω → ℚ) (removed : Ω → Prop)
    [DecidablePred removed] :
    (∑ x ∈ s, (if removed x then mass x else 0)) +
      (∑ x ∈ s, (if removed x then 0 else mass x)) =
      ∑ x ∈ s, mass x := by
  classical
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro x hx
  by_cases h : removed x <;> simp [h]

/-- Scalar distortion inequality used in the BBMST measure update. The denominator is explicitly positive, so division by zero is excluded. -/
theorem max_sub_le_sq_div
    (a b : ℚ) (ha : 0 ≤ a) (hb : 0 < b) :
    max (a - b) 0 ≤ a ^ 2 / (4 * b) := by
  by_cases hab : a ≤ b
  · rw [max_eq_right (sub_nonpos.mpr hab)]
    positivity
  · have hba : b < a := lt_of_not_ge hab
    rw [max_eq_left (sub_nonneg.mpr (le_of_lt hba))]
    have hden : 0 < (4 : ℚ) * b := by positivity
    apply (le_div_iff₀ hden).2
    nlinarith [sq_nonneg (a - 2 * b)]

#print axioms max_sub_le_sq_div

/--
A concrete covered-fraction bound derived from finite cardinalities, not
postulated as an abstract real-valued parameter. If t is a subset of a
nonempty finite coordinate set s, then its normalized cardinality lies
in [0,1]. This is the elementary incidence-count interface needed before
the geometric definition of BBMST's alpha_k can be substituted.
-/
theorem finite_card_ratio_mem_unit_interval
    {Ω : Type*} [DecidableEq Ω]
    (s t : Finset Ω) (hts : t ⊆ s) (hs : s.Nonempty) :
    0 ≤ (t.card : ℚ) / (s.card : ℚ) ∧
      (t.card : ℚ) / (s.card : ℚ) ≤ 1 := by
  have hden : (0 : ℚ) < (s.card : ℚ) := by
    exact_mod_cast hs.card_pos
  have hnum : (t.card : ℚ) ≤ (s.card : ℚ) := by
    exact_mod_cast Finset.card_le_card hts
  constructor
  · exact div_nonneg (by positivity) (le_of_lt hden)
  · exact (div_le_one₀ hden).2 hnum

#print axioms finite_card_ratio_mem_unit_interval


/--
A strictly positive point mass forces strictly positive total mass.
This is the denominator-safety direction complementary to
zero_sum_nonneg_forces_terms_zero: a fiber containing a positive-mass point
cannot be a zero-mass fiber.
-/
theorem positive_point_mass_forces_positive_total
    {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (mass : ι → ℚ)
    (hmass : ∀ i ∈ s, 0 ≤ mass i)
    (i : ι) (hi : i ∈ s) (hpos : 0 < mass i) :
    0 < ∑ j ∈ s, mass j := by
  have hle : mass i ≤ ∑ j ∈ s, mass j :=
    Finset.single_le_sum (fun j hj => hmass j hj) hi
  exact lt_of_lt_of_le hpos hle

#print axioms positive_point_mass_forces_positive_total

end BBMSTFiberMassCore

/--
A concrete obstruction to any BBMST argument that uses only the mean of the
fiber proportions: equal weights on proportions 0 and 1 have mean 1/2 but
zero interior mass sum alpha*(1-alpha). Thus a positive lower bound on
interior mass cannot follow from the mean alone; a variance/geometric input
is indispensable.
-/
theorem two_point_mean_does_not_force_positive_interior_mass :
    ((1 / 2 : ℚ) + 1 / 2 = 1) ∧
    ((1 / 2 : ℚ) * 0 + (1 / 2) * 1 = 1 / 2) ∧
    ((1 / 2 : ℚ) * (0 : ℚ) * (1 - 0) +
      (1 / 2 : ℚ) * (1 : ℚ) * (1 - 1) = 0) := by
  norm_num

#print axioms two_point_mean_does_not_force_positive_interior_mass


/--
Finite weighted variance identity over rational proportions. If the weights
sum to one, then the weighted interior mass is mean*(1-mean) minus the
weighted variance. This is an algebraic identity only; it does not assert
that the variance is small enough to make the interior mass positive.
-/
theorem finite_weighted_variance_identity
    {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (w a : ι → ℚ)
    (hw : (∑ i ∈ s, w i) = 1) :
    (∑ i ∈ s, w i * a i * (1 - a i)) =
      (∑ i ∈ s, w i * a i) *
        (1 - (∑ i ∈ s, w i * a i)) -
      (∑ i ∈ s, w i * (a i - (∑ j ∈ s, w j * a j)) ^ 2) := by
  classical
  let μ : ℚ := ∑ i ∈ s, w i * a i
  have hmean : (∑ i ∈ s, w i * a i) = μ := rfl
  have hvariance :
      (∑ i ∈ s, w i * (a i - μ) ^ 2) =
        (∑ i ∈ s, w i * (a i) ^ 2) - μ ^ 2 := by
    calc
      (∑ i ∈ s, w i * (a i - μ) ^ 2)
          = (∑ i ∈ s, (w i * (a i) ^ 2 - 2 * μ * (w i * a i) +
              w i * μ ^ 2)) := by
                apply Finset.sum_congr rfl
                intro i hi
                ring
      _ = (∑ i ∈ s, w i * (a i) ^ 2) -
            2 * μ * (∑ i ∈ s, w i * a i) +
            μ ^ 2 * (∑ i ∈ s, w i) := by
              simp_rw [Finset.sum_add_distrib, Finset.sum_sub_distrib]
              simp_rw [← Finset.mul_sum]
              ring
      _ = (∑ i ∈ s, w i * (a i) ^ 2) - μ ^ 2 := by
              rw [hw, hmean]
              dsimp [μ]
              ring
  calc
    (∑ i ∈ s, w i * a i * (1 - a i))
        = μ - (∑ i ∈ s, w i * (a i) ^ 2) := by
            rw [← Finset.sum_sub_distrib]
            simp_rw [mul_sub]
            simp_rw [Finset.sum_sub_distrib]
            dsimp [μ]
            ring
    _ = μ * (1 - μ) - (∑ i ∈ s, w i * (a i - μ) ^ 2) := by
          rw [hvariance]
          rw [hw]
          dsimp [μ]
          ring
    _ = (∑ i ∈ s, w i * a i) *
          (1 - (∑ i ∈ s, w i * a i)) -
        (∑ i ∈ s, w i * (a i - (∑ j ∈ s, w j * a j)) ^ 2) := by
          dsimp [μ]

#print axioms finite_weighted_variance_identity
