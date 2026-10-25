# Syracuse: the exact distribution-to-pointwise bridge (2026-10-25)

## Verified external theorem to incorporate carefully

ProofAtlas records a conditional theorem: if there exists even one positive starting value whose ordinary Collatz orbit never reaches 1, then the set of all positive nonconvergent starting values has positive lower natural density. It also records that upper-natural-density-one convergence to 1 would imply convergence for every positive start. These are different from Tao's almost-bounded-orbit theorem and from density-one descent below a threshold that tends to infinity.

External reference pages:
- https://www.proofatlas.ai/formalizations/positive-lower-density-collatz-predecessors/
- https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
- https://www.proofatlas.ai/formalizations/tao-almost-bounded-orbits/

## Exact logical architecture

Let \(E=\{n>0:\text{the Collatz orbit of }n\text{ never reaches }1\}\).

The recorded predecessor theorem gives
\[
E\ne\varnothing\quad\Longrightarrow\quad
\underline d(E)>0.
\]
Consequently,
\[
d(\{n>0:\text{orbit reaches }1\})=1
\quad\Longrightarrow\quad E=\varnothing.
\]

This is a valid route from a **natural-density-one convergence-to-1 theorem** to universal convergence. It is not enough to prove that almost all starts fall below their initial value, or that almost all orbit minima lie below a diverging threshold. Those statements do not assert that the orbit reaches 1.

## How this changes the local project

The existing signed block margin is a local exact certificate: positive margin proves a strict endpoint descent for a certified block. The missing step is not the algebra of that certificate; it is a uniform statement about how often such certificates force actual arrival at 1, strong enough to contradict the positive-lower-density consequence of any counterexample.

A candidate research program is therefore:

1. Define a decidable finite certificate \(C(n,B)\): a verified block from \(n\) reaches a state below a specified threshold \(B\), with every transition and valuation checked exactly.
2. Formalize a transfer theorem from a hypothetical nonconvergent seed to a positive-lower-density family of starts whose trajectories avoid the full convergence event. Do not assume that merely avoiding one local certificate is equivalent to nonconvergence.
3. Prove an unconditional natural-density-one theorem for **reaching 1**, not merely for descending or becoming almost bounded; or prove a stronger certificate-avoidance estimate that contradicts the predecessor theorem.
4. Keep all quantifiers and density notions explicit: natural density versus logarithmic density; hitting 1 versus falling below the start; a density-one set versus every start.

## Falsification checks

- A theorem about orbit minima must not be silently substituted for a theorem about reaching 1.
- A density-zero exceptional set is not empty by definition.
- A finite prefix with positive margin is not a certificate of eventual arrival at 1 unless the terminal condition explicitly connects it to a previously solved state.
- If a proposed proof derives only upper density one for descent, check whether the cited theorem really concerns convergence to 1. If not, the implication is invalid.

## Status

This is a research-path clarification, not a new proof of Collatz. The external implication is recorded as a checked formal theorem by ProofAtlas; it has not yet been imported or independently replayed in this repository. Our own Syracuse files still need successful end-to-end CI and the transitive axiom audit.
