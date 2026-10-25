# External Collatz theorem: import candidate and trust audit

Date: 2026-10-25

## Candidate partial result

ProofAtlas publishes Lech Mazur's “Natural-Density Almost-Bounded Collatz Orbits in Logarithmic Time”, version 2, with a pinned first-party source commit:
  ca3dd0d63920411213403092aecc6946619eb082
Main file: Erdos1135/ND/LogTime/Paper.lean
Main declaration: Erdos1135.ND.ndRhinLogTimePaperPackage
Source page: https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
Pinned source browser: https://www.proofatlas.ai/sources/natural-density-log-time-collatz/

The exact advertised scope is:
- for thresholds f tending to infinity along odd inputs, odd-relative natural-density-one many odd starts have an accelerated Syracuse iterate below f(N) within 145 log N Syracuse steps;
- for thresholds f tending to infinity on all positive inputs, ordinary natural-density-one many positive starts have a raw Collatz iterate below f(N) within 436 log N raw steps;
- a separate corollary gives a square-root hit in a logarithmic time window.

This is stronger than merely saying that almost all starts eventually go below their starting value, but it explicitly permits a density-zero exceptional set and does not prove convergence of every orbit or arrival at 1.

## Critical evidence qualification

The source page records toolchain `leanprover/lean4:v4.30.0-rc2` and build evidence collected on 2026-07-17. The later Lean soundness bug affecting an illicit Collatz disproof was reported and fixed in late July 2026. The page's recorded successful build therefore predates that incident. This does not establish that the theorem is false; it means the old build record alone is not sufficient for our current trust gate.

The external page reports four review gates accepted, but also states that the formal-evidence reviewer did not rerun Lean and that reviewer independence was not asserted. Our acceptance gate must therefore be stronger: obtain the exact source bytes and dependency pins, rebuild the import closure with a patched kernel, audit the exact declaration's transitive axioms and unfinished-proof status, and compare the formal statement to the intended paper theorem.

Our current Collatz research branch pins Lean/Mathlib v4.35.0. Use that patched toolchain as the first recheck target, without assuming the old v4.30.0-rc2 evidence carries over automatically.

## Mathematical route worth extracting

The checked package's eight-stage route is unusually relevant:
1. Rhin's quantitative Diophantine phase-gap bound for multiples of log_2(3);
2. a fixed quantitative passage-error bound;
3. a telescoping rate with exponent d = 6993/200000 < 5/143;
4. a fixed-target natural-density descent estimate;
5. absorption of any threshold tending to infinity;
6. a deterministic two-adic lift from odd cores to all positive starts;
7. separate Syracuse and raw Collatz time constants.

The exact recorded constants are C_syr = 501501/(5000 log 2) < 145 and C_coll = 1509503/(5000 log 2) < 436. These are source-reported values; do not cite them as independently reproduced by this repository until the patched-kernel recheck is complete.

## Action plan

A. Download the pinned source closure and evidence JSON; record checksums.
B. Rebuild with Lean/Mathlib v4.35.0 in an isolated branch and record all compatibility edits.
C. Run `#print axioms Erdos1135.ND.ndRhinLogTimePaperPackage` and the corresponding check for the square-root corollary; also scan for `sorry`, project axioms, unsafe declarations, and untrusted native computation boundaries.
D. Audit the formal statement's exact quantifiers: odd-relative density vs ordinary density, arbitrary diverging thresholds, strict inequality, and separate clocks.
E. Only after successful recheck, reuse its partial theorem or proof modules as a verified lemma. It still cannot discharge the global all-start Collatz obligation.

## Trust references

- ProofAtlas exact theorem/evidence: https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
- Pinned source and recorded toolchain: https://www.proofatlas.ai/sources/natural-density-log-time-collatz/
- Tao/Hales reliability discussion: https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/
- Lean kernel bug postmortem: https://leodemoura.github.io/blog/2026-8-1-postmortem-for-kernel-soundness-bug-14576/

This is an import/reverification plan, not a claim that the external theorem has been independently rechecked here.
