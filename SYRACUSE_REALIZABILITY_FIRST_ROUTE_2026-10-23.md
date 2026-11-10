# Syracuse realizability-first proof route (2026-10-23)

## Status boundary

This note is a research plan and proof-obligation ledger, not a proof of the Collatz conjecture. The exact affine identity is already formalized in `SyracuseOffsetIdentity.lean` from certified transitions
```
2^(a j) * n (j+1) = 3 * n j + 1
A (j+1) = A j + a j
C (j+1) = 3 * C j + 2^(A j)
```
and gives
`2^(A j) * n j = 3^j * n 0 + C j`.
The descent condition is exactly
`C j < (2^(A j) - 3^j) * n 0`, when `3^j ≤ 2^(A j)`.
Neither identity establishes that this strict margin holds.

## New structural direction: quantify over realizable words, not arbitrary words

An exponent word `a : Fin k → ℕ` should not be treated as a free sequence. A valid certificate should carry an odd trajectory `n : Fin (k+1) → ℕ` and, for each step, all of:

1. `2^(a i) * n(i+1) = 3*n(i)+1`;
2. `n(i+1) % 2 = 1`;
3. exactness: `¬ 2^(a i+1) ∣ 3*n(i)+1` (already available as a consequence of an odd quotient in the current development);
4. positivity / oddness of the current iterate, with the indexing convention fixed explicitly.

The third condition is important: the scaled equation alone with an arbitrary quotient does not assert that the exponent is the 2-adic valuation. The current lemma `exponent_is_maximal_of_odd_quotient` formalizes the relevant maximality fact.

## Proposed next formal interface

Introduce a structure (or predicate) `RealizableOddWord n0 k a` which packages the trajectory and exact transitions. Prove:
- the affine offset identity for every prefix of a realizable word;
- the prefix congruence forced by each exact exponent;
- a concatenation theorem that preserves realizability when the second word starts at the first block's terminal iterate;
- a block certificate carrying both `A` and `C`, with the descent margin checked separately.

The first genuinely new target is a *necessary-condition filter*: characterize which exponent prefixes are impossible from their induced congruences before attempting any offset upper bound. This can remove non-realizable words from finite searches and prevent an arbitrary-word estimate from being misreported as an orbit theorem.

## Main unresolved inequality

For a realizable prefix of length `k`, prove or refute
`C_k < (2^(A_k)-3^k) * n0`
under an independently justified condition ensuring `3^k ≤ 2^(A_k)`. A proof for all prefixes would imply strict descent at that block and must be treated as a major claim requiring adversarial testing. If it fails, retain the exact counterexample and identify whether the failure is a genuine Syracuse trajectory or only a non-realizable exponent word.

## Adversarial checks

- Enumerate short odd starting values and compute the exact valuation word, `A_k`, `C_k`, and both sides of the margin.
- Compare only *realizable* words against unrestricted exponent words; report the two sets separately.
- Check every formal theorem with `#print axioms`, inspect the full import closure, and use a Lean version containing the kernel soundness fix (Lean 4.32.2 or later; the current CI toolchain must be checked rather than assumed).
- Do not use average multipliers, random-word heuristics, or finite computations as substitutes for the universal inequality.

## Verification status at note creation

The branch's latest relevant workflow was still in progress while dependency/cache restoration and compilation were pending. This note does not claim that the latest change compiles or that the global conjecture is solved.
