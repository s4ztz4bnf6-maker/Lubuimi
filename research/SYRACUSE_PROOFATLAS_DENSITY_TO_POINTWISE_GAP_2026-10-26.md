# Syracuse continuation target from current ProofAtlas Collatz formalizations
Date: 2026-10-26

## External benchmark inspected

ProofAtlas currently lists two distinct checked Collatz-strength results relevant to this project:

1. “Tao's Almost-Bounded Collatz Orbits”:
   https://www.proofatlas.ai/formalizations/tao-almost-bounded-orbits/
   Its displayed exact endpoint is logarithmic density one for the set of positive starts N with orbit minimum strictly below f(N), for every f : N -> R tending to infinity. The page explicitly says this is not natural density one, not a uniform rate in f, not ReachesOne, and not the full Collatz conjecture.
2. “Natural-Density Collatz Descent in Logarithmic Time”:
   https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
   The displayed theorem gives natural-density-one descent below growing thresholds within a logarithmic number of raw steps (436 log N), with an odd-relative-density Syracuse counterpart (145 log N). Its page explicitly allows a density-zero exceptional set and says it does not prove universal convergence or arrival at 1.

These are external, page-reported accepted formalization statuses. This repository has not independently fetched, built, or audited their pinned source closures in this task.

## What these results do and do not give our project

They establish a strong research benchmark: global distribution of valuation words, phase-gap input, Fourier/mixing estimates, and a two-adic lift can yield quantitative descent for almost all starting values. They do not supply the missing pointwise theorem for every positive integer.

In particular, no implication of the form
“density-one set of starts descends below f(N) -> every start reaches 1”
is valid. A density-zero exceptional set may contain a counterexample, and “falls below a growing threshold” is not the same as reaching 1.

## Revised target ladder

The next Syracuse work should target the following strict ladder, proving each implication rather than conflating endpoints:

A. Exact finite-cylinder statements for valuation words.
B. Uniform, explicit bounds for the exceptional set of starts that fail to descend below a fixed threshold by a given time.
C. Improve the exceptional-set bound from logarithmic density to natural density, or sharpen the rate for a restricted threshold family, only if the proof justifies it.
D. Pointwise global convergence requires an additional mechanism that eliminates every exceptional start; a density estimate alone cannot do this.
E. To infer reaching 1, establish a genuine descent/termination argument, not merely an orbit minimum below a threshold tending to infinity.

The present repository's exact valuation-cylinder and affine-prefix results support A, but do not currently establish B–E.

## Local regularity regression correction

The 2-adic regression now checks the valuation difference directly:
v2(x' - x) - v2(T(x') - T(x)) = k
for tested nonzero integer perturbations in a fixed valuation cylinder. Since |m|_2 = 2^(-v2(m)), this proves the expected norm ratio |T(x')-T(x)|_2 / |x'-x|_2 = 2^k for those test instances. The finite regression passed 2,600 local-cylinder cases; this is not a proof for all 2-adic inputs.

## Formal evidence boundary

Terry Tao's 9 October 2026 post emphasizes both kernel checking and human statement-fidelity audit, and discusses the summer 2026 soundness bugs and independent kernel checking:
https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/

For this project, a passing Lean build and an axiom scan must be accompanied by:
- exact source and toolchain pinning;
- inspection of every hypothesis and imported theorem;
- explicit distinction between natural density, logarithmic density, pointwise convergence, and reaching 1;
- no claim that an external formalization has been independently reproduced until it has actually been built and audited here.
