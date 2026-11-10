# ProofAtlas density-one Collatz result: scope and formalization interface (2026-10-25)

## Purpose

This note records the external formalization frontier relevant to the Syracuse offset project and prevents a density-one theorem from being silently promoted to the universal Collatz conjecture.

## External benchmark

ProofAtlas reports a Lean-checked result titled **Natural-Density Collatz Descent in Logarithmic Time**. Its stated scope is:

- among odd starts, odd-relative natural-density-one many starts descend below their start within at most 145 log N accelerated Syracuse steps, in the stated threshold formulation;
- among positive integer starts, ordinary natural-density-one many starts descend below their start within at most 436 log N raw Collatz steps, in the corresponding threshold formulation;
- a related square-root descent window is also reported.

Primary evidence page: https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/

This is a useful comparison target, not a proof of the universal conjecture. The quantifiers and density notions must be copied exactly from the checked source before any Lean statement is reused. In particular, density one permits an exceptional set of density zero and does not say that the exceptional set is empty.

## Interface with this repository

The local Syracuse development currently targets exact finite-block arithmetic:

1. affine recurrence and canonical offset;
2. signed margin and its exact evolution;
3. valuation-specific residue restrictions;
4. conditional descent from a positive signed margin.

The new valuation-one block identity is

S_(m+r) = 3^r S_m - 2^(A_m+1)(3^r - 2^r),

under the explicit hypothesis that every exponent in the block equals one. This identity gives an exact local threshold. It does not imply that every orbit reaches a positive margin.

The proof obligation that remains is a global bridge from the constraints satisfied by realizable valuation words to a uniform descent conclusion. Arbitrary finite words cannot be treated as actual orbits without proving realizability.

## Proposed next formalization targets

### Target A: statement-fidelity import

Record the exact theorem statement, hypotheses, logarithm convention, threshold function, and density definition of the ProofAtlas result in a separate specification file. Do not import an unverified paraphrase as a theorem.

### Target B: exceptional-set implication

Formalize the logical distinction between a density-one set of starts with a bounded logarithmic descent time and universal descent for every positive integer. Then identify and prove any additional dynamical lemma needed to turn a hypothetical counterexample into a positive-density exceptional set. The ProofAtlas index page reports a positive-lower-density predecessor result for fixed targets not divisible by 3 and notes that a counterexample would force positive lower density of nonconvergence; this implication must be checked against its exact theorem and proof before adoption.

### Target C: local arithmetic strengthening

Continue to connect exact valuation cylinders and affine offsets. For each finite valuation word, prove its necessary congruence conditions, a precise divisibility characterization of admissible starts, the exact block multiplier and correction term, and the condition under which the block forces descent. The goal is to make the orbit-realizability constraint part of the theorem interface, not a heuristic afterthought.

## Reliability requirements

- Run CI on the exact commit.
- Audit the transitive axiom dependencies of every claimed theorem.
- Treat propext, Classical.choice, and Quot.sound as foundational dependencies to report, not automatically as project gaps.
- Reject any project-specific unproved axiom or sorryAx in the final theorem dependency graph.
- For a high-assurance claim, compare with an independent checker/kernel and manually audit statement fidelity.
- Never label density-one descent as a universal Collatz proof.

## Source references

- ProofAtlas, Natural-Density Collatz Descent in Logarithmic Time: https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
- ProofAtlas formalization index: https://www.proofatlas.ai/formalizations/
- Tao / Hales, What mathematicians should know about the Lean Theorem Prover: https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/
