# Syracuse margin research note — 2026-10-23

## Status boundary

The branch `collatz/offset-margin-roadmap-2026-10-23` encodes the certified-block identity
`2^(A_N) * n_N = 3^N * n_0 + C_N`, with
`A_(j+1) = A_j + a_j` and `C_(j+1) = 3*C_j + 2^(A_j)`.
The current CI run 40025155422 has passed checkout and Lean setup; at the latest check it was restoring/installing dependencies. Compilation of the changed margin lemma has not yet been reached.

## Exact margin, not a surrogate

Define the integer margin
`M_N := 2^(A_N) * n_0 - (3^N * n_0 + C_N)`.
The identity gives `M_N = 2^(A_N) * (n_0 - n_N)` for an actual certified block. Therefore `M_N > 0` is equivalent to strict descent, and is not an independent estimate. Any argument that assumes a lower bound on `M_N` without deriving it from trajectory constraints would be circular.

## Useful exact recurrence consequence

The offset recurrence yields `C_(j+1) >= 3*C_j + 1`, hence `3^j <= 2*C_j + 1`. This is a lower bound on the offset, whereas descent requires an upper margin:
`3^N*n_0 + C_N < 2^(A_N)*n_0`.
These directions must not be confused. In particular, `3^N <= C_N` is not a generally available substitute for the sharper doubled bound.

## Next research object: admissible valuation words

Represent a block by its valuation word `a_0,...,a_(N-1)`, but do not quantify over arbitrary positive words when making claims about real orbits. The admissibility certificate must include odd states `n_j`, exact equations
`2^(a_j) * n_(j+1) = 3*n_j + 1`, oddness of every `n_j`, and maximality of each exponent (equivalently, the quotient `n_(j+1)` is odd). The code already contains a local maximality lemma for the last condition.

The research target is a theorem about these certified words that constrains the pair `(A_N,C_N)` strongly enough to force a positive margin for at least one block, or a counterexample to a proposed bound. A statement merely about the average of arbitrary exponents is not enough.

## Acceptance checklist

1. Wait for the current CI to reach the changed module and finish.
2. Inspect the transitive `#print axioms` output for the exact exported result.
3. Test any proposed exponent/offset inequality against actual certified trajectories, not arbitrary sequences alone.
4. Keep finite computational evidence separate from universal proof claims.

## Kernel/toolchain robustness update

Both project branches pin `leanprover/lean4:v4.34.1`. This is preferable to relying on a floating toolchain. A separate independent checker, `nanoda`, was reported to have accepted an invalid Collatz proof due to an unrelated checker bug; that is not evidence that Lean's main kernel accepted the proof. It is a reason to state precisely which kernel checked each result and not to treat independent checker agreement as infallible. See the Lean developer postmortem: https://leodemoura.github.io/blog/2026-8-1-postmortem-for-kernel-soundness-bug-14576/ .

## New cross-kernel audit opportunity (Lean 4.35+)

Lean 4.35.0 adds `lake check` and `lake check --paranoid`, which re-export a project and recheck it with the bundled official and independent kernels, including the consistency-proved con-leche kernel. Our project is currently pinned to 4.34.1, so this check is not available under the present pin. Next infrastructure step: add a separate, explicitly versioned 4.35.0+ audit job (without silently changing the main compilation toolchain), run `lake check --paranoid` after the ordinary build, and archive any checker disagreement. This is defense in depth, not a substitute for checking that theorem statements encode the intended mathematics. Official release notes: https://lean-lang.org/doc/reference/latest/releases/v4.35.0/ .


## New structural route: residue-class sieve for valuation words

For a fixed finite exponent word and its accumulated exponent/offset `(A_N,C_N)`, every genuine block must satisfy
`3^N * n_0 + C_N ≡ 0 (mod 2^A_N)`.
Because `3^N` is odd, it is invertible modulo `2^A_N`; hence this *terminal divisibility condition alone* selects exactly one residue class for `n_0 mod 2^A_N` (including the trivial modulus `2^0=1)). This is a necessary filter, not a sufficient orbit certificate: it does not by itself guarantee positivity, oddness of all intermediate states, or exactness/maximality of each valuation.

Research plan:
1. Prove the residue-class uniqueness lemma in Lean using integer/modular arithmetic, with the `A_N=0` case explicit.
2. For each prefix `j`, impose the corresponding divisibility and odd-quotient conditions, rather than testing only the terminal equation.
3. Use the resulting finite residue filter to enumerate admissible words for bounded `A_N`; use enumeration only to falsify candidate universal inequalities or discover conjectures, never as a substitute for the infinite proof.
4. Seek a theorem bounding the weighted offset `C_N = Σ_{j<N} 3^(N-1-j) 2^(A_j)` on *admissible* words. An upper bound strong enough to force the strict margin would advance descent; an explicit admissible word violating a proposed bound would refute that route.

This is a new proof architecture proposal, not yet a Lean theorem or a global Collatz result.
