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


## 7. BBMST source audit refinement: exact finite-stage semantics

The original paper's actual authors are **Paul Balister, Béla Bollobás, Robert Morris, Julian Sahasrabudhe, and Marius Tiba**, “The Erdős–Selfridge problem with square-free moduli,” Algebra & Number Theory 15 (2021), 609–??, DOI 10.2140/ant.2021.15.609. The acronym is formed from those surnames; do not expand it as a different author list.

Source PDF: https://par.nsf.gov/servlets/purl/10300177

The source defines, for (Q_k=Q_{k-1}\times S_k), the fibre (F_x=\{(x,y):y\in S_k\}), the new removed set (B_k=\bigcup_{F\in N_k}A_F), and
`alpha_k(x) = |{y in S_k : (x,y) in B_k}| / |S_k|`.
This is a uniform *fibre-cardinality proportion*, not an arbitrary real-valued parameter and not necessarily a proper-subset witness for every x.

The stage measure is defined pointwise, with the source's two cases:
- on (B_k), multiply the previous uniform-fibre measure by `max(0, (alpha_k(x)-delta_k)/(alpha_k(x)*(1-delta_k)) )`;
- outside (B_k), multiply by `min(1/(1-alpha_k(x)), 1/(1-delta_k))`.

This exact formula has edge cases: when alpha is zero the removed branch must be handled without evaluating a division by zero; when alpha is one, the complement is empty and the outside branch is never queried on that fibre. A faithful Lean implementation should encode these cases explicitly (e.g. by piecewise definitions and proof obligations), not silently rely on rational division conventions.

Lemma 2.1's actual obligations are:
(4) preservation of mass for every (Q_{k-1})-measurable set;
(5) (P_k(S)\le P_{k-1}(S)/(1-\delta_k)) for every set S;
(6) (P_k(S)\le P_{k-1}(S)) whenever (S\subseteq B_k).
The paper then uses (P_n(B_k)=P_k(B_k)) for the stage-measurable (B_k), and the sum of the stage removed masses to show that a total below 1 implies the uncovered set is nonempty. These implications should be formalized before proving the moment bounds.

A crucial correction to the local-witness route: the paper's principal bound in Theorem 3.1 is the sum of `min(M_k^(1), M_k^(2)/(4*delta_k*(1-delta_k)))`, where (M_k^{(1)}=E_{k-1}[alpha_k]) and (M_k^{(2)}=E_{k-1}[alpha_k^2]). A positive local `alpha*(1-alpha)*mass` term is not by itself the required global bound. The proof must connect the exact pointwise update to these first and second moments and then to the source's summation criterion.

The source's hyperplane mapping is also explicit: a progression (a+d\mathbb Z), with square-free modulus (d=\prod_{i\in I}p_i), maps to the coordinate hyperplane fixing (x_i=a\bmod p_i) for (i\in I), leaving other coordinates unrestricted. Distinct square-free moduli correspond to distinct fixed-coordinate sets, hence nonparallel hyperplanes. The theorem is stated for finite covering systems with distinct square-free moduli greater than 1.

This section records source-derived obligations; it does not claim these stage-measure formulas have been fully formalized in this repository or that a new Lean build was run.


## 8. Collatz external formalization: exact import gate (2026-10-26)

A fresh read of the current ProofAtlas theorem pages sharpens the next action. The predecessor-density companion is not just a headline: it publishes the exact root declaration
`CollatzPredecessorDensity.nonconvergence_positive_lower_density_of_counterexample`
and its proposition says that if there exists a positive start that never reaches 1 under the ordinary map, then there are constants c>0 and X0 such that for every X≥X0 at least cX distinct positive starts below X also never reach 1. Its definition of the counting function counts positive starts strictly below X. This is a lower-density statement, not a natural-density limit.

The same package advertises `universal_reaches_one_of_arbitrarily_dense_convergence`: if for every epsilon>0 and every N there is a cutoff X≥N with at least (1-epsilon)X positive starts below X reaching 1, then every positive start reaches 1. This is a *conditional* global theorem; its density-one-like premise is not proved. The exact quantified premise is an arbitrarily-large-cutoff condition, not necessarily a limit along every cutoff.

Reproducibility boundary reported on the public artifact:
- companion root source commit: `c290ac229b379d2b51026d3e86140496870d6f39`;
- declared toolchain: `leanprover/lean4:v4.30.0-rc2`;
- recorded build passed and unfinished-step scan passed;
- reported standard foundations: `Classical.choice`, `Quot.sound`, `propext`;
- the source record explicitly does not claim a cold independent LeanChecker run or complete independently reconstructed dependency provenance; supporting source revision is `830b9d3f38f2a8da8cd921bf6a9310dd69336fd0`.

**New actionable task:** obtain the exact source supplement and pinned support package from the artifact, inspect the declaration bodies and imported dependencies, compare the theorem’s definitions of `Reaches`, `collatzStep`, and `countBelow` with our ordinary Collatz conventions, and run a clean build in a separately pinned environment if repository tooling permits. Do not copy the conclusion into our project as an established local theorem until that audit passes. This is a verification/import task, not a new proof of Collatz.

The separate logarithmic-time result states that for density-one many starts, some iterate descends below a threshold tending to infinity within 145 Syracuse steps (odd-relative density) or 436 raw Collatz steps (ordinary density), with a square-root corollary in a restricted window. Its own scope explicitly excludes universal convergence and arrival at 1. Therefore it cannot discharge the premise above.

