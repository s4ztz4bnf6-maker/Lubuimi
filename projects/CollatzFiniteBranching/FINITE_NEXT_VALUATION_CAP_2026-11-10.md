# Explicit finite next-valuation bound for nondecreasing Syracuse prefixes

**Source candidate:** PR #46, exact head a89228c696e43dcf07ec1d6b6474162269df3d9a. The declarations are awaiting exact-head CI and axiom audit.

Let the exact odd Syracuse valuation word be a_0,a_1,..., with prefix sums
[
A_{j+1}=A_j+a_j,
]
and signed margin
[
D_j=\operatorname{signedOffsetMargin}(A,j).
]
The established nondecreasing-endpoint implication gives
[
2^{A_j+a_j}+3D_j\le 4\cdot 2^{A_j}.
\tag{1}
]

For every natural m, m < 2^m. Thus
[
a_j\le A_j+a_j<2^{A_j+a_j}
\le 4\cdot 2^{A_j}-3D_j.
]
Set
[
R_j:=4\cdot 2^{A_j}-3D_j.
]
Then
[
\boxed{a_j<R_j,\qquad R_j>0.}
\tag{2}
]
Equivalently,
[
\boxed{a_j\in\operatorname{Finset.range}(\operatorname{Int.toNat}(R_j)).}
\tag{3}
]

The PR #46 Lean candidate contains:
- next_exponent_lt_integer_bound;
- nondecreasing_orbit_next_exponent_finite_bound;
- next_exponent_mem_finite_range_of_cap;
- nondecreasing_orbit_next_exponent_mem_finite_range.

## Exact scope

This proves pointwise finite branching: once the current prefix state (A_j,D_j) is fixed, only finitely many next valuations are compatible with nondecrease.

It does **not** give a uniform bound over all prefixes, does not show that every branch terminates, does not exclude an infinite path through the finite children, and does not prove the Collatz conjecture. The global task remains a pathwise descent or a well-founded ranking argument. Statistical densities of valuation words alone do not supply that pointwise argument.

The previously verified all-one and general finite valuation-word cylinder theorems, terminal-residue energy calculations, and signed-margin lemmas remain separate established components. No transfer between those components is asserted without an explicit proved map.
