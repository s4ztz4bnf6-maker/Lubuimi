# BBMST Fiber-Deficit Certificates: source-faithful formalization plan (2026-10-23)

## Status

This is a proposed formalization architecture, not a proof of BBMST or the unrestricted Erdős–Selfridge problem. The generic finite incidence identities in `BBMSTProbabilityInterface.lean` are useful interfaces, but they do not yet construct the geometric probability space or prove the paper-specific estimates.

## New interface: deficit as a certified object

For a finite nonempty sample (S), a subset (I\subseteq S), and uniform probability, define
[
\operatorname{cov}(S,I)=|I|/|S|,\qquad
\operatorname{def}(S,I)=|S\setminus I|/|S|.
]
Then exactly
[
\operatorname{cov}(S,I)+\operatorname{def}(S,I)=1,
\qquad
\operatorname{def}(S,I)>0\iff S\setminus I\ne\varnothing.
]
The current interface formalizes equivalent deficit/complement facts. The proposed improvement is to package them in a single structure carrying:
- the finite sample space and its nonemptiness;
- the incidence subset proof;
- the normalized measure;
- the exact complement-mass identity;
- the provenance of the incidence predicate.

The final field is crucial: it prevents an abstract `alpha_k` or an arbitrary incidence relation from being silently identified with the one in the source paper.

## Weighted version for the geometric model

The uniform cardinality ratio is only a test case. For a finite probability mass (\mu:S\to\mathbb Q_{\ge0}) with (\sum_{x\in S}\mu(x)=1), and an incidence predicate (P), define
[
\operatorname{cov}_\mu(P)=\sum_{x\in S,,P(x)}\mu(x),\quad
\operatorname{def}_\mu(P)=\sum_{x\in S,,\neg P(x)}\mu(x).
]
A partition-of-sum theorem gives
[
\operatorname{cov}_\mu(P)+\operatorname{def}_\mu(P)=1.
]
A positive deficit is equivalent to existence of an uncovered point only when every point in the finite sample has strictly positive mass. With merely nonnegative masses, an uncovered point may have zero mass. This edge case must be represented explicitly rather than hidden.

## The geometric bridge that remains

The missing work is not the complement identity. It is the source-faithful construction of:
1. the finite probability space used in the BBMST argument;
2. the paper's hyperplanes and incidence predicates;
3. the relevant projection and its genuine fibers;
4. the weights induced on each fiber;
5. the conditional / second-moment estimates for the paper-defined (\alpha_k);
6. the exact hypotheses under which the resulting inequalities imply the theorem.

The proposed certificate should reference these definitions directly. It must not allow users to supply `isParallel`, `isNontrivial`, codimension-one status, or the desired incidence estimate as free facts when those properties are meant to follow from the source geometry.

## Lean targets

- Prove a finite weighted partition identity by splitting the sum over (P(x)) and its complement.
- Prove the strict-positivity characterization with the necessary positive-mass hypothesis; separately provide the counterexample showing why nonnegative mass alone is insufficient.
- Define a source-tagged incidence certificate that stores the actual predicate and its construction.
- Instantiate the abstract weighted-fiber squeeze only after the geometric fiber map and normalized mass are constructed.
- Keep a dependency audit showing whether the final theorem depends only on standard Lean axioms or on project-specific admitted axioms such as `sf_sieve_lt_one` and `sieve_criterion`.

## Falsification gates

- Empty sample, singleton sample, full incidence, empty incidence.
- An uncovered zero-mass point: deficit can still be zero.
- A proper subset does imply a strict uniform-cardinality deficit for a nonempty finite sample, but that fact is not automatically the BBMST estimate.
- Pairwise distinct square-free moduli and arbitrary pairwise distinct odd moduli are different theorem scopes.

The intended improvement is a provenance-preserving bridge: every abstract mass inequality used downstream must be traceable to the exact finite geometry and measure that produce it.