Sources:
- https://www.proofatlas.ai/proofs/artifact.collatz.nonconvergence_positive_lower_density.v001.html
- https://www.proofatlas.ai/proofs/artifact.collatz.universal_reaches_one_of_arbitrarily_dense_convergence.v001.html
- https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
- https://www.proofatlas.ai/sources/positive-density-log-time-collatz/

## 9. Reliability protocol: strengthen, do not overstate

Tao's 9 October 2026 guest post by Thomas Hales reports that Lean soundness bugs were found in summer 2026, including a bug that enabled an illicit Collatz disproof, and discusses independent kernels and kernel verification. For this project, the operational response is layered evidence, not the claim that a kernel is literally infallible:
1. pinned clean build with no unfinished proof placeholders;
2. transitive `#print axioms` evidence for the actual theorem root;
3. independent source-to-statement audit of definitions and quantifiers;
4. where feasible, cross-check the proof term using an independently implemented checker/kernel and independently obtained source/dependency hashes;
5. retain a human-readable proof and a reproducible artifact manifest.

The standard axioms `propext`, `Classical.choice`, and `Quot.sound` are not equivalent to a mathematical conjecture such as Collatz or a placeholder axiom. “Axiom-free” should mean “no unapproved theorem assumptions beyond the explicitly accepted foundation profile,” not an empty output regardless of context.

Tao/Hales source: https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/

## 10. Paired project execution order

**Collatz, next high-value move:** audit/import the two conditional density roots above; then keep the remaining global gap explicitly isolated as an unconditional upper-density-one convergence theorem (or another genuinely global descent argument). Parallel exploration may search for a potential on realized valuation cylinders, but every candidate must prove realizability and a global quantifier—not just a good finite block.

**BBMST, next high-value move:** formalize the stage-measure update before trying to close the global criterion. First prove the pointwise normalization/total-mass identity on a finite fibre with explicit alpha=0 and alpha=1 branches; then prove Lemma 2.1 (4)-(6) in source order; only then derive the exact first/second-moment bound and summation criterion. The finite identity
`sum_i w_i a_i(1-a_i) = mu(1-mu)-V`
is a useful algebraic sublemma, but it cannot replace the source's `min(M1, M2/(4 delta (1-delta)))` term or its accumulated bound.

The four pillars are used as complementary methods, not as a promise that a breakthrough follows: abstract structure proposes lemmas; p-adic/continuous models generate hypotheses; Lean checks exact formal claims; experiments search finite cases and counterexamples. No pillar permits an invalid inference from “almost all” to “all”.


## 11. Additional ProofAtlas result located 2026-10-26: explicit positive-density logarithmic-time convergence

A fresh cross-check of the current ProofAtlas index surfaced a distinct result that should sit beside, not be conflated with, the 145/436-step descent-below-growing-threshold theorem:

- “Explicit Positive-Density Collatz Convergence in Logarithmic Time,” manuscript v2.1, states that there are fixed explicit constants c > 0 and X₀ such that for every X ≥ X₀ at least cX positive starts n < X reach 1 within 10.46 ln n ordinary Collatz steps.
- The public theorem-specific source page records four declarations, a 386-file first-party Lean closure, toolchain/source pins, and recorded build/axiom evidence. It says pinned Mathlib caches were reused; this is not an all-dependency cold rebuild or an independent LeanChecker replay.
- This is stronger than merely descending below a threshold for the guaranteed positive-density subset, because the conclusion is actual arrival at 1 for that subset. It is still only a fixed positive lower-density guarantee, not density-one convergence, and does not imply every orbit reaches 1.
- It does not conflict with the conditional positive-lower-density theorem for nonconvergent starts: a positive-density subset of convergent starts and (if a counterexample exists) a positive-lower-density subset of nonconvergent starts can coexist.

Operational change: prioritize obtaining and auditing this exact source package before designing another duplicate density theorem. Extract the explicit c and X₀ from the pinned source, check the step-count convention at n=1 and for small n where ln n is zero or small, confirm whether the proposition uses a natural-number bound rounded/floored in the formal statement, and compare its Reaches and counting definitions against the companion predecessor package. Do not infer a numerical c or X₀ from the headline alone.

Source: https://www.proofatlas.ai/formalizations/positive-density-log-time-collatz/
Artifact/source overview: https://www.proofatlas.ai/sources/positive-density-log-time-collatz/
Index cross-check: https://www.proofatlas.ai/

## 12. Updated cross-project priority

1. **Collatz:** audit the explicit positive-density/log-time package and the predecessor-density companion as one semantic family, while preserving their separate exact theorem scopes. The highest-value remaining global target is still an unconditional argument that upgrades positive-density convergence to density-one convergence or otherwise proves every start reaches 1. No amount of finite-prefix affine algebra alone supplies that upgrade.
2. **BBMST:** do not let the newly found Collatz result distract from the main outstanding proof engineering. Continue with the paper's exact stage measure and Lemma 2.1, not a stand-alone positivity or conservation lemma. The formal interface must encode the two-branch update and explicitly prove the endpoint behavior before the global moment sum is attempted.
3. **Joint audit:** every imported result gets a theorem-specific evidence sheet: source hash, toolchain, theorem root, all local dependency pins, standard axiom profile, unfinished-proof scan, exact definitions and quantifiers, and independent-review status. Label build evidence precisely; “checked with pinned cached dependencies” is not the same claim as “independently checked from a cold source build.”
