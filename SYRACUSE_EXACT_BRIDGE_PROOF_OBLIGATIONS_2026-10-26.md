# Syracuse exact valuation-to-parity bridge — proof obligations tightened (2026-10-26)

## Verified source comparison

Pinned external source:
https://github.com/neljaouh/uniform-syracuse-atoms-lean/blob/17e43a340f22ccc0cbd7063a0862a93f72373979/Erdos1135/Terras/Parity/Residue.lean

The source defines the one-step Collatz map as even m -> m/2 and odd m -> (3*m+1)/2, and has a parity-prefix/residue theorem plus an affine iterate theorem. It is not the odd-only Syracuse map. The intended bridge must explicitly connect the two maps.

## Exact block lemma (mathematical proof)

Assume n is positive odd, a = v2(3n+1) >= 1, and n' = (3n+1)/2^a is odd. Then C^a(n) = n', where C(m)=m/2 for even m and C(m)=(3m+1)/2 for odd m.

Proof: C(n)=(3n+1)/2=2^(a-1)n'. Since n' is odd, the next a-1 iterates are successive halvings of 2^(a-1)n'; their states before the final endpoint have parities 1, then a-1 zeros, and C^a(n)=n'. Thus the parity bits at times 0,...,a-1 are exactly (1,0^(a-1)); the endpoint parity is the next bit, 1.

For N odd-only steps, concatenate N blocks. The length-(A_N+1) parity prefix is (1,0^(a_0-1)) ... (1,0^(a_{N-1}-1)) 1, where A_N = sum a_j; the final 1 is the parity of the terminal odd state n_N. This endpoint convention is essential: a length-k parity prefix records the parities of states at times 0 through k-1, not the state at time k unless one extra bit is included.

## Exact predicates to formalize

Define a valuation-word predicate recursively by following the odd-only map and requiring v2(3*n_j+1)=a_j at each stage. Define the expansion as the concatenated bit list above. Then prove equivalence between the valuation-word predicate and parityPrefix (sum a + 1) n = expanded_word, under a positive-odd start and the source's exact parity-bit convention. The induction step should use the block lemma and the iterate-prefix decomposition. Do not infer this equivalence from equal cardinalities or finite tests.

## Consequence after bridge

Apply the pinned theorem parityPrefix_eq_of_modEq_twoPow / the source's unique-residue theorem at exponent A_N+1. This gives a unique residue class modulo 2^(A_N+1) for the expanded prefix, and hence for the exact valuation word, provided the bridge equivalence is proved. The odd-start restriction and positivity are part of the theorem statement.

## Regression evidence inherited, not proof

Earlier exact-integer regression tested 180 valuation words (length 1–4, entries 1–4, total valuation <=9), with zero mismatches. This remains finite regression only. No Lean build or CI run has been performed here.

## Main risks

1. Define v2 only on nonzero positive naturals or use a guarded Nat.factorization formulation; never let v2(0) or division by zero silently alter the theorem.
2. Ensure the parity prefix uses the same time-index convention as the pinned source.
3. Prove positivity and oddness of every odd-only iterate.
4. Check the N=0 case explicitly: the empty valuation word expands to the one-bit terminal prefix 1 only if the starting odd state is the chosen endpoint; otherwise define the zero-step convention separately and consistently.
5. Do not claim Collatz convergence from this representation lemma.
