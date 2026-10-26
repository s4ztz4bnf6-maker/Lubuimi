# Syracuse / Collatz: literature baseline and exact scope boundaries — 2026-10-26

## Why this note exists
The goal is the universal Collatz conjecture, not another density-one theorem. Existing formalized results should be used as baselines, while their exact quantifiers and density notions remain distinct.

## Public ProofAtlas results relevant to the project
The following public pages report formalized results, with their own stated verification scope:

1. **Natural-density logarithmic-time descent**:
   https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
   The page reports odd-relative-density-one Syracuse descent within 145 log N steps for odd starts and ordinary-natural-density-one raw Collatz descent within 436 log N steps for positive starts, under the page's threshold hypotheses.

2. **Explicit positive-density convergence**:
   https://www.proofatlas.ai/formalizations/positive-density-log-time-collatz/
   The page reports a fixed positive lower-density bound for starts reaching 1 within 10.46 ln n raw Collatz steps, with a fixed explicit cutoff. The page explicitly says this does not solve the full conjecture and that the numerical range is not practically small. The main page marks the formalization as Lean-checked while independent paper-to-statement alignment and acceptance review remain pending.

3. **Tao's logarithmic-density almost-bounded orbits**:
   https://www.proofatlas.ai/formalizations/tao-almost-bounded-orbits/
   The page states that for every diverging threshold f, logarithmically almost every positive start has an orbit minimum below f(N). This is logarithmic density, not natural density; it does not imply ReachesOne or universal convergence.

4. **Power-saving logarithmic-time descent bound**:
   The current ProofAtlas catalog reports a bound of at most 10,000,000·N^(-1/100) on the proportion of starts below N that do not fall below their start within k≤log n accelerated steps, for N≥15,552. This is a quantitative exceptional-set bound for a short descent event, not a proof that every individual orbit converges.

5. **Positive-density results beyond a fixed logarithmic coefficient**:
   A September 2026 preprint by Idris Ali Shaik claims positive-density convergence for every fixed coefficient c>3/log(4/3), and says a qualitative core is formalized in Lean while coefficient-size comparisons and complete optimized density bounds remain paper proofs. Treat this as a recent preprint, not as a fully kernel-verified end-to-end theorem. Before using it, inspect the paper's exact theorem, assumptions, and source revision.

These are literature baselines to inspect and pin, not results independently rechecked in this note. Before importing any theorem into our project, archive the exact Lean declaration, source revision, Lean/mathlib versions, dependency closure, build/check evidence, and an independent statement-fidelity comparison.

## Quantifier and density audit
Do not conflate:
- positive lower natural density of starts reaching 1;
- natural-density-one descent within a specified time bound;
- logarithmic-density-one orbit minima below a diverging threshold;
- a power-saving upper bound on a finite-scale exceptional fraction;
- every positive integer eventually reaching 1.

The first four can hold while a zero-density exceptional set remains. Universal Collatz requires eliminating every possible exceptional positive integer, not merely showing that the exceptional set has density zero. A quantitative density bound may shrink the exceptional set at finite scales, but unless it gives a pointwise bound for every input, it still leaves the universal problem open.

## New integration target
The valuation-word congruence and cycle filter in the companion note should be tested against these density results as a separate structural layer. They may constrain finite valuation patterns or periodic orbits; they do not currently close the exceptional-set gap. The exact cycle condition derived from the affine identity is:
`(2^A-3^N)n_0 = C > 0`, hence `2^A>3^N`, with `C = Σ_{j=0}^{N-1} 3^{N-1-j}2^{p_j}`.
For a proposed word, also require `(2^A-3^N) | C` and verify every actual valuation. This is a finite necessary-condition filter, not a sufficient cycle construction and not a global descent proof. The companion note now includes the regression vector for the known cycle n=1 and an exact finite-word reconstruction algorithm; that is a code-validation aid, not evidence against nontrivial cycles.

## Formal reliability update
The Lean FRO's August 2026 kernel-bug postmortems document more than one layer of failure: a genuine official-kernel soundness bug accepted a bogus Collatz disproof, and an independent checker had an unrelated bug that allowed that particular forged proof to pass. Later kernel-bug-hunt reporting says further kernel/runtime issues were found and describes plans for exported-proof rechecking and multiple checker backends. Therefore:
- A successful `lake build` is not by itself an adversarial-proof audit.
- `#print axioms` cannot expose a runtime/kernel exploit; a bogus proof can report no axioms.
- An independent checker helps only if its version is current and its implementation is sufficiently independent; record its version and known defects.
- Pin a patched Lean release and mathlib commit, and if adversarial or supply-chain robustness is in scope, export and recheck the proof with a current external checker. Do not assume the project's old Lean 4.28.0 pin is an adequate security baseline merely because ordinary CI passes.
- A kernel audit establishes trust in the proof artifact's type-checking pipeline; it does not establish that the formal proposition matches the intended Collatz conjecture. Statement fidelity remains a separate human review.

Official background:
https://leodemoura.github.io/blog/2026-8-1-postmortem-for-kernel-soundness-bug-14576/
https://leodemoura.github.io/blog/2026-8-24-postmortem-for-the-kernel-soundness-bug-hunt/
https://lean-lang.org/doc/reference/latest/releases/v4.32.2/

## Formal integrity protocol
- Use no `sorry`, `admit`, or unapproved axioms in our own theorem declarations.
- Run `#print axioms` transitively on exported theorems.
- Keep the exact standard raw Collatz map, accelerated map, and odd-only Syracuse map separate.
- Pin source commits and dependency versions; report only checks actually run.
- Treat a formal artifact as evidence for precisely its declared proposition, after a human statement-fidelity audit.
- Independent kernels/checkers improve assurance but do not establish infallibility; their versions and known defects must also be recorded.

## Source context
The recent discussion of Lean reliability stresses both kernel checking and human statement fidelity, and documents that cross-kernel checking alone did not catch every soundness issue:
https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/

AI-assisted Erdős breakthroughs also illustrate that changing representations and actively searching for counterexamples can be more productive than brute force, but results still require human mathematical interpretation and precise verification:
https://www.quantamagazine.org/why-the-legendary-erdos-problems-are-falling-to-ai-20260803/
https://maa.org/math-values/ai-solves-an-80-year-old-erdos-problem/
