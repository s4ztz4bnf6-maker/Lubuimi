# Syracuse offset-margin CI record — 2026-10-24

## Verified workflow result

The workflow run `40132672606` on branch `collatz/offset-margin-roadmap-2026-10-23`, commit `0427ac2d034c8d5258693b6cc6939e9149081db9`, completed successfully.

The run reports successful completion of:
- Lean library modules;
- `IterationLemmas.lean`;
- `ThresholdLemmas.lean`;
- `SyracuseReferenceTest.lean`;
- `SyracuseQuarterDescent.lean`;
- offset identity and strict-margin consequence;
- exact closed-form offset theorem;
- stronger offset lower-bound module.

This is a CI compilation result on the workflow's configured Lean/Mathlib toolchain. It is not a proof of the global Collatz conjecture and is not, by itself, an independent-kernel or statement-fidelity audit.

## Exact mathematical content

For a prescribed odd-step exponent word (a_0,\ldots,a_{j-1}\), define
\[
A_0=C_0=0,\qquad A_{i+1}=A_i+a_i,\qquad C_{i+1}=3C_i+2^{A_i}.
\]
Then
\[
2^{A_j}n_j=3^j n_0+C_j,\qquad
C_j=\sum_{i=0}^{j-1}3^{j-1-i}2^{A_i}.
\]
Strict descent is equivalent to
\[
3^j n_0+C_j<2^{A_j}n_0.
\]
Under (3^j\le 2^{A_j}\), this is equivalently
\[
C_j<(2^{A_j}-3^j)n_0.
\]

For (D_j=2^{A_j}-C_j-3^j\), the recurrence is
\[
D_{j+1}=3D_j+(2^{a_j}-4)2^{A_j}.
\]
Thus exponents 1, 2, and at least 3 contribute respectively a negative, zero, and positive additive correction. This recurrence alone does not bound the lengths or arrangement of exponent-1 runs.

## Next proof obligation

Formalize a blockwise composition lemma for the margin recurrence, then identify hypotheses on a finite exponent block that imply a positive lower bound on its net margin transformation. Any extension to all starts must still prove that the actual valuation word satisfies the required block condition; arbitrary-word inequalities cannot be silently transferred to actual Syracuse trajectories.
