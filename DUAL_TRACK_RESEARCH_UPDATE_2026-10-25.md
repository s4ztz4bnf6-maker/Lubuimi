# Dual-track research update — 2026-10-25

## Scope and status

This is a research-plan and theorem-specification update, not a claim that either open conjecture has been solved. It records the next mathematically discriminating obligations for the Syracuse/Collatz and Erdős–Selfridge/BBMST tracks, informed by recent discussion of AI-assisted mathematics and Lean reliability.

## 1. Syracuse / Collatz: separate dynamics, admissibility, and descent

### Exact algebraic invariant

For accelerated odd steps n_(j+1)=(3n_j+1)/2^(a_j), where a_j=v₂(3n_j+1)≥1, write A_N=Σ_{j<N}a_j. Iteration gives 2^(A_N)n_N=3^N n_0+C_N, with C_0=0 and C_(j+1)=3C_j+2^(A_j). Hence the exact descent margin is M_N=2^(A_N)n_0-(3^N n_0+C_N)=2^(A_N)(n_0-n_N).

Thus proving M_N>0 is equivalent to proving descent; it cannot be used as an independent estimate without circularity.

### Next formal theorem (small, falsifiable milestone)

Formalize the closed form C_N=Σ_{j=0}^{N-1}3^(N-1-j)2^(A_j) from the recurrence, then prove the exact equivalence between (1) the affine orbit identity, (2) positivity of M_N, and (3) strict descent n_N<n_0. This is a useful verification milestone but is not itself a new global Collatz result. The next research bottleneck remains a non-circular theorem about realizable valuation words: a list (a_0,…,a_(N-1)) must arise from an actual orbit, not merely satisfy a_j≥1. Any proposed bound on A_N must explicitly state whether it applies to arbitrary words or only to words satisfying the transition congruences.

### 2-adic idea: valid scope and obstruction

The map x↦3x+1 is continuous on Z₂, but the accelerated map using v₂(3x+1) is not globally a harmless continuous-flow replacement: the valuation is unbounded near the 2-adic point −1/3, where 3x+1=0. A p-adic formulation must specify its domain, treatment of that exceptional point, and whether it preserves the positive-integer orbit and descent order. Compactness alone does not imply that every orbit converges to one sink; continuity on a compact space does not in general force convergence. Therefore p-adic topology is a source of congruence structure and compactness arguments, not a shortcut to the conjecture.

### Required checks

- Compile the exact target on the pinned toolchain.
- Run the transitive axiom audit on the exported theorem, not only on helper lemmas.
- Keep the affine identity, valuation-word realizability, and global descent as three separate claims.
- Record computational searches as finite exploration only; no finite range proves universal convergence.

## 2. Erdős–Selfridge / BBMST: geometric source fidelity before the sieve conclusion

### Main bottleneck

The audit has identified a degenerate interface in the older sieve-axiom wrapper: empty or misaligned delta parameters can exploit totalized rational division and make a formal inequality vacuous. This is a specification/interface defect, not a counterexample to the Erdős–Selfridge conjecture. The source-faithful route is to replace the free-standing sieve envelope with the actual finite configuration, projection, hyperplane incidence, and measure used in the published argument.

### Next formal milestone: finite fiber ledger

For a finite source set S, a projection π:S→I, and each fiber F_i={x∈S:π(x)=i}, define disjoint subsets for removed and surviving points. Define their masses as explicit finite sums, not ratios. Prove in order:

1. Fiber partition: removed and surviving subsets are disjoint and cover the fiber.
2. Local mass conservation: total mass equals removed plus surviving mass.
3. Zero-mass annihilation: if all point masses are nonnegative and the fiber's total mass is zero, each point mass in the fiber is zero.
4. Source-specific local inequalities from the actual hypotheses of the cited lemma.
5. Global inequalities by summing the fiber inequalities over the image of the projection.

Only introduce conditional ratios after proving their denominators strictly positive. Do not encode the paper's geometric premise as a freely chosen predicate or coefficient function; that would formalize a different statement.

### Dependency boundary

The cited 2021 BBMST result addresses the square-free-moduli case, not the unrestricted odd-moduli Erdős–Selfridge conjecture. The unrestricted conclusion must not be inferred from a verified square-free theorem. The remaining dependency chain includes the actual hyperplane geometry, initial distribution/weights, first- and second-moment estimates, their geometric side conditions, and the arithmetic assembly. Each source equation needs a named Lean declaration and a list of assumptions.

### Next deliverable

Create a source-to-Lean table with columns: source lemma/equation and exact hypotheses; Lean declaration; geometric object represented; measure/moment quantity represented; proof status (kernel-proved, assumed, computed certificate, or unresolved); transitive axioms. Then instantiate the finite fiber ledger with the source's actual incidence structure. Do not strengthen the published theorem's hypotheses silently merely to make the Lean interface nondegenerate; instead prove that the source supplies the required conditions.

## 3. Math 2.0 reliability protocol

The recent discussion of AI mathematical work reinforces a layered trust model:

1. Statement fidelity: definitions and hypotheses match the intended published or conjectured statement.
2. Proof-term check: Lean's kernel accepts the proof with no sorry/sorryAx.
3. Transitive axiom audit: inspect #print axioms for the exact exported theorem and dependencies.
4. Independent kernel/checker: where practical, export proof objects or cross-check with an independent implementation; this mitigates but does not logically eliminate common-mode bugs.
5. Source and toolchain pinning: archive exact commits, Lean/mathlib versions, CI logs, and literature versions.
6. Human-readable argument: retain an explanation that identifies the mathematical idea and every nontrivial hypothesis.

