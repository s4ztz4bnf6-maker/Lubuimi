# Syracuse valuation cylinders: affine invariant and exact density (2026-10-25)

## Status and scope

This note records a mathematical deduction from the existing finite-prefix Lean certificates. It is not a Lean theorem and does not claim a proof of the full Collatz conjecture. The currently compiled declarations in `SyracuseValuationTransition.lean` cover the first two through five valuation-one conditions by explicit modular arithmetic; the arbitrary-length theorem remains a formalization target.

## Exact finite-cylinder statement

Let the accelerated odd Syracuse map be
[
T(n)=rac{3n+1}{2^{v_2(3n+1)}}quad(n	ext{ odd}).
]
For the first (k) accelerated steps to have valuation exactly one, each odd state must satisfy
[
v_2(3n_j+1)=1,qquad 0le j<k.
]
Equivalently, (3n_j+1equiv 2pmod4), and hence
[
n_{j+1}=(3n_j+1)/2,qquad n_{j+1}+1=3(n_j+1)/2.
]
Iterating the latter recurrence over a block on which all valuations equal one gives
[
2^j(n_j+1)=3^j(n_0+1),qquad 0le jle k.
]
The divisibility constraints at the final tested state imply
[
n_0equiv -1pmod{2^{k+1}}.
]
Conversely, if (n_0+1=2^{k+1}q), then while (j<k),
[
n_j+1=2^{k+1-j}3^j q
]
is divisible by (4), so (n_jequiv3pmod4) and (3n_j+1equiv2pmod4). Thus the cylinder identity is
[
igl(orall j<k, v_2(3n_j+1)=1igr)
iff n_0equiv -1pmod{2^{k+1}},
]
where (n_j) is the accelerated odd orbit and the left side is interpreted only on odd states.

## New exact counting corollary

Among odd starting integers, the condition (nequiv-1pmod{2^{k+1}}) is exactly one of the (2^k) odd residue classes modulo (2^{k+1}). Therefore the relative natural density among odd starts of a block of (k) consecutive valuation-one steps is exactly
[
2^{-k}.
]
Among all positive integers its natural density is (2^{-(k+1)}). This is an exact finite-cylinder statistic, not a convergence theorem: it only quantifies the rarity of one prescribed valuation word, not the probability or impossibility of all possible long-term orbit behaviors.

## Formalization route that avoids a giant `omega` goal

1. Define the one-step map (F(n)=(3n+1)/2) on the branch where (nequiv3pmod4).
2. Prove the local recurrence identity (2(F(n)+1)=3(n+1)) under that branch condition.
3. Define a recursive predicate `ValOnePrefix k n` rather than writing nested quotients in each theorem statement.
4. Prove by induction on (k) the affine invariant and the cylinder equivalence. Isolate the oddness and divisibility hypotheses explicitly so natural-number division is never used as if it were field division.
5. Derive the existing cases (k=2,3,4,5) as corollaries. Keep the original explicit declarations as regression tests until the general theorem compiles.
6. Formalize the density/counting corollary separately with finite residue classes; do not use it as a substitute for a global descent argument.

## Critical boundary

The cylinder density (2^{-k}) is consistent with the uniform 2-adic distribution of finite residue classes, but it does not imply that every positive integer orbit descends. A density-zero exceptional set can still contain integers, and a statement about a fixed finite valuation word does not control arbitrary adaptive valuation sequences.
