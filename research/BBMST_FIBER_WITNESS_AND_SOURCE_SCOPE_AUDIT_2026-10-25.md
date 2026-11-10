# BBMST audit: fiber witness and source scope

Date: 2026-10-25

The published BBMST theorem proves the obstruction for square-free moduli; it must not be silently promoted to arbitrary odd distinct moduli. The source's proof chain includes the fiber sieve (Lemma 2.1), hyperplane moment bounds, finite rational certificates, and a separate large-prime recurrence.

Formal status in this repository: `BBMSTStrictInteriorMass.lean` proves that positive weighted Bernoulli mass is equivalent to the existence of a positive-weight fiber with a proportion strictly between zero and one, assuming the proportions lie in [0,1]. It does not derive such a fiber from the paper's geometric construction.

Concrete next theorem to formalize: define the source finite probability space and its hyperplane/fiber map, then prove endpoint rigidity from those definitions. The proof must identify the exact source hypothesis that rules out support only at proportions 0 and 1. A global mean constraint is insufficient: weights (1/2,1/2) and proportions (0,1) have mean 1/2 but zero interior mass.

The finite computational certificate and the tail bound are separate proof obligations. Preserve the exact square-free scope and compare all definitions with the published version, not just the preprint. A Lean compile pass establishes neither source fidelity nor the unrestricted Erdős–Selfridge conjecture.

Sources: https://arxiv.org/abs/1901.11465 and https://erdosproblems.ai/wiki/library/covering_systems/balister_2021_erdos_selfbridge_problem_square_free_moduli
