# BBMST source-to-Lean matrix — 2026-10-23

## Status boundary

Branch: `audit/lean4-erdos-selfridge`.
The latest CI run for commit `6ed78a47` is run 40025299764. At the latest check, Lean setup was still in progress; the new predicate-deficit corollary has not yet been confirmed by that run. The general finite-cardinality deficit bound is CI-confirmed on earlier commits, but this does not establish the BBMST geometric estimates.

## Proven finite combinatorics

For a nonempty finite sample (S) and an incidence predicate (P), let (U = \{x \in S : \neg P(x)\}). The code establishes the exact identity
`1 - |{x in S : P x}| / |S| = |U| / |S|`
and, if `m <= |U|`,
`m / |S| <= 1 - |{x in S : P x}| / |S|`.
This is a finite uniform-sample fact. Since the lower bound `1/|S|` shrinks with sample size, it cannot by itself yield the source's uniform geometric sieve estimate.

## Source-to-Lean obligations

| Published source object | Required Lean object | Current status |
| --- | --- | --- |
| Lemma 2.1: fiber sieve and measure bounds | Explicit finite configuration space, projection, hyperplane incidence, fiber-local mass inequalities | Generic finite-fiber algebra exists; source geometry not yet instantiated |
| Theorem 3.1: removed mass via first/second moments | Exact fiber moment definitions and derived inequalities | Open |
| Lemmas 3.3–3.4: weight propagation and compatible intersections | Source-specific hyperplane intersection predicates and weight induction | Open |
| Theorem 3.2: union count / singleton case | Finite union and intersection-count bounds with exact hypotheses | Open |
| Lemmas 5.3–5.4 and Corollary 5.2 | Exact rational/integer certificates and endpoint checks | Must be mapped against published text, not only preprint |
| Main theorem | Composition of proved geometric and arithmetic lemmas | Open; sieve dependencies remain admitted in the main file |

## Ratio-free fiber design

For each projection label (i), define the fiber as the actual subset `F_i = {x in S | label x = i}`. Define total, removed, and retained masses as finite sums over pairwise-disjoint subsets of (F_i). First prove:
1. the subsets are disjoint and exhaustive;
2. their masses add to the fiber mass;
3. a zero-mass fiber has zero mass at every point under nonnegative point masses;
4. the source-specific inequalities hold for these sums.

Only introduce a quotient after proving its denominator positive. This avoids the rational-field convention `q / 0 = 0` from masking a missing positivity hypothesis. Do not encode the desired hyperplane geometry as unconstrained predicates and then treat the resulting generic inequality as the paper's lemma.

## Version control and source fidelity

Use the published 2021 article as canonical. The square-free-moduli theorem is a restricted result; it does not settle the unrestricted odd-moduli problem. The exact source mapping must note changes between the 2019 preprint and published version, especially theorem hypotheses and the direction of inequalities. The public problem tracker still lists the unrestricted problem as open.

## Acceptance checklist

- CI passes for the exact head commit.
- Every exported theorem's transitive axioms are audited.
- Each source inequality is mapped to a Lean declaration with matching hypotheses.
- `sf_sieve_lt_one` and `sieve_criterion` are derived rather than renamed or assumed.
