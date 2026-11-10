# Research continuation: exact-prefix coverage and first-passage transport
Date: 2026-10-23

## Scope and status

This note is a research plan and list of proof obligations, not a proof of the Collatz conjecture. The current Lean branch certifies finite affine identities and local descent/non-descent implications. CI for the current head was still running when checked; no fresh successful compile or axiom audit is claimed here.

## What the literature establishes, and where it stops

Tao, *Almost all orbits of the Collatz map attain almost bounded values*, Forum of Mathematics, Pi 10 (2022), e12, proves that almost every orbit in logarithmic density reaches below any threshold tending to infinity. The proof uses stabilization of a first-passage distribution, auxiliary measures with better transport properties, 3-adic distribution, and Fourier decay. It does **not** establish descent for every starting integer. A key warning in Tao's introduction is that naive iteration of density-one statements fails because the Collatz map need not preserve the reference measure or exceptional sets.

Reference: https://doi.org/10.1017/fmp.2022.8

## Exact deterministic layer already isolated

For a finite exponent word a and states n, the recurrence
2^(a_i) * n_(i+1) = 3*n_i + 1
gives
2^A_k * n_k = 3^k*n_0 + C_k,
where A_k = sum_{i<k} a_i and
C_k = sum_{j<k} 3^(k-1-j) * 2^A_j.

Thus strict descent at prefix k is equivalent to
(2^A_k - 3^k) * n_0 > C_k.
If 2^A_k <= 3^k, descent is impossible at that prefix. If D_k = 2^A_k - 3^k > 0, non-descent is equivalent to D_k*n_0 <= C_k, or n_0 <= C_k / D_k in natural-number division. These are exact finite statements; none guarantees that a given symbolic word is realized by the true Syracuse orbit.

## New proposed architecture: prefix certificates + transport + exceptional mass

Separate the global problem into three independently auditable modules:

1. **Exact prefix certificates.** Retain the affine margin/obstruction inequalities as the deterministic kernel-facing layer. A prefix word must carry exact valuation witnesses a_i = v2(3*n_i+1), not merely a recurrence.
2. **First-passage transport.** Define finite distributions on odd starts modulo 2^A (or compatible residue cylinders) and map them to the first prefix at which n_k < n_0, n_k <= B, or a selected affine margin holds. Prove consistency under refinement of residue cylinders. This is the deterministic finite analogue of Tao's first-passage viewpoint, but it does not import his asymptotic theorem for free.
3. **Explicit exceptional set.** For each cutoff K and height B, partition starts into those with a certified descent by time K and the residual set. Prove a quantitative bound on the residual mass, then separately investigate whether that bound can be upgraded from a density statement to a pointwise statement. A density estimate alone cannot settle the universal conjecture.

## Candidate new lemma (not yet formalized)

For a finite set of starts S with a probability weight μ, let Good_K be the starts whose **actual** valuation word gives a descent certificate by time K. Then μ(S \\ Good_K) = 1 - μ(Good_K). The research target is not this tautology; it is a useful lower bound for μ(Good_K) that survives transport to the next scale, with an explicit error term. Track the distortion/exceptional mass at each scale rather than silently assuming invariance.

## Falsification / counterexample discipline

- Search for actual odd starts whose realized prefixes repeatedly satisfy D_k <= 0 or D_k*n_0 <= C_k; distinguish a long delay from a counterexample.
- Any finite residue graph must prove that its states cover all realized valuation words, including unbounded exponents, or be labelled a bounded-exponent experiment only.
- The mean multiplier heuristic is not a universal descent proof. A global theorem needs a deterministic coverage/transport mechanism or a genuine contradiction for every hypothetical non-descending orbit.

## Immediate next formal target

Formalize a finite-prefix partition theorem: for a finite set of starts and a chosen cutoff, the certified-good set and residual set are disjoint and exhaustive, then expose the residual cardinality/mass as a named quantity. This is modest, exact, and provides the interface where a later analytic or combinatorial bound can attach without conflating local Lean verification with the global conjecture.
