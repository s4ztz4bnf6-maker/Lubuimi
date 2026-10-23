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

## Further source check: the computational claim is not a universal prime-list theorem

The published article and its supplemental-material record clarify a second mismatch in the current `sf_sieve_lt_one` interface. The paper's result is not a statement that **every** finite list of odd primes admits parameters making the repository's `sieveSum` less than one. The proof uses a specific finite initial parameter/certificate search and then a separate tail argument (Corollary 5.2), with an explicit threshold and recurrence. The supplemental material describes the LP search on the initial coordinates `3, 5, 7, 11`, checks the finite configurations, and optimizes the later `δ_k` values; it is not an arbitrary-list oracle.

The paper's square-free theorem is obtained from a geometric theorem through a Chinese-remainder correspondence. That correspondence and the source's parameter family must be represented in Lean; they are absent from the current generic axiom signatures. Consequently, even restricting `CoveringSystem` to square-free moduli would not by itself validate the current `sf_sieve_lt_one` statement.

**Concrete next milestone:** formalize the fixed finite certificate and its exact rational inequalities first, with the source's exact coordinate indexing. Then formalize the recurrence/tail bound as a separate lemma. Only after both are checked should the generic covering-system bridge be attempted. The unrestricted odd-moduli Erdős–Selfridge conjecture remains a separate open target.

## Source crosswalk added 2026-10-23

A useful independent source map is now available in the open `plasma-ai/erdos` record:
`library/covering_systems/balister_2021_erdos_selfridge_problem_square_free_moduli/`.
It separates the published proof into explicit obligations: Lemma 2.1 (fiber measure preservation/distortion), Theorems 3.1–3.2 (moment criterion and moment bounds), Lemmas 5.3–5.4 (initial parameter/certificate), and Corollary 5.2 (large-prime recurrence and termination). Its finite checker uses exact integer/rational arithmetic for the retained certificates; the record explicitly does **not** claim those checks are Lean verification.

This crosswalk sharpens the repository repair plan:

- `sieve_criterion` is not a faithful statement of Theorem 3.1 by itself. The source theorem requires the geometric product-space setup, the evolving measures, and moment bounds from Theorem 3.2.
- `sf_sieve_lt_one` is not Theorem 1.1. The published result uses the specific odd-prime box, an initial finite certificate, a parameter range, and a separately justified tail recurrence.
- A faithful Lean port should start with the algebraic/fiber-mass core of Lemma 2.1 (including the `α=0` and `α=1` branches), then the moment inequalities, and only then the finite certificate and tail bound. It should not retain a universal prime-list axiom as a shortcut.

Reference: https://github.com/plasma-ai/erdos/tree/main/library/covering_systems/balister_2021_erdos_selfridge_problem_square_free_moduli

## Formal micro-milestone: min/max mass identity (2026-10-23)

The Lean source now includes `sum_min_max_identity`:

```lean
theorem sum_min_max_identity (a b : ℚ) :
    min a b + max a b = a + b
```

This is a small, source-independent algebraic lemma that can serve as a checked building block when a later formalization splits a total mass into smaller/larger contributions. It is **not** a formalization of BBMST Lemma 2.1, does not establish fiber mass conservation in the paper's probability space, and does not discharge either admitted axiom. The repository currently has no dedicated BBMST compile workflow, so this addition must be compiled in the pinned Lean/Mathlib environment before it is described as kernel-verified.

## CI evidence and kernel dependency boundary (2026-10-23)

The first dedicated BBMST compile workflow completed successfully on commit `6d02552fcf` (run `39992100767`). The command `lake env lean ErdosSelfridge_v17_fixed.lean` completed with warnings only. Crucially, Lean printed the dependency list for the main theorem:

```text
'erdos_selfridge' depends on axioms: [propext, sf_sieve_lt_one, sieve_criterion, Classical.choice, Quot.sound]
```

This is positive evidence that the file compiles, but also direct evidence that the main theorem still depends on the two project placeholders. The later commit adds an explicit `#print axioms sum_min_max_identity` diagnostic and the header has been corrected to describe the file as an audit rather than a completed proof. Those later commits are being recompiled separately; do not treat the earlier green run as validation of later commits.
