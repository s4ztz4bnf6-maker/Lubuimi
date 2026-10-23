# Research target: exact finite Syracuse valuation cylinders

Status: research specification, not a proved Lean theorem.

## Mathematical target

For the accelerated odd map T(n) = (3n+1)/2^v2(3n+1), fix a finite word a=(a_0,...,a_{k-1}) of positive integers and S=sum_i a_i. Characterize exactly the odd starts n whose first k accelerated valuations equal this word.

The candidate is a single residue class modulo 2^(S+1), but the modulus and admissibility conditions must be proved for this precise indexing convention, not assumed by analogy. Prove both directions, including strict valuation conditions.

## Why this is the next lemma

Bernstein-Lagarias 2-adic conjugacy and the De Bruijn graph viewpoint encode finite parity prefixes by residue classes. For the accelerated odd-to-odd map, a valuation word compresses consecutive parity bits. This finite-prefix structure does not imply that every positive integer orbit globally descends.

The existing exact descent criterion is 3^k*n_0 + C_k < 2^S*n_0. Once the cylinder theorem is proved, study the affine residual on the corresponding residue class. For each word, characterize starts in its cylinder that fail to descend, preserving the residual term.

## Formal proof plan

1. Define a finite word Fin k -> Nat with every valuation positive.
2. Prove the one-step criterion using divisibility by 2^a and non-divisibility by 2^(a+1).
3. Inductively derive the affine iterate and congruence on the initial odd state.
4. Prove uniqueness via invertibility of odd powers modulo powers of two; prove the converse using the strict valuation conditions.
5. Connect the prefix theorem to strict_descent_iff_affine_margin.
6. Run Lean and the axiom audit; report success only after CI confirms it.

## Boundary

This classifies finite prefixes only. It does not prove that cumulative valuations exceed k log_2(3) along every infinite positive orbit, nor that the affine residual is uniformly controlled.

## Research pointers

- Bernstein-Lagarias, The 3x+1 Conjugacy Map.
- The Collatz conjecture and De Bruijn graphs, Indagationes Mathematicae 24 (2013), 971-983.
- Recent independent preprints on exact valuation cylinders should be treated as candidate derivations to verify, not as proof certificates.