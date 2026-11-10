External frontier scan — 2026-10-26

Scope: route-selection notes, not evidence that either conjecture is solved.

COLLATZ / SYRACUSE

ProofAtlas currently advertises formalized density or logarithmic-time results for Collatz dynamics, including natural-density-one descent in logarithmic time, a power-saving upper bound on starts that fail to descend within a logarithmic window, and lower bounds for predecessor counts. Its pages distinguish such statements from the full Collatz conjecture.

Useful transfer: treat stopping-time and density results as sources of quantitative candidate lemmas for valuation words. Translate only exact claims with pinned source commits and proof assumptions. Do not infer universal convergence from density-one convergence, positive-density predecessor bounds, or average valuation drift.

Our finite-prefix affine identity and record-time surplus make the missing universal statement visible: force a sufficiently good suffix along every realized orbit, not merely for most starts. The local exact-transition identity is 2^k(3*T(n)+1)=9*n+3+2^k, yielding the adjacent valuation congruence. Next formalize its connection to exact valuation-cylinder membership and investigate which finite valuation words are genuinely realizable by positive odd integers. Do not model the accelerated map as a globally continuous 2-adic map: the valuation singularity at -1/3 obstructs that simple route.

BBMST / ERDOS-SELFRIDGE

ProofAtlas's evidence model is a useful process template: keep the informal claim, exact Lean statement, check transcript, dependencies, and publication/review status separate.

The new BBMSTInteriorBand.lean target isolates alpha*(1-alpha) >= delta*(1-delta) for delta <= alpha <= 1-delta, and sums it against nonnegative masses over an actual finite filtered index set. This turns “interior mass” into a quantitative lower bound conditional on a band-mass hypothesis. It does not prove BBMST's hyperplane geometry supplies that band mass. The next real proof obligation is geometric, not algebraic.

RELIABILITY PROTOCOL

The Tao/Hales discussion of the 2026 Lean soundness bugs motivates three gates: (1) compile the exact declared targets and reject no-op builds; (2) audit theorem dependencies and axioms, and cross-check critical artifacts with a second checker/kernel when feasible; (3) audit statement fidelity against the source paper, including endpoints and whether any geometric condition was silently assumed.

A #print axioms report with standard foundations is useful evidence but does not establish statement fidelity. An empty axiom list is not by itself evidence that all imported declarations or the compiler/kernel are trustworthy.

Sources checked: Quanta Magazine, “Why the Legendary Erdős Problems Are Falling to AI” (3 August 2026); Terence Tao / Thomas Hales, “What mathematicians should know about the Lean Theorem Prover: questions of reliability and AI” (9 October 2026); OpenAI, “Sharing AI progress in mathematics” (6 October 2026, updated 15 October); ProofAtlas public pages; Balister–Bollobás–Morris–Sahasrabudhe–Tiba, “The Erdős–Selfridge problem with square-free moduli,” Algebra & Number Theory 15 (2021), DOI 10.2140/ant.2021.15.609.

The catalogue count “722 manuscripts / 372 related result families” is a corpus statistic, not a count of independently peer-reviewed or fully formalized theorems.
