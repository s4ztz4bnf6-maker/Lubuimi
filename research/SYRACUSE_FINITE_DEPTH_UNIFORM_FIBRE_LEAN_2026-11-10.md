# Syracuse finite-depth uniform-fibre formalization

**Author:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Source research note:** `LUBUIMI_SYRACUSE_FINITE_DEPTH_UNIFORM_FIBRE_BRIDGE_2026-11-10.md`, source commit `31b01567` in the APW4 repository.  
**Lean status:** the finite dyadic interval union and cardinality core is kernel-verified on the exact commit below. Later stages remain obligations.

## 1. Verified Lean source

Repository: `s4ztz4bnf6-maker/Lubuimi`  
Candidate branch: `collatz/finite-depth-uniform-fibre-2026-11-10`  
Exact source commit: `de022f653de94dd589c98eb51a31f57559682004`  
GitHub Actions run: `42861870848` — success  
Toolchain: Lean 4.34.1 / Mathlib 4.34.1

File: `SyracuseFiniteDepthUniformFibre.lean`

The explicit axiom report gives the following profile for each of the four declarations:

`[propext, Classical.choice, Quot.sound]`

- `SyracuseUniformFibre.ico_union_adjacent`
- `SyracuseUniformFibre.childBlocks_tail_partition`
- `SyracuseUniformFibre.card_childBlock`
- `SyracuseUniformFibre.card_tailBlock`

The dedicated workflow step re-runs the module and rejects `sorryAx`; that step succeeded. The complete declared Lean library also built successfully.

## 2. Exact statements established

For the dyadic child block
`I(Bstar,b) = Ico (2^Bstar - 2^(Bstar-b+1)) (2^Bstar - 2^(Bstar-b))`
and tail block
`T(Bstar,B) = Ico (2^Bstar - 2^(Bstar-B)) (2^Bstar)`,
the formalized core establishes:

1. Adjacent half-open intervals join exactly:
   `Ico a b ∪ Ico b c = Ico a c` when `a ≤ b ≤ c`.
2. For every `B ≤ Bstar`, the recursive union of the first `B` child blocks together with the tail equals `Finset.range (2 ^ Bstar)`.
3. For `1 ≤ b ≤ Bstar`, the child block has cardinality `2^(Bstar-b)`.
4. For `B ≤ Bstar`, the tail block has cardinality `2^(Bstar-B)`.

These are exact finite integer-interval statements. The ambient coordinate range has size `2^Bstar`.

## 3. Remaining formal obligations

The next steps are intentionally separate:

- Prove pairwise disjointness of all child blocks and disjointness from the tail; the current union identity alone is not recorded as a disjointness theorem.
- Define the finite surviving prefix level `S_k` from a cap function and prove its finiteness.
- Define the level maximum `B_k^*` and prove `B_alpha ≤ B_k^*` for every prefix on that level.
- Derive rational uniform masses and the exact proportions `2^{-b}`, `2^{-B_alpha}`, and `1-2^{-B_alpha}`.
- Prove the canonical residue-atom refinement bijection against the exact Syracuse valuation cylinders.
- Instantiate the generic APW4 finite-fibre data only after the preceding maps and identities are explicit.

## 4. Non-implications

This finite combinatorial core does not prove:

- the historical APW4 event-to-BIB map;
- preservation of historical APW4 weights or capacities;
- a Hall/BIB incidence inequality;
- exclusion of an infinite surviving path;
- arbitrary valuation-word realizability;
- the global Collatz conjecture.

In particular, the candidate finite-fibre model must not be identified with the historical APW4 event system without a separate index-preserving map and weight/capacity proofs.

## 5. Branch integrity

The authoritative branch `collatz/valuation-cylinders-2026-10-26` was not modified. No merge to `main` was made. This formalization remains isolated on the candidate branch named above.
