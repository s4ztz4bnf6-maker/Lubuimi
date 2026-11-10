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
- `Lubuimi_Terminal_Residue_Collision_Energy_2026-11-10.md` — exact finite-place incidence and diagonal/off-diagonal collision energy identity.
- `CITATION.cff` — citation metadata.
- The full proof of the general finite-word extension is in the companion file listed above. The Lean declaration and full CI chronology are maintained in the parent Collatz–Syracuse research workspace.

## Mathematical results

1. Exact equivalence between the all-one initial valuation block and the single residue class modulo `2^{N+1}`.
2. Exact initial run length `r=v₂(n₀+1)-1`.
3. Natural densities: among odd starts, at least `N` initial ones has density `2^{-N}`, and exactly `r` has density `2^{-(r+1)}`; among all integers the corresponding densities are `2^{-(N+1)}` and `2^{-(r+2)}`.
4. Exact initial signed margin `D_r=-2(3^r-2^r)` and next-step recovery threshold `2^{a_r+r}>6·3^r-2^{r+1}`.
5. Generalization: every finite exact valuation word determines one unique odd residue class modulo `2^{A+1}`, with relative density `2^{-A}` among odd starts and exact child mass ratios `2^{-b}`.
6. Finite truncation: the first `B` exact next-exponent children plus one `a_k≥B+1` tail cylinder form a finite partition with relative masses `2^{-1},…,2^{-B},2^{-B}`.
7. Terminal-residue collision energy: the word-to-unit-residue incidence modulo `3^k` has diagonal mass `3^{-k}` and off-diagonal collision mass at least `1/(2·3^k)`.
8. Finite Markov representation: the terminal-residue mass vector is `δ₀ P_k^k` for an explicit rational stochastic matrix; at `k=2`, the mass vector is `(8,16,11,4,2,22)/63` and the energy is `5/21`.

## Scope

This theorem is not a proof of the global Collatz conjecture. The initial-cylinder Lean declaration is now compiled and axiom-audited on five exact CI snapshots:

- Run 42721006544 (merge `44bb2ac`, PR head `013192ce524a4572a9d96c8d4dcb2796830b1f62`).
- Run 42721305220 (merge `3d79761`, PR head `ad7203f5571d03e5989b9ac935b2103300f02409`).
- Run 42721911555 (merge `7b84a1b`, PR head `21829b4dd3b82a73edb19cf0d09ed011f55ef384`).
- Run 42722186081 (merge `5d4a19c`, PR head `a36894eefc52e5d28cd43110f5e289805509ad33`).
- Run 42724343412 (merge `06675a1`, PR head `29b27dc529b9e81a33b5211e9e01a01e19edc256`).

All five full workflows completed successfully. The transitive axiom profile for `CollatzSyracuseAudit.lubuimi_initial_valuation_one_cylinder` was `[propext, Classical.choice, Quot.sound]` in every run, and the explicit complete-log `sorryAx` audit steps passed. Earlier failed attempts 42719689591 and 42720406876 remain in the historical record but do not invalidate these five later positive audits. Current documentation/status recheck 42725493567 is in progress on head `a52dffc23b323964f33bc7f6c61c2cb24bcdf708`.

The broader finite valuation-word partition theorem, finite tail-cylinder partition, terminal-residue collision energy and finite Markov matrix remain separate Lean formalization targets. The APW4–Syracuse cylinder–energy bridge remains a research programme, not a theorem used in the initial-cylinder proof.

The manuscript is a self-contained preprint draft for scholarly circulation and review. No journal acceptance, DOI, or independent peer review is claimed. The result is named **Lubuimi's Initial Valuation-One Cylinder Theorem** and attributed to Ta-Yoshua Lubuimi. AI systems are assistants only, never authors or independent mathematical verifiers.

## Rights

See `LICENSE.md` and the repository-wide proprietary and commercial licensing notices. Third-party software and mathematical-library components retain their own licenses.
