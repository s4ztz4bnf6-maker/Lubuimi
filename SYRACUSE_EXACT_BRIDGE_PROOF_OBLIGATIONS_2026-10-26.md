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


## New local backward-exactness lemma — 10 November 2026

The one-step implication from terminal exactness at `k+1` to exactness at `k` is derived in [the dedicated proof note](research/SYRACUSE_TERMINAL_EXACT_BACKWARD_STEP_2026-11-10.md). It uses only the accumulator recursion and `1 ≤ a k`; no orbit step equations are needed for this local implication. The Lean theorem and finite backward induction remain unimplemented and unverified. This does not close the general finite-word realization or tail-partition obligations.


## Compile blocker exposed on backward-step branch — 10 November 2026

Workflow 42835859458 failed at `SyracuseAffineCorrectionSum.lean:108:2` with `No goals to be solved`: `simp [affineCorrectionSum]` closed the goal before the following `omega`. The isolated repair removes only that redundant tactic in commit `b9a89872e39b6688f7c7ef567755beceb0c1e5f9`. The fresh exact-head build is pending. This is separate from the terminalExact backward-step theorem, which remains a target signature only.


## Status correction — terminal backward exactness is kernel-verified

The earlier statement that the terminal-exact backward lemma and finite induction were unimplemented is superseded. Both declarations were kernel-verified at exact source commit `e44eb4331cc1481e10d6f60780d695412c47a726`, run `42844423707`, with axiom profile `[propext, Classical.choice, Quot.sound]` and no `sorryAx`. The later candidate-branch head `f36fdcc157e2f40dffd96485898f4ad35136550b` also passed its corrected workflow. Their mathematical scope remains finite backward propagation only.

## Status addition — finite-depth uniform-fibre interval core

On isolated candidate branch `collatz/finite-depth-uniform-fibre-2026-11-10`, exact source commit `8a9d2b32a265e70d662aeedd21ec8a3ca9a7e594`, workflow `42861207383` succeeded under Lean 4.34.1 / Mathlib 4.34.1. The interval union identity and the exact child/tail cardinality lemmas in `SyracuseFiniteDepthUniformFibre.lean` each report `[propext, Classical.choice, Quot.sound]`; the dedicated `sorryAx` rejection step passed.

Still open: finite-level construction and maximum cap, pairwise disjointness of the complete family, rational mass identities, residue-cylinder refinement bijection, and any global infinite-path exclusion. This candidate does not identify the finite atoms with historical APW4 events/BIB slots. The authoritative branch `collatz/valuation-cylinders-2026-10-26` remains unchanged.


### Follow-up: child-region / tail disjointness kernel-verified

The formalization was extended at exact source commit `c7a6d1c19fe6d8541871064413b0c5e558ed1524`. GitHub Actions run `42862468237` completed successfully under Lean 4.34.1 / Mathlib 4.34.1. The declared library, dedicated finite-fibre axiom audit, all other named modules, and the explicit project axiom report passed.

Two additional declarations were checked:

- `SyracuseUniformFibre.mem_childBlocks_lt_tailLower`
- `SyracuseUniformFibre.childBlocks_disjoint_tail`

Both have profile `[propext, Classical.choice, Quot.sound]`; no `sorryAx` occurs in their transitive axiom reports. Thus the combined retained-child region is now proved disjoint from the terminal tail.

**Still open:** pairwise disjointness of the individual child blocks within `childBlocks`, finite surviving-level construction and maximum cap, rational mass identities, and the residue-cylinder refinement bijection. Do not call the full family a disjoint partition until the internal child-block disjointness theorem is also established.
