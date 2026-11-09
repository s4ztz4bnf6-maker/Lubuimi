# Collatz/Syracuse: weighted margin budget and the realizability bottleneck (2026-10-25)

## Scope and status

This note records a derived criterion, not a proof of the Collatz conjecture. The current Lean file `SyracuseOffsetIdentity.lean` contains the exact affine block identity, the signed margin recurrence, the valuation-one block formula, and conditional descent results. A successful GitHub Actions compile audit is recorded for code commit `011ad04ac354c086ad62d39d048cec61c6abf254`; this does not certify a global descent theorem.

## Exact weighted budget

Write `a_j = v₂(3 n_j + 1)`, `A_{j+1}=A_j+a_j`, and let the signed margin be
`D_j = 2^{A_j} - 3^j - C_j` (using the repository's exact definition and sign convention).
The implemented recurrence is
`D_{j+1}=3D_j+(2^{a_j}-4)2^{A_j}`.
Iterating it gives
`D_N = 3^N D_0 + Σ_{j<N} 3^(N-j-1)(2^(a_j)-4)2^(A_j)`.

For `D_0 ≤ 0`, positive terminal margin is equivalent to
`Σ_{j<N, a_j≥3} 3^(N-j-1)(2^(a_j)-4)2^(A_j) >
  3^N(-D_0) + Σ_{j<N, a_j=1} 2·3^(N-j-1)2^(A_j)`.
Terms with `a_j=2` vanish. This is a bookkeeping identity/criterion, not yet a newly compiled Lean theorem.

## Research bottleneck: realizability

A bound for arbitrary exponent words is insufficient: the values `a_j` are coupled by the actual congruences of the orbit. The next formal target should therefore be an admissible-prefix predicate that records
`2^(a_j) n_(j+1) = 3 n_j + 1`, oddness of each iterate, and exactness of `a_j` (including `2^(a_j) ∣ 3n_j+1` and `2^(a_j+1) ∤ 3n_j+1`, or an equivalent valuation equality).

Then pursue one of two rigorous outcomes:
1. prove a uniform weighted-budget inequality for every admissible prefix of a stated length; or
2. extract a counterexample to the proposed uniform inequality, with a certified orbit prefix.

Do not infer global convergence from 2-adic compactness: compactness and continuity alone do not imply descent in the usual order on positive integers.

## Audit gate

Before any global claim: build the pinned toolchain, inspect all transitively used axioms, confirm exact agreement with the chosen Syracuse definition, and use an independent checker where available. Density-one and positive-density theorems remain partial results, not universal convergence.
