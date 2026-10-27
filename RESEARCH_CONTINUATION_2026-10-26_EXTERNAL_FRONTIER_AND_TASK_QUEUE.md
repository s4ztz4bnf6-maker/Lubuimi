# Research continuation: 2026-10-26 external frontier and formal task queue

## Purpose and evidence boundary

This is a source-triage note for the BBMST square-free covering-system project and the accelerated Syracuse/Collatz project. It is not a claim that either target problem is solved. Search-result abstracts and project pages are useful for locating candidate lemmas, but claims must be checked against the exact paper and exact Lean declarations before they become dependencies.

## 1. Syracuse/Collatz: recent formal results that can inform, but do not close, the global gap

### 1.1 Natural-density descent formalizations

ProofAtlas's “Natural-Density Almost-Bounded Collatz Orbits in Logarithmic Time” page reports a Lean-checked result: for growing thresholds, odd-relative-density-one many odd starts descend below the threshold within at most 145 accelerated Syracuse steps; a separate ordinary-natural-density-one statement gives a raw-step bound of 436 log N. The page explicitly says it does not prove convergence for every start or arrival at 1. These two density notions and the two step clocks must remain separate.

Source: https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/

A further ProofAtlas page reports a positive-lower-density theorem for starts reaching 1 within an explicit logarithmic raw-step bound, with a very small density constant and a very large cutoff, while explicitly retaining that the full conjecture remains open and that independent paper-to-statement review is pending. This is potentially relevant to studying the structure of exceptional sets, but it is not a universal theorem.

Source: https://www.proofatlas.ai/

A newer October 2026 preprint by Idris Ali Shaik, “Polylogarithmic Descent for Almost All Collatz Orbits in Natural Density,” reports density-one descent below a polylogarithmic target for almost all starts and explicitly states that pointwise Collatz remains open. It should be treated as a preprint/formalization lead until the exact source, assumptions, and Lean artifact are independently audited.

Source: https://papers.ssrn.com/sol3/papers.cfm?abstract_id=7290240

### 1.2 A useful new bridge question: density-one results versus a hypothetical counterexample

A possible route is to seek a theorem of the form:

“If one positive integer has a nonterminating orbit, then the set of positive integers with nonterminating orbits has positive lower natural density.”

If this implication were established, a separately proved density-one theorem asserting termination (not merely descent below every growing threshold) would contradict it. The current almost-bounded/descent results do not supply that termination premise. Nor does a positive-density theorem for starts that reach 1 supply density-one termination. Therefore this is a research target, not a current deduction.

A nearby published/formalized result about positive lower density of Collatz predecessors may be useful only after checking its exact quantifiers and how predecessor trees preserve nontermination. Do not infer the displayed implication without proving those steps.

### 1.3 The affine block interface remains the right exact arithmetic boundary

For actual transition equations `2^(a k) * n(k+1) = 3*n(k)+1`, the current file `SyracuseAffineCore.lean` proves the finite-prefix identity

`2^A_N * n_N = R_N`,

where `A_N` is the prefix exponent sum and `R_(k+1)=3*R_k+2^A_k`.

The closed form is

`R_N = 3^N*n_0 + C_N`,

`C_N = sum_{j<N} 3^(N-1-j)*2^A_j`.

Consequently, in integer arithmetic,

`n_N < n_0` iff `(2^A_N - 3^N)*n_0 > C_N`.

The highest-value next formal tasks are (i) prove the finite-sum expansion of `R_N`, (ii) formalize the descent equivalence over integers to avoid truncated natural subtraction, and (iii) keep a realized valuation word distinct from an arbitrary exponent word. The global obligation remains to prove every nontrivial orbit obtains a descent witness or to establish a different well-founded potential.

### 1.4 2-adic cylinder papers: use as finite-resolution lemmas, not global convergence

A March 2026 preprint on cylinder collision and bit non-reuse reports that restricted survival sets shrink by a factor of one half at each step in a fixed modular class, while explicitly leaving emptiness of the infinite survival set open. This suggests formalizing exact cylinder injectivity, depth growth, and finite-resolution survival counts. Measure zero of an infinite survival set does not imply that the set is empty.

