# Explicit finite next-valuation bound for nondecreasing Syracuse prefixes

**Status:** mathematical consequence of the existing signed-margin cap; the accompanying Lean declarations are in the parent PR #41 and remain subject to exact-head CI.

Let the exact odd Syracuse valuation word be a_0,a_1,..., with prefix sums
[
A_{j+1}=A_j+a_j,
]
and signed margin
[
D_j=\operatorname{signedOffsetMargin}(A,j).
]
The already formalized nondecreasing-endpoint implication gives the necessary inequality
[
2^{A_j+a_j}+3D_j\le 4\cdot 2^{A_j}.
\tag{1}
]

## A concrete integer cap

For any natural m, m < 2^m. Therefore
[
a_j\le A_j+a_j<2^{A_j+a_j}
\le 4\cdot 2^{A_j}-3D_j.
]
Consequently,
[
\boxed{a_j< R_j,\qquad
R_j:=4\cdot 2^{A_j}-3D_j.}
\tag{2}
]
In particular, (1) itself implies R_j>0. Thus every admissible next valuation belongs to the explicit finite set
[
\boxed{a_j\in\{0,1,\ldots,\operatorname{Int.toNat}(R_j)-1\}.}
\tag{3}
]
The actual Syracuse valuations are positive, so the value 0 can be omitted when constructing the child set.

The Lean candidate in PR #41 contains:
- next_exponent_lt_integer_bound, proving (2) from (1);
- nondecreasing_orbit_next_exponent_finite_bound, instantiating (2) for the actual orbit endpoint;
- next_exponent_mem_finite_range_of_cap, proving membership in the finite initial segment (3);
- nondecreasing_orbit_next_exponent_mem_finite_range, the orbit-instantiated finite-range theorem.

## What this does and does not prove

It proves **pointwise finite branching** of the nondecreasing-prefix tree: once a prefix state (A_j,D_j) is fixed, there are only finitely many next valuations compatible with nondecrease.

It does not give a uniform bound over all prefixes. It does not show that every branch terminates, does not exclude an infinite path through the finite children, and does not prove the Collatz conjecture. The remaining global task is to combine this local finite branching with a genuinely pathwise descent or a well-founded ranking argument. Density of valuation words alone is not such an argument.

This note preserves the previously verified cylinder, terminal-residue, and signed-margin results as separate components. No transfer between those components is asserted without an explicit proved map.
