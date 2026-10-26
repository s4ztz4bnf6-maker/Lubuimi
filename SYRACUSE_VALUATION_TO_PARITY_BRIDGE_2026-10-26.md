# Syracuse bridge: exact valuation cylinders to ordinary parity prefixes

Date: 2026-10-26
Status: proof design and exact statement correspondence; NOT Lean-compiled. No global Collatz result claimed.

## Definitions

For positive odd n, let
\[
T(n)=\frac{3n+1}{2^{v_2(3n+1)}}.
\]
Write n_{j+1}=T(n_j), a_j=v_2(3n_j+1)>=1, and A_N=sum_{j<N} a_j.

Let the ordinary Collatz map be C(m)=m/2 for even m and C(m)=(3m+1)/2 for odd m.

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

## Important precision about the residue class

A parity prefix of length L for the ordinary Collatz map is determined by a residue class modulo 2^L, subject to the precise convention for whether the initial state and terminal state are included. Here L=A_N+1. The proof must establish the convention and residue modulus in Lean, not rely on visual agreement between bit strings.

The existing exact-cylinder derivation says the valuation word selects one residue class modulo 2^(A_N+1), intersected with positive odd integers, with relative density 2^(-A_N) among odd starts. The bridge theorem should identify this class with the class defined by W. It should not merely assert equal cardinalities.

## Formal proof obligations

1. Define the accelerated map and valuation using a division-free or explicitly guarded formulation; prove a_j>=1 for positive odd states.
2. Prove the ordinary-map block identity: after exactly a_j ordinary steps from n_j, the orbit reaches n_{j+1}, with parity block (1,0^(a_j-1)).
3. Prove the finite concatenation theorem by induction on N, keeping the terminal-state convention explicit.
4. Prove both directions of predicate equivalence, including positivity and oddness of all accelerated states.
5. Separately prove the unique residue-class statement and density calculation.
6. Compare the definitions and indexing with the public Terras-style parity-prefix formalization before claiming novelty.

## What this does not prove

The bridge is a representation theorem. It does not prove that every orbit descends, that the exceptional set is empty, or that a density-one result upgrades to a universal theorem. A density estimate may leave a nonempty exceptional set of density zero.

## Existing related work

A public parity-word/residue-class formalization already exists at:
https://www.proofatlas.ai/formalizations/terras-log-time-power-saving/

Therefore, the parity-cylinder idea itself is not claimed as new. The prospective contribution is a checked equivalence for the variable-length exact-valuation encoding, plus a source-faithful comparison with that existing formalization. No Lean compilation or CI is claimed for this note.
