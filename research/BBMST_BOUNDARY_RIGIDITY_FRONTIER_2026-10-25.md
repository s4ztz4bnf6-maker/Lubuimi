# Research frontier: geometric witness extraction for BBMST positivity
Date: 2026-10-25

## Purpose
This note narrows the remaining positivity gap to a source-level geometric statement, rather than another algebraic rearrangement. It is a research target, not a claim that the BBMST theorem is proved.

## Exact finite reduction
For a finite family of rational weights and proportions, set
Q = sum_i p_i alpha_i(1-alpha_i), mu = sum_i p_i alpha_i, and V = sum_i p_i(alpha_i-mu)^2.
Under sum_i p_i=1, the Lean core establishes Q = mu(1-mu)-V. Thus the variance route needs the strict geometric estimate V < mu(1-mu). The alternate route needs one index with p_i>0 and 0<alpha_i<1, plus nonnegative weights and all alpha_j in [0,1]. These are distinct sufficient routes; neither follows from normalization alone.

## New proof-organization proposal: extract a witness from the partition
Do not introduce an axiom-like premise saying an interior fiber exists. Instead, prove it from the source definitions in this order:

1. Reconstruct the source's finite probability space and its partition into the relevant geometric classes.
2. Prove the exact weight identity and positivity of every weight attached to a nonempty class. Keep empty classes explicit; do not divide by their cardinalities.
3. Express each alpha_k as a normalized count of the source-defined subset of a class, with the exact numerator and denominator from the paper.
4. Prove a boundary rigidity lemma: if every positive-weight alpha_k is in {0,1}, then the source's partition geometry forces the forbidden degenerate configuration (or contradicts the precise hypotheses of the source theorem).
5. Conclude an interior witness by contradiction, then apply the existing finite weighted interior-mass positivity lemma.

The key novelty is the proposed boundary-rigidity step: it attacks the actual obstruction instead of assuming the desired positivity. It must be checked against the original BBMST definitions before being formalized. If the source's hypotheses do not imply boundary rigidity, this route fails and the variance route must be pursued instead.

## Required mathematical safeguards
- A partition identity does not itself imply strict positivity.
- A positive average does not imply every summand is positive.
- Strict positivity can fail exactly at endpoint-only proportions, e.g. weights (1/2,1/2) and proportions (0,1).
- The proof must use the original finite probability spaces, hyperplanes, R_k/N_k/B_k, and alpha_k definitions and the source's Lemma 2.1 equations (3)-(6). No invented noCodimOne, isNontrivial, isParallel, or codimOne hypothesis may be added merely to make the theorem pass.
- A compiled generic lemma is not evidence that the source geometry supplies its hypotheses.

## Formal audit gate
For each new theorem: compile; inspect its transitive #print axioms; then compare its statement and all hypotheses to the source. Project-level assumptions such as sieve_criterion or sf_sieve_lt_one remain blockers until eliminated or proved from earlier results.

## Status
This is a candidate route and a falsifiable research plan, not a proof of the original Erdős–Selfridge/BBMST result.
