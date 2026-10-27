# BBMST: source-to-positive-mass bridge, obligations and exact dependencies

Date: 2026-10-26

## Source theorem

Balister, Bollobás, Morris, Sahasrabudhe and Tiba prove that a covering system with distinct square-free moduli must include an even modulus:
https://digitalcommons.memphis.edu/facpubs/5868/
The complete proof structure is also indexed in the Erdős Problems research library; its entry identifies Lemma 2.1 as the fiber sieve with three measure bounds and explicit handling of zero-mass fibers:
https://erdosproblems.ai/wiki/library/covering_systems/balister_2021_erdos_selfridge_problem_square_free_moduli

## Our local results and their exact strength

`BBMSTHyperplaneFiberGeometry.lean` establishes:
- one hyperplane fixing the last coordinate has at most one compatible final coordinate above a fixed prefix;
- a finite union of such fibers has cardinality at most the number of indexed hyperplanes;
- if the union is nonempty and the number of indexed fibers is strictly smaller than `|S_k|`, its relative size is strictly between zero and one.

`BBMSTFiberMassCore.lean` establishes:
- a positive-mass point forces positive total mass for nonnegative weights;
- a positive-weight interior proportion `0 < α < 1` forces strictly positive weighted interior mass;
- the weighted variance identity and its exact positivity criterion.

These lemmas are compatible pieces, but their hypotheses are not yet derived together from the paper's actual `N_k/B_k/R_k` construction.

## New proof target: an actual source-derived witness

Build a theorem with conclusion equivalent to:

There exists a prefix x in the source-defined prefix probability space such that
1. its prefix weight w(x) is strictly positive;
2. the source-defined newly exposed fiber Fₓ is nonempty;
3. `|Fₓ| < |S_k|`, so `0 < α_k(x) < 1`.

Then `finite_weighted_interior_mass_pos_of_interior_point` immediately yields positive total interior mass. The nontrivial work is deriving all three properties from source conditions, not proving the final finite-sum inequality again.

## Exact logical decomposition

**Witness existence.** From the source-defined event `B_k` being nonempty, extract a point `(x,y) ∈ B_k`. This gives a nonempty fiber at x. But it is necessary to prove that x belongs to the probability space carrying the source weight and that `w(x)>0`; nonempty set membership alone is not a general positive-mass theorem.

**Properness.** Show `Fₓ ≠ S_k` using the paper's actual exclusion of a newly exposed codimension-one hyperplane and the distinctness/nonparallelity conditions. The local estimate `|Fₓ| ≤ |N_k|` is only useful if the source hypotheses imply `|N_k| < |S_k|` or supply another properness argument. Do not insert this inequality as an assumed conclusion.

**Mass transfer.** Once a positive-weight proper nonempty fiber is found, apply the existing weighted interior-mass theorem. This stage is algebraic and should remain independent from the geometric source reconstruction.

**Zero-mass handling.** Preserve the source's explicit distinction between a nonempty fiber and a fiber carrying positive probability. The published proof's zero-mass cases must be matched, not erased by using a uniform distribution unless that is exactly the source measure.

## A concrete formal interface to implement next

Define a source-indexed finite prefix space `P`, a nonnegative weight `w : P → ℚ`, a coordinate set `S_k`, and a source-defined fiber map `F : P → Finset S_k`. Prove the bridge lemma under source-derived assumptions:
- `Σ x ∈ P, w x = 1` (or the exact normalization used by the paper);
- `w x ≥ 0`;
- there exists x with `w x > 0`, `F x ≠ ∅`, and `F x ≠ S_k`.

Then connect `α x = |F x| / |S_k|` to the existing mass result. Keep the witness-existence and properness lemmas separate, so the mathematical gap remains visible.

## Audit status

The coordinate-model CI previously failed on decidability in the filtered fiber definition; commit `8fd933e8befe0e85f09164f0c357b2b5f7fda05c` added a classical finite-set definition and proof context. At last check, the new CI job was still in progress; no successful build is claimed yet.

The source-fidelity gate must compare the exact statement with Lemma 2.1 equations (3)–(6), including all cases involving zero-mass fibers, and audit transitive axioms. A local geometric lemma or a successful build alone is not the theorem.