An empty project-specific axiom list is not enough if the theorem has a hypothesis equivalent to the desired conclusion, an incorrect definition, or an unsound trusted toolchain. Conversely, standard foundations such as classical choice are not the same category as an unproved project-specific theorem; report them separately rather than demanding an indiscriminately empty list.

## 4. Research heuristics inspired by AI-assisted Erdős work

Use AI as a proposal generator, adversarial reviewer, and literature-search assistant—not as an authority. For every candidate lemma: search for prior work and alternate formulations; attempt a minimal counterexample or boundary-case test; ask a separate pass to identify hidden assumptions and circularity; formalize the smallest useful lemma first; preserve negative results and failed approaches in the audit log.

Algebraic geometry or a continuous embedding should be pursued only when a concrete map, invariant, or theorem connects it to the original discrete statement. A higher-dimensional reinterpretation is a hypothesis to test, not evidence of progress by itself.

## Acceptance gates for this update

No global conjecture is claimed solved. Progress is accepted only when the exact theorem statement, source mapping, pinned commit/toolchain, CI status, and transitive axiom output are recorded together. The next productive unit is a kernel-checked local theorem that closes one named obligation without adding a new assumption.


## 5. Literature update: AI mathematics, evidence, and partial Collatz results

### What the supplied sources contribute

- Quanta's 3 August 2026 account of the Erdős unit-distance counterexample describes a useful discovery pattern: challenge a plausible conjecture, transfer methods from a distant area (here algebraic number theory and higher-dimensional lattice structure), and then have mathematicians simplify and strengthen the proof. It also documents a false "solved" claim for Erdős 333 that was already solved in 1977. Therefore literature triage is a required proof step, not administrative overhead. Source: https://www.quantamagazine.org/why-the-legendary-erdos-problems-are-falling-to-ai-20260803/
- The MAA account reports that the unit-distance counterexample's exponent was substantially improved by human mathematicians after the AI discovery. The lesson for both tracks is to separate discovery, optimization, formal checking, and source-faithful exposition. Source: https://maa.org/math-values/ai-solves-an-80-year-old-erdos-problem/
- ProofAtlas now lists multiple Collatz results with distinct scopes: a positive-density set of starts reaches 1 within an explicit logarithmic number of ordinary steps; a separate natural-density-one result gives logarithmic-time descent; and predecessor-count lower bounds improve from exponent 0.84 to 0.90. The site labels some outcomes accepted and Lean-checked, while others remain candidates with acceptance review open. These are substantial partial/density results, not a proof that every positive integer reaches 1. We should inspect each exact Lean statement and dependency closure before using any result as a lemma. Source: https://www.proofatlas.ai/
- Thomas Hales's guest post on Tao's blog documents the 2026 Lean soundness-bug incidents, including an illicit Collatz disproof accepted by a defective checker, and emphasizes statement fidelity, human audit, independent implementations, and pinned toolchains. Cross-kernel agreement is risk reduction, not an absolute guarantee. Source: https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/
- Tao's 20 October experimental challenge models a productive collaboration pattern: expose the exact claim, cite inherited analytic inputs, publish code and verification outputs, and invite adversarial scrutiny without pretending that formalization replaces mathematical exposition. Source: https://terrytao.wordpress.com/2026/10/20/an-experimental-ai-math-challenge-using-tenth-discriminant-bounds-to-explore-arguments-ruling-out-siegel-zeroes/

### Consequences for the two active projects

**Syracuse / Collatz.** Add a related-work ledger with one row per external theorem: exact statement, iterate convention (ordinary vs accelerated odd steps), density notion, quantitative clock, Lean commit, transitive axioms, and acceptance status. A density theorem must not be converted into universal termination. The current affine-offset equivalence is a finite-prefix criterion; its next mathematical bottleneck remains a non-circular bound on the offset for *realizable* valuation words, or a structural argument excluding all infinite non-descending paths.

**Erdős–Selfridge / BBMST.** Treat the unit-distance counterexample as evidence that unusual algebraic embeddings can be productive, not as a ready-made method for the covering-system problem. Any such transfer must produce a concrete map/invariant that preserves the covering-system hypotheses. The immediate blocker remains source-faithful finite product geometry and the actual hyperplane/fiber moment estimate; scalar normalization and generic finite-sum identities alone do not establish the square-free-moduli theorem.

### Evidence status update

The Collatz offset-margin CI failure exposed a genuine proof-script issue: the reverse implication tried to rewrite a target containing the accumulated offset as though it contained the scale-difference product. The proof has now been changed to use the exact scale identity and monotonicity of addition. The new CI run is pending; do not call this lemma verified until that run completes and its axiom output is checked.

The BBMST scalar weighted-gap PR has a successful CI run under its existing pinned toolchain. The separate Lean 4.35.0 migration compiles the preceding Lean targets, but its final `lake check` step fails because Bubblewrap cannot create the UID map in the hosted runner (`bwrap: setting up uid map: Permission denied`). This is an environment/sandbox failure, not evidence that the theorem is false or that the independent recheck passed. Keep the migration PR open until the recheck is made reproducible or the trust limitation is explicitly resolved.
