# Lubuimi's Initial Valuation-One Cylinder Project

**Author:** Ta-Yoshua Lubuimi  
**Project date:** 10 November 2026  
**Status:** Standalone mathematical project and preprint manuscript draft.

This project isolates and documents the exact initial valuation-one cylinder theorem for accelerated Syracuse orbits. It is a self-contained research subproject within the author's Collatz–Syracuse repository; it does not replace or detach the result from the larger Collatz/Syracuse programme.

## Main theorem

For a positive odd accelerated Syracuse orbit `2^{a_j}n_{j+1}=3n_j+1`, for every `N ≥ 0`,

\[
(\forall j<N,\ a_j=1)\quad\Longleftrightarrow\quad 2^{N+1}\mid(n_0+1).
\]

Thus the initial run length is exactly `v₂(n₀+1) − 1`.

## Contents

- `Lubuimi_Initial_Valuation_One_Cylinder_2026-11-10.md` — self-contained manuscript draft.
- `Lubuimi_Finite_Valuation_Word_Cylinder_Partition_2026-11-10.md` — stronger companion theorem for every finite positive valuation word.
- `CITATION.cff` — citation metadata.
- Companion research note: `SyracuseInitialValuationOneCylinder_2026-11-09.md`.
- Lean source: `SyracuseOffsetIdentity.lean`.
- Consolidated record: `COLLATZ_SYRACUSE_RESEARCH_RECORD_TA_YOSHUA_LUBUIMI_2026-11-10.md`.

## Mathematical results

1. Exact equivalence between the all-one initial valuation block and the single residue class modulo `2^{N+1}`.
2. Exact initial run length `r=v₂(n₀+1)-1`.
3. Natural densities: among odd starts, at least `N` initial ones has density `2^{-N}`, and exactly `r` has density `2^{-(r+1)}`; among all integers the corresponding densities are `2^{-(N+1)}` and `2^{-(r+2)}`.
5. Generalization: every finite exact valuation word determines one unique odd residue class modulo `2^{A+1}`, with relative density `2^{-A}` among odd starts and exact child mass ratios `2^{-b}`.
4. Exact initial signed margin `D_r=-2(3^r-2^r)` and next-step recovery threshold `2^{a_r+r}>6·3^r-2^{r+1}`.

## Scope

This theorem is not a proof of the global Collatz conjecture. The current Lean declaration is not yet reported as successfully compiled and axiom-audited. The APW4–Syracuse cylinder–energy bridge remains a research programme, not a theorem used here.

The manuscript is a self-contained preprint draft for scholarly circulation and review. No journal acceptance, DOI, or independent peer review is claimed. The result is named **Lubuimi's Initial Valuation-One Cylinder Theorem** and attributed to Ta-Yoshua Lubuimi. AI systems are assistants only, never authors or independent mathematical verifiers.

## Rights

See `LICENSE.md` and the repository-wide proprietary and commercial licensing notices. Third-party software and mathematical-library components retain their own licenses.
