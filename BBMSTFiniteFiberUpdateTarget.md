# BBMST next formalization target: finite-fiber update

Status: specification and proof plan; not a Lean theorem and not a substitute for the paper's Lemma 2.1.

## Finite model

Let X = X₀ × S be a finite product space, with S nonempty. For each base point x : X₀, let Bₓ ⊆ S be the covered fiber and put αₓ = |Bₓ|/|S|. Assume 0 < δ < 1.

For a nondegenerate fiber 0 < αₓ < 1, define cₓ = max(0, (αₓ - δ)/(αₓ(1-δ))) on Bₓ, and uₓ = min(1/(1-αₓ), 1/(1-δ)) on S  Bₓ.

The already formalized scalar identity αₓ cₓ + (1-αₓ)uₓ = 1 is only the fiber-total normalization. The finite-space proof must additionally identify the actual updated point mass and sum it over fibers.

## The right next lemma (not yet formalized)

For any function f : X₀ → ℚ, whose lifted set is constant on each fiber, the update preserves its mass:

  ∑ x∈X₀ ∑ y∈S f(x) * updateWeight(x,y) / (|X₀| |S|) = ∑ x∈X₀ f(x)/|X₀|.

This follows by rewriting the inner sum as f(x) * (αₓ cₓ + (1-αₓ)uₓ) and applying normalization for 0 < αₓ < 1.

## Endpoint-safe design

Do not define a multiplier by dividing through αₓ or 1-αₓ at the endpoints:
- if αₓ = 0, the covered fiber is empty and only the uncovered mass matters;
- if αₓ = 1, the uncovered fiber is empty and only the covered mass matters.

Implement the update weight as a piecewise function on the point-membership predicate, with endpoint branches that never evaluate the absent part's multiplier. Then prove, in order:
1. each fiber's total updated mass equals its old mass;
2. masses of sets determined by the base coordinates are preserved;
3. pointwise updated mass is at most the old mass divided by (1-δ);
4. on the covered region, pointwise mass does not increase;
5. only then connect the finite sums to the paper's Pₖ and moment notation.

## Audit boundary

This does not yet establish the geometric assumptions on hyperplanes, the codimension-one reduction in the second-moment argument, the positive deficit required by the sieve criterion, or the final Erdős–Selfridge statement. No geometric hypothesis should be hidden inside an unconstrained Boolean such as noCodimOne.
