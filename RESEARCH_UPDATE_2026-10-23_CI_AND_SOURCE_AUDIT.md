# CI-confirmed update and source-to-proof plan — 2026-10-23

This is a follow-up to RESEARCH_FRONTIER_2026-10-23.md. It records completed CI checks and sharpens the next work items using source inspection. It does not claim either open problem is solved.

## Verified CI status

- Syracuse branch `collatz/offset-margin-roadmap-2026-10-23`, commit `613e3b2297f25f7d423ab9047cd261841855df54`: GitHub Actions run `40007491437` completed successfully; job `compile-drafts` succeeded.
- BBMST branch `audit/lean4-erdos-selfridge`, commit `5051c92f8da6ca7456da405e22b89a9855dad3c6`: GitHub Actions run `40007687217` completed successfully; job `compile-bbmst-audit` succeeded.

These results confirm the configured workflows compile the tracked modules. They do not by themselves establish that the global conjectures follow, nor do they replace a transitive axiom audit of every target theorem.

## Syracuse: margin ledger rather than generic growth claims

For an actual certified orbit, maintain a per-block ledger with the following distinct fields:
- start value (n_0);
- number of accelerated odd steps (N);
- exact cumulative exponent (A_N = \sum_{j<N} a_j);
- recurrence-generated offset (C_N);
- exact margin (M_N = 2^{A_N}n_0 - (3^N n_0+C_N)).

The affine identity makes (M_N = 2^{A_N}(n_0-n_N)). Thus (M_N>0) is equivalent to strict descent; it is not an independent estimate. This distinction prevents circular reasoning.

The current formalized necessary threshold is
`3^N (n_0+1) < 2^{A_N} n_0`
whenever a block descends and the offset lower bound is available. Therefore a useful search strategy is to record `(N, A_N, C_N, M_N)` for actual trajectories and compare:
1. the necessary exponent threshold;
2. the stronger exact margin;
3. the gap between bounds that apply to arbitrary exponent words and those that apply only to realizable valuation words.

This suggests a research interface: a theorem about admissible valuation words must take a genuine transition certificate as input, not merely a list of positive integers. A numerical exploration can discover patterns, but any resulting bound needs a separate proof.

### External audit lessons

The 2 October 2026 erratum at https://collatz-lab.org/ says a large-cycle bound had been assumed rather than derived, so its claimed global cycle conclusion was conditional. This is directly relevant to our standard: name every open hypothesis and reject any proof that merely repackages the desired conclusion. Barina's verified range through approximately (2^{71}), https://pcbarina.fit.vutbr.cz/, is a finite computational theorem and must remain distinct from universal convergence.

## BBMST: source-to-Lean proof map

The published 2021 theorem is specifically the square-free-moduli case; the unrestricted odd-moduli problem is not solved by it. Source record: https://ora.ox.ac.uk/objects/uuid%3A3c55267c-60be-4652-89a7-db3db5f62c25 .

The reconstruction index at https://erdosproblems.ai/wiki/library/covering_systems/balister_2021_erdos_selfridge_problem_square_free_moduli identifies the full dependency chain:
1. Lemma 2.1 — fiber sieve and three measure bounds, including zero-mass fibers.
2. Theorem 3.1 — removed mass bounded using first and second fiber moments.
3. Lemma 3.3 — propagation of initial hyperplane weights.
4. Lemma 3.4 — integer moments bounded by compatible hyperplane intersections.
5. Theorem 3.2 — union count and improved bound when a new singleton is absent.
6. Lemma 5.4 — finite configuration exhaustion and integer probability certificates.
7. Lemma 5.3 — uniform parameter bound from an exact rational vector and endpoint checks.
8. Corollary 5.2 — exact integer recurrence plus finite prime sieve.
9. Theorem 1.2 and Theorem 1.1 — assemble the geometric and arithmetic conclusions.

Our current code covers general finite mass partition, weighted partition, envelope/squeeze inequalities, and zero-mass fibers. It does not yet instantiate the paper's actual hyperplane geometry or its first-/second-moment estimates. The next coding milestone should be the exact finite incidence structure and the fiber-local statement, not a renamed generic inequality.

### Ratio-free local specification

For a finite source set (S), projection (\pi), and a fixed fiber (F_i = \{x\in S : \pi(x)=i\}), define each mass by a finite sum over an explicitly defined subset of (F_i). Prove disjointness and coverage first. Then prove the paper's local bounds directly on these sums. Only introduce a conditional ratio if the relevant denominator is proved positive; otherwise handle the zero-mass case via the already checked annihilation lemma.

## Acceptance criteria for the next iteration

- Keep CI run IDs and commit hashes attached to each claim.
- Run `#print axioms` on the exact exported theorem and inspect all imported hypotheses.
- Maintain a source map from each paper equation/lemma to the Lean declaration and its assumptions.
- Label all computations as exploration or finite certificate verification; do not call them universal proofs.
