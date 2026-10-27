# Research continuation: literature update and next proof obligations (2026-10-26)

Status: research/audit note only. No Lean build, kernel replay, CI run, or theorem proving universal Collatz convergence was performed in this update.

## 1. New literature and reliability context

### Tao / Hales on Lean reliability (9 October 2026)
Primary source: https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/

The guest post by Thomas Hales argues for three distinct layers:
1. kernel-check the proof;
2. audit statement fidelity and definitions against the intended informal theorem;
3. inspect axioms/dependencies and consider independent checkers/kernels.

It discusses the 2026 Lean soundness bugs, including an illicit Collatz disproof, the repaired kernel, Con-Leche, and the limitations of cross-checking. Operational consequence for these projects: do not equate a green build with a source-faithful theorem, and do not treat one kernel/checker as an absolute guarantee. Record exact Lean/Mathlib revisions, theorem roots, transitive axioms, build logs, and an independent statement review separately.

### AI-assisted Erdős work
- Quanta (3 August 2026): https://www.quantamagazine.org/why-the-legendary-erdos-problems-are-falling-to-ai-20260803/
- MAA (1 June 2026): https://maa.org/math-values/ai-solves-an-80-year-old-erdos-problem/
- ProofAtlas: https://www.proofatlas.ai/

These reports are evidence that AI can generate valuable mathematical routes and counterexamples; they do not transfer validity to our projects. Every result still needs a stable proposition, complete proof dependency, source alignment, and reproducible checks.

## 2. Syracuse: strengthen the exact local certificate, not the global claim

Current project source:
- branch: `collatz/valuation-cylinders-2026-10-26`
- file: `SyracuseAffineCore.lean`
- retrieved source blob SHA: `ca47fd77389449a329b75f681d4830e4b9af263c`

The file already contains the general finite-prefix affine identity. For actual transition equations
`2^(a_k) * n_(k+1) = 3*n_k + 1`, define prefix sums `A_0=0`, `A_(k+1)=A_k+a_k`, and recursively define `R_0=n_0`, `R_(k+1)=3*R_k+2^A_k`. The existing theorem proves
`2^A_N * n_N = R_N`
conditionally on those step equations. It does not prove an arbitrary exponent word is realizable.

Closed form:
`C_N = sum_{j < N} 3^(N-1-j) * 2^(A_j)`,
so `R_N = 3^N*n_0 + C_N`. This follows by induction from the recurrence; implement with a sum convention that makes the successor case transparent, rather than relying on truncated Nat subtraction.

For a fixed actual block, descent is exactly
`n_N < n_0 ↔ C_N < (2^A_N - 3^N) * n_0`,
where the comparison should be expressed over integers (not by silently treating Nat subtraction as integer subtraction). If `D_N = 2^A_N - 3^N > 0`, then the block descends exactly when `C_N < D_N*n_0`. A stronger uniform sufficient condition for all odd `n_0 ≥ 3` with a fixed realizable block is `C_N < 3*D_N`.

**No global conclusion:** neither `A_N > N*log_2(3)` nor 2-adic compactness proves the required inequality for the additive term. The missing global obligation remains: prove every orbit reaches a realizable block satisfying a descent certificate, or find another well-founded potential that decreases for every nonterminal orbit. A finite cylinder computation can discover/test block patterns, but cannot establish that all integer orbits descend unless accompanied by a uniform theorem.

### ProofAtlas results relevant to Collatz
- Positive lower density of predecessors of each fixed positive target not divisible by 3; accepted formalization listing: https://www.proofatlas.ai/formalizations/positive-lower-density-collatz-predecessors/
- Natural-density-one descent below growing thresholds in logarithmic time: https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
- Positive-density convergence in logarithmic time candidate: https://www.proofatlas.ai/formalizations/positive-density-log-time-collatz/

The predecessor result also lists a conditional theorem that one nonconvergent start implies positive lower natural density of nonconvergent starts, and another theorem that upper-natural-density-one convergence implies universal convergence. The latter's density-one premise is not proved. The positive-density logarithmic-time result guarantees only a positive fraction reaches 1 under explicit constants and a very large cutoff; it does not prove all starts reach 1. Keep these quantifiers and density notions separate.

