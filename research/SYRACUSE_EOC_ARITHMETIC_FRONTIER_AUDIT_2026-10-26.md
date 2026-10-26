# Syracuse research checkpoint: prior-art correction and the actual arithmetic bottleneck

Date: 2026-10-26

## New source-level finding

The public EOC Lean Verification repository (Elias De Jesús, 2026; Revision 5 manuscript, Zenodo DOI 10.5281/zenodo.22286812) already treats exact valuation-word realizers and their residue classes as a central formalization target. Its literature audit explicitly identifies Bernstein (1994) as giving a noniterative 2-adic conjugacy formula in terms of the valuation word, and Bernstein–Lagarias (1996) as constructing the 2-adic conjugacy and its residue-class action. The repository states that its Carry closed form and Realizer congruence are the same object in different notation. Therefore the finite-cylinder realization lemma developed in this project is not, by itself, a novelty claim; at most it is an independently derived formulation and a candidate for independent verification.

The same EOC repository also identifies the logarithmic drift identity used in this project as classical: it is the logarithm of the product identity in Rozier (2017), Lemma 2.5, generalizing Eliahou (1993). The identity must not be presented as a new mathematical discovery.

Primary source snapshots inspected:
- https://github.com/innerlightr-wq/eoc-lean-verification/blob/main/README.md
- https://github.com/innerlightr-wq/eoc-lean-verification/blob/main/docs/LITERATURE_CONTEXT.md
- https://github.com/innerlightr-wq/eoc-lean-verification/blob/main/docs/NOVELTY_AND_PROVENANCE.md
- https://github.com/innerlightr-wq/eoc-lean-verification/blob/main/docs/ARITHMETIC_FRONTIER.md
- https://github.com/innerlightr-wq/eoc-lean-verification/blob/main/scratch/sparsevisits_2026-09-16/REPORT.md

## Exact open arithmetic interface

The most actionable unresolved interface found in the EOC source is PowerOfTwoDangerousWindowSparsity. Its statement bounds the number of windows whose geometric odd-dark mass exceeds 2^(2K/10). The source proves in Lean that this hypothesis implies summed pressure and then low-frequency decay, using an unconditional ShapeTail theorem. The hypothesis itself remains OPEN; no implication to Collatz is claimed.

The low-frequency shell lambda = 1 is unavoidable. The source reduces the relevant dark condition, through reciprocity, to leading balanced-ternary digits of residues 2^(-a) mod 3^b; the related deterministic sparse-visit report connects this to the family of questions around ternary expansions of powers of 2, without claiming equivalence to a named conjecture.

## Route audit: reject a tempting averaging shortcut

The EOC shift audit says full-period averaging is exact only over a period Q_D = 2*3^(D-1), while the natural shift range has width roughly sqrt(j) and does not span that period. More importantly, downstream inequalities charge a bad shift exponentially (roughly 2^(t/2)), so averaging over shifts is not a valid substitute for pointwise-in-shift control. The source also finds the worst low-frequency shell lambda=1 offers no frequency averaging.

The deterministic sparse-visit report explicitly refutes a proposed finite-memory transducer route: the tested digit offset depends on all lower exponent digits. It also reports severe short-interval over-visits for fixed-modulus cylinders. We should not revive either route without a new argument that addresses these exact obstructions.

## Next mathematically meaningful experiment

Do not add more generic affine or CRT lemmas. The next target is the window rate itself:
1. Extract the exact definition of the geometric odd-dark kernel and reproduce the 1230-environment scan from source artifacts.
2. Extend the exact scan along the lambda=1 diagonal, retaining the supremum over all start states and the source's true window geometry.
3. For each candidate bad window, emit a minimal exact witness (indices, modulus, residue, state, rational/integer comparison) so a proposed threshold can be refuted by one finite counterexample.
4. If no counterexample appears, seek a symbolic carry/recurrence inequality that bounds the number of windows pointwise in shift; do not infer it from a random model or Haar average.
5. Independently compare our finite-word Lean theorem against EOC's Realizer and classical Bernstein/Bernstein–Lagarias results before describing it as novel.

## Status boundary

EOC's README reports 94 modules building with standard Lean axioms and no sorry, but that is a claim about the external repository's stated snapshot, not this project's CI. Its PowerOfTwoDangerousWindowSparsity is an explicit open hypothesis. The Collatz conjecture and EOC remain open. This document records a source-level audit and proposed experiment; it does not report a new theorem or a completed reproduction of the external scans.
