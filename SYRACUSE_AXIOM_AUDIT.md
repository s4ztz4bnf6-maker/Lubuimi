# Syracuse / Collatz axiom and evidence audit

Date: 2026-10-24
Branch: `collatz/offset-margin-roadmap-2026-10-23`

## Scope

This is an evidence ledger, not a proof of the Collatz conjecture. It separates (i) checked local Lean statements, (ii) hypotheses about realizable exponent words, and (iii) the still-open universal descent claim.

## Current exact algebra

For a certified accelerated-odd orbit with
`2^(a j) * n (j+1) = 3*n j + 1`,
`A 0 = C 0 = 0`,
`A (j+1) = A j + a j`, and
`C (j+1) = 3*C j + 2^(A j)`,
the file `SyracuseOffsetIdentity.lean` proves the affine identity
`2^(A j) * n j = 3^j * n 0 + C j`.

The signed margin `D j = 2^(A j) - C j - 3^j` obeys
`D (j+1) = 3*D j + (2^(a j)-4)*2^(A j)`.
For a block of length r, the exact decomposition is
`D (m+r) = 3^r * D m + W(m,r)`,
where `W` is the recursively accumulated correction. Therefore
`D (m+r) > 0 ↔ W(m,r) > -(3^r)*D m`.
This is an identity/criterion, not a proof that the inequality holds on all actual orbits.

## Admissibility: necessary versus sufficient

A finite exponent word is orbit-admissible only if every prefix has positive odd states satisfying
`2^(a j) * n_(j+1) = 3*n_j+1`, with the quotient odd. The latter certifies the exact valuation. The terminal congruence
`3^N*n_0 + C ≡ 0 (mod 2^A)`
selects one residue class modulo `2^A` because 3 is invertible modulo every power of 2. Neither this terminal congruence nor a finite residue filter alone proves the prefix conditions or excludes an infinite exceptional orbit.

## Current CI status (snapshot)

Run: https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/40123092159

At the last inspection, the library build, `IterationLemmas.lean`, `ThresholdLemmas.lean`, and `SyracuseReferenceTest.lean` had completed successfully. `SyracuseQuarterDescent.lean` was still running; the offset-identity/margin audit and stronger lower-bound audit had not yet run. This is not a completed workflow or a complete axiom audit.

## Axiom audit protocol

For each target theorem, run `#print axioms <fully-qualified-name>` in a compiling Lean file and preserve the output in CI. Standard foundational dependencies such as `propext`, `Classical.choice`, and `Quot.sound` must be distinguished from project-specific axioms and `sorryAx`. A successful compile by itself does not establish axiom-freedom.

Audit at minimum:
- `offset_identity_of_certified_steps`
- `signedOffsetMargin_block_decomposition`
- `signedOffsetMargin_pos_iff_block_correction`
- `strict_descent_of_offset_margin`
- `descent_iff_offset_margin`
- any theorem advertised as a residue-filter or quarter-descent result.

## Research targets, ordered by logical dependency

1. Formalize the unique terminal residue class and its compatibility with all prefix constraints.
2. Search finite words only with exact valuation and odd-state constraints; report counterexamples to proposed *finite-block inequalities* if found, without extrapolating a bounded search to the infinite conjecture.
3. Derive a quantitative bound on the negative contribution from exponent-one steps using actual orbit admissibility, not arbitrary symbolic words.
4. Only after (3), try to prove a block margin that forces descent. Density-one or positive-density results do not dispose of a possible zero-density exceptional orbit.

## Explicit non-claims

- No universal Collatz convergence theorem is proved here.
- No claim that all exponent words with (a_j \ge 2) occur, or that exponent-one runs are globally bounded, is made.
- A local descent lemma is not a global termination proof.
- A passing CI run is evidence for compilation and the recorded axiom trace only, not a proof beyond the checked theorem statements.


## Important obstruction: exponent-one runs are not uniformly forbidden

The tempting claim that sufficiently large starting values structurally forbid long runs of (a_j=1) is too strong. In fact, for any finite (k\ge1), take (n_0=2^{k+1}q-1) with (q\ge1). For (0\le j<k), the repeated exponent-one recurrence gives
[
n_j+1=\frac{3^j(n_0+1)}{2^j}=3^j2^{k+1-j}q,
]
which is divisible by (4). Hence (n_j\equiv3\pmod4), so (v_2(3n_j+1)=1) at each of the first (k) steps. Thus arbitrarily long *finite* runs of exponent one occur for suitable, arbitrarily large starting values. This rules out a uniform run-length cutoff.

What remains useful is a start-dependent bound: a run of length (k) forces (2^{k+1}\mid n_0+1), hence (2^{k+1}\le n_0+1), so (k\le \lfloor\log_2(n_0+1)\rfloor-1). The bound grows with the starting value and by itself does not control the cumulative negative margin tightly enough for global descent. Any Lean theorem should state this dependence explicitly rather than claim a fixed bound.


## Counterexample to a proposed forced large exponent after an exponent-one run

A run of (k) exponent-one steps does **not** force the next exponent to be at least (3). From the exact recurrence above,
[
n_k+1=2cdot 3^k q,qquad n_k=2cdot3^kq-1,
]
so
[
3n_k+1=2(3^{k+1}q-1).
]
The valuation of this expression depends on the residue of (3^{k+1}q) modulo higher powers of two; it is not uniformly at least (3).

Concrete counterexample: (n_0=7=2^3-1) gives
[
7\xrightarrow{a_0=1}11\xrightarrow{a_1=1}17
\xrightarrow{a_2=2}13.
]
Indeed, (3\cdot7+1=22=2\cdot11), (3\cdot11+1=34=2\cdot17), and (3\cdot17+1=52=4\cdot13). Thus after a run of two ones, the next exponent is exactly (2), not at least (3).

This invalidates the proposed deterministic implication “maximal exponent-one run (Rightarrow) next exponent (a_k\geq3)”. The valid conclusion is only that the next exponent is at least (2), since (n_k=2\cdot3^kq-1\equiv1\pmod4) and hence (3n_k+1\equiv0\pmod4). Even this single forced exponent (2) contributes zero to the margin recurrence, so it does not by itself compensate for the accumulated negative contributions. The global argument must use a longer, quantitatively controlled suffix or a different invariant.


## CI status update — 2026-10-24

Workflow run [40125303822](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/40125303822) completed successfully. It compiled the library modules, `IterationLemmas.lean`, `ThresholdLemmas.lean`, `SyracuseReferenceTest.lean`, `SyracuseQuarterDescent.lean`, the offset-identity/strict-margin audit, and the stronger offset lower-bound audit. This confirms compilation for the checked targets in this commit; it does not by itself certify axiom-freedom unless the recorded `#print axioms` outputs are inspected, and it does not prove global Collatz convergence.
