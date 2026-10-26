# Research continuation II — source witness and realizable Syracuse blocks

Date: 2026-10-26

This note continues the two proof audits by extracting the next concrete obligations from the current Lean sources. It is a research note, not a build report; it does not claim a global theorem.

## A. BBMST / Erdős–Selfridge: prefer a source-derived interior witness when available

### Existing formal core

On branch `audit/lean4-erdos-selfridge`:
- `BBMSTFiberMassCore.lean` proves finite mass partition/conservation, weighted variance identity, variance nonnegativity, and the equivalence between positive interior mass and a strict variance bound.
- `BBMSTProperFiberInterior.lean` proves that if `t` is a nonempty proper subset of a nonempty finite set `s`, then its cardinality ratio `card(t)/card(s)` lies strictly in `(0,1)`; with positive fiber mass, its contribution `alpha * (1-alpha) * mass` is strictly positive.
- `ErdosSelfridge_v17_fixed.lean` explicitly states that `sieve_criterion` and `sf_sieve_lt_one` are admitted placeholders and that the current `CoveringSystem` does not impose square-freeness.

### Sharpened proof obligation

The direct-witness route can avoid proving a global variance bound, but only if the original BBMST construction yields a fiber (s_x) and removed subset (t_x) satisfying all of:
1. (s_x) is finite and nonempty;
2. (t_xsubsetneq s_x) and (t_x
earnothing);
3. the source probability assigned to that fiber is strictly positive;
4. the source-defined (alpha_k(x)) is exactly the ratio (or the corresponding probability ratio) of (t_x) to (s_x);
5. the theorem's global sum includes this contribution with nonnegative remaining terms.

Then the existing proper-fiber lemma gives a positive term and nonnegative summands give strict positivity of the whole sum. This is a valid sufficient-condition pattern, not yet a BBMST theorem: the five facts must be derived from the source's actual geometry and evolving probability measures, not inserted as assumptions.

If the source cannot guarantee such a proper fiber at the needed stage, revert to the variance/non-concentration route. These are alternative ways to close the same positivity gap, not independent proof obligations that must both be proved.

### Next falsification checks

- Check whether the source construction permits a fiber with no removed points or with all points removed; such endpoint cases make (alpha(1-alpha)=0).
- Check whether every candidate positive fiber has positive probability under the evolving measure; nonempty cardinality alone does not imply positive mass.
- Check that the finite sample/fiber map and the source (alpha_k(x)) use the same objects and normalization.
- Preserve the square-free modulus hypothesis in the theorem interface and prove the connection from the geometric result to the appropriate covering-system statement. Do not silently broaden the conclusion to arbitrary odd moduli.

### BBMST stop condition

The next milestone is a source-faithful lemma proving either the five direct-witness facts for a specific relevant fiber, or the strict variance bound. Until then, the algebraic core is reusable but the missing geometric/probabilistic interface remains open.

## B. Syracuse / Collatz: make the block inequality uniform, then enforce realizability

### Exact closed form for the correction term

The current `SyracuseAffineCore.lean` defines (A_0=0), (A_{j+1}=A_j+a_j), (C_0=0), (C_{j+1}=3C_j+2^{A_j}), and proves the conditional identity
[
2^{A_N}n_N=3^Nn_0+C_N
]
for a chain satisfying (2^{a_j}n_{j+1}=3n_j+1).

Unrolling the recurrence gives the exact expression
[
C_N=sum_{j=0}^{N-1}3^{N-1-j}2^{A_j}.
]
This follows by induction from the recurrence and is a useful explicit target for a small auxiliary Lean lemma. It does not depend on valuation estimates; it depends only on the affine recurrence.

For a realized block, strict descent is equivalent to
[
(2^{A_N}-3^N)n_0>C_N.
]
For odd (n_0>1), we know (n_0ge3). Therefore the following is a sufficient **uniform-in-start-value** criterion for a fixed exponent block:
[
2^{A_N}>3^N
quad	ext{and}quad
3(2^{A_N}-3^N)>C_N.
]
If this inequality holds for a block actually realized by the orbit, then the affine identity implies (n_N<n_0). The criterion is only sufficient, not necessary, and by itself says nothing about whether a proposed exponent block can occur.

### Realizability is a separate constraint

An arbitrary word (a_0,ldots,a_{N-1}) satisfying a favorable sum bound is not necessarily a Syracuse valuation word. Each exponent must be the exact value (v_2(3n_j+1)), each quotient must be an odd positive integer, and successive states must agree with the transition equations. The existing source correctly warns that its affine identities are conditional algebra and do not establish realizability.

Consequently, the next proof must combine:
1. a realizability/cylinder lemma for a class of exact valuation blocks;
2. a quantitative block inequality strong enough to dominate (C_N);
3. a proof that every relevant starting orbit reaches one of those blocks, or another well-founded potential that guarantees descent.

The third item is the global difficulty. Testing finite blocks can reject false inequalities but cannot establish that every orbit reaches a favorable block.

### A concrete formalization target

Add and prove the recurrence-unrolling lemma
[
C_N=sum_{j<N}3^{N-1-j}2^{A_j}
]
in the affine core, then formulate the uniform sufficient descent criterion as a separate theorem with explicit hypotheses. Keep it distinct from any theorem asserting that Syracuse orbits always satisfy those hypotheses. Pin the Lean/Mathlib versions and run the project-specific axiom audit before describing the result as certified.

### Syracuse stop condition

A finite-prefix identity or a sufficient condition for one block is not global Collatz convergence. The global proof remains open until a theorem forces every odd start (n>1) to reach a strict descent (or proves another well-founded global invariant).

## C. Shared audit rule

For each new lemma, record separately:
- exact assumptions;
- whether data are arbitrary or arise from the original mathematical construction;
- whether the conclusion is local, blockwise, or global;
- counterexample tests attempted;
- actual build and axiom-audit status.

Do not claim a build unless it was run and observed. Do not treat CI success as proof that the formalized theorem is the intended theorem.