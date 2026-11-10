# Review reconciliation — initial valuation-one cylinder note

**Author:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Scope:** Editorial and mathematical comments supplied in the 10 November review discussion. This is a reconciliation record, not a claim of independent peer review.

## 1. Scope and historical framing

The reviewed note concerns the initial valuation-one cylinder classification in the accelerated Syracuse map. It is not an APW4 review and does not close APW4's historical event-to-BIB or integrated Lean obligations.

The mathematical classification is a classical parity-vector congruence consequence. The manuscript now uses descriptive titles only, cites Terras (1976), Everett (1977), and Lagarias (1985, Theorem B), and does not claim a new theorem, priority, or an eponymous “Lubuimi theorem”. Tao (2022), Proposition 1.9, is identified as a conditional distribution result rather than the exact unique-residue-class source.

## 2. Comment-by-comment source check

The current manuscript `Lubuimi_Initial_Valuation_One_Cylinder_2026-11-10.md` was checked against the supplied comments:

| Review point | Current source status |
|---|---|
| Raw/ambiguous multiplication notation in Lemma 2.1 | Correctly typeset as multiplication, e.g. \(3\cdot 2^{A_j}n_j\); no comma substitution |
| Markdown damage in density equation (5.5) | Equation is present in a valid display-math block with explicit subscripts and fraction |
| Explain why \(D_j\) matters | Corollary 6.3 explicitly proves \(D_j>0\Rightarrow n_j<n_0\) from the affine identity |
| “Stopping time” terminology | Section 4 uses “exact initial run length”; it does not mislabel that quantity as the classical stopping time |
| Irrelevant APW4/tail-project references | The initial-cylinder note is self-contained and expressly disclaims cross-project identification or transfer |
| Overlong Lean evidence section | The manuscript gives the source file, historical line, exact commit, and the literal Lean declaration signature; detailed run chronology is kept in the separate formalization-status/review records |

The current Section 6 also states that the next-valuation threshold is exact but is not a universal assertion that the next valuation meets it. The note explicitly avoids claiming global Collatz descent.

## 3. Verification boundary

The initial all-one declaration has seven successful historical exact-commit audit snapshots, as listed in `WRITTEN_REVIEW.md`. The neutral declaration `initial_valuation_one_cylinder_iff_dyadic_divisibility` was separately checked on exact source commit `5f6e46de8bed7061f8336089857143c54e997af5` by workflow [42809750956](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42809750956), with Lean 4.34.1 kernel check, compile-drafts, Lean 4.35.0 paranoid check, standard transitive axiom profile, and no-`sorryAx` guard passing.

The current publication PR [#35](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/35) is still open/draft at head `2fa0eb333bddc145ad1a34eb2b42d6b97453d6cd). The exact-head workflow query returned [42827159570](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42827159570) completed successfully. This records the workflow result associated with that head; it does not expand the audited theorem scope.

The general finite valuation-word theorem, its density corollary, and finite tail partition are separate mathematical statements and remain **OFFEN – NICHT VERIFIZIERT** as general Lean results. A verified special case does not certify the arbitrary-word theorem.

## 4. Attribution and licensing

The research exposition and formalization are attributed to Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers. The project rights notice applies only to original copyrightable expression/code actually owned by the author; it does not claim exclusive rights over mathematical facts, theorem statements, or abstract ideas. Lean, Mathlib, TeX packages, and other third-party materials retain their own licences. No new licence or commercial permission is granted by this editorial reconciliation.

**Conclusion:** The supplied editorial comments are reflected in the current initial-cylinder source. This reconciliation does not change the mathematical theorem, claim novelty, certify the general finite-word formalization, or assert a global Collatz proof.
