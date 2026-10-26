# Research continuation: 2026-10-26 exact descent contract and source-fidelity gates

This note records the next concrete proof obligations for both projects. It is a research artifact, not a claim that either open problem is solved and not evidence of a new Lean build.

## 1. Syracuse: make the finite-block criterion an exact interface

Let actual odd transitions satisfy
`2^{a_k} n_{k+1}=3n_k+1`, and let
`A_0=0`, `A_{k+1}=A_k+a_k`, `R_0=n_0`, and
`R_{k+1}=3R_k+2^{A_k}`.

The already-present induction theorem `finite_prefix_affine_identity` proves
`2^{A_N}n_N=R_N` for every prefix of actual transition equations. This is useful because it avoids pretending an arbitrary exponent word is an orbit.

### Exact expansion (ordinary induction)

Define
`C_N := sum_{0 <= j < N} 3^(N-1-j) * 2^(A_j)`.
Then
`R_N = 3^N*n_0 + C_N`.

Proof: at (N=0), the sum is empty and (R_0=n_0). If the formula holds at (N), then
`R_(N+1)=3R_N+2^(A_N)=3^(N+1)n_0 + sum_{j<N} 3^(N-j)2^(A_j)+2^(A_N)`,
which is exactly the (N+1) formula. The Lean implementation should first choose a sum convention whose successor simplification exposes the final term; avoid relying on truncated natural subtraction without proving (j<N).

### Exact descent criterion (integers, not truncated Nat subtraction)

Combining the two identities gives
`2^(A_N)*n_N = 3^N*n_0 + C_N`.
Let (D_N=2^{A_N}-3^N) in (mathbb Z). Since (2^{A_N}>0),
`n_N < n_0  <-> 3^N*n_0 + C_N < 2^(A_N)*n_0`
and hence
`n_N < n_0  <-> C_N < D_N*n_0`.
The last comparison is an integer inequality. A sufficient condition for descent for every integer (n_0ge3) in a fixed block type is (D_N>0) and (C_N<3D_N). This only applies to block types that are actually realizable by the exact valuation dynamics.

**Global gap:** no result here proves every orbit realizes a block satisfying this criterion. The criterion is a local certificate, not Collatz convergence.

### Formalization order

1. Define a correction term recursively, prove its closed form by induction, and separately prove equivalence to the finite sum.
2. Prove the integer descent equivalence with explicit positivity of (2^{A_N}); do not use Nat subtraction as if it were integer subtraction.
3. Define a realized transition block with exact valuations and odd quotient. Keep it distinct from a raw exponent list.
4. Prove a finite-depth cylinder counting/injectivity lemma; explicitly state what finite resolution proves and what it does not.
5. Only then investigate whether a global block/potential argument follows.

## 2. Collatz density bridge: quantifier audit

A tempting target is
“one nonterminating positive integer implies positive lower natural density of nonterminating positive integers.”
This is not established. It cannot be inferred merely from a positive-density set of terminating starts, nor from a density-one result saying trajectories descend below every growing threshold. Descent below a threshold is not arrival at 1.

A valid contradiction strategy would require both:
- a proved implication from a single counterexample to a sufficiently large exceptional set; and
- a proved theorem that excludes that exceptional set (for example, density-one termination, not merely almost-boundedness).

The ProofAtlas page at https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/ reports density-one almost-bounded/descent statements with separate odd-relative and ordinary densities and separate accelerated/raw step clocks. Preserve those distinctions and audit the formal declarations before using them. The main page https://www.proofatlas.ai/ itself says the full conjecture remains open and flags independent paper-to-statement review as pending for some results.

## 3. BBMST: a source-faithful local positivity contract

The current finite-fiber lemma says: if (t) is a nonempty proper subset of a nonempty finite fiber (s), then (0<|t|/|s|<1); with positive fiber mass, (alpha(1-alpha)m>0).

That does not yet establish the BBMST theorem. The bridge must show, from the paper's actual finite product space and stage measure:
1. the selected (s,t) are exactly the fiber and removed points used in the source definition of (alpha_k(x));
2. the fiber mass is positive for the correct (P_k);
3. the term occurs with the required coefficient in the source's sum;
4. all other terms have the needed sign;
5. the exact stage update yields the paper's Lemma 2.1 properties (preservation on earlier-measurable sets, distortion by (1/(1-delta_k)), and monotonicity on subsets of the removed set);
6. the progression-to-coordinate-hyperplane map preserves coverage and uses explicit square-free/distinct-modulus assumptions.

