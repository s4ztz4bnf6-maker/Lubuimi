# External frontier audit: natural-density Collatz descent (2026-10-24)

Status: research note only. This is not a claim that the local Syracuse project imports, reproduces, or proves the result described below.

## External result located

Lech Mazur, *Natural-Density Almost-Bounded Collatz Orbits in Logarithmic Time*, version 2, ProofAtlas, 2026-07-21:
- Overview: https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
- Exact theorem and evidence: https://www.proofatlas.ai/proofs/artifact.known-nd-rhin-log-time.paper-package.v002.html
- Pinned source browser: https://www.proofatlas.ai/sources/natural-density-log-time-collatz/
- Immutable source commit: `ca3dd0d63920411213403092aecc6946619eb082`
- Main declaration: `Erdos1135.ND.ndRhinLogTimePaperPackage`
- Main file: `Erdos1135/ND/LogTime/Paper.lean`
- Recorded toolchain: `leanprover/lean4:v4.30.0-rc2`
- Reported first-party import closure: 599 files / 182,625 lines; recorded build passed; no unfinished proof steps reported.
- Recorded standard foundations: `Classical.choice`, `Quot.sound`, `propext`.

## Exact scope (do not strengthen)

The published statement packages two distinct density-one conclusions:
1. For every threshold function tending to infinity along odd inputs, odd-relative natural-density-one many odd starts hit below that threshold within fewer than 145 times log N odd-to-odd Syracuse steps.
2. For every threshold function tending to infinity on all positive inputs, ordinary natural-density-one many positive starts hit below that threshold within fewer than 436 times log N raw Collatz steps.

The listed proof route is: a quantitative Rhin phase gap for multiples of log_2(3); scheduled-passage separation; telescoping estimates at a fixed exponent; fixed-target density-one descent; absorption of a growing threshold; then a deterministic 2-adic lift from odd cores to raw Collatz time.

The source page explicitly states that this does **not** prove convergence of every orbit, arrival at 1, or the full Collatz conjecture. A density-zero exceptional set may remain. Its recorded independent-review section also says independence was not asserted for the listed review entries. Thus “Lean checked” is useful evidence for the exact declaration, not a substitute for independently reproducing the build, auditing the statement, and checking provenance.

## Relationship to this repository

The current local project proves exact algebraic identities for certified odd-step blocks, including
`2^(A_j) n_j = 3^j n_0 + C_j`, offset recurrences, necessary descent-margin conditions, and a residue-specific strict descent. Those are local statements and do not imply either density theorem above.

The external result is a much stronger density-and-time theorem, but it has a different proof architecture and a different source/toolchain. It should not be imported as an unexplained black box. The most useful next audit is to extract and compare the exact definitions and dependencies for:
- the source's `Tao.syracuse` and `collatzStep` versus this repository's accelerated odd map;
- the natural-density predicates and the threshold-growth hypotheses;
- the quantitative Rhin phase-gap theorem and the fixed-exponent rate engine;
- the deterministic odd-core / 2-adic lift and the conversion from Syracuse steps to raw steps;
- the transitive axiom and unfinished-proof evidence for the exact theorem declaration.

## New research direction

Treat the existing offset identity as a deterministic local layer, not as the main route to a global proof. In parallel, audit whether the phase-gap/density route can be independently reproduced or whether a weaker quantitative stopping-time statement can be proved from a subset of its inputs. Do not infer pointwise convergence from density one: the exceptional set is precisely the unresolved logical gap between this result and the full conjecture.

## Evidence labels

- External page reports: Lean build passed; exact declaration and source commit are identified.
- Not yet independently reproduced by this repository: external build, full import closure, theorem proof, and statement-alignment review.
- No global Collatz proof claimed here.
