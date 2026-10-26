# Collatz literature boundary and next proof obligation

Date: 2026-10-25

## Current external boundary

ProofAtlas's public catalogue explicitly distinguishes density-one Collatz results from the all-start conjecture. Its featured natural-density logarithmic-time theorem states that almost all starts descend below a threshold tending to infinity, while explicitly warning that this does not prove convergence for every start or arrival at 1. The catalogue also lists a power-saving bound for the proportion of starts that fail to descend within a logarithmic-time window. See https://www.proofatlas.ai/formalizations/.

This is an important boundary condition for our project: probabilistic or density-one control can leave a density-zero exceptional set. The global conjecture requires eliminating every exceptional start or proving an alternative exhaustive termination statement.

## Candidate bridge from our exact margin recurrence

For a certified exponent word, the existing affine recurrence is

A_(j+1) = A_j + a_j,
C_(j+1) = 3 C_j + 2^(A_j),
2^(A_j) n_j = 3^j n_0 + C_j.

Define the integer-valued signed margin

M_j = 2^(A_j) - 3^j - C_j.

Its formalization should establish the exact cocycle

M_(j+1) = 3 M_j + 2^(A_j) (2^(a_j) - 4),

and then the exact finite weighted-sum identity

M_N = sum_{j<N} 3^(N-1-j) 2^(A_j) (2^(a_j)-4).

The sum's positivity is sufficient for a start-independent descent margin when n_0 > 1, but has not been proved for every realizable exponent word. The crucial missing theorem is a universal balance estimate derived from the actual residue/admissibility constraints of Syracuse trajectories, not from an assumed random distribution of exponents.

## Why 2-adic continuity alone is insufficient

The extension of the ordinary Collatz map to 2-adic spaces can organize congruence information and finite exponent words, but continuity on a compact space does not imply that every integer orbit converges to 1. A compact dynamical system may have cycles, recurrent sets, or nonconvergent trajectories. Any use of topological or ergodic tools must therefore prove an additional arithmetic exclusion theorem for every positive integer start.

## Formalization and audit sequence

1. Define M over integers to avoid natural-number truncated subtraction.
2. Prove the one-step cocycle from the exact recurrences.
3. Prove the finite weighted-sum expansion by induction.
4. Prove a separate theorem connecting M_N > 0 to the already formalized exact descent margin.
5. Derive block-balance estimates only from verified admissibility lemmas.
6. Audit transitive axioms and the exact accelerated-map statement.

No global Collatz proof is claimed. The present contribution is a precise proof obligation that cannot be replaced by a density-one theorem or by compactness alone.
