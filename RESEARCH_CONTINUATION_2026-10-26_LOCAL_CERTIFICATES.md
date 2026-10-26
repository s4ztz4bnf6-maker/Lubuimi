# Research continuation — 2026-10-26: exact local certificates and the global gap

This is a proof-obligation document, not a Lean source file and not a claim of a new global theorem. The default `main` branch contains research notes rather than a Lean project; separate working branches do contain Lean source and a pinned toolchain. This document commit did not run a build, so no compilation result is claimed.

## A. Syracuse: exact mod-4 split

Let n be odd and m = 3n + 1. Then m is even. Exactly one of the following holds:

1. 4 divides m, equivalently n ≡ 1 (mod 4). Hence v₂(m) ≥ 2.
2. 4 does not divide m, equivalently n ≡ 3 (mod 4). Since m is even but not divisible by 4, v₂(m) = 1.

The equivalences follow by evaluating 3n+1 modulo 4 for the two odd residue classes. This is a complete, disjoint local split; it is not a descent theorem. In branch 2, the fully accelerated odd Syracuse step is m/2 = (3n+1)/2, which need not be less than n. In branch 1, additional division by at least 4 occurs, but this also does not alone prove that every orbit descends over bounded blocks.

### Certificate design

For each genuine accelerated transition n_j -> n_{j+1}, store:
- n_j and n_{j+1} are positive odd naturals;
- a_j > 0;
- 2^(a_j) * n_{j+1} = 3*n_j + 1;
- n_{j+1} is odd.

From the last two conditions, 2^(a_j+1) cannot divide 3*n_j+1: if it did, the displayed equality would imply 2 divides n_{j+1}. Thus exactness of the exponent can be derived from the quotient equality and oddness, rather than redundantly supplied as an independent field.

For a certified chain define A_0 = 0, A_(j+1) = A_j + a_j and C_0 = 0, C_(j+1) = 3*C_j + 2^A_j. Induction on the chain gives

  2^A_N * n_N = 3^N * n_0 + C_N.

This is a valuable kernel-checkable algebraic invariant. It does not imply n_N < n_0. The strict descent target is equivalent to

  2^A_N * n_0 > 3^N * n_0 + C_N,

and that inequality must be proved independently for a suitable block. Assuming it, or a rearrangement equivalent to it, would be circular.

## B. BBMST: weighted finite-fiber identity

Let S and T be finite types, let f : S -> T, and let w : S -> R be any weight function. The fibers f⁻¹(y) partition S. Consequently,

  sum_(x in S) w(x) = sum_(y in T) sum_(x in S, f(x)=y) w(x).

No nonnegativity assumption is needed for this identity, because it is finite regrouping over a partition. Nonnegativity becomes relevant only for inequalities such as: if all weights are nonnegative and the total weight of a fiber is zero, then every point in that fiber has zero weight.

For a probability measure, normalization is a separate premise: the total mass is one. A quotient-based normalization must explicitly establish that its denominator is nonzero. The weighted identity alone gives neither a strict upper bound nor the BBMST covering conclusion.

### Dependency firewall

Keep the formal dependency graph separated into:
1. finite partition / weighted regrouping;
2. source-specific measure or incidence bounds;
3. the actual BBMST moment or sieve inequality;
4. the final covering conclusion.

The first theorem must not import the fourth or assume the sieve criterion. If the source-specific global inequality is missing, the result should remain explicitly conditional.

## C. Next falsification-first tasks

1. Obtain the actual pinned Lean source and toolchain; the present repository tree contains research notes but no Lean source/project files.
2. Implement the local Syracuse transition certificate and affine-chain induction in a real Lean project; compile against the pinned Lean/Mathlib versions.
3. Implement the weighted fiber identity independently of all BBMST-specific assumptions.
4. Only then tackle the two genuinely global gaps: a uniform positive descent margin for Syracuse blocks, and the source-faithful global BBMST sieve/moment inequality.
5. For any proposed bridge from a Collatz exceptional set to a short-time no-descent set, first test the exact statement against finite cases and then prove the quantified inclusion. Density estimates for different predicates cannot be combined without this bridge.

## Status

This note records two exact local proof targets and explicitly marks their global limitations. No Lean build, CI pass, independent kernel replay, universal Collatz proof, or completed BBMST theorem is claimed.
