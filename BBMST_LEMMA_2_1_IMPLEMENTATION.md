# BBMST Lemma 2.1: implementation contract

## Mathematical target

Formalize the published square-free-moduli argument of Balister, Bollobás, Morris, Sahasrabudhe and Tiba (2021), not the unrestricted Erdős–Selfridge conjecture. The theorem says a finite covering system with distinct square-free moduli greater than one must contain an even modulus.

The existing `BBMSTFiberMassCore.lean` and `BBMSTProbabilityInterface.lean` prove generic finite weighted-fiber algebra. They do not yet instantiate the source's geometry, hyperplanes, or conditional estimates.

## Immediate milestone: source Lemma 2.1

Use a finite coordinate box and an explicit finite measure. For each sieve coordinate and each fiber:
- define the removed set and surviving set from the actual hyperplane family;
- define the fiber mass without dividing by a possibly zero mass;
- prove the three source measure bounds as separate lemmas;
- split zero-mass and positive-mass fibers explicitly;
- only then sum the local inequalities using the existing weighted-fiber partition theorem.

Do not introduce independent abstract coefficients and then call them geometric estimates. The incidence relation between hyperplanes and fibers must be represented in the definitions and proved.

## Proof-chain checkpoints

1. **CRT bridge:** prove both directions between the square-free arithmetic covering and the nonparallel hyperplane cover. Exclude modulus one and trivial hyperplanes explicitly.
2. **Lemma 2.1:** construct the finite probability space and prove fiber bounds with zero-mass conventions.
3. **Theorems 3.1–3.2 / Lemmas 3.3–3.4:** formalize first/second moments and propagation of hyperplane weights.
4. **Finite certificate:** encode the published 480-point certificates using exact integer/rational arithmetic. The public reconstruction reports 9,283 primal certificates and an exact checker; treat this as a target dataset, not as Lean verification.
5. **Parameter/tail obligations:** formalize the exact rational parameter checks and separate the finite certificate from the analytic tail theorem.
6. **Endpoint audit:** `#print axioms` on the final endpoint; no `sorryAx`, and every imported theorem remains visible.

## Reproducibility and source fidelity

The published paper's theorem and the public reconstruction distinguish the square-free result from the unrestricted conjecture. The reconstruction also records important version details: published Theorem 3.2 permits coordinate size two in its improved second-moment bound, and the finite certificate uses exact arithmetic. These are test cases for translation fidelity.

## Acceptance criteria

A module is not complete merely because it compiles. For each lemma, record: source statement, Lean statement, hypothesis mapping, proof dependencies, and axiom footprint. Any mismatch is a formalization defect until explained.
