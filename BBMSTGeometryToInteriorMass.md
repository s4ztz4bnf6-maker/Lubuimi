# BBMST: geometry-to-interior-mass proof obligations

Date: 2026-10-26
Branch: audit/lean4-erdos-selfridge

## Source-checked geometric structure

Primary source: Balister–Bollobás–Morris–Sahasrabudhe–Tiba, *The Erdős–Selfridge problem with square-free moduli*, Algebra & Number Theory 15 (2021), Section 2.1 and Section 3, DOI 10.2140/ant.2021.15.609.

Let Q_k = S_1 × ... × S_k. Each hyperplane A_F fixes one value in each coordinate in its nonempty fixed-coordinate set F ⊆ [k]. Nonparallelity means distinct hyperplanes have distinct fixed-coordinate sets. At stage k, the newly exposed family N_k consists of fixed sets containing k, and B_k = ⋃_{F∈N_k} A_F. For each prefix x ∈ Q_{k-1},
[
\alpha_k(x)=\frac{|\{y\in S_k:(x,y)\in B_k\}|}{|S_k|}.
]

The crucial geometric fact used in the source's Theorem 3.2 is: for a fixed prefix x and a hyperplane A_F with k in F, there is at most one y such that (x,y) lies in A_F. Thus the union bound yields
[
\alpha_k(x)\le \frac1{|S_k|}\sum_{F\in N_k}1[x\in A_F^{[k-1]}].
]
For the second moment, expand the square. Every pair (F,G) contributes only when x lies in both projected hyperplanes, and the product of indicators is the indicator of their intersection. The weighted measure of that intersection must then be bounded using the already established propagation estimate for hyperplanes. This is the geometric origin of the c_{k-1}(3)/|S_k|² second-moment bound; it is not an abstract variance argument alone.

When no newly exposed hyperplane has codimension one, each F in N_k has at least two fixed coordinates. The source improves the second moment to
[
M_k^{(2)}\le \frac{c_{k-1}(3)-2c_{k-1}(1)+1}{|S_k|^2}.
]
The subtraction comes from excluding singleton fixed-coordinate sets, together with the corresponding first-moment terms. In the application, codimension-one hyperplanes are removed first: for each coordinate i and value s whose singleton hyperplane is present, remove s from S_i. The remaining hyperplanes are then interpreted on the reduced product, where every remaining fixed set has size at least two. The reduced coordinate sets must remain nonempty, and the cost of reducing their sizes must be included in every bound.

## What must be encoded, not assumed

1. A finite product model Q_k and a type of hyperplanes with explicit fixed-coordinate set and fixed values.
2. Nonparallelity as injectivity of the map from the hyperplane family to fixed-coordinate sets. Do not add a free predicate for parallelism or codimension one; define these from the data.
3. The projection A_F^[k-1] and proof that for k in F each prefix x has at most one compatible final coordinate y.
4. Finite union indicator bound for α, followed by the pair expansion for α².
5. A source-faithful estimate on the P_{k-1}-mass of projected hyperplanes and their intersections, proved by induction from the exact probability update in Lemma 2.1.
6. Codimension-one removal as a transformation of both the hyperplane family and the coordinate sets, plus preservation of coverage and the resulting lower bounds on coordinate sizes.
7. Only then, derive the moment bounds and connect them to the variance-gap/interior-mass interface.

## How the existing local positivity lemma fits

The current Lean theorem says that a nonempty proper removed subset of a finite fiber of size q contributes at least m/q² when the fiber has mass m>0. This is a correct local bound, but it does not produce:
- a fiber whose removed subset is nonempty and proper;
- a lower bound for that fiber's mass m;
- a global sum of such contributions strong enough to beat the sieve threshold.

The geometry-to-moment chain above is the route for deriving these facts from the actual hyperplane family. The local lemma is a downstream component, not a substitute for the geometric proof.

## Immediate next formalization target

Implement the finite hyperplane representation and prove the one-compatible-last-coordinate lemma. Then prove the union-bound and pair-expansion inequalities for α and α² as finite sums. This isolates the purely combinatorial geometry before bringing in the more delicate P_k update. The probability update and Lemma 2.1 remain a separate necessary layer; neither should be replaced by a free assertion about positive interior mass.

## Status

This file is a proof specification, not a Lean-checked theorem. The existing finite-fiber lower bound is in BBMSTProperFiberInterior.lean; its latest workflow for commit ce42a2d3 was still in progress at the time this note was written. No claim is made that the geometric bridge or the full BBMST theorem has been formalized.
