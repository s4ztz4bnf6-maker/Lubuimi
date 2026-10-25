# Dual-project frontier update — 2026-10-25

Status: research note only. This commit does not claim either the full Collatz conjecture or the unrestricted Erdős–Selfridge conjecture is solved.

## 1. New literature lead: AI mathematics is a discovery pipeline, not an acceptance criterion

Sources reviewed:
- Quanta, “Why the Legendary Erdős Problems Are Falling to AI” (2026-08-03): https://www.quantamagazine.org/why-the-legendary-erdos-problems-are-falling-to-ai-20260803/
- Thomas Hales, “What mathematicians should know about the Lean Theorem Prover: questions of reliability and AI”, hosted on Terence Tao’s blog (2026-10-09): https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/
- MAA, “AI solves an 80 year-old Erdős problem” (2026-06-01): https://maa.org/math-values/ai-solves-an-80-year-old-erdos-problem/
- ProofAtlas formalizations index: https://www.proofatlas.ai/formalizations/
- OpenAI bulk mathematical release overview: https://en.wikipedia.org/wiki/OpenAI_bulk_release_of_mathematical_papers
- ProofAtlas home: https://www.proofatlas.ai/

Operational conclusion: use AI-generated proof routes as hypotheses and search leads; independently recover the exact statement, definitions, dependencies, and proof. A Lean check validates the formal proposition under its imports, not the intended informal theorem unless statement fidelity is audited. Human-readable source alignment and kernel/compiler evidence are separate gates.

## 2. Collatz/Syracuse: strengthen the orbit-correction research interface

### Established local facts in the tracked work
The accelerated odd map is T(n) = (3n+1)/2^a, where a = v₂(3n+1). For odd n:
- a = 1 iff n ≡ 3 (mod 4);
- a = 2 iff n ≡ 1 (mod 8);
- a ≥ 3 iff n ≡ 5 (mod 8).
The remaining odd residue class n ≡ 7 (mod 8) also has a = 1. Thus the complete mod-8 partition is:
- residues 3, 7: negative local correction (a = 1);
- residue 1: zero local correction (a = 2);
- residue 5: positive local correction (a ≥ 3).

For uniformly sampled odd residues, P(a = k) = 2^{-k}, so E[a] = 2 and the one-step log multiplier heuristic is E[log(3/2^a)] = log(3/4) < 0. This is a residue-space heuristic, not an orbit theorem: successive valuations along a deterministic orbit are not thereby independent or equidistributed.

The tracked weighted correction identity is
  C_r = Σ_{j<r} 3^(r-1-j) (2^(a_j)-4) 2^(A_j),
where A_j is the cumulative exponent before step j. The weights vary with j and A_j. Consequently, merely proving an unweighted frequency statement about a_j = 1 cannot close the descent estimate.

### New research direction: residue-cylinder certificates
Build a finite-depth transition certificate on odd residue classes modulo 2^k:
1. Enumerate each class n mod 2^k and determine the exact valuation prefix it certifies, stopping when the valuation is at least k.
2. Propagate the class through the accelerated map only to the precision justified by that prefix; record when precision is lost or the next class is not uniquely determined.
3. Attach the exact signed correction and its 3-power block weight, rather than only the count of exponent-one steps.
4. Seek a proved block inequality that holds for every realizable residue cylinder, then a refinement/compactness argument as k grows.
5. Keep a machine-discovered finite bound separate from the required theorem that the bound holds for every orbit.

This is a candidate route, not a completed lemma. The key unresolved obstruction is uniform control of the weighted negative contributions on actual valuation words. A random-residue expectation or a finite search cannot supply that uniform bound.

### External lead requiring independent audit
ProofAtlas currently lists formalized results on logarithmic-time descent for a density-one set of Collatz starts, as well as Tao’s almost-bounded-orbit result. These are relevant partial results, not proofs that every start reaches 1. Before using any statement as a dependency, pin its source commit, inspect the exact Lean declaration and imported axioms, and verify the paper-to-formal-statement match. Do not transplant an external theorem merely from a summary page.

## 3. Erdős–Selfridge/BBMST: preserve the source-faithful proof chain

The 2021 BBMST result concerns the square-free-moduli case. It must not be presented as a solution to the unrestricted conjecture for arbitrary pairwise distinct odd moduli greater than one.

The source-mapped dependency chain recorded in the workspace is:
1. Lemma 2.1: fiber sieve and measure bounds, including zero-mass fibers.
2. Theorem 3.1: removed-mass estimate via first and second fiber moments.
3. Lemma 3.3: propagation of initial hyperplane weights.
4. Lemma 3.4: integer moments bounded by compatible hyperplane intersections.
5. Theorem 3.2: union count and the improved bound when a new singleton is absent.
6. Lemma 5.4: finite configuration exhaustion and integer probability certificates.
7. Lemma 5.3: uniform parameter bound from an exact rational vector and endpoint checks.
8. Corollary 5.2: exact integer recurrence plus finite prime sieve.
9. Theorem 1.2 and Theorem 1.1: assemble geometric and arithmetic conclusions.

The reusable algebraic inequality is
  Σ_i p_i α_i(1-α_i) ≥ ε(1-ε) Σ_{i∈S} p_i
when p_i ≥ 0, 0 ≤ α_i ≤ 1, and ε ≤ α_i ≤ 1-ε for i in S.
This is valid but not the difficult theorem. Progress requires deriving a nontrivial lower bound on the mass of such interior fibers from the original hyperplane geometry, rather than assuming it. The zero-mass fibers and α = 0,1 endpoint cases must be handled explicitly; division by a potentially zero rational denominator must never be used to smuggle in a conclusion.

### Next formal milestones
A. Formalize and audit the finite partition/fiber normalization and mass conservation.
B. Prove the moment-gap inequality from these definitions.
C. Identify the exact geometric hypothesis in BBMST that forces enough interior mass, and prove it from the paper's actual definitions.
D. Only then replace any placeholder criterion with a theorem derived from the source chain.
E. Run the configured Lean build and transitive axiom audit for the exact target theorem; report both independently.

## 4. Integrity protocol correction

“Empty axiom list” is not the right universal acceptance criterion for Lean developments: legitimate foundational dependencies can include propext, Classical.choice, and Quot.sound. The requirement is to enumerate the transitive dependencies and compare them against an explicitly declared trusted foundation, while rejecting project-specific unproved assumptions, sorry, and hidden placeholders. Also audit the actual proposition and definitions, not just the proof term.

## 5. Evidence status

This note is a literature-and-proof-obligation update. It does not change theorem statements, does not claim a new global mathematical result, and has not been Lean-compiled as a Lean source file. Existing CI records for the earlier tracked commits remain scoped to those commits and workflows.
