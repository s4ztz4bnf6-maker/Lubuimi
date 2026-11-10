# BBMST research frontier: aggregate interior mass (2026-10-26)

## Goal

Strengthen the current one-witness estimate without assuming that a single fiber carries mass at least delta. The current lemma proves
\[
\delta^2(1-\delta) \le \sum_{i\in s}\alpha_i(1-\alpha_i)m_i
\]
when one index has mass at least delta and proportion in [delta,1-delta]. This is sharper than delta^3, but still imposes a potentially artificial concentration hypothesis.

## Proposed aggregate lemma

Let s be a finite index set, m_i >= 0, 0 <= alpha_i <= 1, and 0 < delta <= 1/2. Define the good-fiber set
\[
G_\delta=\{i\in s: \delta\le\alpha_i\le 1-\delta\}.
\]
Then
\[
\sum_{i\in s}\alpha_i(1-\alpha_i)m_i
\ge \delta(1-\delta)\sum_{i\in G_\delta}m_i.
\]

### Proof

For every i in G_delta, the factorization
\[
\alpha_i(1-\alpha_i)-\delta(1-\delta)
=(\alpha_i-\delta)(1-\alpha_i-\delta)\ge0
\]
gives alpha_i(1-alpha_i)m_i >= delta(1-delta)m_i. For i outside G_delta, the summand alpha_i(1-alpha_i)m_i is nonnegative because alpha_i is in [0,1]. Summing these pointwise inequalities proves the claim.

This is a purely finite weighted inequality; it needs no division, normalization, or probability-space assumption. It therefore avoids endpoint hazards such as rational division by zero.

## Why this improves the project

The existing witness theorem asks for one fiber with mass >= delta. The aggregate version asks only for a lower bound on the total mass of all interior fibers. In a finite geometric partition, mass may be spread across many small fibers; the aggregate formulation does not lose that case.

## Exact remaining geometric obligation

The source-faithful BBMST bridge must prove a bound
\[
\sum_{i\in G_\delta}m_i\ge \eta
\]
for an explicit eta > 0 (or establish a suitable multiscale alternative). Merely knowing total mass 1 is insufficient: all mass could in principle lie on endpoint fibers alpha_i in {0,1}. The geometric proof must exclude that possibility using the actual hyperplane/fiber definitions and source hypotheses, not a newly assumed nondegeneracy axiom.

## Formalization plan

1. Define G_delta as a Finset.filter.
2. Prove the pointwise bound on the filtered set using nonlinear arithmetic and nonnegativity.
3. Split the full sum into filtered and complement terms, using nonnegativity on the complement.
4. Print transitive axioms for the final theorem.
5. Audit that all alpha_i and m_i are the source paper's quantities, and record exactly where its geometric assumptions enter.

Status: mathematical lemma and proof written here; Lean implementation and CI verification are not yet claimed.
