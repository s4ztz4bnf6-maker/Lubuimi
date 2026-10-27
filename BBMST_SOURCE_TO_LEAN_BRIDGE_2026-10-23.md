# BBMST source-to-Lean bridge — 2026-10-23

## Scope

The source theorem is the square-free-moduli case, not the unrestricted odd-moduli Erdős–Selfridge conjecture. The publication record and version of record:
- https://digitalcommons.memphis.edu/facpubs/5868/
- https://ora.ox.ac.uk/objects/uuid%3A3c55267c-60be-4652-89a7-db3db5f62c25

The research map identifies the chain Lemma 2.1 -> Lemmas 3.3/3.4 -> Theorem 3.2 -> Lemma 5.4 -> Lemma 5.3 -> Corollary 5.2 -> Theorem 1.2/1.1 and finite certificates:
https://erdosproblems.ai/wiki/library/covering_systems/balister_2021_erdos_selfridge_problem_square_free_moduli

## Formalization design refinement

The current finite rational-mass core is intentionally abstract. The next source-faithful module should make the finite box and projection explicit, then define a fiber as a genuine preimage of the projection. For a fiber F and a predicate R on the source-defined removed region, define mass(F) = sum over x in F of mu(x), removed(F) = sum over x in F of if R(x) then mu(x) else 0, and retained(F) = sum over x in F of if R(x) then 0 else mu(x).

First prove removed(F) + retained(F) = mass(F) by a pointwise indicator identity. Then prove nonnegativity and the zero-mass corollary. This avoids both free fiber weights and division by zero.

The critical next theorem is not another abstract squeeze: it is the paper's local geometric inequality for the explicitly represented hyperplane family. Every coefficient must be traced to a source equation and to its actual incidence predicate. The theorem must not assume the target inequality as a parameter.

## Audit gates

- finite coordinate box and hyperplane membership are explicit;
- projection fibers are preimages, not arbitrary labels;
- removed/retained sets are disjoint and exhaustive;
- conditional ratios are introduced only for strictly positive mass;
- zero-mass fibers contribute zero to the global sum;
- all transitive axioms are printed for the final theorem.

The open obligations sf_sieve_lt_one and sieve_criterion remain unresolved until proved from this source-faithful construction.
