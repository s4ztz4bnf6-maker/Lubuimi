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
