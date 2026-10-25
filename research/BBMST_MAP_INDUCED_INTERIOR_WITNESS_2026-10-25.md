# BBMST geometric bridge: turn the interior witness into a map-induced fact

Date: 2026-10-25

## New proof architecture

The finite theorem in `BBMSTProperFiberInterior.lean` proves that a nonempty proper subset of a nonempty finite fiber has a rational proportion strictly between zero and one, and that a positive mass multiplied by \(\alpha(1-\alpha)\) contributes positively.

The unresolved point is not rational arithmetic. It is the construction of the subset/fiber and the proof that it is nonempty and proper under the source hypotheses. This note makes that gap explicit as a three-map interface rather than an abstract “nontrivial geometry” assumption.

## Candidate finite interface

A source-faithful formalization should expose:

- a finite sample space \(\Omega_k\) carrying the exact measure used at stage \(k\);
- a source-defined label map \(\pi_k:\Omega_k\to Y_k\), so fibers are actual preimages \(\pi_k^{-1}(y)\);
- a source-defined event \(E_k\subseteq\Omega_k\), with local proportions represented by ratios of event and fiber masses only after denominators are proved positive.

For a fiber \(F_y=\pi_k^{-1}(y)\), the strict-interior obligation becomes the concrete pair
\[
0<\mu_k(E_k\cap F_y)<\mu_k(F_y).
\]
In the uniform finite case this reduces to the already-proved cardinality bridge. In a nonuniform case, cardinality is not the right substitute: one must prove positive measure on both sides of the partition.

## Why the obvious shortcuts fail

1. Normalization \(\sum p_i=1\) and \(0\leq\alpha_i\leq1\) do not imply \(\sum p_i\alpha_i(1-\alpha_i)>0\): endpoint-only examples make the sum zero.
2. A label map alone does not guarantee a fiber has positive mass; unreachable labels and zero-weight points must be excluded or handled.
3. A nonempty proper subset is enough only for uniform counting measure. For a general probability measure, both the subset and its complement must have positive mass.
4. A formal lemma named after a paper symbol is not statement fidelity. The definitions of \(R_k,N_k,B_k,\alpha_k\), their stage indices, and the update rule must be copied from the source before the interface is connected.

## Next falsifiable theorem

The next theorem should not assume “there exists a strict-interior fiber.” It should derive one from the actual source update:

\[
\exists y,\quad \mu_k(F_y)>0\quad\land\quad
0<\mu_k(E_k\cap F_y)<\mu_k(F_y).
\]

If the paper's argument instead establishes a quantitative variance bound, formalize that bound directly and document why it implies the required interior mass. If neither conclusion follows from the exact hypotheses, produce the smallest finite countermodel and revisit the interpretation of the source lemma.

## Exit criteria

- Source definitions transcribed with citations/page or equation references.
- The finite sample space, event, label map, and measure are explicit Lean objects.
- Strict positivity follows from proved geometric hypotheses, not a new axiom or an unconstrained predicate.
- The downstream sieve/tail argument and exact square-free-modulus statement remain separate proof obligations.

This is a research plan with a concrete falsifiable target, not a claim that the BBMST theorem or the unrestricted Erdős–Selfridge conjecture is now proved.
