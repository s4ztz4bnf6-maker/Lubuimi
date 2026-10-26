# Parallel research continuation: descent certificates and cylinder mass

Date: 2026-10-23

This note records the next mathematically meaningful bridge for both projects. It is a research design, not a claim that either global conjecture is solved or that a Lean build has passed.

## A. Syracuse: turn every failed block into an obstruction

For an exact accelerated-Syracuse valuation word a_0,...,a_{k-1}, define
A_k = sum_{i<k} a_i and C_0 = 0, C_{k+1} = 3 C_k + 2^{A_k}.
The affine identity is
2^{A_k} n_k = 3^k n_0 + C_k.
Put D_k = 2^{A_k} - 3^k. Whenever D_k > 0,
n_k < n_0 iff D_k n_0 > C_k iff n_0 >= floor(C_k / D_k) + 1.

This yields a useful dual-certificate viewpoint:
- A descent certificate is a realized prefix with D_k > 0 and n_0 > floor(C_k/D_k).
- A non-descent prefix with D_k > 0 imposes the exact obstruction n_0 <= floor(C_k/D_k).
- Prefixes with D_k <= 0 are not descent certificates; they must not be silently counted as failures that can be repaired by increasing k.

For a fixed starting n_0, one can maintain two finite ledgers while exploring exact valuation prefixes: (i) the first witnessed descent, or (ii) the accumulated upper bounds on n_0 imposed by all positive-D prefixes that have failed to descend. If a failed-prefix bound falls below the candidate n_0, the branch is inconsistent and can be pruned. This is more informative than a bare search for a descent because every rejected branch has a checkable arithmetic reason.

The critical unresolved theorem is global coverage: prove that every odd n_0>1 has a realizable valuation prefix whose positive-D threshold is crossed, or prove that an infinite non-descending path is impossible by a well-founded invariant. Finite residue enumeration alone does not establish this unless the abstraction is proved to represent all exact valuation words, including arbitrarily large valuations. A possible next formal interface is a certificate type carrying (word, A_k, C_k, D_k, positivity proof, threshold proof), plus a separate soundness theorem from the exact Syracuse recurrence. A search procedure can discover certificates; only the soundness and coverage theorems can establish universal descent.

### Research comparison and limit

Tao's result proves that almost all Collatz orbits attain arbitrarily slowly growing bounds in logarithmic density, using a first-passage stabilization theorem, 3-adic distribution, and Fourier decay. It is not a universal descent theorem. The productive lesson is to separate a local exact certificate from a distributional theorem; replacing the latter with universal coverage is the main open gap, not a bookkeeping detail.

## B. BBMST: cylinder mass as a finite-sum factorization theorem

Let X_i be finite nonempty coordinate spaces and w_i normalized nonnegative coordinate weights. Let W(x)=prod_i w_i(x_i). For a cylinder H fixing coordinates F to values v_i, define its indicator coordinatewise:
I_i(y) = 1 if i in F and y=v_i, 0 if i in F and y!=v_i, and 1 if i not in F.
Then
1_H(x) = prod_i I_i(x_i),
and the desired cylinder formula is
sum_x W(x) 1_H(x) = prod_i sum_{y in X_i} w_i(y) I_i(y)
= prod_{i in F} w_i(v_i).
The last equality is precisely where fixed coordinates contribute their prescribed weight and free coordinates contribute 1 by normalization.

The proof should be split into three separately auditable lemmas:
1. Filter-to-indicator: the finite filtered sum defining eventMass is equal to the unrestricted sum of W(x) times the cylinder indicator.
2. Product-sum factorization: sum over the finite dependent product of the product of coordinate functions equals the product of the coordinate sums. Prefer the concrete Fin n/coordinate-subtype model already used in BBMSTGeometryTest.lean; the earlier generic dependent-Pi attempt failed during elaboration because Lean could not synthesize the finite instance early enough.
3. Coordinate evaluation: fixed coordinate sums are w_i(v_i); free coordinate sums are 1.

