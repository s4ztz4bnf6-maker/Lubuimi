# Consecutive Values of Restricted 2-3 Sums

**Authors:** Tayoshua Luguimi and Phillipp Haas  
**Project:** Independent Adjacent-Values research strand  
**Status date:** 18 November 2026

This directory is a separate project area inside the Lubuimi repository. It is not part of the Syracuse/Collatz research programme. Its mathematical statements, code, tests, Lean declarations, CI results, authorship and licences are scoped only to this directory unless explicitly stated otherwise.

## Mathematical object

For a strictly increasing sequence of nonnegative integers
\(e=(e_0,\ldots,e_{n-1})\), define
\[
T_n(e)=\sum_{j=0}^{n-1}3^{n-1-j}2^{e_j}.
\]

The central adjacent-values question is whether, for every positive integer \(n\), there are strictly increasing nonnegative integer sequences \(e,f\) of length \(n\) with
\[
T_n(f)-T_n(e)=1.
\]

The current research dossier records a block-induction proof strategy and the universal existence theorem as mathematically established in the independent project. This repository branch does **not yet** contain all five finite block-certificate tables or a complete Lean formalization of that induction. Accordingly, the theorem is not labelled Lean-verified here.

## Evidence and formalization status

| Item | Status |
|---|---|
| Definition and elementary identities | Formalization started |
| Universal adjacent-values theorem | Mathematical proof recorded in project checkpoint; formalization pending |
| Five finite block certificates | Exact tables must still be committed |
| Lean kernel verification of main theorem | Not yet achieved |
| Axiom audit for main theorem | Not yet available |
| CI for the Lean subproject | Added by this branch; first run pending |

A successful build of the elementary Lean file is not evidence that the universal theorem has been formalized.

## Lean project

Run from this directory:

    lake update
    lake exe cache get
    lake build
    lake env lean AdjacentValues/AxiomAudit.lean

The formalization currently contains only the definition of \(T_n\), strict monotonicity as a predicate, and the exponent-shift identity. The audit prints axioms for that identity only. It makes no claim about the universal existence theorem.

## Authors and AI assistance

The project authors are **Tayoshua Luguimi** and **Phillipp Haas**. Both are listed as co-authors. AI tools were used as research and writing assistance; they are not authors and their outputs are not independent verification.

## Licensing

- Manuscript, mathematical exposition, README and documentation in this project area: **CC BY 4.0**.
- Original source code and tests in this project area: **MIT**.
- Third-party material remains under its respective licence and must be attributed.

See [LICENSING.md](LICENSING.md). These project-specific terms do not relicense the rest of this repository.