Source: https://zenodo.org/records/18831527

Another formalized note reports an exact countdown for consecutive single-halving behavior in a residue class, using `v₂(n+1)` as a clock. This may support local block lemmas, but a local bound on single-halving runs is not universal Collatz convergence. Audit the author's artifact and exact statement before importing it.

Source: https://zenodo.org/records/19371947

## 2. BBMST / Erdős–Selfridge: exact source mechanism and local witness route

The 2021 paper “The Erdős–Selfridge problem with square-free moduli” describes a finite product probability space and a stagewise measure update. For each fiber `F_x`, the removed proportion is `alpha_k(x)`. The update depends on `alpha_k(x)` and a stage parameter `delta_k`; the paper's Lemma 2.1 gives preservation of probabilities for earlier-measurable sets, a distortion upper bound by `1/(1-delta_k)`, and a monotonicity bound for subsets of the removed set. These are the actual source interfaces to formalize, not a generic global mass split.

Source PDF: https://par.nsf.gov/servlets/purl/10300177

### Direct witness vs variance

The repository's `BBMSTProperFiberInterior.lean` proves a local finite-set fact: if `t` is a nonempty proper subset of a nonempty finite fiber `s`, then its cardinality ratio `alpha = |t|/|s|` satisfies `0 < alpha < 1`; with positive fiber mass, `alpha*(1-alpha)*mass > 0`.

This is valid but only local. The source paper's update has piecewise factors and stagewise distortion; its positivity theorem cannot be replaced by the local witness until one proves:

1. the fiber and removed subset are exactly the ones used in the paper's `alpha_k(x)`;
2. the fiber has positive mass under the correct stage measure;
3. the relevant sum includes this contribution with nonnegative remaining terms;
4. the update and distortion estimates transport the contribution to the desired global inequality;
5. the prime-coordinate/hyperplane correspondence faithfully represents the original covering system.

If any one of these fails, the direct-witness route is insufficient. The variance route must then establish the source-required strict bound rather than assume it.

### Highest-value Lean tasks

1. Define the paper's finite product space and its uniform measure, with explicit prime-coordinate types.
2. Define the progression-to-coordinate-constraint map, including unrestricted coordinates when the prime does not divide the modulus.
3. Prove the exact coverage equivalence in the product space.
4. Encode the stagewise `P_k` update and prove the three properties corresponding to equations (4)–(6) in Lemma 2.1.
5. Connect the source-defined `alpha_k(x)` to the finite subset ratio lemma.
6. Prove all distortion/normalization estimates and then discharge the theorem, with square-freeness and pairwise distinctness explicit in the hypotheses.

Do not use rank-nullity, Bézout, generic transversality, or a freely supplied `isNontrivial`/`isParallel` predicate as a substitute for any of these source-specific statements. Those ideas may become useful only after a concrete algebraic variety, map, dimension, and theorem have been defined and shown relevant.

## 3. Formal integrity and evidence policy

The project should distinguish four evidence levels:

- **Paper claim:** statement appears in a cited source.
- **Lean declaration:** source contains a formal theorem.
- **Build evidence:** the pinned source compiles under a stated Lean/Mathlib version.
- **Faithfulness and axiom audit:** the declaration matches the intended theorem, and transitive axioms/escapes are reviewed.

Only the last two together support describing a result as locally verified and source-faithful. A kernel check cannot repair an incorrect formal statement, and a zero-measure exceptional set cannot be treated as empty.

## 4. Prioritized next actions

**Syracuse:** (1) add and prove the `R_N` closed form, (2) prove the integer descent equivalence, (3) prove exact cylinder-count/injectivity lemmas at finite depth, (4) investigate whether any density/predecessor theorem can imply positive lower density of nontermination from a single counterexample, without assuming the conclusion.

**BBMST:** (1) encode the exact paper stage update and equations (4)–(6), (2) prove source-measure conservation and distortion bounds, (3) connect the finite fiber ratio to the paper's conditional proportion, (4) prove the geometric coverage map, (5) audit the final theorem's exact square-free/distinct hypotheses and transitive axioms.

No new Lean compilation or CI result is asserted by this note.
