# Collatz/Syracuse frontier update: ProofAtlas density result and the remaining exceptional set
Date: 2026-10-25

## External checked baseline

ProofAtlas publishes Lech Mazur's *Natural-Density Almost-Bounded Collatz Orbits in Logarithmic Time* (version 2, 2026-07-21) and reports a passed Lean build and accepted formalization record:
- Odd-relative natural-density-one Syracuse starts hit below a threshold tending to infinity within 145 log N odd-to-odd steps.
- Ordinary natural-density-one positive starts hit below a threshold tending to infinity within 436 log N raw Collatz steps.
- The page explicitly excludes a proof of convergence for every start and allows a density-zero exceptional set.

Reference: https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
Related community discussion: https://www.reddit.com/r/singularity/comments/1v2sgwa/ai_agents_strengthened_terence_taos_landmark/
This is an external baseline, not a theorem proved by this repository. Before importing any result, pin the exact source revision, Lean version, dependencies, declarations, and axiom output.

## Local verified scope

The local Syracuse work currently formalizes finite residue cylinders and exact finite affine identities. In particular, the two- and three-step identities eliminate intermediate states under hypotheses
`3*x_i + 1 = p_i*x_{i+1}`.
These identities are algebraically exact, but do not prove that the `p_i` are exact powers of two, that a prescribed valuation word is realizable, or that every orbit descends.

The logarithmic cocycle audit gives, for positive odd Syracuse states and exponents `a_j`,
`log₂(x₀/x_N) = Σ_{j<N}(a_j - log₂ 3) - Σ_{j<N}log₂(1 + 1/(3x_j))`.
The correction sum is positive. Therefore a global descent proof needs a uniform argument controlling the accumulated valuation surplus against this correction; average drift or a density-one theorem alone does not close the exceptional set.

## Research decision: do not duplicate the density theorem blindly

The highest-value next work is a source-to-source comparison of the ProofAtlas theorem's exact Lean declarations and dependency chain with our local finite-cylinder infrastructure. If compatible, treat the external result as a benchmark and identify the precise unproved bridge from its density-one conclusion to the universal Collatz conjecture. Do not assert that bridge exists.

Concrete obligations:
1. Pin and inspect the first-party Lean source and its theorem statement; separately verify its axiom/dependency evidence.
2. Compare its valuation-cylinder and phase-gap lemmas with our general finite-word recurrence. Prove, rather than assume, any modulus (2^{1+\sum a_j}) cylinder theorem.
3. Make the exceptional-set boundary explicit: a density-zero set can still contain a counterexample or a nontrivial cycle.
4. Test whether a proposed new invariant controls every orbit, not merely almost every start. Any candidate must yield a deterministic descent or exclude all nontrivial cycles without probabilistic language.
5. Keep the 2-adic shortcut-map continuity argument separate from the accelerated odd map; the latter has unbounded valuation near (-1/3), so compactness alone is not a descent theorem.

## Current CI status

The latest known run for commit `0e76c7333be5afa4dc81af352464c02798133049` is GitHub Actions run 40142262056, still `in_progress` at the Mathlib dependency/cache step when checked on 2026-10-25. The three-step identity is committed, but that latest run is not yet a successful compile certificate.

Run: https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/40142262056


## New finite algebraic extension (2026-10-25)

The Lean source now also contains `four_step_affine_identity`, committed as
`750307106e369358ecdf259b0cbd6f9420f22cb7`. From
`3*xᵢ + 1 = pᵢ*xᵢ₊₁` for four transitions it proves
[
81x_0+27+9p_0+3p_0p_1+p_0p_1p_2=p_0p_1p_2p_3x_4.
]
The proof eliminates the intermediate states by a ring identity and the
already stated three-step identity. This is an exact finite affine invariant,
not a valuation-realizability or descent theorem.

The GitHub Actions run for this commit is
https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/40142627092 .
At the latest check it was still in progress during toolchain installation;
the new four-step theorem must therefore be treated as awaiting CI confirmation.
The prior run 40142262056 completed successfully for the preceding commit and
does not certify this new theorem.


## Five-step affine extension

A further exact instance, `five_step_affine_identity`, was added to
`SyracuseValuationTransition.lean` at commit
`b2e05980cd32171697441ff41f67dd223b730807`:
[
243x_0+81+27p_0+9p_0p_1+3p_0p_1p_2+p_0p_1p_2p_3
=p_0p_1p_2p_3p_4x_5.
]
It follows by applying the four-step identity and the fifth transition.
The associated CI run is
https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/40142758719
and was still in progress at the last check. As with the shorter instances,
this is a finite algebraic identity only. The next mathematically meaningful
step is a single induction theorem for arbitrary length, rather than adding
unboundedly many isolated cases.
