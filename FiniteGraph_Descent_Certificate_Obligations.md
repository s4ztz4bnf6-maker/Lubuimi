# Finite affine transition graphs: what would actually imply global descent?

Status: research design note. This is not a proof of the Collatz conjecture.

## 1. Exact arithmetic and the sign of the offset

For an accelerated Syracuse trajectory with exact valuations (a_i=v_2(3n_i+1)), define
(A_k=\sum_{i<k}a_i) and
(C_0=0, C_{k+1}=3C_k+2^{A_k}). Then
[
2^{A_k}n_k=3^k n_0+C_k.
]
Consequently
[
n_k<n_0\iff C_k<(2^{A_k}-3^k)n_0.
]
The offset is a *cost* that must fit under the multiplicative margin. A lower bound such as
(2C_k+1\ge 3^k) is a necessary obstruction / quantitative cost estimate; it does not itself help establish descent. The useful certificate needs an upper bound on (C_k), or a lower bound on the margin strong enough to dominate the exact offset.

## 2. Finite graph is not yet a termination proof

A finite graph of residue families alone cannot rule out nontrivial cycles. It only makes cycle analysis finite if (i) every relevant integer has a soundly represented node, (ii) every actual trajectory transition is covered by an edge, and (iii) each edge's arithmetic relation is exact or soundly over-approximated.

A valid proof pipeline needs these obligations separately:
- **Coverage:** every positive odd (n>1) belongs to at least one certified source family.
- **Transition soundness:** the edge's target family contains the actual block endpoint, with the exact number of accelerated steps recorded.
- **Affine bound:** for each edge, prove (S(n)\le q_e n+b_e), with rational (q_e,b_e), from exact arithmetic rather than a fitted trend.
- **Uniform descent outside a finite core:** if a finite edge set has (q_e<1), let (q=\max_e q_e<1) and (b=\max_e b_e). Then every represented input (n>b/(1-q)) strictly decreases along any certified edge. The remaining finite interval must be checked exactly.
- **Core resolution:** every positive integer in the finite interval either reaches 1 or has a certified transition to a smaller positive integer. A cycle among these small values must be ruled out explicitly.

This is a more robust alternative to “cycle weights alone”: the affine potential (V(n)=n) proves descent outside a finite core; exact finite-state checking resolves the core. If no uniform (q<1) exists, refine blocks or use a different potential, but refinement is only a search heuristic until coverage and inequalities are proved.

## 3. Cycle composition

For edges (e_1,ldots,e_r) with bounds (n_{j+1}\le q_j n_j+b_j), composition gives
[
n_r\le (\prod_j q_j)n_0+
\sum_{j=1}^r b_j\prod_{\ell=j+1}^r q_\ell.
]
This bound is valid only when the edge source/target predicates match along the path. If the cycle has product (Q<1) and accumulated offset (B\ge0), it gives (n_r\le Qn_0+B<n_0) only when (n_0>B/(1-Q)). It does **not** exclude small cycles by itself.

## 4. Literature boundary

The 2-adic conjugacy/shift viewpoint of Bernstein–Lagarias explains the symbolic valuation dynamics but does not provide a positive-integer descent theorem. A finite symbolic model is therefore useful for organizing trajectories, not a shortcut from residue coverage to termination. The proposed affine-potential + finite-core architecture makes the missing global obligations explicit.

## Acceptance criterion

Do not call the graph a Collatz proof until the coverage theorem, transition soundness, all affine inequalities, and finite-core termination check are independently machine-checked. No average multiplier or statistical valuation law substitutes for any of these obligations.
