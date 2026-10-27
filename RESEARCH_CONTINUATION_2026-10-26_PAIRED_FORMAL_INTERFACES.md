# Research continuation: paired formal interfaces (2026-10-26)

## Status and scope

This note records a concrete next-step interface for the two projects. It is a research specification, not a claim that either open problem has been solved. The existing Lean source branches are separate from `main`; no source theorem is claimed compiled by this note.

## A. Syracuse: isolate the exact Archimedean descent obligation

The existing `SyracuseAudit.finite_prefix_affine_identity` gives, for a sequence of transition equations

`2^(a k) * n (k+1) = 3*n k + 1`,

an exact identity with `A_N = prefixExponentSum a N` and the recursively accumulated right side `R_N`:

`2^A_N * n_N = R_N`,

where `R_0 = n_0` and `R_(k+1) = 3*R_k + 2^A_k`.

Unrolling this recurrence gives the explicit expression

`R_N = 3^N*n_0 + C_N`,

`C_N = sum_{j=0}^{N-1} 3^(N-1-j) * 2^A_j`.

This follows by induction from the recurrence, and all summands in `C_N` are nonnegative. Combining with the affine identity yields the exact descent equivalence

`n_N < n_0  <->  (2^A_N - 3^N)*n_0 > C_N`,

where the subtraction formulation is most naturally stated over integers or rationals in Lean to avoid truncated natural subtraction. The equivalence is the key interface: valuation growth alone is not descent; the additive correction must also be dominated.

A convenient sufficient condition for a fixed realized block and all starting values `n_0 >= 3` is

`2^A_N > 3^N` and `3*(2^A_N - 3^N) > C_N`.

It implies descent by monotonicity in `n_0`, but it does not prove that every orbit contains such a block. The remaining global obligation is to prove that every nontrivial orbit reaches a realized block satisfying a descent criterion, or to construct a different well-founded potential that implies descent without that block condition.

### Required proof boundaries

1. Prove the finite-sum closed form for `C_N` from the recurrence, with no assumptions about realizability beyond the transition equations.
2. State the descent equivalence over `ℤ` (cast the natural quantities) and prove both directions.
3. Keep exact valuation certificates separate: `a_k = v₂(3*n_k+1)` must be derived from divisibility and non-divisibility, not assumed for arbitrary exponent words.
4. Keep cylinder realizability separate from the Archimedean descent inequality. Compactness of `ℤ₂` alone does not compare ordinary integer sizes.
5. Only after (1)-(4), seek a global block-cover theorem or a strictly decreasing potential. A density-one theorem cannot discharge the exceptional-orbit obligation.

## B. BBMST / square-free covering systems: turn a geometric witness into a global lower bound

The current finite mass core proves algebraic conservation and positivity facts, including the variance identity

`interior mass = mean*(1-mean) - variance`,

under normalized weights. It also formalizes the finite witness fact that a positive-mass fiber containing a nonempty proper subset has a strictly positive contribution `alpha*(1-alpha)*mass`.

The direct-witness route is therefore logically shorter than the variance route if, and only if, the source-faithful BBMST geometry can produce such a witness in the correct conditional fiber and the rest of the measure update preserves the required mass bounds.

### Required source-derived interface

For each relevant stage and fiber, define from the paper's actual finite probability space:

- the fiber/sample set `s`, with `s.Nonempty`;
- the removed subset `t`, with `t ⊂ s` and `t.Nonempty`;
- the exact source mass `m`, with `0 < m`;
- the actual conditional proportion `alpha = card(t)/card(s)` (or the source's exact weighted analogue).

Then apply the existing proper-subset ratio lemma to get `0 < alpha < 1`, and the positive-term lemma to get `0 < alpha*(1-alpha)*m`. This is a valid local certificate, but not yet the theorem: one must prove the fiber is one of those actually used in the source's sum, that all other terms are nonnegative, and that the source's normalization/distortion inequalities transfer the local positive term to the required global bound.

If the source geometry does not yield a nonempty proper subset for the relevant fiber, this route stops. Do not add an axiom asserting the witness. Fall back to the source's moment/variance argument and prove the needed strict variance bound from the actual geometric hypotheses.

### Source-faithfulness checklist

1. Define the finite product space from the paper's prime coordinates and the corresponding product measure.
2. Define each arithmetic progression's coordinate constraint exactly, including the unrestricted coordinates when a prime does not divide the modulus.
3. Prove the progression/hyperplane correspondence and the coverage equivalence in the finite product model.
4. Enforce square-freeness and distinctness in the theorem hypotheses, rather than relying on comments or names.
5. Reproduce the paper's actual evolving measure, conditional proportions, and distortion estimates; no free `alpha`, `isNontrivial`, `isParallel`, or `codimOne` hypotheses may stand in for those constructions.
6. Audit the final theorem's transitive axioms and check that no admitted sieve criterion, division-by-zero convention, or degenerate empty family changes the original theorem statement.

## C. Four-pillar protocol: what can and cannot be imported

- Algebraic meta-structure: useful when it produces a precisely stated invariant or equivalence, not when higher-dimensional geometry is only metaphorical.
- Continuous / 2-adic embedding: useful for finite valuation cylinders and distributions; it does not by itself imply an ordinary-size descent.
- Formal verification: a Lean kernel check certifies the formal statement under its axioms. It does not certify that the formal statement faithfully represents the intended paper or conjecture; source audit and transitive axiom audit remain separate.
- Experiments: computation can discover counterexamples to proposed lemmas, identify valuation patterns, and test finite instances. No finite search establishes universal Collatz convergence or the covering theorem.

## D. Acceptance gates for the next iteration

A change is accepted only if it has (i) an exact statement, (ii) a proof or explicit counterexample, (iii) source-to-formalization mapping, (iv) a transitive axiom report, and (v) a reproducible build/CI result. Until those are observed, label the item a proposed lemma or research obligation, not a verified result.
