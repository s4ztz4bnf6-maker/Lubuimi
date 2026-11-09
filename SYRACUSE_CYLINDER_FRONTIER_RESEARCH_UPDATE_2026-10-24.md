# Research update: finite cylinders, known density results, and the universal gap (2026-10-24)

## Current formal evidence

The Syracuse branch's latest recorded successful workflow, `40129768467`, compiled the existing offset identity, strict-margin consequence, and stronger offset lower bound. The exact finite-word density argument currently recorded in `SYRACUSE_FINITE_WORD_DENSITY_2026-10-24.md` is a mathematical note, not yet a Lean-checked density theorem.

For a certified exponent word (a_0,\ldots,a_{N-1}\ge1), let
[
A_0=C_0=0,\quad A_{j+1}=A_j+a_j,\quad C_{j+1}=3C_j+2^{A_j}.
]
The exact offset identity gives (2^{A_N}n_N=3^Nn_0+C_N). Oddness of the terminal quotient forces
[
3^Nn_0+C_N\equiv2^{A_N}\pmod {2^{A_N+1}}.
]
Because (3^N) is invertible modulo (2^{A_N+1}), a fixed word corresponds to one residue class. Its relative density among odd starts is (2^{-A_N}). This yields the exact finite-prefix geometric law; it does not imply that every individual orbit follows the average drift.

## External frontier comparison

ProofAtlas publicly describes two distinct Collatz-type results: (i) a Lean-checked positive-natural-density-one statement with a logarithmic-time descent bound, and (ii) a separate statement about positive-density convergence in logarithmic time. Its page explicitly says the full Collatz problem remains open. These are useful comparators, not imported proof dependencies and not evidence that our universal termination goal is solved. Before using either result, pin the exact manuscript, Lean commit, theorem statement, assumptions, and paper-to-formalization alignment.

Tao's almost-bounded-orbit theorem is also a different quantifier: logarithmic density one for a threshold tending to infinity is not universal termination. The lesson for this branch is to keep separate:
- a finite-prefix density identity;
- an almost-all-starting-values descent theorem;
- a trajectory-wise theorem for every positive odd start.

No implication from either of the first two to the third is available without a new argument.

## Sharpened target: exact cylinder extension theorem

For a prefix with accumulated exponent (A), appending exponent (b\ge1) refines a residue class modulo (2^{A+1}) to one class modulo (2^{A+b+1}). The child has relative density (2^{-b}) inside the parent; summing over all (b\ge1) gives
[
\sum_{b\ge1}2^{-b}=1.
]
The finite-level tree is therefore exactly mass-conserving. This can be formalized without any probabilistic independence assumption about a single infinite orbit.

## Next formalization steps

1. Define list-recursive `wordExponent` and `wordOffset` and prove the offset identity by induction on the list.
2. Prove each certified transition's exact residue constraint; use the existing `exact_exponent_residue` as the one-step lemma.
3. Prove the cylinder residue is unique using invertibility of odd numbers modulo powers of two.
4. Prove extension nesting and relative child-cylinder cardinality at finite modulus.
5. Only after these finite lemmas are checked, state the density theorem. Keep density and universal termination as separate declarations.

## The genuine obstruction

The margin recurrence
[
D_{j+1}=3D_j+(2^{a_j}-4)2^{A_j}
]
has negative correction at exponent (1), zero correction at exponent (2), and positive correction for exponents at least (3). Long strings of exponent (1) prevent a proof based only on a uniform bound for low-exponent runs. A global proof needs a deterministic invariant that controls every admissible word, or a rigorous argument showing that every putative nonterminating trajectory eventually enters a forbidden region. Finite-cylinder frequencies alone cannot provide that invariant.

## Falsification checklist

- Check exact valuation, not just divisibility by (2^a).
- Check all residue moduli and the odd-start normalization.
- Do not convert density-one into “all starts.”
- Search for words with nonpositive margin before conjecturing a monotonic invariant.
- Treat any computational search as a source of candidate lemmas/counterexamples, not as proof of a universal statement.
