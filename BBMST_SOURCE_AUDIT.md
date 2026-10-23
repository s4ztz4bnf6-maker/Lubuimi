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

## Source identification warning (added 2026-10-23)

A source search surfaced the paper *The Erdős–Selfridge problem with square-free moduli* by Paul Balister, Béla Bollobás, Robert Morris, Julian Sahasrabude and Marius Tiba, Algebra & Number Theory 15 (2021), 609–626. Its public full-text record is available at Oxford's repository:
https://ora.ox.ac.uk/objects/uuid:3c55267c-60be-4652-89a7-db3db5f62c25/files/rdv13zt50s

That paper's Theorem 1.1 concerns square-free moduli and is supported by a geometric hyperplane/sieve proof chain (including Lemma 2.1 and Theorems 3.1–3.2). This is not enough, by itself, to validate the current Lean declarations: the code's general `CoveringSystem` and the exact claims/parameters of `sieve_criterion` and `sf_sieve_lt_one` still require a line-by-line mapping to the source. In particular, a theorem about square-free moduli must not silently be used as a theorem about arbitrary odd moduli.

The exact bibliographic identity intended by the acronym “BBMST” and the theorem numbering used in this repository must therefore be resolved before attempting an axiom replacement. Do not cite the paper as justification for an axiom until the formal statement and all hypotheses have been matched.

## Critical formal-interface mismatch (verified against the Lean source)

The overreach is not merely a missing citation. In `ErdosSelfridge_v17_fixed.lean`:

- `CoveringSystem` records distinct moduli and a covering, but does not require square-freeness.
- `erdos_selfridge` assumes only `cs : CoveringSystem K`; it does not assume `CS_squarefree cs`.
- `sieve_criterion` is quantified over every such `CoveringSystem`, with no square-free restriction.
- `sf_sieve_lt_one` is quantified over every finite list of odd primes, not just the specific prime family or finite parameter regime established by the published computational certificate.

Thus the two admitted interfaces, as currently typed, jointly encode the unrestricted odd-moduli conclusion that the proof is supposed to derive. The square-free-moduli paper cannot justify these unrestricted quantifiers. The existing monotonicity lemmas do not repair this gap: they only transfer a bound between block-size lists after a valid analytic/sieve input has been supplied.

### Required repair before claiming source-faithfulness

1. Reconstruct the exact published theorem hypotheses and the finite computational certificate, including the permitted prime list / index range.
2. Narrow each Lean interface to those hypotheses; do not silently retain universal quantification over arbitrary `CoveringSystem` values or arbitrary prime lists.
3. State the result actually supported by those narrowed hypotheses, and only then prove the required bridge from a square-free covering system to the source's geometric formulation.
4. Keep the unrestricted `erdos_selfridge` theorem marked as unproved until a separate argument handles arbitrary odd moduli.

This is a verified audit of the current declarations, not a proof or disproof of the mathematical conjecture.
