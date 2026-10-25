# Research frontier: block certificates and the exceptional-orbit barrier
Date: 2026-10-25

## Objective
Advance the Syracuse formalization without confusing a finite-block estimate or a density theorem with universal termination.

## Exact arithmetic core
For accelerated odd steps 2^(a_j)n_(j+1)=3n_j+1, let A_j=sum_(k<j) a_k. The affine identity is
2^(A_r)n_r = 3^r n_0 + C_r, where C_0=0 and C_(j+1)=3C_j+2^(A_j).
For a block of length r, this identity is exact. The weighted signed correction expansion already formalized in SyracuseWeightedCorrection.lean isolates the local contribution Delta(a,A)=(2^a-4)2^A. It is negative for valuation 1, zero for valuation 2, and positive for valuation at least 3.

## Candidate new structure: a proof-carrying block certificate
A finite block should carry a certificate containing:
- the valuation word (a_0,...,a_(r-1));
- its cumulative exponents A_j;
- the exact correction sum, checked by the affine recurrence;
- a strict inequality showing the block endpoint is smaller than the starting point.

The Lean theorem should be conditional: given a verified word and a strict margin, derive endpoint descent. It must not assert that every orbit has such a block. The global conjecture then has a clean remaining obligation: prove every positive odd orbit either reaches 1 or admits a sequence of certificates that forces descent to a terminal range. Any infinite orbit avoiding all certificates is an explicit exceptional-orbit obstruction.

## Why naive smoothing is insufficient
The polynomial map x -> 3x+1 is continuous on the 2-adic integers, but the accelerated map that divides by 2^(v2(3x+1)) is not continuous at points where 3x+1=0 in Z_2, including x=-1/3. Along integer-like 2-adic sequences approaching this point, the valuation can grow while the odd quotient varies. Compactness alone therefore does not imply that all trajectories converge to a common sink; a topological argument needs an invariant continuous object and a theorem linking its behavior back to every positive integer orbit.

## Exceptional-set logic
A density-one result can leave a nonempty density-zero exceptional set. To derive universal convergence, one needs a separate exceptional-set elimination theorem, not just stronger numerical evidence for typical starts. The ProofAtlas density-one and positive-density results are valuable inputs only within their stated domains, clocks, and endpoints.

## Concrete formalization order
1. Finish compiling and axiom-auditing the current weighted correction expansion.
2. Prove an endpoint descent theorem from the exact affine identity plus an explicit strict margin, with all positivity and denominator conditions stated.
3. Formalize the logical distinction between density-one descent and pointwise convergence using a simple nonempty density-zero set example; do not imply such a set is an actual Collatz exception.
4. Test the block certificate against long valuation-one families. These are arbitrary long finite runs, so any proposed universal argument based on a fixed maximum run length is false.
5. Only then attempt the global bridge: a proof that every orbit eventually has a qualifying block, or a counterexample search against that claim.

## Status and safeguards
No global Collatz proof or counterexample is established. Kernel checking, transitive axiom auditing, and statement fidelity remain separate gates. A proof-carrying finite block is a local certificate, not a universal theorem.
