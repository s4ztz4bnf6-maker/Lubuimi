# BBMST source-faithful incidence bridge: next obligations (2026-10-23)

## What the current formal core establishes

`BBMSTFiberMassCore.lean` contains finite weighted-fiber partition and squeeze lemmas, nonnegative-mass zero-fiber lemmas, and a concrete predicate mass partition. `BBMSTProbabilityInterface.lean` now expresses incidence fractions using an actual filtered sample and proves the exact complement identity:
`1 - |{x in S : covered x}|/|S| = |{x in S : not covered x}|/|S|`,
for finite nonempty `S`. It also proves that a strict incidence fraction below one is equivalent to at least one uncovered point.

These are exact finite identities. They do not establish a quantitative uncovered-mass lower bound, do not prove the BBMST geometric estimate for `alpha_k`, and do not replace the remaining assumptions `sf_sieve_lt_one` and `sieve_criterion` in the main theorem.

## Structural direction: derive the incidence relation from the geometry

The next layer must define, rather than assume, the finite sample space and its incidence relation. The intended dependency order is:

1. **Finite probability space.** Define the actual finite set of admissible points/residue data for the source theorem, with a nonempty denominator and a specified uniform or source-weighted measure.
2. **Geometric objects.** Define the relevant hyperplanes / affine constraints from the source-faithful BBMST setup. Do not pass `noCodimOne`, `isNontrivial`, `isParallel`, or `codimOne` as unconstrained hypotheses.
3. **Incidence predicate.** Define `covered x` from membership in those objects. Prove that the induced filtered set is the union of the intended incidence classes, with overlaps handled explicitly.
4. **Fiber decomposition.** Choose the source's label map (the geometric class / fiber index), then prove the finite mass partition over its image. Empty fibers contribute zero; nonempty fibers have a positive denominator before any conditional ratio is formed.
5. **Quantitative geometry.** Derive the source's bound on `alpha_k` from the actual dimensions, intersections and multiplicities. Only then instantiate the existing weighted-fiber squeeze.
6. **Sieve interface.** Prove the exact hypotheses currently hidden in `sf_sieve_lt_one` and `sieve_criterion`, or isolate a genuinely necessary external theorem with its source and assumptions.

## Critical distinction

`incidence_fraction < 1` yields existence of an uncovered sample point, but it can be arbitrarily close to one as the sample size grows. To establish a useful uniform lower bound on uncovered mass, a quantitative estimate must survive normalization and must be uniform in the parameters used by the covering argument. The complement identity alone cannot provide this.

## Source-faithfulness checks

- Translate each source symbol into a Lean definition and document the source equation / lemma it represents.
- Preserve the original hypotheses, including distinctness and square-free restrictions where required by the cited theorem; do not silently generalize them to all odd moduli.
- Keep finite counting identities separate from geometric incidence bounds and from the final sieve conclusion.
- Run `#print axioms` on the final theorem and audit every dependency, especially the two remaining named assumptions.
- The external Lean CI run was still in progress at note creation; this note is not evidence of a successful build or of an axiom-free proof of Erdős–Selfridge.

## Immediate target

Write the concrete finite sample and incidence predicate first, then prove one source-faithful fiber decomposition theorem for that predicate. A generic lemma with arbitrary `alpha_k` or arbitrary geometric assumptions is not a substitute for this bridge.
