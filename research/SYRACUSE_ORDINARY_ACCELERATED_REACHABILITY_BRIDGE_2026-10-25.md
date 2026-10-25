# Syracuse bridge frontier: port the conditional density theorem without confusing dynamics (2026-10-25)

## External formal result and exact scope

ProofAtlas records three checked Lean roots in Lech Mazur's *Positive Lower Density of Collatz Predecessors*:
- `CollatzPredecessorDensity.predecessors_positive_lower_density`
- `CollatzPredecessorDensity.nonconvergence_positive_lower_density_of_counterexample`
- `CollatzPredecessorDensity.universal_reaches_one_of_arbitrarily_dense_convergence`

Sources:
- https://www.proofatlas.ai/formalizations/positive-lower-density-collatz-predecessors/
- https://www.proofatlas.ai/sources/positive-lower-density-collatz-predecessors/

The source page identifies Lean v4.30.0-rc2, Mathlib revision 5450b53e5ddc75d46418fabb605edbf36bd0beb6, and pinned source archive hashes. This project currently uses a different Lean toolchain (4.35.0); therefore, the source is a theorem benchmark and porting target, not an import that can be presumed compatible. The published verification reused pinned compiled dependencies and is not described as a cold rebuild or an independent LeanChecker run.

## The exact logical opportunity

The formal result states:
- If any positive starting value never reaches 1 under ordinary Collatz iteration, nonconvergent starts have positive lower natural density.
- If convergence to 1 has upper natural density one, then every positive integer reaches 1.
- It does not prove that the density-one premise holds.

Our local accelerated map on odd states is
\[
T(n)=\frac{3n+1}{2^{v_2(3n+1)}}.
\]
For odd n, this is the odd state obtained after one ordinary odd step 3n+1 followed by removing all powers of two. The bridge needed is exact reachability equivalence:
\[
\text{ordinary Collatz orbit of }n\text{ reaches }1
\iff
\text{accelerated odd Syracuse orbit of the odd part of }n\text{ reaches }1.
\]
The formalization should prove this as a separate theorem by relating each accelerated step to a finite, nonempty block of ordinary steps, and relating the ordinary trajectory's odd subsequence to iterations of T.

## New work plan: make the conditional theorem composable

1. Define the ordinary map and the odd accelerated map separately; do not identify their step counts.
2. Prove the transition simulation in both directions. Each accelerated step must be backed by an exact divisibility/valuation witness; no real-valued or probabilistic approximation is needed.
3. Port the density theorem's statement interface first, under a clearly named hypothesis or a theorem proved from source. Record the source's density convention and quantifier order exactly.
4. Prove that a nonconvergent odd Syracuse orbit corresponds to an ordinary nonconvergent orbit. Conversely, make sure a finite even prefix or a zero-step reachability convention does not create a mismatch.
5. Only after the simulation theorem is checked, connect the external conditional density result to the accelerated project.
6. Keep the missing premise visible: our signed-margin and weighted-correction lemmas prove local arithmetic facts, not density-one convergence to 1.

## Why the existing correction expansion still matters

The exact identity
\[
M_{r+1}=3M_r+(2^{a_r}-4)2^{A_r}
\]
classifies local correction signs: exponent 1 is negative, exponent 2 is zero, and exponent at least 3 is positive. The residue partition identifies the exponent-one branch with n congruent to 3 mod 4, and the positive-correction branch with n congruent to 5 mod 8. What is missing is a uniform orbit-level estimate on the weighted balance. The unweighted density P(v2(3n+1)=k)=2^{-k} for uniformly sampled odd residue classes cannot simply be substituted for the orbitwise distribution: the weights 2^{A_j} are state-dependent and can bias the accumulated correction.

## Falsification gates

- Density-one descent below the initial state is not density-one convergence to 1.
- Almost-bounded orbit results are not a theorem that every orbit reaches 1.
- A density-zero exceptional set is not necessarily empty.
- A formal theorem in the external package does not become part of this repository until its exact source, dependency pins, statement, and axiom closure are reproduced or faithfully ported.
- Do not call a port complete until end-to-end CI and the transitive axiom audit succeed.

## Status

This is a concrete formalization bridge plan and source pin record, not a Collatz proof. The next useful theorem is the two-way simulation between ordinary Collatz reachability and accelerated odd Syracuse reachability; it is prerequisite plumbing that makes the existing external density theorem usable without changing its meaning.
