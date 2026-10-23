# BBMST axiom source audit (2026-10-23)

## Status boundary

The Lean theorem `erdos_selfridge` in `ErdosSelfridge_v17_fixed.lean` is **not currently axiom-free**. Its dependency report intentionally retains two admitted declarations:

- `sieve_criterion`
- `sf_sieve_lt_one`

The proved Lean layer establishes the finite-list monotonicity bridge from square-free block sizes to the corresponding non-square-free block sizes. That bridge does not prove either analytic/combinatorial BBMST input.

## Obligations before an axiom can be discharged

1. **Source statement:** pin the exact published/preprint version and quote the theorem/lemma statement and hypotheses that are being formalized. The source mapping currently labels `sieve_criterion` as Theorems 3.1+3.2 and `sf_sieve_lt_one` as Theorem 1.1, but labels alone are not a proof of equivalence.
2. **Parameter correspondence:** prove that the Lean `δs`, `ca1`, and `ca3` match the paper's parameters, including the indexing/length convention. The condition `δs.length = primes.length` is part of the admitted interface and must be justified from the source rather than treated as an established consequence.
3. **Quantifiers and domain:** verify whether the source result applies to every finite list of odd primes as stated, or only to a particular sieve setup / parameter family. Do not generalize a numerical computation or a result for a covering system into a universal statement without a source-faithful derivation.
4. **Kernel boundary:** after replacing an axiom, inspect `#print axioms erdos_selfridge` and confirm that no replacement axiom, `sorry`, or hidden admitted declaration remains.

## Current theorem status

No claim is made here that the Erdős–Selfridge conjecture has been proved axiom-free. This note records proof obligations, not a mathematical resolution. The next valid milestone is a source-matched formal statement and proof of one of the two admitted interfaces, or a concrete counterexample to the current interface if its quantifiers are too strong.
