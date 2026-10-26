# Syracuse / Collatz: literature baseline and exact scope boundaries — 2026-10-26

## Why this note exists
The goal is the universal Collatz conjecture, not another density-one theorem. Existing formalized results should be used as baselines, while their exact quantifiers and density notions remain distinct.

## Public ProofAtlas results relevant to the project
The following public pages report formalized results, with their own stated verification scope:

1. Natural-density logarithmic-time descent:
   https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
   The page reports odd-relative-density-one Syracuse descent within 145 log N steps for odd starts and ordinary-natural-density-one raw Collatz descent within 436 log N steps for positive starts, under the page's threshold hypotheses.

2. Explicit positive-density convergence:
   https://www.proofatlas.ai/formalizations/positive-density-log-time-collatz/
   The page reports a fixed positive lower-density bound for starts reaching 1 within 10.46 ln n raw Collatz steps, with a fixed explicit cutoff. The page explicitly says this does not solve the full conjecture and that the numerical range is not practically small.

3. Tao's logarithmic-density almost-bounded orbits:
   https://www.proofatlas.ai/formalizations/tao-almost-bounded-orbits/
   The page states that for every diverging threshold f, logarithmically almost every positive start has an orbit minimum below f(N). This is logarithmic density, not natural density; it does not imply ReachesOne or universal convergence.

These are literature baselines to inspect and pin, not results independently rechecked in this note. Before importing any theorem into our project, archive the exact Lean declaration, source revision, Lean/mathlib versions, dependency closure, build/check evidence, and an independent statement-fidelity comparison.

## Quantifier and density audit
Do not conflate:
- positive lower natural density of starts reaching 1;
- natural-density-one descent within a specified time bound;
- logarithmic-density-one orbit minima below a diverging threshold;
- every positive integer eventually reaching 1.

The first three can hold while a zero-density exceptional set remains. Universal Collatz requires eliminating every possible exceptional positive integer, not merely showing that the exceptional set has density zero.

## New integration target
The valuation-word congruence and cycle filter in the companion note should be tested against these density results as a separate structural layer. They may constrain finite valuation patterns or periodic orbits; they do not currently close the exceptional-set gap. The exact cycle condition derived from the affine identity is:
`(2^A-3^N)n_0 = C > 0`, hence `2^A>3^N`, with `C = Σ_{j=0}^{N-1} 3^{N-1-j}2^{p_j}`.
For a proposed word, also require `(2^A-3^N) | C` and verify every actual valuation. This is a finite necessary-condition filter, not a sufficient cycle construction and not a global descent proof.

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
