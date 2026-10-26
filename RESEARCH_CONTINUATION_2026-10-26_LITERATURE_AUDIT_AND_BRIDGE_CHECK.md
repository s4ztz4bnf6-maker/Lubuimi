# Research continuation III — literature audit and falsification of proposed bridges

Date: 2026-10-26

Status: research/audit note only. No new global theorem is claimed. This note records which proposed steps are sound, which implications remain unsupported, and the next proof obligations.

## 1. BBMST / Erdős–Selfridge: correct literature alignment

The original minimum-modulus problem for distinct covering systems was solved by Bob Hough in 2015: the least modulus is at most 10^16. Balister, Bollobás, Morris, Sahasrabudhe and Tiba later developed related methods and improved that bound to 616000 in their work on the Erdős covering problem. These are related but distinct results.

The square-free Erdős–Selfridge theorem is the 2021 paper by Balister, Bollobás, Morris, Sahasrabudhe and Tiba, *The Erdős–Selfridge problem with square-free moduli*, Algebra & Number Theory 15 (2021), 609–626. Its conclusion is that a covering system with distinct square-free moduli cannot have all moduli odd: at least one modulus must be even.

References:
- Hough, *Solution of the minimum modulus problem for covering systems* (Annals of Mathematics, 2015): https://annals.math.princeton.edu/2015/181-1/p06
- BBMST, *The Erdős–Selfridge problem with square-free moduli* (2021): https://doi.org/10.2140/ant.2021.15.609
- Public full text: https://par.nsf.gov/servlets/purl/10300177
- BBMST, *On the Erdős covering problem: the density of the uncovered set* (Inventiones Mathematicae, 2022): https://doi.org/10.1007/s00222-021-01087-5

### Source-grounded geometry

For square-free moduli, factor the moduli into distinct primes p₁,…,pₙ and use the finite product Q = ∏ᵢ {1,…,pᵢ}. Associate a progression a + dℤ with a coordinate hyperplane: coordinate i is fixed to a mod pᵢ when pᵢ divides d, and is unrestricted otherwise. Distinct square-free moduli yield distinct non-parallel hyperplanes in this product model. This is the source bridge to formalize, not an arbitrary affine-linear model over one finite field.

### Unsupported implications in the proposed method

1. **Rank-nullity does not imply strict interior mass.** The identity dim ker A + rank A = dim V does not show that a removed subset of a fiber is nonempty and proper, or that the fiber has positive probability under the evolving measure.
2. **Bézout is not automatically applicable.** A bound for algebraic varieties over a field does not directly yield the needed probability or fiber-positivity inequality for a finite product of coordinate sets. A precise algebraic encoding and a proved transfer theorem would be required.
3. **The proposed “fiber degeneracy degree” and “transversal positivity bound” are not yet mathematical statements.** Their definitions and bounds were left blank; the stated rank condition has not been shown to imply a strict inequality. They cannot be inserted as Lean assumptions.
4. **Non-parallelity alone is not a positivity proof.** It is a structural property used in the source argument, but a separate theorem must connect it to the specific mass or covering inequality needed at the current stage.

### Sound narrower route

The existing finite-set lemma proves that if t is a nonempty proper subset of a nonempty finite fiber s, then 0 < |t|/|s| < 1. With positive fiber mass m, it follows that (|t|/|s|)(1 - |t|/|s|)m > 0. This is a valid local certificate.

To use it in BBMST, derive from the actual source construction that a relevant fiber has all required properties, and that its contribution enters the target sum with the correct normalization and nonnegative remainder. If the construction does not supply such a proper fiber, return to the source's moment/variance argument rather than postulating a transversal theorem.

### Immediate formalization target

Formalize the finite product Q, the progression-to-hyperplane map, and the exact correspondence between coverage of ℤ and coverage of Q, retaining square-freeness and nontriviality conditions. Then connect the source lemma to the existing finite mass core. Do not generalize beyond square-free moduli without a separate proof.

## 2. Syracuse / Collatz: exact bridge still missing

### Tao's theorem, stated precisely

Terence Tao's 2019 result proves that for every function f(N) tending to infinity, the minimum value attained on the Collatz orbit is less than f(N) for almost all starting values N, in logarithmic density. This is a powerful almost-all result, not the universal Collatz conjecture. A logarithmic-density-zero exceptional set can still contain infinitely many integers, so it does not guarantee descent for every individual start.

