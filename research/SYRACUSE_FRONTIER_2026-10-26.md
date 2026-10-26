# Syracuse frontier update — 2026-10-26

## Evidence update

GitHub Actions run 40215178359 (workflow run #1103) completed successfully for head `e7d850a7b166bbf4fd081b4256722bdfa6f1fe89` on `fix/syracuse-positivity-bridge-2026-10-25`. It built the Lean library and compiled the iteration, threshold, quarter-descent, affine-transition, valuation, and stopping-time bridge modules. The stopping-time theorem is conditional: its global premise remains that every positive nonterminal input has some positive iterate strictly below itself.

## Exact block identity and the missing margin

For a certified odd-to-odd block with valuation exponents a_j, let
A_k = Σ_{j<k} a_j and define C_0=0, C_{j+1}=3C_j+2^{A_j}. The verified affine identity has the form

  2^{A_k} n_k = 3^k n_0 + C_k.

Thus strict descent is equivalent to the exact margin

  3^k n_0 + C_k < 2^{A_k} n_0,

or, equivalently, to the positive integer gap
  D_k n_0 - C_k > 0, where D_k=2^{A_k}-3^k.

The offset lower bound C_k ≥ 3^{k-1} is necessary information but not enough: the sign of D_k and the relative size of C_k still control descent. This prevents the common error of treating average multiplicative contraction as a pointwise theorem.

## New research route: finite cylinders plus exactification

The next tractable formal target is not “all orbits descend” directly. It is a finite-cylinder theorem:

1. For each finite valuation word (a_0,…,a_{k-1}), derive its exact congruence cylinder modulo 2^{A_k+1} (or prove the correct modulus for the chosen coding).
2. Prove the exact count and compatibility of cylinders, including the tail where v_2(3n+1)≥K. Do not extrapolate a finite truncated distribution to an infinite expectation without a tail argument.
3. Attach to each cylinder the affine margin D_k n_0-C_k. Classify which cylinders force descent above an explicit threshold and which remain exceptional.
4. Search for a *uniform deterministic covering* of all positive odd starts by descending cylinders, or construct a rigorously checked exceptional-cylinder obstruction. Density-one information alone cannot close this step.

## Literature cross-check: an important but non-global benchmark

ProofAtlas publicly records a Lean-checked power-saving result for the standard accelerated-by-one-division Collatz map
T(n)=n/2 for even n and T(n)=(3n+1)/2 for odd n. For N≥15552, it bounds the proportion of starts n<N that fail to descend below n within k≤log n such T-steps by 10^7 N^{-1/100}. This is a quantitative density statement, not a proof that every orbit descends or reaches 1.

Our map σ(n)=(3n+1)/2^{v_2(3n+1)} on odd inputs is a first-return/odd-to-odd map, so the result is not a drop-in theorem. A legitimate reuse requires a formal correspondence between T-iterates and σ-iterates, with explicit control of the number of even steps removed. The strongest immediate use is as a benchmark and source of reusable parity-word counting lemmas, not as a shortcut to global termination.

## Reliability gate

The latest build success is not an axiom audit. Before treating a theorem as a result, record its exact proposition, source-faithfulness review, unfinished-proof scan, transitive axiom profile, pinned toolchain, and independent checker evidence where available. Cross-kernel checks reduce implementation risk but do not make statement fidelity or mathematical scope automatic.

## Status boundary

Known: the latest recorded CI run passed for the listed modules.

Not established: a uniform descent margin for every positive start, a proof that all odd-to-odd trajectories terminate, or the full Collatz conjecture.
