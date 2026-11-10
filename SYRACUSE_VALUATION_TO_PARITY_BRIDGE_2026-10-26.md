# Syracuse bridge: exact valuation cylinders to ordinary parity prefixes

Date: 2026-10-26
Status: proof design plus finite regression evidence; NOT Lean-compiled. No global Collatz result claimed.

## Definitions

For positive odd n, let
\[
T(n)=\frac{3n+1}{2^{v_2(3n+1)}}.
\]
Write n_{j+1}=T(n_j), a_j=v_2(3n_j+1)>=1, and A_N=sum_{j<N} a_j.

Let the ordinary Collatz map be C(m)=m/2 for even m and (3m+1)/2 for odd m.

## Bridge theorem target

For each valuation word (a_0,...,a_{N-1}), define its expanded parity word
\[
W(a_0,\ldots,a_{N-1})=(1,0^{a_0-1})(1,0^{a_1-1})\cdots(1,0^{a_{N-1}-1})1.
\]
Here 0^r means a block of r zeros, and the final 1 records the terminal odd state n_N. Its length is A_N+1.

The intended theorem is: for every positive odd start n, the first N accelerated valuations equal the prescribed word if and only if the ordinary Collatz orbit has parity prefix W, with the endpoint/length convention fixed as above. Thus the valuation-cylinder and parity-prefix predicates describe the same starts.

### Why the block encoding is exact

If a_j=v_2(3n_j+1), then 3n_j+1=2^{a_j}n_{j+1} with n_{j+1} odd. The ordinary map takes one odd step to (3n_j+1)/2=2^{a_j-1}n_{j+1}, followed by exactly a_j-1 even halvings before reaching n_{j+1}. The parity of the states before the next odd state is therefore (1,0^{a_j-1}). Concatenating the N blocks and recording the terminal odd state gives length A_N+1.

Examples: valuation 1 expands to 11; valuation 2 expands to 101; valuation 3 expands to 1001.

## Finite regression check (exploratory, not proof)

An independent exact-integer enumeration checked every valuation word of lengths 1 through 4 with entries in {1,2,3,4} and total valuation A_N <= 9: 180 words. For each word, all odd representatives modulo 2^(A_N+1) were tested. The set matching the exact valuation word agreed with the set matching the expanded ordinary parity prefix in every case; each set contained exactly one odd residue representative. Failures: 0.

This is finite regression evidence only. It is not Lean-compiled, does not establish the theorem for all words, and does not establish universal Collatz descent.

## Existing formalization discovered

A public Lean source already formalizes parity-prefix/residue-class machinery for the ordinary accelerated map:
https://github.com/neljaouh/uniform-syracuse-atoms-lean/blob/17e43a340f22ccc0cbd7063a0862a93f72373979/Erdos1135/Terras/Parity/Residue.lean

The source includes same_parityPrefix_one_iff_modEq_two, parityPrefix_eq_of_modEq_twoPow, and an affine-iterate lemma. This makes exact source comparison feasible and further rules out claiming parity-word residue coding itself as new. The prospective contribution is a checked translation from exact valuation words to the existing parity-prefix convention, including endpoint and modulus.

## Important precision about the residue class

The public formalization uses the standard Collatz map C(m)=m/2 for even m and (3m+1)/2 for odd m; a length-k parity prefix is tied to congruence modulo 2^k. For the valuation word, the proposed prefix length is A_N+1 because it records all A_N ordinary-step parities plus the terminal odd state n_N. The proof must establish that this convention yields exactly the same residue class modulo 2^(A_N+1), not merely equal cardinalities.

The valuation-cylinder derivation predicts one residue class modulo 2^(A_N+1), intersected with positive odd integers, with relative density 2^(-A_N) among odd starts.

## Formal proof obligations

1. Define the accelerated map and valuation using a division-free or explicitly guarded formulation; prove a_j>=1 for positive odd states.
2. Prove the ordinary-map block identity: after exactly a_j ordinary steps from n_j, the orbit reaches n_{j+1}, with parity block (1,0^(a_j-1)).
3. Prove the finite concatenation theorem by induction on N, keeping the terminal-state convention explicit.
4. Prove both directions of predicate equivalence, including positivity and oddness of all accelerated states.
5. Separately prove the unique residue-class statement and density calculation.
6. Align the definitions with the cited Lean source and pin the exact dependency/toolchain before any novelty claim.

## What this does not prove

The bridge is a representation theorem. It does not prove that every orbit descends, that the exceptional set is empty, or that a density-one result upgrades to a universal theorem. A density estimate may leave a nonempty exceptional set of density zero.

## Related checked result and its boundary

ProofAtlas records a checked logarithmic-time power-saving descent theorem:
https://www.proofatlas.ai/formalizations/terras-log-time-power-saving/

Its stated conclusion bounds the proportion of starts below N that fail to descend within a logarithmic number of accelerated steps by 10^7 N^(-1/100), for N >= 15552. It does not prove that every orbit descends or reaches 1. The proposed bridge should reuse compatible definitions where possible, not restate that result as a new theorem.


## Update 2026-10-26: direct comparison with a pinned existing Lean source

The pinned source was fetched and inspected, not merely discovered by search:
https://github.com/neljaouh/uniform-syracuse-atoms-lean/blob/17e43a340f22ccc0cbd7063a0862a93f72373979/Erdos1135/Terras/Parity/Residue.lean

Relevant declarations in that file include:
- `same_parityPrefix_iff_modEq_pow_two`: parity prefixes of length k agree iff the starts are congruent modulo 2^k.
- `unique_residue_for_word`: each parity word determines exactly one residue class modulo 2^k.
- `accelerated_iterate_add_two_pow_mul_of_prefix`: the accelerated iterate has an affine tail formula on a fixed prefix class.

This reduces the residue-class part of the project: we should not duplicate it. The remaining precise bridge is to define the expansion W of an exact valuation word, prove by induction that its parity-prefix predicate is equivalent to the valuation predicate, and then invoke the existing unique-residue theorem at k=A_N+1. The target theorem should be stated for the ordinary map convention used by that repository; the accelerated map there is the one-step map (even n -> n/2, odd n -> (3n+1)/2), not the odd-only Syracuse map T. Keep these two maps explicitly distinct.

A caveat from the source inspection: its residue theorem is general over natural starts, while our valuation statement concerns positive odd starts and exact 2-adic valuations. The bridge must carry the oddness and positivity hypotheses explicitly. No import or Lean build was run here, and no proof of the bridge has yet been added.

This is a reduction of proof obligations, not a new theorem result. The residue-class bijection is prior work.
