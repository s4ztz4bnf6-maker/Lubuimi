# Research frontier: positive-density Collatz convergence is not universal convergence — 2026-10-24

## New external result to use as a bounded benchmark

ProofAtlas currently lists Lech Mazur's “Explicit Positive-Density Collatz Convergence in Logarithmic Time” (manuscript v2.1, 2026-09-06). The exact public Lean endpoint is:

`positive_density (X : ℕ) (hX : cutoff ≤ X) :
  (densityConstant : ℝ) * X ≤ (countBelow (523 / 50) X : ℝ)`

The stated interpretation is that there are explicit fixed (c>0) and (X_0) such that for every (X\ge X_0), at least (cX) positive starts (n<X) reach 1 within (10.46\ln n) ordinary Collatz steps. The result also has a weaker 10.48-clock corollary. The public evidence record reports a successful build and no unfinished proof steps for its pinned theorem-specific source package.

Primary references:
- Theorem page and its scope: https://www.proofatlas.ai/formalizations/positive-density-log-time-collatz/
- Evidence record: https://www.proofatlas.ai/proofs/artifact.collatz.positive_density_log_time.lean-package.v003.html
- Pinned first-party source closure: https://www.proofatlas.ai/sources/positive-density-log-time-collatz/

## Evidence boundary

The page explicitly says the publication/paper-presentation review is pending for the current release. Its Lean-checked endpoint is therefore evidence about that exact formal declaration and build, not an unconditional endorsement of every informal claim in the companion paper. The theorem itself is a **positive lower natural-density** result, not density-one convergence and not the full Collatz conjecture. It does not show every positive integer reaches 1. The reported cutoff and positive fraction are also not practical bounds.

This is distinct from the accepted ProofAtlas formalization “Natural-Density Collatz Descent in Logarithmic Time,” which says density-one many starts fall below every diverging threshold within logarithmic time; it still does not prove universal termination. These two results have different endpoints and must not be conflated.

## Why this matters for our Syracuse project

Our local project has the exact affine identity
`2^(A_j) n_j = 3^j n_0 + C_j`, the recurrence
`C_(j+1) = 3*C_j + 2^(A_j)`, and the terminal odd-residue condition
`(3^N*n₀ + C) % 2^(A+1) = 2^A`.
The new `SyracuseOffsetClosedForm.lean` module attempts to make the accumulated offset explicit as
`C_j = ∑_{i<j} 3^(j-(i+1)) * 2^(A_i)`.

The next meaningful bridge is to compare our exponent-word representation with the exact odd-step map and then with the source's ordinary Collatz map. This should be pursued in stages:
1. Prove the closed-form offset identity from the recurrence and compile it.
2. State and prove the exact relation between exponent words and residue cylinders, including all prefix constraints.
3. Formalize a limited quantitative-density statement with an explicit density notion, without asserting universal convergence.
4. Only then consider integrating a theorem-specific slice of the external density proof, preserving source pins and exact theorem statement.
5. Keep any attempted route from positive-density convergence to universal convergence explicitly conditional; positive lower density alone cannot close the exceptional set.

## Soundness / reproducibility

The baseline Syracuse project uses Lean 4.34.1, which is beyond the known affected range through v4.31.0 for kernel bug #14576. An isolated Lean 4.35.0 experiment successfully compiled the current local modules, including `SyracuseOffsetIdentity.lean`, but its `lake check` step initially failed because the CI runner lacked `bubblewrap`. The workflow has been amended to install that dependency; a rerun is required before claiming the independent recheck passed. This is an infrastructure failure, not a mathematical proof failure.

The BBMST repository's baseline Lean 4.28.0 remains inside the known affected version range, so its isolated migration to Lean/Mathlib 4.35.0 remains a trust-remediation priority. No migration is considered complete until the full CI and recheck pass.
