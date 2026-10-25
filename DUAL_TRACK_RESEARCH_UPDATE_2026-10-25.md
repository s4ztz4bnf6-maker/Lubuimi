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
