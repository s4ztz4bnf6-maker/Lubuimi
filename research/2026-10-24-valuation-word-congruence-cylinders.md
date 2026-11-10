# Finite valuation words as nested congruence cylinders

Status: a new exact structural lemma proposal; not yet Lean-compiled and not a global Collatz result.

## Definitions

Fix a finite word of positive integers a_0,...,a_{k-1}. Put A_0=0, A_{j+1}=A_j+a_j, C_0=0, and C_{j+1}=3 C_j + 2^{A_j}. The affine recurrence gives

  2^{A_j} n_j = 3^j n_0 + C_j.

The prescribed word is realized at prefix j exactly when n_j is a positive odd integer and the valuation at that step is exactly a_j.

## Congruence characterization

For each j >= 1, the prefix condition that n_j is odd is equivalent to

  3^j n_0 + C_j ≡ 2^{A_j} (mod 2^{A_j+1}).

Since 3^j is invertible modulo 2^{A_j+1}, this condition specifies exactly one residue class for n_0 modulo 2^{A_j+1}. Thus each prefix defines a congruence cylinder. A finite word can only be realized when all prefix cylinders are compatible; because their moduli are nested powers of two, compatibility is decidable by comparing the residue classes under reduction.

This is an exact characterization of the parity/valuation constraints, subject to the separately checked positivity of every reconstructed n_j. It is not sufficient to infer that an arbitrary word occurs: incompatible prefixes or nonpositive reconstructed values must be excluded.

## Why this is useful

1. It separates word admissibility from the descent inequality.
2. It converts an orbit-realizability question into finite modular arithmetic.
3. It gives a route to exhaustive finite-word audits without confusing arbitrary exponent lists with actual orbit segments.
4. It can be formalized using integer congruences or ZMod (2^m), with the inverse of 3 proved from oddness.

## Proof obligations for Lean

- Prove the affine identity by induction on the prefix length.
- Prove 3^j is a unit modulo 2^(A_j+1).
- Prove the equivalence between odd quotient and the displayed congruence.
- Prove compatibility of nested power-of-two congruences is equivalent to residue reduction.
- Keep positivity of the reconstructed values as an explicit invariant.
- Audit the final theorem with #print axioms.

## Boundary

This structure does not prove that every orbit descends, nor does it establish the offset margin C_k < (2^A_k - 3^k) * n_0. Its value is to isolate the exact set of realizable words before searching for uniform descent bounds.