For two cylinders H and K, apply the same formula to their union of fixed-coordinate sets only after proving agreement on overlap. A disagreement on a shared coordinate gives an empty intersection and hence zero mass. If they agree, each shared coordinate is counted once, not twice. Independence does not imply that arbitrary overlapping cylinders have product intersection mass; the product formula is over the combined constraints.

### Research comparison and limit

The BBMST/Hough distortion method does not stop at a product-measure identity. It constructs stage-dependent measures concentrated on uncovered points and controls how the measure distorts as progressions/hyperplanes are exposed. The cylinder identity is foundational infrastructure, not the quantitative theorem. The next genuine frontier after it is a source-faithful bound on the stage likelihood ratio or conditional coordinate weights, with constants sharp enough to make the surviving mass stay positive. Generic pointwise domination is only a transfer lemma; it does not manufacture the needed distortion estimate.

## Status discipline

A green CI run is evidence only for the steps actually completed. A Lean compilation is not automatically an axiom audit, and neither local descent certificates nor finite-product identities imply the global Erdős–Selfridge or Syracuse conjecture. Record separately: source change, compile status, #print axioms, and mathematical scope.


## 2026-10-23 follow-up: research-derived alternative routes

### Syracuse: what the strongest established result does and does not give us

Tao's 2022 paper proves that almost every starting value (in logarithmic density) has an orbit reaching below any prescribed function tending to infinity. The proof route is not a uniform pointwise descent lemma: it uses stabilization of a first-passage random variable, 3-adic distribution, and Fourier decay for a skew random walk. Reference: https://www.cambridge.org/core/journals/forum-of-mathematics-pi/article/almost-all-orbits-of-the-collatz-map-attain-almost-bounded-values/1008CC2DF91AF87F66D190C5E01C907F

This identifies the precise transfer gap for our deterministic certificates: an affine-prefix obstruction bounds a start value for one realized valuation word, but it does not control the distribution or coverage of all realized words. Proposed alternative architecture:
1. Keep the current exact affine identity as a deterministic certificate layer.
2. Add a finite-modulus/valuation-word layer recording which prefixes are genuinely realizable, rather than treating exponent words as independent symbols.
3. Investigate whether a quantitative distribution statement over residue classes can bound the measure of starts that avoid all certified descent prefixes.
4. Keep the exceptional set explicit. An almost-all result, even if formalized, is not the universal Collatz conjecture.

The relevant frontier is not another local congruence lemma by itself. It is a coverage/transport theorem connecting exact finite prefixes to all starting values. Tao's Fourier/mixing machinery explains why this is difficult: local residue facts do not supply the high-frequency decay or first-passage stabilization needed for global statistical conclusions.

### BBMST: translate distortion into a verifiable likelihood-ratio obligation

The Hough/BBMST distortion method is designed to control how probability mass changes while avoiding progressions are exposed; it is not a consequence of product-measure normalization alone. The published overview explicitly presents distortion as a general method and reports the reduction of the minimum-modulus bound. References: https://doi.org/10.1007/s10474-020-01048-z and https://doi.org/10.1007/s00222-021-01087-5

Our finite-product factorization and cylinder-mass identity should therefore be treated as the exact base case, not the main theorem. For a stage transition from measure mu_j to mu_(j+1), the proof obligation should be stated as a pointwise or conditional likelihood-ratio bound with explicit constants. Compose the bounds only after proving each stage constant from the actual BBMST geometry. If a useful pointwise bound fails, the alternative is to partition states into good/bad distortion classes and bound the total mass of the bad class; this is a research proposal, not an established theorem.

### Current engineering consequence

The generic dependent-Pi factorization now explicitly asks Lean for the Fintype instance on the Pi type. This fixes the elaboration boundary at the theorem signature, but does not certify that the theorem compiles. The CI and axiom audit remain the authority. The latest Syracuse change also corrected the floor-bound type to state n0 <= C_k / D_k as a single Nat inequality.

