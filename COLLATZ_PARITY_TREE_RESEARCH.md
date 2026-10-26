# General parity-vector construction: implementation target

## Status boundary

The current file `TwoAdicValuationDistribution.lean` proves individual exact classes
for v₂(3n+1), through valuation 12, by divisibility and non-divisibility modulo
successive powers of two. These are finite local facts; they do not prove global
termination or descent.

## Literature adaptation

Terras, *A stopping time problem on the positive integers*, Acta Arith. 30 (1976),
241–252, proves periodicity of finite stopping-time data on residue classes modulo
powers of two. A July 2026 preprint by Mike Winkler, *Deterministic Structures in
the Coefficient Stopping-Time Dynamics of the 3x+1 Problem*, describes admissible
odd-position vectors as a rooted tree, with a recursion that generates each
admissible vector exactly once. The preprint explicitly does not prove global
Collatz termination or identify coefficient stopping time with classical stopping
time.

## Formalization plan

1. Define the parity vector of length k and the number of odd positions.
2. Define the affine iterate coefficients by recursion and prove the iterate
   identity, without assuming any conjectural descent.
3. Define admissibility using the coefficient inequality and intermediate
   stopping-time inequalities.
4. Define the parent map by deleting the final odd position; define child
   generation and prove admissibility is preserved exactly under the stated
   child conditions.
5. Prove a no-duplicates theorem for generated vectors and a completeness theorem
   for all admissible vectors.
6. Derive the unique residue class associated to each finite parity vector and
   prove periodicity modulo 2^k.
7. Reuse the existing exact valuation statements as regression tests. Avoid
   adding more isolated valuation classes unless they test the general theorem.

## Acceptance criteria

- Lean kernel compilation, no `sorry` or `sorryAx`.
- `#print axioms` for the affine iterate identity, recursion soundness,
  completeness, and residue-class theorem.
- Explicitly separate coefficient stopping time from classical stopping time.
- No claim of global Collatz proof unless a new global argument is independently
  established.
