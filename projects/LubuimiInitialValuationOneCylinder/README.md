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
- The full proof of the general finite-word extension is in the companion file listed above. The Lean declaration and full CI chronology are maintained in the parent Collatz–Syracuse research workspace.

## Mathematical results

1. Exact equivalence between the all-one initial valuation block and the single residue class modulo `2^{N+1}`.
2. Exact initial run length `r=v₂(n₀+1)-1`.
3. Natural densities: among odd starts, at least `N` initial ones has density `2^{-N}`, and exactly `r` has density `2^{-(r+1)}`; among all integers the corresponding densities are `2^{-(N+1)}` and `2^{-(r+2)}`.
4. Exact initial signed margin `D_r=-2(3^r-2^r)` and next-step recovery threshold `2^{a_r+r}>6·3^r-2^{r+1}`.
5. Generalization: every finite exact valuation word determines one unique odd residue class modulo `2^{A+1}`, with relative density `2^{-A}` among odd starts and exact child mass ratios `2^{-b}`.
6. Finite truncation: the first `B` exact next-exponent children plus one `a_k≥B+1` tail cylinder form a finite partition with relative masses `2^{-1},…,2^{-B},2^{-B}`.

## Scope

This theorem is not a proof of the global Collatz conjecture. The initial-cylinder Lean declaration is now compiled and axiom-audited on two exact CI snapshots: run 42721006544 (merge commit 44bb2ac, PR head 013192ce524a4572a9d96c8d4dcb2796830b1f62) and run 42721305220 (merge commit 3d79761, PR head ad7203f5571d03e5989b9ac935b2103300f02409). Both completed every workflow step successfully. The transitive axiom profile is [propext, Classical.choice, Quot.sound], and the explicit sorryAx scan found none. Runs 42721911555 and 42722186081 are later exact-head rechecks of the documentation/status branch and were in progress at the latest retrieval. The broader finite valuation-word partition theorem remains a separate Lean formalization target. The APW4–Syracuse cylinder–energy bridge remains a research programme, not a theorem used here.

The manuscript is a self-contained preprint draft for scholarly circulation and review. No journal acceptance, DOI, or independent peer review is claimed. The result is named **Lubuimi's Initial Valuation-One Cylinder Theorem** and attributed to Ta-Yoshua Lubuimi. AI systems are assistants only, never authors or independent mathematical verifiers.

## Rights

See `LICENSE.md` and the repository-wide proprietary and commercial licensing notices. Third-party software and mathematical-library components retain their own licenses.
