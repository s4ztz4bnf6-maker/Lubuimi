# Two exact identities for the Collatz/BBMST research tracks

Date: 2026-10-25

This note records elementary deductions useful for proof design. They are not global solutions and have not been Lean-compiled.

## A. Exact length of an initial run of Syracuse valuation one

Let n_0 be a positive odd integer and define the accelerated odd Syracuse orbit while applicable by
  n_{j+1} = (3 n_j + 1) / 2^{a_j},   a_j = v₂(3 n_j + 1).
Then for every integer r ≥ 1, the first r valuations are all equal to one if and only if
  n_0 ≡ -1 (mod 2^{r+1}).

Proof:
If a_j = 1, then n_{j+1} = (3n_j+1)/2, hence
  n_{j+1}+1 = 3(n_j+1)/2.
Iterating for j < r gives
  n_j+1 = 3^j (n_0+1)/2^j
for all j ≤ r. Since 3^j is odd, v₂(n_j+1) = v₂(n_0+1)-j. For an odd n_j, the condition a_j=1 is equivalent to n_j ≡ 3 (mod 4), equivalently 4 divides n_j+1. Therefore a_j=1 for every j=0,...,r-1 exactly when v₂(n_0+1)-j ≥ 2 for every such j, which is equivalent to v₂(n_0+1) ≥ r+1, i.e. n_0 ≡ -1 mod 2^(r+1).

The converse follows by the same valuation calculation, inductively. In particular, the maximal initial run length of valuation-one steps is exactly v₂(n_0+1)-1.

Research value: this gives an exact arithmetic description of a potentially long run of locally negative corrections. It is not a counterexample mechanism by itself: the congruence class has relative density 2^(-r) among odd integers, and after the run ends the later weighted correction still must be controlled. Any global argument must account for both the rarity of such cylinders and the magnitude/position of their contributions.

## B. Exact variance identity for the BBMST moment gap

Let p_i ≥ 0 with Σ_i p_i = 1, and let α_i ∈ [0,1]. Define μ = Σ_i p_i α_i and Var_p(α) = Σ_i p_i(α_i-μ)^2. Then
  Σ_i p_i α_i(1-α_i) = μ(1-μ) - Var_p(α).

Proof:
The left side is Σ p_i α_i - Σ p_i α_i² = μ - Σ p_i α_i². Expanding variance gives Var_p(α)=Σ p_i α_i²-μ². Substitution yields μ - (Var_p(α)+μ²)=μ(1-μ)-Var_p(α).

Research value: the first/second moment gap can be viewed as a Bernoulli-envelope term μ(1-μ) diminished by the dispersion of the fiber parameters. Thus a lower bound on the gap can come from either (i) mass concentrated away from endpoints with a controlled spread, or (ii) a direct lower bound on interior fiber mass. Merely controlling the mean μ is insufficient, since variance can consume the entire μ(1-μ) term. The geometric BBMST argument must supply the missing control; this identity does not replace it.
