# BBMST geometric bridge: finite incidence model and local inequality gate
Date: 2026-10-23

## Scope and non-claims

The target is the square-free-moduli theorem of Balister, Bollobás, Morris, Sahasrabudhe and Tiba (2021), not the unrestricted odd-moduli Erdős–Selfridge problem. The paper proves that a covering system with square-free moduli must contain an even modulus. The current Lean mass core proves algebraic conservation and positivity identities only; it does not yet derive the geometric estimates or remove the admitted axioms sf_sieve_lt_one and sieve_criterion.

Sources:
- Version of record: https://digitalcommons.memphis.edu/facpubs/5868/
- Oxford repository and paper PDF: https://ora.ox.ac.uk/objects/uuid%3A3c55267c-60be-4652-89a7-db3db5f62c25

## Concrete next module: no free fiber labels

Represent the finite coordinate box as an explicit finite type or finite set of coordinate assignments. Represent each paper-defined hyperplane by its actual incidence predicate on coordinates. Represent a projection p : Ω → Y and each fiber as the preimage {x ∈ Ω | p x = y}; do not supply arbitrary fiber labels or arbitrary weights.

For each finite fiber F, define
- total(F) = ∑ x∈F μ(x);
- removed(F) = ∑ x∈F if R(x) then μ(x) else 0;
- retained(F) = ∑ x∈F if R(x) then 0 else μ(x),
where R is the actual source-defined removed-region predicate.

The pointwise identity
  (if R(x) then μ(x) else 0) + (if R(x) then 0 else μ(x)) = μ(x)
gives exact finite mass conservation without division. With μ(x) ≥ 0 it also gives nonnegativity, and total(F)=0 implies every point in F has zero mass. The existing finite_predicate_mass_partition lemma is the algebraic start of this interface, but its CI run for commit 1dd82619 is still pending as of this note.

## What would count as real progress

The next milestone must not be another generic split theorem. It must formalize one source-specific incidence inequality:
1. Freeze the finite coordinate box and hyperplane family from the paper.
2. State the exact local mass inequality, with coefficients tied to a numbered equation/lemma in the paper.
3. Prove it from the explicit incidence relation, not by assuming a parameter equal to the desired bound.
4. Sum the local inequalities over the actual projection fibers, explicitly handling zero-mass fibers.
5. Show how this yields the precise downstream statement needed by Lemma 2.1 / Theorem 3.1 (verify numbering and statement against the publisher PDF before coding).

A conditional probability or quotient may be defined only on a positive-mass fiber. The zero-mass case should be discharged using the existing zero-mass lemmas, never by simplifying a ratio with denominator zero. This avoids the rational-field convention 0/0=0 silently affecting the theorem.

## Source-to-Lean audit gates

- Match each definition and coefficient against the original paper, not just a secondary reconstruction.
- Do not use noCodimOne, free isNontrivial, isParallel, or codimOne assumptions to stand in for the paper's geometry.
- Keep the algebraic core separate from geometric/probabilistic hypotheses.
- Print all transitive axioms for the final theorem.
- Require a clean CI build and source-line mapping before claiming the formalization is faithful.

## Current mathematical boundary

Finite mass conservation is bookkeeping. It does not imply the strict sieve bound. The unsolved obligation is to establish the paper's local geometric/probabilistic estimate from the actual finite hyperplane configuration and then propagate it through the paper's dependency chain. No axiom-free proof of the target theorem is claimed in this note.
