# Source benchmark update: BBMST proof obligations versus the published square-free-moduli chain (2026-10-25)

## Why this update matters

The current Lean project has a useful generic lemma: a positive-mass fiber with a strictly interior proportion contributes positive weighted Bernoulli mass. That is a conditional algebraic tool, not yet the missing geometric theorem. The external source library for Balister's square-free-moduli treatment gives a sharper benchmark than another generic variance identity.

Source benchmark:
- https://erdosproblems.ai/wiki/library/covering_systems/balister_2021_erdos_selfbridge_problem_square_free_moduli
- https://erdosproblems.ai/wiki/library/covering_systems

The catalog describes a proof chain through Lemma 2.1, Theorem 3.1, Lemmas 3.3–3.4, Theorem 3.2, Lemmas 5.3–5.4, and Corollary 5.2. It reports that the finite certificate reaches threshold 138.877 by an exact integer recurrence and finite prime sieve. It also says square-freeness is required only at primes at most 73; large-prime exponents require a second-moment interface rather than being treated as singleton hyperplanes.

## New audit decision: split the modulus regime

The formalization must not encode “all moduli are square-free” if the theorem's actual hypothesis is only square-freeness at small primes. Separate each modulus into:
1. its small-prime square-free component, for primes `p ≤ 73`;
2. its large-prime exponent data;
3. the exact Chinese-remainder / hyperplane representation for the first component;
4. the compatible second-moment interface for the large-prime tail.

This prevents a stronger-than-source hypothesis from silently replacing the target theorem.

## Required next steps

1. Create a source map for each published lemma, recording its exact statement, Lean declaration (if available), imported dependencies, and hypotheses.
2. Compare the project's `R_k`, `N_k`, `B_k`, and `alpha_k` definitions against the source, not just the notation.
3. Keep `weighted_interior_mass_positive` as a downstream algebraic lemma. Do not present it as a derivation of an interior witness from BBMST geometry.
4. Formalize the finite-prime certificate and recurrence independently of the geometric lemmas; exact integer/rational checks should have theorem-level specifications.
5. Preserve zero-mass fiber cases and denominator safety from Lemma 2.1.
6. Audit the final theorem against the square-free-at-small-primes statement and its CRT correspondence.

## Falsification tests

- A modulus with a squared prime factor `p^2` for `p > 73` must not be rejected merely because it is not globally square-free, if it lies within the source theorem's scope.
- A repeated large-prime coordinate must not be represented as a singleton hyperplane without proof.
- A finite recurrence check is not a proof of the infinite tail unless the recurrence bound and termination argument are separately proved.
- An auxiliary positivity theorem cannot close `sieve_criterion` or `sf_sieve_lt_one` unless those statements are explicitly derived from it.

## Status

This note tightens the external source benchmark and formalization plan. It is not a new proof of the global Erdős–Selfridge problem. The immediate target is a source-derived interface separating small-prime hyperplane geometry from large-prime second-moment control and the exact tail recurrence.
