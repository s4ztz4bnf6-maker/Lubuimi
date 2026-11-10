# Syracuse research update: valuation-run audit and global-bridge targets
Date: 2026-10-26
Branch: `collatz/valuation-cylinders-2026-10-26`

## Concrete correction: the valuation-one run exponent

Let (T(n)=(3n+1)/2^{v_2(3n+1)}) on positive odd integers, and suppose the first (k) accelerated steps all have valuation exactly one:
\[
n_{j+1}=(3n_j+1)/2,\qquad 0\le j<k.
\]
Repeated substitution gives the exact identity
\[
2^k n_k=3^k n_0+(3^k-2^k)=3^k(n_0+1)-2^k.
\]
Therefore (2^k\mid 3^k(n_0+1)), and since (3^k) is odd,
\[
\boxed{2^k\mid n_0+1.}
\]
This only gives divisibility by (2^k), not (2^{k+1}). The stronger exponent is false: (n_0=3) has two consecutive valuation-one steps (3\mapsto5\mapsto1), while (8\nmid 4). Any note or lemma claiming (2^{k+1}\mid n_0+1) must be corrected before it is used.

The exact run bound is consequently (k\le v_2(n_0+1)). This is a genuine state-dependent constraint, but not a uniform bound: (v_2(n_0+1)) is unbounded over odd (n_0). It cannot alone force global descent.

## Exact affine cocycle (the reliable bridge object)

For valuations (a_j=v_2(3n_j+1)\ge1), let (A_j=\sum_{i<j}a_i), with (A_0=0). Then
\[
2^{A_N}n_N=3^Nn_0+C_N,\qquad
C_N=\sum_{j=0}^{N-1}3^{N-1-j}2^{A_j}.
\]
The correction term is positive. Thus the identity itself is not a descent inequality: descent (n_N<n_0) is equivalent to
\[
C_N<(2^{A_N}-3^N)n_0,
\]
which in particular requires (2^{A_N}>3^N). A proposed proof must control both the valuation sum (A_N) and the weighted positive correction (C_N), uniformly over every actual orbit.

## New proof-design proposal: split the obstruction into two certificates

For a candidate block (N), record two independent certificates:
1. **multiplicative margin:** (M_N=2^{A_N}-3^N>0);
2. **offset domination:** (C_N<M_N n_0).

A checker can verify both with exact natural/integer arithmetic. Search can discover candidate blocks and patterns, but only a theorem proving that every hypothetical non-descending orbit eventually admits such a pair would close the global gap. This separates a cheap, machine-checkable local certificate from the hard universal existence theorem.

The valuation-cylinder congruences can constrain candidate words, but finite-word realizability or density-one descent cannot by itself rule out a density-zero exceptional orbit. Do not infer the universal theorem from a probabilistic distribution of valuations.

## Research frontier and integration plan

ProofAtlas's reported logarithmic-time, natural-density-one descent result is a useful comparison target, not a proof of convergence for every start:
- https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
- https://www.proofatlas.ai/proofs/artifact.known-nd-rhin-log-time.paper-package.v002.html

Next steps:
1. Correct the valuation-one run exponent wherever the stronger (k+1) form appears.
2. Formalize the affine identity and the two-certificate equivalence in Lean with exact arithmetic.
3. Run a source/axiom audit on the exact target theorem, and confirm the CI executes explicit Lean targets (not merely a green empty build).
4. Keep the global obligation explicit: prove every positive odd start reaches a smaller odd value or otherwise exclude all nontrivial cycles and divergent trajectories.

This update is a proof-frontier correction and a sharper proof architecture, not a Collatz solution.