Actionable Collatz order:
1. Prove the recursive correction term's closed form.
2. Prove the exact integer descent equivalence.
3. Represent *realized* valuation blocks separately from arbitrary exponent lists.
4. Verify finite-depth cylinder counting and the precise scope of each bound.
5. Search for a uniform descent theorem or a counterexample to proposed intermediate lemmas; do not upgrade density results to universal convergence.

## 3. BBMST: preserve the actual probability update

Primary source: Balister, Bollobás, Morris, Sahasrabudhe, Tiba, “The Erdős–Selfridge problem with square-free moduli,” Algebra & Number Theory 15 (2021), DOI https://doi.org/10.2140/ant.2021.15.609 ; paper PDF https://par.nsf.gov/servlets/purl/10300177

Current project source:
- branch: `audit/lean4-erdos-selfridge`
- file: `BBMSTFiberMassCore.lean`

The existing core proves elementary retained/removed mass conservation and nonnegativity. It deliberately does not prove the source's evolving probability measure, Lemma 2.1, or the final sieve criterion. These are separate obligations.

For the source's stage (k), the fibre is (F_x = \{(x,y): y\in S_k\}), the new removed region is (B_k), and
`alpha_k(x) = |{y in S_k : (x,y) in B_k}| / |S_k|`.
This is a uniform fibre-cardinality proportion. It must not be replaced by an arbitrary real parameter or by an unproved geometric rank surrogate.

The measure update is piecewise and requires endpoint-safe formalization:
- on (B_k), the multiplier is `max 0 ((alpha-delta)/(alpha*(1-delta)))`;
- outside (B_k), the multiplier is `min (1/(1-alpha)) (1/(1-delta))`.

Handle `alpha=0` and `alpha=1` before division. The first branch has no points when alpha is zero; the outside branch has no points when alpha is one. Prove those emptiness facts from the exact finite-cardinality definition, then prove the branchwise identities/inequalities.

### What rank-nullity/Bézout can and cannot do
Rank-nullity is valid when the maps are actual linear maps between specified finite-dimensional vector spaces. But the BBMST sets are coordinate hyperplanes in a finite product of finite fields; a rank statement does not by itself imply a fibre has a nonempty proper removed subset, nor positive mass under the updated measure. Bézout is not a direct substitute for the finite probability inequalities. Any proposed “fibre transversality” theorem must state:
1. the exact spaces and maps;
2. the hypotheses connecting them to the square-free coordinate-hyperplane model;
3. the conclusion that yields a source-required bound on (M_k^{(1)}) or (M_k^{(2)});
4. why the measure is positive and the endpoint cases are valid.

Until those links are proved, treat transversality as a research hypothesis, not a theorem.

Actionable BBMST order:
1. Define the exact finite product spaces, coordinate hyperplanes, and new-set family from the paper.
2. Prove `0 ≤ alpha_k(x) ≤ 1` and endpoint emptiness directly from finite cardinality.
3. Formalize the piecewise update with denominators protected by branch hypotheses.
4. Prove the three exact Lemma 2.1 properties (earlier-measurable preservation, global distortion, monotonicity on the removed set).
5. Only then derive the moment criterion and connect it to the square-free covering statement.

## 4. Shared integrity record

For every milestone, report four independent facts:
- **Mathematical implication:** exact theorem proved and hypotheses.
- **Statement fidelity:** source theorem matched, including edge cases.
- **Formal evidence:** Lean/Mathlib versions, reproducible build/CI transcript, no placeholders.
- **Axiom/checker evidence:** transitive `#print axioms`, and independent checker/kernel status where available.

A theorem with no custom axioms may still prove the wrong statement. A theorem that compiles may still depend on an unreviewed imported result. A correct local lemma is progress, but not the whole conjecture. Sensor experiments may test computational predictions; they cannot replace a universal proof about all natural numbers.

## 5. Status of this note

This is a literature and proof-obligation update. No repository code was modified by this note, no new Lean compilation was run, and neither the BBMST covering theorem nor the full Collatz conjecture is claimed solved.