References:
- Tao, *Almost all orbits of the Collatz map attain almost bounded values*: https://arxiv.org/abs/1909.03562
- Tao's exposition: https://terrytao.wordpress.com/2019/09/10/almost-all-collatz-orbits-attain-almost-bounded-values/

### Exact algebra already in the repository

For a prescribed chain satisfying 2^(aⱼ)nⱼ₊₁ = 3nⱼ + 1, the current SyracuseAffineCore.lean proves the finite-prefix identity
2^Aᴺ nᴺ = 3ᴺ n₀ + Cᴺ,
where Aᴺ = Σⱼ₍ₙ₎ aⱼ, C₀ = 0 and Cⱼ₊₁ = 3Cⱼ + 2^Aʲ.

Unrolling the recurrence gives
Cᴺ = Σⱼ₌₀ⁿ⁻¹ 3^(N−1−j) 2^Aʲ.
The closed form follows by induction. It is a useful next formal lemma, but it remains conditional algebra until the exponents and states are tied to the actual accelerated Syracuse map.

Strict descent is equivalent to
(2^Aᴺ − 3ᴺ)n₀ > Cᴺ.
Thus Aᴺ > N log₂ 3 makes the coefficient positive, but does not by itself establish this inequality. The additive term must still be controlled for the actual starting value and actual valuation block.

### Unsupported implications in the proposed method

1. **Ryll-Nardzewski does not yield the asserted conclusion by itself.** An invariant-measure theorem on a compact dynamical system does not automatically produce an integer descent bound or prove Collatz convergence. The claimed chain from bounded Cᴺ to a 2-adic ergodic cycle and then a contradiction has not been justified.
2. **The “Bohm–Sontacchi” step needs a precise theorem and hypotheses.** No theorem statement was supplied that entails the proposed contradiction. It must not be used as a black box without verifying its exact statement and applicability.
3. **The proposed potential Φ is not defined.** A Lyapunov potential needs an explicit formula, domain, and a proved monotonicity or block-decrease property. λ = log₂ 3 alone does not define such a function.
4. **The determinant claim is unsupported.** No transition matrix or determinant is defined, and a negative determinant would not by itself imply integer descent.
5. **A 2-adic cylinder does not force archimedean descent by itself.** It can encode a finite valuation prefix, but the exact inequality for the actual integer representatives must still be established. Finite residue checking helps only with a uniform bound for all representatives or an exhaustive treatment of the remaining finite cases.
6. **An arbitrary exponent word is not necessarily realizable.** Exact valuations aⱼ = v₂(3nⱼ + 1), oddness, quotient integrality, and compatibility of successive transitions must be proved.

### Sound narrower route

First prove the recurrence-unrolling identity for Cᴺ. Then formalize a conditional block theorem: if a genuine Syracuse block of length N satisfies (2^Aᴺ − 3ᴺ)n₀ > Cᴺ, its endpoint is strictly below n₀. The hard theorem is then isolated: prove every odd n₀ > 1 has a realized block satisfying this inequality, or prove another well-founded invariant. Neither the affine identity nor Tao's almost-all theorem closes that global obstacle.

## 3. Reliability and formalization protocol

The methodological lesson from Hales/Tao's 2026 discussion is that formal verification is a strong proof check, not a substitute for source fidelity or foundational scrutiny:
https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/

For every milestone, record separately: exact theorem and source; assumptions including square-freeness, nontriviality, positivity and exact valuation conditions; whether data are arbitrary or constructed from the original problem; whether the result is local, finite-block, almost-all or universal; actual Lean/Mathlib version and build output; transitive axiom output; and all remaining admitted placeholders.

A successful build certifies the formal statement under the kernel's foundations. It does not establish that the statement matches the intended research theorem unless that correspondence is also proved.

## 4. Next actions

### BBMST
1. Formalize the source's finite product and progression-to-hyperplane correspondence with square-free moduli.
2. Prove the finite-product coverage equivalence.
3. Identify the exact source lemma connecting hyperplane structure to the required uncovered/positive-mass conclusion.
4. Connect that lemma to the existing fiber-mass core without assuming the needed positivity.

### Syracuse
1. Prove the recurrence-unrolling identity for Cᴺ.
2. Prove the conditional strict-descent theorem from the affine identity.
3. Formalize exact valuation/cylinder realizability separately from arbitrary exponent words.
4. Search for a uniform block theorem or well-founded potential; do not infer it from average drift, compactness or almost-all results.

No global solution is claimed by this note. Its contribution is to replace unproved proposed bridges with exact, auditable obligations and preserve the valid local work.
