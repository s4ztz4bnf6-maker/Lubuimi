# Collatz research continuation: residue cylinders and exception descent

Date: 2026-10-23

## Mathematical correction to the proposed bridge

A finite word of exponents is not certified as realizable merely by saying that it corresponds to a nonempty residue class modulo a power of two. The residue constraint must encode *exactly* each valuation at the state reached so far. For a word (a_0,...,a_{k-1}), recursively impose

  3 n_i + 1 = 2^{a_i} n_{i+1},   and   2^{a_i+1} ∤ (3 n_i + 1).

The second clause is essential: divisibility by 2^{a_i} alone gives only a lower bound on the valuation. The affine identity then yields
  2^{A_k} n_k = 3^k n_0 + C_k,
where A_k = sum_{i<k} a_i. This identity is necessary but not by itself a proof that a symbolic word is realizable by a positive odd orbit.

## Better finite-state object

For each depth k, define a *certified cylinder* as a set of starting integers satisfying all exact divisibility/nondivisibility conditions along the recursively determined transitions. The formal object should carry:
1. a recurrence witness for all intermediate states;
2. positivity and oddness of each accelerated state;
3. exact valuation at each step, expressed using divisibility by 2^a and nondivisibility by 2^(a+1);
4. a proof that the cylinder is empty or an explicit congruence class modulo a stated modulus.

Do not assume in advance that every exponent word gives a single nonempty cylinder. Prove the representation theorem or retain a finite union of residue classes where branching is needed.

## New research direction: residual tree with quantitative certificates

Build a tree whose nodes are certified exact cylinders. At each depth, split each node into:
- cylinders with a verified strict-descent prefix;
- cylinders with an offset obstruction;
- cylinders not yet classified due to insufficient scale.

Track the residual cylinder set explicitly. A universal proof would need a theorem forcing every infinite branch of the residual tree to contradict a proved invariant, or a well-founded descent measure. A density estimate alone does not rule out one exceptional branch. The affine floor bound n_0 <= floor(C_k/(2^{A_k}-3^k)) is useful only when the denominator is positive and the prefix is an actual orbit.

## Literature lesson

Tao's almost-all result uses distributional/first-passage information, but density-one control is not automatically invariant under iteration and cannot alone establish universal termination. The alternative here is not to claim density implies universality, but to combine exact residue cylinders with a separate branch-exclusion invariant. Candidate invariant families to test: lower bounds on cumulative valuation A_k, congruence restrictions on admissible words, and monotonicity of a potential that is valid for every branch (not only typical branches).

## Acceptance criteria

- Compile exact-valuation cylinder definitions and prove each transition preserves the claimed residue constraints.
- Exhaustively classify small depths computationally as falsification/search support only.
- Any universal claim must close the infinite-branch argument; finite-depth coverage is not enough.
