# BBMST variance identity: exact algebraic target and geometric gap
Date: 2026-10-25

## Status

This note records an exact reduction for the finite weighted-fiber stage. It is not a proof of the BBMST geometric lemma, and it does not discharge either admitted sieve assumption in `ErdosSelfridge_v17_fixed.lean`.

## Finite weighted identity

Let (S) be finite, (p_i\geq0), \(\sum_i p_i=1\), and \(0\leq\alpha_i\leq1\). Define
\[
\mu=\sum_i p_i\alpha_i,\qquad
Q=\sum_i p_i\alpha_i(1-\alpha_i),\qquad
V=\sum_i p_i(\alpha_i-\mu)^2.
\]
Then
\[
\boxed{Q=\mu(1-\mu)-V.}
\]
This follows by expanding the square and using \(\sum p_i=1\). It is an exact identity, not an estimate. In particular, (Q>0) is equivalent to (V<\mu(1-\mu)).

## Sharp endpoint obstruction

For two equally weighted points with \((\alpha_1,\alpha_2)=(0,1)\), one has \(\mu=1/2\), \(V=1/4\), and \(Q=0\). Thus neither a nontrivial mean \(0<\mu<1\), nor mass conservation, nor the bounds \(0\leq\alpha_i\leq1\) imply positive interior mass. The existing Lean core contains a formal endpoint counterexample to this inference.

## The precise missing theorem

The next legitimate target is not to assume a convenient variance bound. It is to derive, from the paper's actual finite probability spaces and geometric definitions, a strict estimate
\[
\sum_i p_i(\alpha_i-\mu)^2
< \mu(1-\mu),
\]
or an equivalent source-faithful lower bound on \(Q\). The proof must identify which BBMST hypotheses prevent the endpoint configuration above. Until that is established, the algebraic identity is only a reduction.

A source-faithful formalization must preserve the paper's definitions of its probability measures, hyperplanes, and the quantities (R_k,N_k,B_k,\alpha_k). A freely postulated geometric predicate or an arbitrary bound on (V) would move the desired theorem into the assumptions rather than prove it.

## Audit boundary

- The finite fiber-mass lemmas establish algebraic conservation, positivity, and envelope/squeeze interfaces.
- They do not yet construct the paper's geometric conditional proportions.
- The unrestricted distinct-odd-moduli Erdős–Selfridge statement must not be silently replaced by the square-free version of a cited theorem, or vice versa.
- The admitted assumptions `sieve_criterion` and `sf_sieve_lt_one` remain proof blockers until proved or removed.
- A successful Lean CI run verifies the committed Lean code under its imported axioms; it does not validate the missing geometric argument or solve the open number-theoretic statement.