Do not assume the geometry supplies a proper nonempty removed subset; prove it from the source construction. If no such witness exists, the variance route needs the paper's strict inequality, not a guessed one.

Source: BBMST, “The Erdős–Selfridge problem with square-free moduli,” https://par.nsf.gov/servlets/purl/10300177.

## 4. Integrity protocol update: four separate claims

For each result, record separately:
- **Statement fidelity:** does the Lean proposition mean the paper's theorem, including hypotheses and edge cases?
- **Kernel/build:** does the pinned Lean/Mathlib source compile, with reproducible CI?
- **Transitive axioms:** what does `#print axioms` report, including dependencies?
- **Independent audit:** can a reviewer reconstruct the correspondence between informal mathematics and formal definitions?

A successful build alone does not prove source fidelity. A zero-measure exceptional set does not imply emptiness. A 2-adic compact embedding does not, by compactness alone, force every ordinary integer orbit to converge to a single sink. Sensor data can validate empirical physical predictions, but cannot replace a universal proof of a pure arithmetic statement.

## 5. External methodological references

- Tao, “What mathematicians should know about the Lean theorem prover—questions of reliability and AI” (2026-10-09): https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/
- Quanta, “Why the legendary Erdős problems are falling to AI” (2026-08-03): https://www.quantamagazine.org/why-the-legendary-erdos-problems-are-falling-to-ai-20260803/
- MAA, “AI solves an 80-year-old Erdős problem”: https://maa.org/math-values/ai-solves-an-80-year-old-erdos-problem/
- ProofAtlas: https://proofatlas.ai/
- OpenAI bulk release context: https://en.wikipedia.org/wiki/OpenAI_bulk_release_of_mathematical_papers

These are leads and methodological context, not proof dependencies. Any claimed AI discovery must still be tied to a stable theorem statement, exact source, artifact, build, and independent review.


## 6. Correction and new formal result discovered 2026-10-26

The earlier section “Collatz density bridge: quantifier audit” described the implication from a counterexample to positive lower density as not yet established. That is now superseded by the published ProofAtlas companion theorem discovered in the latest literature check.

ProofAtlas records three Lean-checked declarations in the “Positive Lower Density of Collatz Predecessors” release:
- `CollatzPredecessorDensity.predecessors_positive_lower_density`
- `CollatzPredecessorDensity.nonconvergence_positive_lower_density_of_counterexample`
- `CollatzPredecessorDensity.universal_reaches_one_of_arbitrarily_dense_convergence`

The second declaration formalizes: if some positive integer never reaches 1 under the ordinary Collatz map, then the set of positive starts that never reaches 1 has positive lower natural density. The third proves that if convergence to 1 has upper natural density one (stated as arbitrarily dense large cutoffs), then every positive integer reaches 1. Crucially, that density-one premise is not proved. These are published ProofAtlas claims; this project has not independently rebuilt their source or audited its imported dependencies.

Sources:
- https://www.proofatlas.ai/proofs/artifact.collatz.nonconvergence_positive_lower_density.v001.html
- https://www.proofatlas.ai/proofs/artifact.collatz.universal_reaches_one_of_arbitrarily_dense_convergence.v001.html
- https://www.proofatlas.ai/formalizations/positive-lower-density-collatz-predecessors/

This improves the research map: the “counterexample implies positive-density exceptions” bridge is no longer our open lemma target; it is an external formal result to import only after checking exact source, versions, axioms, and statement fidelity. The remaining statistical route is still blocked at the unconditional upper-density-one convergence premise. The known 145-step Syracuse / 436-step ordinary Collatz results concern descent below growing thresholds, not convergence to 1, and cannot fill that gap.

Verification boundary: ProofAtlas reports successful builds and lists its exact claims, but its own reproduction notes say some compiled dependencies were reused and the result is not an independent LeanChecker run. Do not present it as independently audited by this repository.
