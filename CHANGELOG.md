# Changelog

## 2026-11-17 — Ta-Yoshua Lubuimi Dynamic Residual Bound (TL-DRB), Collatz application

- Named and documented the Collatz application as the Ta-Yoshua Lubuimi Dynamic Residual Bound (TL-DRB); added a dedicated research note recording the exact identity between the overlapping-word residual and the Collatz signed valuation surplus.
- Added a manuscript with the algebraic derivation, exact descent threshold, overlap-constrained recursion, the (n_0=7) regression, and the all-ones finite-prefix obstruction.
- Updated the root README and consolidated status to distinguish this exact algebraic bridge from the still-open global descent problem.
- Confirmed that the new original TL-DRB materials fall under the repository's existing proprietary rights and commercial licensing notices; clarified that the eponym is attribution, not a copyright claim over mathematical ideas or methods. No third-party code or upstream license is changed.
- No Lean formalization, CI run, or global Collatz proof is claimed.

- Added an isolated Lean 4.35.0 / Mathlib formalization project with named declarations for the overlap identity, residual update, and generic descent-threshold interface, plus a dedicated CI workflow. The first setup attempt failed due to a missing Lake manifest; the workflow was corrected and exact-head run 43997407311 is pending. No Lean verification pass is claimed yet.
