# AI-assisted mathematics: research and verification protocol
Date: 2026-10-25

This note translates the recent AI-mathematics discussion into concrete acceptance rules for the Syracuse/Collatz and Erdős–Selfridge/BBMST tracks. It is a research protocol, not a mathematical theorem.

## Evidence from the supplied sources

- Quanta, 2026-08-03, “Why the Legendary Erdős Problems Are Falling to AI”: AI can surface non-obvious structures and challenge the assumed direction of a conjecture, but old solutions can be missed and informal output still needs human mathematical review. The unit-distance result is a counterexample to a conjecture, not evidence that all hard problems are now solved.
- MAA, 2026-06-01, “AI solves an 80 year-old Erdős problem”: the unit-distance counterexample used a higher-dimensional lattice construction and a projection/shadow into the plane. This is a concrete example of changing representations; it is not a license to posit a smooth or algebraic representation without proving that it preserves the target property.
- Tao/Hales, 2026-10-09, “What mathematicians should know about the Lean Theorem Prover”: kernel checking is essential but not sufficient for accepting a result. The exact formal statement must match the intended mathematical claim; kernel soundness bugs, runtime/compiler trust, and independent-checker limitations must be part of the trust model.
- ProofAtlas, “Natural-Density Collatz Descent in Logarithmic Time”: the reported accepted result is explicitly a natural-density-one theorem with explicit logarithmic clocks. Its own scope notes that a density-zero exceptional set may remain and that it does not prove convergence for every start or arrival at 1.
- The linked Reddit discussion repeats this distinction: “almost every input” with a quantitative clock is not the universal Collatz conjecture. Reddit is a discussion pointer, not the primary proof source.
- The 2026 OpenAI bulk release described on Wikipedia illustrates the need to separate a paper's claim, a formal artifact, statement alignment, external mathematical review, and acceptance. A large volume of generated manuscripts is not itself a verification result.

## Operational protocol

For every research claim, preserve:
1. Exact proposition and domain, including quantifiers and exceptional cases.
2. Source-to-formalization map: each hypothesis and conclusion linked to the cited theorem or equation.
3. Pinned repository commit and toolchain.
4. Reproducible build and test output.
5. Transitive axiom report for the exact target declaration.
6. Independent checker evidence where feasible, with the checker version recorded.
7. Human statement-fidelity review, including the distinction between universal, almost-everywhere, conditional, finite, and heuristic claims.

A successful build proves the formalized proposition from its imported premises and axioms. It does not establish that the proposition is the intended theorem, nor that a named axiom is mathematically justified. `#print axioms` exposes dependencies but does not itself prove the soundness of the kernel or runtime.

## Project-specific application

### Syracuse / Collatz

The current research line has an exact affine identity for a certified accelerated-odd block and a weighted expansion of its signed correction. The local correction is negative at valuation 1, zero at valuation 2, and positive at valuation at least 3. The newly added residue classifications target the local arithmetic:
- valuation 1 iff the current odd state is 3 modulo 4;
- valuation 2 iff it is 1 modulo 8;
- valuation at least 3 iff it is 5 modulo 8.

These are local classifications, not a bound on the weighted global sum. The remaining obstacle is to prove a non-circular positive descent margin for all actual trajectories, or find a genuine counterexample. A 2-adic extension may help classify admissible finite words, but compactness or continuity alone does not imply convergence of every positive-integer orbit.

The ProofAtlas natural-density result is a useful comparison and potential source of techniques, but its exceptional-set allowance cannot be promoted to a pointwise theorem without a new argument.

### Erdős–Selfridge / BBMST

The audit branch has a CI-checked degeneracy witness for the current axiom interface: an empty delta list makes the product degenerate, and rational division by a zero denominator is totalized rather than rejected. A separate example shows that nonemptiness alone is not enough; delta = 0 also degenerates. This is a defect in the formal axiom interface, not a counterexample to the conjecture.

The new `GuardedSieveParams` prototype uses one shared finite index type and strict bounds (0<\delta_i<1), making stage mismatch and invalid delta values unrepresentable in that interface. It does not yet replace or discharge the original sieve axioms. The next mathematical bridge must connect this guarded interface to the actual BBMST stage data and prove the source-specific first/second-moment bounds, including the geometric side condition for the strengthened bound.

## Current acceptance boundary

Do not describe either global conjecture as proved. Do not count a local lemma, a finite search, a positive-density theorem, a passing build, or a theorem that still depends on project-specific axioms as a universal resolution.
